tableextension 52179318 "Dimension Values Ext" extends "Dimension Value"
{
    fields
    {
        field(9001; "G/L Account No."; Code[50])
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
        field(9002; "G/L Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9003; "Falls Under"; code[50])
        {

            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code;
        }
        field(9004; Main; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Err: Label 'Sorry, you can only have 1 main branch at a time.';
            begin
                Rec.Reset();
                Rec.SetRange("Global Dimension No.", 1);
                Rec.SetRange(Main, true);
                if Rec.Count > 1 then
                    Error(Err);
            end;
        }
        field(9005; Casuals; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
         field(9006; "Dimension Code 2"; code[50])
        {
            TableRelation = "Dimension Value".code;
            trigger OnValidate()
            begin
                Dimension.Reset();
                Dimension.SetRange(Code, rec."Dimension code 2");
                if Dimension.Find('-') then begin
                    "Dimension Name 2" := Dimension.Name;
                end;
            end;
        }
        field(9007; "Dimension Name 2"; text[250])
        {
            Editable = false;

        }
    }
    keys
    {
        key(key4; Name)
        {

        }
    }
    var
    Dimension : Record "Dimension Value";
}
