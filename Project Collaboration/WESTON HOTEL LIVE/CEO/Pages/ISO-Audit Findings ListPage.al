page 52178913 "ISO-Audit Findings List"
{
    Caption = 'ISO-Audit List';
    PageType = List;
    SourceTable = "Audit Findings";
    CardPageId = "Audit Findings Card";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Department"; Rec.Department)
                {
                    ApplicationArea = All;

                }

                field("Audit Date"; Rec."Date audited")
                {
                    ApplicationArea = All;

                }

            }

        }
    }
}
