/// <summary>
/// TableExtension ExtUser Setup (ID 52178862) extends Record User Setup.
/// </summary>
tableextension 52178862 "User Setup Two" extends "User Setup"
{
    fields
    {
        modify("Employee No.")
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnBeforeValidate()
            var
                emp: Record "HRM-Employee C";
            begin 
                emp.Reset();
                emp.SetRange("No.", "Employee No.");
                if emp.Find('-') then begin
                    "Approval Title" := emp."Job Title";
                    "E-Mail" := emp."Company E-Mail";
                    HOD := emp.HOD;
                    "Global Dimension 1 Code" := emp."Department Code";
                end;
            end;

        }
    }

}