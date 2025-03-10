tableextension 52178536 "ExtG_L Entry" extends "G/L Entry"
{
    fields
    {
        field(52178524; Remarks; Text[100])
        {
           FieldClass = FlowField;
            CalcFormula = lookup("FIN-Imprest Surr. Header".Purpose where("No" = field("Document No.")));
        }
    }
}
