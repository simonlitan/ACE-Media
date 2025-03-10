table 52179077 "Training and Development"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(3; "Training Identification"; Text[250])
        {
            Caption = 'Training Identification';
            DataClassification = ToBeClassified;
            TableRelation = Trainings.Code;

            trigger OnValidate()
            Var
                Trn: Record "Trainings";
            begin
                Trn.Reset();
                Trn.SetRange(Code, Rec."Training Identification");
                If Trn.Find('-') then Begin
                    "Training Identification" := format(Trn."Training Identification");
                End;
            end;
        }
        field(20; "Project Types"; code[100])
        {

        }
        field(29; "Type of Training"; Option)
        {
            OptionMembers = " ",Individual,Group;
        }
        field(4; "Name of Training"; Text[250])
        {
            // Caption = 'Name of Training';
            // DataClassification = ToBeClassified;
            // TableRelation = "Training Name"."Training Name";


        }
        field(5; Trainer; Code[200])
        {
            Caption = 'Venue';
            DataClassification = ToBeClassified;
            //TableRelation = 

        }
        field(13; Duration; Integer)
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "End Date" := "Start Date" + Duration
            end;

        }
        field(6; "Start Date"; Date)
        {


            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                if (Duration <> 0) and ("Start Date" <> 0D) then begin
                    "End Date" := "Start Date" + Duration
                end;
            end;

        }
        field(7; Venue; Text[200])
        {
            Caption = 'Venue';
            DataClassification = ToBeClassified;
        }
        field(8; Cost; Decimal)
        {
            Caption = 'Cost';
            DataClassification = ToBeClassified;
        }
        field(9; "Supervisor Comment"; Text[1250])
        {
            Caption = 'Supervisor Comment';
            DataClassification = ToBeClassified;
        }
        field(10; Tution; Integer)
        {
            //BlankZero = true;

            trigger OnValidate()
            begin

                Tution := Rec.Tution;
                Cost := Tution + DSA + Logistics + "Full Board Amount";
                // end;
            end;
        }
        field(11; DSA; Integer)
        {
            //BlankZero = true;


            trigger OnValidate()
            begin
                // Rec.Reset();
                // Rec.SetRange("Document No.", Rec."Document No.");
                // Rec.SetRange("Training Identification", Rec."Training Identification");
                // If Rec.Find('-') then
                // begin
                Tution := Rec.Tution;
                Cost := Tution + DSA + Logistics + "Full Board Amount";
                //end;
            end;
        }
        field(12; Logistics; Integer)
        {
            //BlankZero = True;


            trigger OnValidate()
            begin
                // Rec.Reset();
                // Rec.SetRange("Document No.", Rec."Document No.");
                // Rec.SetRange("Training Identification", Rec."Training Identification");
                // If Rec.Find('-') then
                // begin
                // Tution := Rec.Tution;
                IsVisible := true;

                Cost := Tution + DSA + Logistics + "Full Board Amount";
                //end;
            end;
        }
        field(2; "Full Board Amount"; Integer)
        {

        }
        field(14; "Supervisor No"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";
            trigger OnValidate()
            var
                emp: Record "HRM-Employee C";
            begin
                emp.SetRange(emp."No.", "Supervisor No");
                if emp.Find('-') then begin
                    "Supervisor Name" := emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";

                end;
                //"Highest Academic Qualification":=emp
            end;

        }
        Field(15; "Supervisor Name"; Text[100])
        {



        }
        field(1; "Full Board"; Boolean)
        {
            trigger OnValidate()

            begin

            end;



        }
        field(16; "Ref. No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "No."; Integer)
        {
            AutoIncrement = true;
        }
        field(18; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }
        field(19; "Training Period"; Code[40])
        {

        }
        field(31; "Last Training Attended"; Text[200])
        {

        }
        field(32; "Relevance of Training"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Trainings.Code;

            trigger OnValidate()
            Var
                Trn: Record "Trainings";
            begin
                Trn.Reset();
                Trn.SetRange(Code, Rec."Relevance of Training");
                If Trn.Find('-') then Begin
                    "Relevance of Training" := format(Trn."Training Identification");
                End;
            end;

        }
        field(33; Supervisor; Code[20])
        {

        }


    }

    keys
    {
        key(Key1; "No.", "Ref. No.")
        {
            Clustered = true;
        }
    }

    var


    trigger OnInsert()
    var
        Err: Label 'Sorry, you have selected %1 Courses you can only select maximum of 2.';
        MaxItem: Integer;
    begin
        if "Full Board" then
            IsVisible := true else
            IsVisible := false;





    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure Getlastno(): Integer;
    begin
        Rec.Reset();
        Rec.SetRange("No.");
        If Rec.FindLast() then begin
            exit(Rec."No.");
        end
        Else
            Exit(0);
    end;


    var
        IsVisible: Boolean;

}
