/// <summary>
/// TableExtension ExtDimension Value (ID 52179318) extends Record Dimension Value.
/// </summary>
tableextension 52178442 "Dimension Values Ext" extends "Dimension Value"
{
    fields
    {
        field(6000; "G/L Account No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
            trigger OnValidate()
            var
                gl: Record "G/L Account";
            begin
                gl.Reset();
                gl.SetRange("No.", "G/L Account No.");
                if gl.Find('-') then
                    "G/L Name" := gl.Name;
            end;
        }
        field(6001; "G/L Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6002; "Falls Under"; code[50])
        {

            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code;
        }

    }

}