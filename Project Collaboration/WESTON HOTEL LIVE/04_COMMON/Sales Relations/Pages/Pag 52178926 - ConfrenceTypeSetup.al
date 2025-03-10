page 52178926 "Confrence Type Setup"
{
    Caption = 'Confrence Type Setup';
    PageType = List;
    SourceTable = "Confrence Type Setup";

    layout
    {
        area(content)
        {
            repeater(General)
            {

                // field("Line Number"; Rec."Line Number")
                // {
                //     ApplicationArea = all;
                // }
                field("Confrence Type"; Rec."Confrence Type")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = basic, suite;
                    Editable = true;
                    Caption = 'Confrence Description';
                    MultiLine = true;
                    ShowCaption = false;
                }
            }
        }
    }
}
