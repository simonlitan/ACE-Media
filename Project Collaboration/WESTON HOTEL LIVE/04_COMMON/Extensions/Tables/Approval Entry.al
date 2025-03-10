/// <summary>
/// TableExtension MyExtension (ID 52178861) extends Record Approval Entry.
/// </summary>
tableextension 52178861 "Approval Entry" extends "Approval Entry"
{
    fields
    {

        // Add changes to table fields here
        field(52178861; "Net Amount"; Decimal)
        {
            // FieldClass = FlowField;
            // CalcFormula = lookup("Prl-Approval"."Net Amount");
        }
        field(52178862; "Gross Amount"; Decimal)
        {
            // FieldClass = FlowField;
            // CalcFormula = lookup("Prl-Approval"."Gross Amount");

        }
    }

    var
        myInt: Integer;
}