page 52179234 "HRM-Leave Allowance Buffer"
{
    PageType = Listpart;
    SourceTable = "HRM-Leave Allowance Reg.";

    layout
    {
        area(content)
        {


            repeater(Group)
            {
                field(Datefils; dateFilter)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Caption = 'Period Filter';
                    TableRelation = "PRL-Payroll Periods"."Date Opened" where(Closed = filter(false));

                    trigger OnValidate()
                    begin
                        //if dateFilter <> 0D then
                        //Rec.SetFilter("Payroll Period", '=%1', dateFilter);
                    end;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;


                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

                field("Leave Allowance Amount"; Rec."Leave Allowance Amount")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                    TableRelation = "PRL-Payroll Periods"."Date Opened" where(Closed = filter(false));

                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }


                field("Allowance Paid"; Rec."Allowance Paid")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Allowance Paid field.';
                }
                field("Reject Reason"; Rec."Reject Reason")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

            }

        }



    }
    trigger OnOpenPage()
    begin
        payrolPeriod.Reset;
        payrolPeriod.SetFilter(payrolPeriod.Closed, '=%1', false);
        payrolPeriod.SetFilter(payrolPeriod."Date Opened", '<>%1', 0D);
        if payrolPeriod.Find('-') then begin
            dateFilter := payrolPeriod."Date Opened";
        end;
        if dateFilter <> 0D then
            Rec.SetFilter("Payroll Period", '=%1', dateFilter);
    end;


    var
        dateFilter: Date;
        payrolPeriod: Record "PRL-Payroll Periods";
        salarycard: record "PRL-Salary Card";
        leaveAll: Record "HRM-Leave Allowance Reg.";
        emps: Record "HRM-Employee C";
        salarygrades: Record "HRM-Job_Salary grade/steps";
        emptrans: Record "PRL-Employee Transactions";
        leavereq: Record "HRM-Leave Requisition";
        Allheader: Record "HRM-Leave Allowance Header";
        TGroup: Text[30];
        TGroupOrder: Integer;
        TSubGroupOrder: Integer;








}

