table 61841 "Prl-Approval"
{
    LookupPageId = "Prl-Approval List";
    DrillDownPageId = "Prl-Approval List";
    fields
    {
        field(1; "Payroll Period"; Date)
        {
            TableRelation = "PRL-Payroll Periods"."Date Opened" where(Closed = filter(false));
            trigger OnValidate()
            begin
                objPeriod.Reset();
                objPeriod.SetRange("Date Opened", Rec."Payroll Period");
                if objPeriod.Find('-') then begin
                    "Period Month" := objPeriod."Period Month";
                    "Period Year" := objPeriod."Period Year";
                    "Period Name" := objPeriod."Period Name";
                end;
            end;
        }
        field(2; "Period Month"; integer)
        {
            Editable = false;
        }
        field(3; "Period Year"; integer)
        {
            Editable = false;
        }
        field(4; "Period Name"; Text[50])
        {
            Editable = false;

        }
        field(5; Status; Option)
        {
            OptionMembers = Pending,"Pending Approval",Approved;
        }
        field(6; "Net Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PRL-Period Transactions".Amount where("Payroll Period" = field("Payroll Period"),
            "Transaction Code" = filter('NPAY')));
            trigger OnValidate()
            begin
                rec."Gross Amount" := approval.Amount;

            end;
        }
        field(7; "Gross Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PRL-Period Transactions".Amount where("Payroll Period" = field("Payroll Period"),
            "Transaction Code" = filter('GPAY')));
        }
        field(8; "Total deductions"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PRL-Period Transactions".Amount where("Payroll Period" = field("Payroll Period"),
            "Transaction Code" = filter('TOT-Deductions')));
        }
        field(9; "Journals Posted"; Boolean)
        {

        }

    }

    var
        objPeriod: Record "PRL-Payroll Periods";
        approval: Record "Approval Entry";


    procedure ApprovePayroll()
    begin
        objPeriod.Reset();
        objPeriod.SetRange("Date Opened", Rec."Payroll Period");
        objPeriod.SetRange(Closed, false);
        if objPeriod.Find('-') then begin
            objPeriod."Approved For Closure" := true;
            objPeriod.Modify(true);
        end;
    end;

    procedure GetPayrollJournal()
    var
        prlJournal: Record "Payroll Journal Lines";
        prlApproval: Record "Prl-Approval";
        periodTrans: Record "PRL-Period Transactions";
        GeneraljnlLine: Record 81;
        GenJnlBatch: Record 232;
        LineNumber: Integer;
        counter: integer;
    begin
        prlApproval.reset;
        prlApproval.setrange("Payroll Period", Rec."Payroll Period");
        // prlApproval.SetRange(Status, prlApproval.Status::Approved);
        if prlApproval.Find('-') then begin

            periodTrans.Reset();
            periodTrans.SetRange("Payroll Period", prlApproval."Payroll Period");
            periodTrans.SetFilter("Transaction Code", '<>%1&<>%2&<>%3&<>%4&<>%5&<>%6&<>%7&<>%8&<>%9', 'TXBP', 'TXCHRG', 'DEFCON1', 'DEFCON2', 'INSR', 'NHIFINSR', 'PSNR', 'PNSR', 'GPAY');

            if periodTrans.Find('-') then begin
                repeat

                    prlJournal.Reset();
                    prlJournal.SetRange("Transaction Code", periodTrans."Transaction Code");
                    if not prlJournal.Find('-') then begin

                        counter := counter + 1001;
                        prlJournal.Init();
                        prlJournal."Payroll Period" := prlApproval."Payroll Period";
                        prlJournal."Document No." := periodTrans."Transaction Code" + '-' + Format(periodTrans."Payroll Period");
                        prlJournal."Transaction Code" := periodTrans."Transaction Code";
                        prlJournal."Transaction Name" := periodTrans."Transaction Name";
                        prlJournal."GL Account" := periodTrans."Journal Account Code";
                        prlJournal."Bal Account" := periodTrans."Journal Bal Acc";
                        prlJournal."Group Text" := periodTrans."Group Text";
                        prlJournal."Line No." := counter;
                        //if ((prlJournal."Transaction Code" <> 'TXBP') or (prlJournal."Transaction Code" <> 'NHIFINSR')) then
                        prlJournal.Insert();
                    end;
                until periodTrans.Next() = 0;
            end;

            Message('Generated');
        end;


    end;

    procedure PostPayrollJournal()
    var
        prlJournal: Record "Payroll Journal Lines";
        prlApproval: Record "Prl-Approval";
        periodTrans: Record "PRL-Period Transactions";
        GeneraljnlLine: Record 81;
        GenJnlBatch: Record 232;
        LineNumber: Integer;
        counter: integer;
    begin
        prlApproval.reset;
        prlApproval.setrange("Payroll Period", Rec."Payroll Period");
        prlApproval.SetRange(Status, prlApproval.Status::Approved);
        prlApproval.SetRange("Journals Posted", false);
        if prlApproval.Find('-') then begin

            objPeriod.Reset();
            objPeriod.SetRange("Date Opened", prlApproval."Payroll Period");
            //objPeriod.SetRange(Closed, false);
            if objPeriod.Find('-') then begin
                GeneraljnlLine.Reset();
                GeneraljnlLine.SetRange("Journal Template Name", 'GENERAL');
                GeneraljnlLine.SetRange("Journal Batch Name", 'SALARIES');
                GeneraljnlLine.DeleteAll();

                GenJnlBatch.INIT;
                GenJnlBatch."Journal Template Name" := 'GENERAL';
                GenJnlBatch.Name := 'SALARIES';
                IF NOT GenJnlBatch.GET(GenJnlBatch."Journal Template Name", GenJnlBatch.Name) THEN
                    GenJnlBatch.INSERT;

                prlJournal.Reset();
                prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
                prlJournal.SetFilter("Group Text", '=%1', 'EARNINGS');
                if prlJournal.Find('-') then begin
                    repeat
                        prlJournal.CalcFields(Amount);
                        counter := counter + 101;
                        GeneraljnlLine.INIT;
                        GeneraljnlLine."Journal Template Name" := 'GENERAL';
                        GeneraljnlLine."Journal Batch Name" := 'SALARIES';
                        GeneraljnlLine."Line No." := prlJournal."Line No." + counter;
                        GeneraljnlLine."Posting Date" := objPeriod."Date Opened";
                        GeneraljnlLine."Document No." := (objPeriod."Period Name");
                        GeneraljnlLine.Description := prlJournal."Transaction Name";
                        GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                        GeneraljnlLine."Account No." := prlJournal."GL Account";
                        GeneraljnlLine.Amount := Round(prlJournal.Amount, 0.1, '=');
                        GeneraljnlLine.Insert();
                    until prlJournal.Next() = 0;
                end;

                prlJournal.Reset();
                prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
                prlJournal.SetFilter("Group Text", '=%1', 'DEDUCTIONS');
                if prlJournal.Find('-') then begin
                    repeat
                        counter := counter + 101;

                        prlJournal.CalcFields(Amount);
                        GeneraljnlLine.INIT;
                        GeneraljnlLine."Journal Template Name" := 'GENERAL';
                        GeneraljnlLine."Journal Batch Name" := 'SALARIES';
                        GeneraljnlLine."Line No." := prlJournal."Line No." + counter;
                        GeneraljnlLine."Posting Date" := objPeriod."Date Opened";
                        GeneraljnlLine."Document No." := (objPeriod."Period Name");
                        GeneraljnlLine.Description := prlJournal."Transaction Name";
                        GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                        GeneraljnlLine."Account No." := prlJournal."GL Account";
                        GeneraljnlLine.Amount := -round(prlJournal.Amount, 0.1, '=');
                        GeneraljnlLine.Insert();

                    until prlJournal.Next() = 0;
                end;

                prlJournal.Reset();
                prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
                prlJournal.SetFilter("Group Text", '=%1', 'STATUTORIES');
                if prlJournal.Find('-') then begin
                    repeat
                        counter := counter + 201;

                        prlJournal.CalcFields(Amount);
                        GeneraljnlLine.INIT;
                        GeneraljnlLine."Journal Template Name" := 'GENERAL';
                        GeneraljnlLine."Journal Batch Name" := 'SALARIES';
                        GeneraljnlLine."Line No." := prlJournal."Line No." + counter;
                        GeneraljnlLine."Posting Date" := objPeriod."Date Opened";
                        GeneraljnlLine."Document No." := (objPeriod."Period Name");
                        GeneraljnlLine.Description := prlJournal."Transaction Name";
                        GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                        GeneraljnlLine."Account No." := prlJournal."GL Account";
                        GeneraljnlLine.Amount := -round(prlJournal.Amount, 0.1, '=');
                        GeneraljnlLine.Insert();

                    until prlJournal.Next() = 0;
                end;

                prlJournal.Reset();
                prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
                prlJournal.SetFilter("Group Text", '=%1', 'NET PAY');
                if prlJournal.Find('-') then begin
                    repeat
                        counter := counter + 1;

                        prlJournal.CalcFields(Amount);
                        GeneraljnlLine.INIT;
                        GeneraljnlLine."Journal Template Name" := 'GENERAL';
                        GeneraljnlLine."Journal Batch Name" := 'SALARIES';
                        GeneraljnlLine."Line No." := prlJournal."Line No." + counter;
                        GeneraljnlLine."Posting Date" := objPeriod."Date Opened";
                        GeneraljnlLine."Document No." := (objPeriod."Period Name");
                        GeneraljnlLine.Description := prlJournal."Transaction Name";
                        GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                        GeneraljnlLine."Account No." := prlJournal."GL Account";
                        GeneraljnlLine.Amount := -round(prlJournal.Amount, 0.1, '=');
                        GeneraljnlLine.Insert();

                    until prlJournal.Next() = 0;
                end;




                prlJournal.Reset();
                prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
                prlJournal.SetFilter("Group Text", '=%1|=%2|=%3|=%4', 'GEMPRPENSION', 'GRATUITY', 'NEMPRPENSION', 'NSSF EMPLOYER');
                if prlJournal.Find('-') then begin
                    repeat
                        prlJournal.CalcFields(Amount);
                        GeneraljnlLine.INIT;
                        GeneraljnlLine."Journal Template Name" := 'GENERAL';
                        GeneraljnlLine."Journal Batch Name" := 'SALARIES';
                        GeneraljnlLine."Line No." := prlJournal."Line No.";
                        GeneraljnlLine."Posting Date" := objPeriod."Date Opened";
                        GeneraljnlLine."Document No." := (objPeriod."Period Name");
                        GeneraljnlLine.Description := prlJournal."Transaction Name";
                        GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                        GeneraljnlLine."Account No." := prlJournal."GL Account";
                        GeneraljnlLine.Amount := round(prlJournal.Amount, 0.1, '=');
                        GeneraljnlLine.Insert();
                    until prlJournal.Next() = 0;
                end;

                // //No Employer Pension and gratuity
                // prlJournal.Reset();
                // prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
                // prlJournal.SetFilter("Group Text", '=%1', 'GEMPRPENSION');
                // if prlJournal.Find('-') then begin
                //     prlJournal.CalcFields(Amount);
                //     GeneraljnlLine.INIT;
                //     GeneraljnlLine."Journal Template Name" := 'GENERAL';
                //     GeneraljnlLine."Journal Batch Name" := 'SALARIES';
                //     GeneraljnlLine."Line No." := prlJournal."Line No." + 47;
                //     GeneraljnlLine."Posting Date" := objPeriod."Date Opened";
                //     GeneraljnlLine."Document No." := (objPeriod."Period Name");
                //     GeneraljnlLine.Description := prlJournal."Transaction Name";
                //     GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                //     GeneraljnlLine."Account No." := '5000067';
                //     GeneraljnlLine.Amount := -round(prlJournal.Amount);
                //     GeneraljnlLine.Insert();
                // end;
                // prlJournal.Reset();
                // prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
                // prlJournal.SetFilter("Group Text", '=%1', 'NEMPRPENSION');
                // if prlJournal.Find('-') then begin
                //     prlJournal.CalcFields(Amount);
                //     GeneraljnlLine.INIT;
                //     GeneraljnlLine."Journal Template Name" := 'GENERAL';
                //     GeneraljnlLine."Journal Batch Name" := 'SALARIES';
                //     GeneraljnlLine."Line No." := prlJournal."Line No." + 37;
                //     GeneraljnlLine."Posting Date" := objPeriod."Date Opened";
                //     GeneraljnlLine."Document No." := (objPeriod."Period Name");
                //     GeneraljnlLine.Description := prlJournal."Transaction Name";
                //     GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                //     GeneraljnlLine."Account No." := '5000067';
                //     GeneraljnlLine.Amount := -round(prlJournal.Amount);
                //     GeneraljnlLine.Insert();
                // end;

                // prlJournal.Reset();
                // prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
                // prlJournal.SetFilter("Group Text", '=%1', 'GRATUITY');
                // if prlJournal.Find('-') then begin
                //     prlJournal.CalcFields(Amount);
                //     GeneraljnlLine.INIT;
                //     GeneraljnlLine."Journal Template Name" := 'GENERAL';
                //     GeneraljnlLine."Journal Batch Name" := 'SALARIES';
                //     GeneraljnlLine."Line No." := prlJournal."Line No." + 23;
                //     GeneraljnlLine."Posting Date" := objPeriod."Date Opened";
                //     GeneraljnlLine."Document No." := (objPeriod."Period Name");
                //     GeneraljnlLine.Description := prlJournal."Transaction Name";
                //     GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                //     GeneraljnlLine."Account No." := '5000003';
                //     GeneraljnlLine.Amount := -round(prlJournal.Amount);
                //     GeneraljnlLine.Insert();
                // end;

                prlJournal.Reset();
                prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
                prlJournal.SetFilter("Group Text", '=%1', 'NSSF EMPLOYER');
                if prlJournal.Find('-') then begin
                    prlJournal.CalcFields(Amount);
                    GeneraljnlLine.INIT;
                    GeneraljnlLine."Journal Template Name" := 'GENERAL';
                    GeneraljnlLine."Journal Batch Name" := 'SALARIES';
                    GeneraljnlLine."Line No." := prlJournal."Line No." + 14;
                    GeneraljnlLine."Posting Date" := objPeriod."Date Opened";
                    GeneraljnlLine."Document No." := (objPeriod."Period Name");
                    GeneraljnlLine.Description := prlJournal."Transaction Name";
                    GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                    GeneraljnlLine."Account No." := prlJournal."Bal Account";
                    GeneraljnlLine.Amount := -round(prlJournal.Amount, 0.1, '=');
                    GeneraljnlLine.Insert();
                end;
            end;

            prlApproval."Journals Posted" := true;
            prlApproval.Modify();
            Message('Journals Generated');
        end else
            error('Check if approved or already posted');
    end;




}