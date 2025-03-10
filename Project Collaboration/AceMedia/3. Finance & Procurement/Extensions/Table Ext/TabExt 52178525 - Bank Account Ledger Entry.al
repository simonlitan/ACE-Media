/// <summary>
/// TableExtension ExtBank Account Ledger Entry (ID 52178505) extends Record Bank Account Ledger Entry.
/// </summary>
tableextension 52178525 "ExtBank Account Ledger Entry" extends "Bank Account Ledger Entry"
{
    fields
    {
        field(6000; "Statement Difference"; Decimal)
        {
            Caption = '"Statement Difference"';
            DataClassification = ToBeClassified;
        }
        field(6001; "Amount Applied"; decimal)
        {
            Caption = '"Amount Applied"';
            DataClassification = ToBeClassified;
        }
        field(6002; Remarks; text[250])
        {
              TableRelation = "FIN-Imprest header".Purpose where("No." = field("Document No."));
        }
        field(6003; Description2; text[200])
        {
            // TableRelation = "FIN-Imprest Header".Purpose where("No." = field("Document No."));
            // trigger OnLookup()
            // var
            //    ImpHeader: Record "FIN-Imprest Header";
            // begin
            //    ImpHeader.Reset();
            //    ImpHeader.SetRange("No.", "Document No.");
            //    if ImpHeader.Find('-') then
            //    Description2 := ImpHeader.Purpose;
            // end;
            FieldClass = FlowField;
            CalcFormula = lookup("FIN-Imprest Header".Purpose where("No." = field("Document No.")));
        }
    }

}
