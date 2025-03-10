table 52178952 "FLT-Transport Requisition"
{
    DrillDownPageID = "FLT-Transport Req. List";
    LookupPageID = "FLT-Transport Req. List";

    fields
    {
        field(1; "Transport Requisition No"; Code[20])
        {
        }
        field(2; Commencement; Text[30])
        {
        }
        field(3; Destination; Text[50])
        {
        }
        field(4; "Vehicle Allocated"; Code[20])
        {
            TableRelation = "FLT-Vehicle Header"."Registration No.";
        }
        field(5; "Driver Allocated"; Code[20])
        {
            TableRelation = "FLT-Driver";

            trigger OnValidate()
            begin
                if HrEmployee.Get("Driver Allocated") then begin
                    "Driver Name" := HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name";
                end;
                "Authorized  By" := UserId;

                userset.Reset;
                userset.SetRange(userset."User ID", UserId);
                if userset.Find('-') then begin
                    Emp.Reset;
                    //Emp.SetRange(Emp."No.",userset."Employee No.");
                    if Emp.Find('-') then begin
                        "TO Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                        ;
                    end;
                end;
                Modify;
            end;
        }
        field(6; "Requested By"; Code[50])
        {
        }
        field(7; "Date of Request"; Date)
        {
        }
        field(8; "Vehicle Allocated by"; Code[20])
        {
        }
        field(9; "Opening Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(10; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved;

            trigger OnValidate()
            begin
                if Status = Status::Approved then begin
                    fltman2.Reset;
                    fltman2.SetRange(fltman2."Finance Approver", true);
                    if fltman2.Find('-') then begin
                        "Checked By" := fltman2.UserID;
                        "Checked Designation" := 'FIN OFFICER';
                    end;
                end;
            end;
        }
        field(13; "Date of Trip"; Date)
        {
        }
        field(14; "Purpose of Trip"; Text[250])
        {
        }
        field(60; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(61; Comments; Text[250])
        {
        }
        field(62; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code Where("Global Dimension No." = const(2));
        }
        field(63; "Driver Name"; Text[100])
        {
        }
        field(64; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            // TableRelation = "FIN-Responsibility Center BR";

            trigger OnValidate()
            begin

                TestField(Status, Status::Open);
                if not UserMgt.CheckRespCenter(1, "Department code") then
                    Error(
                      Text001
                      //RespCenter.TableCaption, UserMgt.GetPurchasesFilter
                      );
            end;
        }
        field(65; "Loaded to WorkTicket"; Boolean)
        {
        }
        field(66; "Time out"; Time)
        {
        }
        field(67; "Time In"; Time)
        {
        }
        field(68; "Journey Route"; Text[250])
        {
        }
        field(69; "Time Requested"; Time)
        {
        }
        field(70; "Closing Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(71; "Work Ticket No"; Code[20])
        {
        }
        field(72; "No of Days Requested"; Integer)
        {
        }
        field(73; "Authorized  By"; Text[30])
        {
        }
        field(74; Position; Text[30])
        {
        }
        field(80; "Recommed this Request"; Option)
        {
            OptionMembers = ,Yes,No;
        }
        field(81; "Recommendation Reason"; Text[250])
        {

        }
        field(82; "HOD UserName"; code[50])
        {
        }
        field(83; "Reg. No."; code[30])
        {
        }
        field(84; "Approved/Not Approved"; Option)
        {
            OptionMembers = ,Approved,"Not Approved";
        }
        field(85; "Admin Head Name"; Text[200])
        {

        }
        field(86; "Admin Head Username"; code[50])
        {

        }
        field(50000; Name; Code[200])
        {
        }
        field(50001; Signature; BLOB)
        {
        }
        field(50002; "Time of trip"; Time)
        {
        }
        field(50003; "Supervosor Recommendations"; Text[250])
        {
        }
        field(50004; "Date Requisition Received"; Date)
        {
        }
        field(50005; "Time Requisition Received"; Time)
        {
        }
        field(50006; "Transport Officer Remarks"; Text[250])
        {

            trigger OnValidate()
            begin
                "TO ID" := UserId;
                "TO Approval Date" := Today;
                userset.Reset;
                userset.SetRange(userset."User ID", UserId);
                if userset.Find('-') then begin
                    empno.Reset;
                    empno.SetRange(empno."No.", FltMgtSetup."Employee No.");
                    if empno.Find('-') then begin
                        "TO Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";

                    end;
                end;
                Modify;
            end;
        }
        field(50007; "Checked By"; Code[50])
        {
        }
        field(50008; "Checked Designation"; Code[100])
        {
        }
        field(50009; "P/NO"; Code[20])
        {
        }
        field(50010; Designation; Code[50])
        {
        }
        field(50011; "No Of Passangers"; Integer)
        {
            CalcFormula = Count("FLT-Travel Requisition Staff" WHERE("Req No" = FIELD("Transport Requisition No")));
            FieldClass = FlowField;
        }
        field(50012; "HOD Recommendations"; Text[100])
        {

            trigger OnValidate()
            begin
                "HOD ID" := UserId;
                "Checked By" := UserId;

                userset.Reset;
                userset.SetRange(userset."User ID", UserId);
                if userset.Find('-') then begin
                    empno.Reset;
                    empno.SetRange(empno."No.", FltMgtSetup."Employee No.");
                    if empno.Find('-') then begin
                        "HOD Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                        "Checked Designation" := empno.Initials;
                    end;
                end;
                Modify;
            end;
        }
        field(50013; Make; Code[20])
        {
            CalcFormula = Lookup("FLT-Vehicle Header".Make WHERE("Registration No." = FIELD("Vehicle Allocated")));
            FieldClass = FlowField;
        }
        field(50014; Model; Code[20])
        {
            CalcFormula = Lookup("FLT-Vehicle Header".Model WHERE("Registration No." = FIELD("Vehicle Allocated")));
            FieldClass = FlowField;
        }
        field(50015; "Finance Officer Comments"; Text[250])
        {

            trigger OnValidate()
            begin
                "FO ID" := UserId;
                fltman5.Reset;
                fltman5.SetRange(fltman5.UserID, UserId);
                if fltman5.Find('-') then begin
                    if fltman5."Finance Approver" = true then begin
                        userset.Reset;
                        userset.SetRange(userset."User ID", UserId);
                        if userset.Find('-') then begin
                            empno.Reset;
                            empno.SetRange(empno."No.", FltMgtSetup."Employee No.");
                            if empno.Find('-') then begin
                                "FO Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                            end;
                        end;
                    end;
                end;

                Modify;
            end;
        }
        field(50016; "TO Name"; Text[150])
        {
        }
        field(50017; "FO Name"; Text[150])
        {
        }
        field(50018; "HOD Name"; Text[150])
        {
        }
        field(50019; "HOD ID"; Code[20])
        {
        }
        field(50020; "Checked By Name"; Code[150])
        {
        }
        field(50021; "FO ID"; Code[20])
        {
        }
        field(50022; "TO ID"; Code[20])
        {
        }
        field(50023; "TO Approval Date"; Date)
        {
        }
        field(50024; "Opening ODO"; Decimal)
        {
        }
        field(50025; "Clossing ODO"; Decimal)
        {
        }
        field(50026; "Nature of Trip"; Option)
        {
            /*  OptionCaption = ',Administrative,Business Travel,Research/Academic';
             OptionMembers = ,Administrative,"Business Travel","Research/Academic"; */
            OptionMembers = ,Administrative,"Local","Field Trip";
        }
        field(50027; Group; Code[20])
        {
            //TableRelation = "Trans.Groups".code;
        }
        field(50028; Mileage; Decimal)
        {
        }
        field(50029; "Emp No"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                IF Emp.GET("Emp No") THEN begin
                    "Employee Name" := (Emp."First Name") + ' ' + (Emp."Last Name");
                    Designation := emp."Job Title";
                end;

            end;
        }
        field(50030; "Employee Name"; Text[250])
        {
        }
        field(50031; "Estimated Mileage"; Decimal)
        {
        }
        field(50032; "Approved Rate"; Decimal)
        {
        }
        field(50033; "Fuel Unit Cost"; Decimal)
        {
        }
        field(50034; "Total Cost"; Decimal)
        {
        }
        field(50035; "Return Date"; Date)
        {
        }
        field(50036; "Type of Vehicle"; Code[20])
        {
        }
        field(50037; "Mileage Before Trip"; Decimal)
        {
        }
        field(50038; "Milleage after Trip"; Decimal)
        {
        }
        field(50039; "Total Mileage Travelled"; Decimal)
        {
        }
        field(50040; "Transport Return Date"; Date)
        {
        }
        field(50041; "Cost Per Kilometer"; Decimal)
        {
        }
        field(50043; "Vehicle Capacity"; Integer)
        {
        }
        field(50044; "Return Confirmed By"; Code[20])
        {
        }
        field(50045; "Club/Societies"; Code[30])
        {
            //TableRelation = "Clubs & Societies"."Club/Society Code";
        }
        field(50046; "Transport Available/Not Av."; Option)
        {
            OptionCaption = ' ,Available,Not Available';
            OptionMembers = " ",Available,"Not Available";
        }
        field(50047; Submitted; Boolean)
        {
        }
        field(11; "Preferred Motor Vehicle "; Option)
        {
            OptionMembers = ,Bus,Lorry,"S-cab","D-cab";
        }
        field(50050; "Number of Passangers"; Integer)
        {

        }
    }

    keys
    {
        key(Key1; "Transport Requisition No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Transport Requisition No" = '' then begin
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Transport Req No");
            NoSeriesMgt.InitSeries(FltMgtSetup."Transport Req No", xRec."No. Series", 0D, "Transport Requisition No", "No. Series");
            "Date of Request" := Today();
            "Requested By" := UserId;
        end;
        /*  userset.Reset;
         userset.SetRange(userset."User ID", UserId);
         if userset.Find('-') then begin
             empno.Reset;
             empno.SetRange(empno."No.", FltMgtSetup."Employee No.");
             if empno.Find('-') then begin
                 // userset.CalcFields(userset."User Signature");
                 //Signature:=userset."User Signature";
                 Name := empno."First Name" + ' ' + empno."Middle Name" + ' ' + empno."Last Name";
                 "P/NO" := empno."No.";
                 Designation := empno.Initials;
             end else
                 Error('Please ensure that you have been setup by the System Administrator.')
         end; */
    end;

    trigger OnModify()
    begin
        //if (Status = Status::Approved) or (Status = Status::Approved) then
        //   Error(Text0001);

        if xRec."Vehicle Allocated" <> "Vehicle Allocated" then begin
            fltman5.Reset;
            fltman5.SetRange(fltman5."Transport Mger Approver", true);
            if fltman5.Find('-') then begin
                "Authorized  By" := fltman5.UserID;
                userset5.Reset;
                userset5.SetRange(userset5."User ID", fltman5.UserID);
                if userset5.Find('-') then begin
                    Emp1.Reset;
                    Emp1.SetRange(Emp1."No.", userset5."User ID");
                    if Emp1.Find('-') then begin
                        Position := Emp1.Initials;
                    end;
                end;
            end;
            Modify;
        end;
    end;

    var
        FltMgtSetup: Record "FLT-Fleet Mgt Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text0001: Label 'You cannot modify an Approved or Closed Record';
        HrEmployee: Record "HRM-Employee C";
        UserMgt: Codeunit "User Setup Management";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        // RespCenter: Record "FIN-Responsibility Center BR";
        userset: Record "User Setup";
        empno: Record "HRM-Employee C";
        fltman2: Record "FLT-Mgt Approval Setups";
        Emp: Record "HRM-Employee C";
        fltman4: Record "FLT-Mgt Approval Setups";
        fltman5: Record "FLT-Mgt Approval Setups";
        Emp1: Record "HRM-Employee C";
        userset5: Record "User Setup";
}

