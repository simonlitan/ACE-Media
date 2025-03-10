page 52178936 "Legal-MoU CardPage"
{
    Caption = 'Legal-MoU CardPage';
    PageType = Card;
    SourceTable = "Legal-MoU Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No"; Rec."No")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("MoU No."; Rec."MoU No.")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                    ApplicationArea = All;
                    Caption = 'MoU No.';
                }
                field("Collaboration Areas"; Rec."Collaboration Areas")
                {
                    ToolTip = 'Specifies the value of the Collaboration Areas field.';
                    MultiLine = true;
                    ApplicationArea = All;
                    Caption = 'Areas of Collaboration';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                    ApplicationArea = All;
                }

                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                    ApplicationArea = All;
                }



            }
            group("Involved Party(s)")
            {
                field("1st Party"; Rec."First Party")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                    ApplicationArea = All;
                    Caption = 'First Party';
                    MultiLine = true;
                }
                field("2nd Party"; Rec."Second Party")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                    ApplicationArea = All;
                    Caption = 'Second Party';
                    MultiLine = true;
                }
                group(others)
                {
                    field("1st Other Party"; Rec."Other Party One")
                    {
                        ToolTip = 'Specifies the value of the End Date field.';
                        ApplicationArea = All;
                        Caption = '(1)';
                    }
                    field("2nd Other Party"; Rec."Other Party Two")
                    {
                        ToolTip = 'Specifies the value of the End Date field.';
                        ApplicationArea = All;
                        Caption = '(2)';
                    }
                }
            }
        }
    }
}
