table 52178894 "ICT Support Desk team"
{
    DrillDownPageId = "ICT Support Desk team";
    LookupPageId = "ICT Support Desk team";
    fields
    {
        field(2; "Employee No"; Code[30])
        {
            // TableRelation = "HRM-Employee C"."No.";//where("Job Title" = const('ICT'));
            TableRelation = "User Setup"."Employee No." where("Shortcut Dimension 4 Code" = const('HR & Admin'));
            trigger OnValidate()
            var
                ICTEmp: Record "User Setup";
            begin
                ICTEmp.Reset();
                if ICTEmp.Get("Employee No") then begin
                    "Employee No" := ICTEmp."Employee No.";
                    "User ID" := ICTEmp."User ID";
                    Responsibility := ICTEmp."Global Dimension 2 Code";
                    EMail := ICTEmp."E-Mail";
                    //Status := ICTEmp.Status;
                end;
            end;
        }
        field(3; "Employee Name"; text[100])
        {
            Editable = false;

        }
        field(4; "User ID"; Code[30])
        {
            Editable = false;
        }
        field(5; Responsibility; code[30])
        {
            Editable = false;
        }
        field(6; Status; Option)
        {
            Editable = false;
            DataClassification = ToBeClassified;
            OptionMembers = Active,Inactive;
        }
        field(7; EMail; Text[250])
        {
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(key1; "Employee No")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Employee No", "Employee Name", "User ID")
        { }
    }
}