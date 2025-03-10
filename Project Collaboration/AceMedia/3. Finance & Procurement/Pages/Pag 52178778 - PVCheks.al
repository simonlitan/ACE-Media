page 52178778 PVCheks
{
    Caption = 'PVCheks';
    PageType = List;
    SourceTable = "FIN-Payment Line";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {

                }
                field("Account No."; Rec."Account No.")
                {

                }
                field("Account Name"; Rec."Account Name")
                {

                }
            }
        }
    }
}
