tableextension 52178537 "ExtCust. Ledger Entry" extends "Cust. Ledger Entry"
{
    fields
    {
        field(52178524; Narration; text[500])
        {
         //  FieldClass = FlowField;
          //  CalcFormula = lookup("Gen. Journal Line".Narration where("Document No." = field("Document No.")));
        }
    }
}
