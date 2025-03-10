tableextension 52178508 "Detailed Vendeor Ledger Ext" extends "Detailed Vendor Ledg. Entry"
{
    fields
    {

        field(50000; "Invoice No."; Code[30])
        {
            CalcFormula = Lookup("Vendor Ledger Entry"."Document No." WHERE("Entry No." = FIELD("Vendor Ledger Entry No.")));
            FieldClass = FlowField;
        }
        field(50001; "Vendor No Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Vendor."No.";
        }
        field(50002; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }

    }
}
