table 52179115 "HRM-Applicant Qualifications"
{
    Caption = 'HR Applicant Qualifications';
    DataCaptionFields = "Employee No.";
    //todo  DrillDownPageID = 39003960;
    //todo LookupPageID = 39003960;

    fields
    {
        field(1; "Application No"; Code[10])
        {
            Caption = 'Application No';
            TableRelation = "HRM-Job Applications (B)"."Application No";
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            NotBlank = true;
        }
        field(3; "Qualification Description"; code[80])
        {
            Caption = 'Qualification Description';
            NotBlank = true;

            trigger OnValidate()
            begin
                /*
                Qualifications.RESET;
                Qualifications.SETRANGE(Qualifications.Code,"Qualification Description");
                IF Qualifications.FIND('-') THEN
                "Qualification Code":=Qualifications.Description;
                */

            end;
        }
        field(4; "From Date"; Date)
        {
            Caption = 'From Date';
        }
        field(5; "To Date"; Date)
        {
            Caption = 'To Date';
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Internal,External,Previous Position';
            OptionMembers = " ",Internal,External,"Previous Position";
        }
        field(7; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(8; "Institution/Company"; Text[30])
        {
            Caption = 'Institution/Company';
        }
        field(9; Cost; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost';
        }
        field(10; "Course Grade"; Text[30])
        {
            Caption = 'Course Grade';
        }
        field(11; "Employee Status"; Option)
        {
            Caption = 'Employee Status';
            Editable = false;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
        field(12; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(13; "Qualification Type"; Code[20])
        {

            TableRelation = "HRM-Lookup Values".Code WHERE(Type = FILTER("Qualification Type"));
        }
        field(14; "Qualification Code"; Text[200])
        {
            NotBlank = true;
            TableRelation = "HRM-Qualifications".Code WHERE("Qualification Type" = FIELD("Qualification Type"));

            trigger OnValidate()
            begin
                if HRQualifications.Get("Qualification Type", "Qualification Code") then
                    "Qualification Description" := HRQualifications.Description;
                if JobReq.Get(JobReq."Qualification Type", JobReq."Qualification Code") then
                    "Score ID" := JobReq."Desired Score";
            end;
        }
        field(15; "Score ID"; decimal)
        {

        }
        field(16; "Desired Score"; decimal)
        {

        }
        field(17; "Scored Grade"; Code[50])
        {

        }
        field(18; "Desired Grade"; Code[50])
        {
        }

    }

    keys
    {
        key(Key1; "Application No", "Qualification Type", "Qualification Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        HRQualifications: Record "HRM-Qualifications";
        Applicant: Record "HRM-Job Applications (B)";
        Position: Code[20];
        JobReq: Record "HRM-Job Requirements";
}

