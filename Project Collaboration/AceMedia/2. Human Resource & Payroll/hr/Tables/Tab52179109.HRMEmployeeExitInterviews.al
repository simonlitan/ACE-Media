table 52179109 "HRM-Employee Exit Interviews"
{
    LookupPageID = "HRM-Exit Interview List";
    DrillDownPageId = "HRM-Exit Interview List";

    fields
    {
        field(1; "Exit Clearance No"; Code[20])
        {
        }
        field(2; "Date Of Clearance"; Date)
        {

            trigger OnValidate()
            begin

                /* IF ("Date Of Interview" <> 0D) AND ("Date Of Interview" <> xRec."Date Of Interview") THEN BEGIN
                   CareerEvent.SetMessage('Exit Interview Conducted');
                   CareerEvent.RUNMODAL;
                   OK:= CareerEvent.ReturnResult;
                   IF OK THEN BEGIN
                       CareerHistory.INIT;
                       CareerHistory."Employee No.":= "Employee No.";
                       CareerHistory."Date Of Event":= "Date Of Interview";
                       CareerHistory."Career Event":= 'Exit Interview Conducted';
                       CareerHistory."Exit Interview":= TRUE;
                        OK:= Employee.GET("Employee No.");
                        IF OK THEN BEGIN
                         CareerHistory."Employee First Name":= Employee."Known As";
                         CareerHistory."Employee Last Name":= Employee."Last Name";
                        END;
                       CareerHistory.INSERT;
                    END;
                 END;
                   */

            end;
        }
        field(3; "Clearance Requester"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                HREmp.Reset;
                HREmp.SetRange(HREmp."No.", "Clearance Requester");
                if HREmp.Find('-') then begin
                    IntFullName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    "Clearer Name" := IntFullName;
                end;
            end;
        }
        field(4; "Re Employ In Future"; Option)
        {
            OptionCaption = ' ,Yes,No,Not Applicable';
            OptionMembers = " ",Yes,No,"Not Applicable";
        }
        field(5; "Nature Of Separation"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Deceased,Termination,"Contract Ended",Abscondment,"Appt. Revoked","Contract Termination",Retrenchment,Other;
        }
        field(6; "Reason For Leaving (Other)"; Text[150])
        {
        }
        field(7; "Date Of Leaving"; Date)
        {
        }

        field(8; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


        }
        field(9; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));


        }


        field(10; Comment; Boolean)
        {

        }
        field(11; "Employee No."; Code[20])
        {
            TableRelation = "HRM-Employee C"."No." WHERE(Status = CONST(Active));

            trigger OnValidate()
            begin
                HREmp.Reset;
                HREmp.SetRange(HREmp."No.", "Employee No.");
                if HREmp.Find('-') then begin
                    EmpFullName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    "Employee Name" := EmpFullName;
                end;
            end;
        }
        field(12; "No Series"; Code[10])
        {
        }
        field(13; "Form Submitted"; Boolean)
        {

            trigger OnValidate()
            begin
                HREmp.Reset;
                HREmp.SetRange("No.", "Employee No.");
                OK := HREmp.Find('-');

                if "Form Submitted" = true then begin

                    if OK then begin
                        HREmp.Status := HREmp.Status::Inactive;
                        HREmp."Date Of Leaving" := "Date Of Leaving";
                        // HREmp."Nature Of Separation":= "Nature Of Separation";
                        HREmp."Exit Interview Done by" := "Clearance Requester";
                        HREmp.Modify;
                    end
                end;

                if "Form Submitted" = false then begin
                    if OK then begin
                        HREmp.Status := HREmp.Status::Active;
                        HREmp."Date Of Leaving" := 0D;
                        HREmp."Termination Category" := HREmp."Termination Category"::" ";
                        HREmp."Exit Interview Done by" := '';
                        HREmp.Modify;
                    end;
                end;
            end;
        }
        field(14; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));


        }
        field(15; "Employee Name"; Text[50])
        {
        }
        field(16; "Clearer Name"; Text[50])
        {
        }
        field(17; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved';
            OptionMembers = New,"Pending Approval",Approved;
        }
        field(18; "Responsibility Center"; Code[30])
        {
            //TableRelation = "FIN-Responsibility Center BR".Code;
        }
        field(19; "Employee Type"; Option)
        {
            OptionCaption = 'Permanent,Casuals,Contract';
            OptionMembers = Permanent,Casuals,Contract;
        }
        field(20; "Appointment Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Exit Clearance No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Exit Clearance No" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Exit Interview Nos");
            NoSeriesMgt.InitSeries(HRSetup."Exit Interview Nos", xRec."Exit Clearance No", 0D, "Exit Clearance No", HRSetup."Exit Interview Nos");
        end;


        "Clearance Requester" := UserId;
    end;

    var

        OK: Boolean;
        HREmp: Record "HRM-Employee C";
        HRSetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmpFullName: Text;
        IntFullName: Text;
        Dimn: Record "Dimension Value";
}

