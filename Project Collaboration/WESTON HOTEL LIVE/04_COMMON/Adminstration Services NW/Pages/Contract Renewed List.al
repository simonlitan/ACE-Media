/// <summary>
/// Page Contract Renewal List (ID 52178491).
/// </summary>
Page 52178864 "Contract Renewal List"
{
    PageType = list;
    Editable = false;
    CardPageId = "Contract Renewal Card";
    SourceTable = "Outsourced Services";

    layout
    {
        area(Content)
        {
            repeater(rep)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                }
                field("Contract Description"; Rec."Contract Description")
                {
                    ApplicationArea = All;

                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;

                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;

                }
                field(Renewable; Rec.Renewable)
                {
                    ApplicationArea = All;

                }
                field("Date Renewed"; Rec."Date Renewed")
                {
                    ApplicationArea = All;

                }
                field("End Of renewal Period"; Rec."End Of renewal Period")
                {
                    ApplicationArea = All;

                }
                field("Renewal Status"; Rec."Renewal Status")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}