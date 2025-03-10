table 52178878 "RepairMaintenance"
{
    LookupPageId = "Repair and Maintenance App";
    DrillDownPageId = "Repair and Maintenance App";

    fields
    {
        field(1; No; Code[30])
        {
            editable = false;
            caption = 'Request No';
        }
        field(2; "Asset No."; Code[30])
        {
            TableRelation = "Fixed Asset"."No.";
            trigger OnValidate()
            var
                FA: Record "Fixed Asset";
            begin
                FA.SetRange(FA."No.", "Asset No.");
                if FA.Find('-') then begin
                    Description := FA.Description;

                    //Rec.Modify;
                end;
            end;
        }
        field(3; Description; Text[2048])
        {
            caption = 'Nature of Repair';
        }

        field(4; "Request Description"; Text[2048])
        {
            Caption = 'Request Description';
            DataClassification = ToBeClassified;
        }
        field(5; Outsource; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Artisan/Technician"; Code[50])
        {
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));// where("Job Title" = field("Mastery Filter"));
            trigger OnValidate()
            var
                Emp: Record "HRM-Employee C";
            begin
                if Outsource = false then begin
                    Emp.SetRange("No.", "Artisan/Technician");
                    if Emp.Find('-') then
                        "Artisan/Technician Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                end else
                    Message('This document is marked for outsourcing');
            end;
        }
        field(7; Vendor; Code[50])
        {
            TableRelation = Vendor."No." where(Blocked = filter(false));
            trigger OnValidate()
            var
                V: Record Vendor;
            begin
                if Outsource = true then begin
                    V.SetRange(V."No.", Vendor);
                    if V.Find('-') then
                        "Artisan/Technician Name" := V.Name;
                end else
                    Message('You need to first enable the  outsource button');
            end;
        }
        field(8; "Artisan/Technician Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Repair Status"; Option)
        {
            OptionMembers = Open,"Pending","Under Maintenance","Maintenance Completed";
        }
        field(10; Remarks; Text[1020])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Created By"; Code[50])
        {
            Caption = 'Requested By';
            editable = false;
            DataClassification = ToBeClassified;
        }
        field(13; "Date Created"; DateTime)
        {
            editable = false;
            DataClassification = ToBeClassified;
        }
        field(14; "Raise PRN"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


        }

        field(16; "Mastery Filter"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                         Blocked = CONST(false));

        }
        field(18; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                         Blocked = CONST(false));

        }
        field(19; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(20; Status; Option)
        {

            optionmembers = New,"Pending Approval",Approved;
            Editable = false;
            trigger onvalidate()
            begin
                if status = status::Approved then begin
                    "Repair Status" := "Repair Status"::"Under Maintenance";
                end

            end;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        CaseNoSeries: record "HRM-Setup";

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No" = '' then begin
            CaseNoSeries.Get();
            CaseNoSeries.TestField(CaseNoSeries."Maintenance No");
            NoSeriesMgt.InitSeries(CaseNoSeries."Maintenance No", xRec."No Series", 0D, "No", "No Series");
        end;

        "Created By" := USERID;
        "Date Created" := CURRENTDATETIME;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}