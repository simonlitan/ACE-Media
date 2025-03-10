table 52179257 "HRM-Training Needs Analysis 2"
{
    Caption = 'HRM-Training Needs Analysis';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Period; Code[50])
        {
            Caption = 'Period';
            TableRelation = "HRM-Leave Periods".Year where(Closed = const(false));
        }
        field(2; "Employee No"; Code[50])
        {
            Caption = 'Employee No';
            tablerelation = "HRM-Employee C"."No." where(status = const(Active));
            trigger OnValidate()
            begin
                Empc.Reset();
                Empc.SetRange("No.", "Employee No");
                if Empc.Find('-') then begin
                    "Employee Name" := Empc."First Name" + ' ' + empc."Middle Name" + ' ' + Empc."Last Name";


                end
            end;
        }
        field(3; "Document No"; Code[100])
        {
            editable = false;
            Caption = 'Document No';
        }
        field(4; "Trainings Attended"; Integer)
        {
            Caption = 'Trainings/Seminars/Workshops attended in the last two years';
        }
        field(5; "Reason(s) for Training"; Text[2048])
        {
            Caption = 'Reason(s) for training/not training';
        }
        field(6; "Course Relevant"; Option)
        {
            Caption = 'Was the Course Relevant?';
            optionmembers = No,Yes;
        }
        field(7; "Give Reason"; Text[2048])
        {
            Caption = 'Please give reason(s)';
        }
        field(8; "Selection Process"; Text[2048])
        {
            Caption = 'Please explain how you were selected / nominated for the Course(s)';
        }
        field(9; "Aware Training Needs"; Option)
        {
            Caption = 'Are you aware of your training needs?';
            optionmembers = No,Yes;
        }
        field(10; "Areas Need Training"; Text[2048])
        {
            Caption = 'If yes, suggest the areas where you need training';
        }
        field(11; "Service Delivery"; Option)
        {
            Caption = 'Service Delivery';
            optionmembers = No,Yes;
        }
        field(12; "Career Progression"; Option)
        {
            Caption = 'Career Progression';
            optionmembers = No,Yes;
        }
        field(13; "Self Development"; Option)
        {
            Caption = 'Self Development';
            optionmembers = No,Yes;
        }
        field(14; "Created By"; code[50])
        {
            editable = false;
        }
        field(15; "Created On"; date)
        {
            editable = false;
        }
        field(16; "Employee Name"; text[250])
        {
            editable = false;
        }
    }
    keys
    {
        key(PK; Period, "Employee No", "Document No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin

    end;

    var
        Leaveperiods: record "HRM-Leave Periods";
        Empc: Record "HRM-Employee C";
        usersetup: record "User Setup";
}
