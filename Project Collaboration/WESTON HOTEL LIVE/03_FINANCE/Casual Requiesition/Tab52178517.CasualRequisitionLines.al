table 52178517 "Casual Requisition Lines"
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Last Name"; Text[100])
        {
        }
        field(4; "Middle Name"; Text[100])
        {
        }
        field(5; "First Name"; Text[100])
        {

        }
        field(21; Casuals; text[100])
        {

            trigger OnValidate()
            var
            begin
                Casuals := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";

            end;

        }

        field(6; Comments; Text[100])
        {
        }
        field(7; Rate; Decimal)
        {

            trigger OnValidate()
            begin
                
                Total := Rate * "No of Days"
                
            end;
        }
        field(8; "No of Days"; Integer)
        {

            trigger OnValidate()
            begin
               Total := Rate * "No of Days";
                
           
            end;
        }
        field(22; "Confirmed Days"; Integer)
        {
            trigger OnValidate()
            
            begin
              Total := "Confirmed Days" * Rate
            end;
      
        }
        field(9; Total; Decimal)
        {

            trigger OnLookup()
            begin
              //  Total:=Rate*"No of Days";
            end;
        }
        field(10; Department; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Casual Requisition".Branch WHERE("No." = FIELD(No)));
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            


        }
        field(11; "Cost Center"; Code[20])
        {
            CalcFormula = Lookup("Casual Requisition"."Cost Center" WHERE("No." = FIELD(No)));
            FieldClass = FlowField;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }

        field(12; "Requisition Date"; Date)
        {
            CalcFormula = Lookup("Casual Requisition"."Request Date" WHERE("No." = FIELD(No)));
            FieldClass = FlowField;
        }
        field(13; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(14; Status; Option)
        {
            CalcFormula = Lookup("Casual Requisition".Status WHERE("No." = FIELD(No)));
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
        }
        field(15; "No. Series"; Code[30])
        {
        }
        field(16; "Employee No"; Code[30])
        {
        }
        field(17; Gender; Option)
        {
            OptionMembers = ,Male,Female;
        }
        field(18; "ID Number"; Text[30])
        {


            trigger OnValidate()
            begin
                // IF "ID Number" = '' THEN
                //     ERROR('This field is Mandatory!');
                // //search thru the Req lines
                // CasualLines.RESET;
                // CasualLines.SETRANGE(CasualLines."ID Number", "ID Number");
                // IF CasualLines.FIND('-') THEN BEGIN
                //     "Last Name" := CasualLines."Last Name";
                //     "Middle Name" := CasualLines."Middle Name";
                //     "First Name" := CasualLines."First Name";
                //     Gender := CasualLines.Gender;
                //     "Cell Phone Number" := CasualLines."Cell Phone Number";

                // END;
            end;
        }
        field(19; "ID NO"; Integer)
        {

            trigger OnValidate()
            begin
                IF "ID No" = '0' THEN
                    ERROR('This field is Mandatory!');
                //search thru the Req lines
                CasualLines.RESET;
                CasualLines.SETRANGE(CasualLines."ID No", "ID No");
                IF CasualLines.FIND('-') THEN BEGIN
                    "Last Name" := CasualLines."Last Name";
                    "Middle Name" := CasualLines."Middle Name";
                    "First Name" := CasualLines."First Name";
                    Gender := CasualLines.Gender;
                    "Cell Phone Number" := CasualLines."Cell Phone Number";

                END;
            end;

        }
        field(20; "Cell Phone Number"; Text[30])
        {

        }
        field(24; Confirmed; Boolean)
        {

        }

    }

    keys
    {
        key(Key1; No, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Rates.GET;
        IF Rates.FIND('-') THEN
            Rate := Rates."Casual Rate";

        //get number of days from the header

        casualHeader.RESET;
        casualHeader.SETRANGE(casualHeader."No.", No);
        IF casualHeader.FIND('-') THEN BEGIN
            "No of Days" := casualHeader."Date To" - casualHeader."Date From";
        END;
    end;

    var
        CasualLines: Record "Casual Requisition Lines";
        Rates: Record "prVital Setup Info";
        casualHeader: Record "Casual Requisition";
        days: Decimal;
        EmpNo: Code[20];

    //[Scope('Internal')]
    procedure createCasualEmployees(ReqNo: Code[40])
    var
        Reqlines: Record "Casual Requisition Lines";
        HREmp: Record "HRM-Employee C";
        HRSetup: Record "Cash Office Setup";
        NoSeriesMgt: Codeunit 396;
        objNoSeries: Record 310;
        Sal: Record "PRL-Salary Card";
    begin
        //get the req No and loop thru these records to insert into HR employees
        Reqlines.RESET;
        Reqlines.SETRANGE(Reqlines.No, ReqNo);
        IF Reqlines.FIND('-') THEN BEGIN
            REPEAT
                //check if staff exist in HR Employees
                HREmp.RESET;
                HREmp.SETRANGE(HREmp."ID Number", Reqlines."ID Number");
                IF HREmp.FIND('-') THEN BEGIN
                    HREmp.Status := HREmp.Status::Active;
                    HREmp.MODIFY;
                END ELSE BEGIN
                    //get next no and insert
                    HRSetup.GET;
                    HRSetup.TESTFIELD(HRSetup."Casual Employee Nos.");
                    //objNoSeries.RESET;
                    //objNoSeries.SETRANGE(objNoSeries.Code,HRSetup."Employee Nos.");
                    //IF objNoSeries.FIND('-') THEN BEGIN
                    NoSeriesMgt.InitSeries(HRSetup."Casual Employee Nos.", HREmp."No. Series", 0D, EmpNo, "No. Series");//"Employee No"  "No. Series"
                                                                                                                        //END;

                    // EXIT;
                    HREmp.INIT;
                    HREmp."No." := EmpNo;//"Employee No";
                    HREmp."First Name" := Reqlines."First Name";
                    HREmp."Middle Name" := Reqlines."Middle Name";
                    HREmp."Last Name" := Reqlines."Last Name";
                    // HREmp."Cell Phone Number" := Reqlines."Cell Phone Number";
                    HREmp."ID Number" := Reqlines."ID Number";
                    HREmp.Gender := Reqlines.Gender;
                    HREmp.Status := HREmp.Status::Active;
                    HREmp."Contract Type" := HREmp."Contract Type"::Casual;
                    HREmp."Payroll Code" := 'PAYROLL';
                    //HREmp."Casual Requisition No." := No;
                    HREmp.INSERT(TRUE);

                    Sal.RESET;
                    Sal.SETRANGE(Sal."Employee Code", EmpNo);
                    IF NOT Sal.FIND('-') THEN BEGIN
                        Sal.INIT;
                        Sal."Employee Code" := EmpNo;//"Employee No";
                        Sal."Pays NSSF" := TRUE;
                        Sal."Pays NHIF" := TRUE;
                        Sal."Pays PAYE" := TRUE;
                        //Sal.Rate := Reqlines.Rate;
                        Sal.INSERT;
                    END ELSE BEGIN
                        //Sal."Employee Code":="Employee No";
                        Sal."Pays NSSF" := TRUE;
                        Sal."Pays NHIF" := TRUE;
                        Sal."Pays PAYE" := TRUE;
                        //Sal.Rate := Reqlines.Rate;
                        Sal.MODIFY;
                    END;
                END;
                CLEAR(EmpNo);
            UNTIL Reqlines.NEXT = 0;



        END;
    end;

    //[Scope('Internal')]
    procedure approveCasualEmployees(ReqNo: Code[40])
    var
        Reqlines: Record "Casual Requisition Lines";
        HREmp: Record "HRM-Employee C";
        HRSetup: Record "Cash Office Setup";
        NoSeriesMgt: Codeunit 396;
        objNoSeries: Record 310;
        Sal: Record "PRL-Salary Card";
        Muster: Record "Muster Roll";
    begin
        //get the req No and loop thru these records to insert into HR employees
        Reqlines.RESET;
        Reqlines.SETRANGE(Reqlines.No, ReqNo);
        IF Reqlines.FIND('-') THEN BEGIN
            REPEAT
                ;
                //get next no and insert
                Muster.RESET;
                Muster.SETRANGE(Muster."Staff No", Reqlines.No);
                IF Muster.FIND('-') THEN BEGIN
                    Muster.Approved := TRUE;
                    Muster.MODIFY;
                END;

            UNTIL Reqlines.NEXT = 0;



        END;
    end;
}

