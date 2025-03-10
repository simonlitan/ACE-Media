page 52178952 "Cleaning Listpart"
{
    Caption = 'Cleaning Listpart';
    PageType = ListPart;
    SourceTable = "Cleaning Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Cleaning Date"; Rec."Cleaning Date")
                {
                    ApplicationArea = All;
                }
                field("Cleaning Time"; Rec."Cleaning Time")
                {
                    ApplicationArea = All;
                }
                field("Cleaner No"; Rec."Cleaner No")
                {
                    ApplicationArea = All;
                }
                field("Cleaner Name"; Rec."Cleaner Name")
                {
                    ApplicationArea = All;
                }
                field("Office Space"; Rec."Office Space")
                {
                    ApplicationArea = All;
                }

                field("Cleaning Done"; Rec."Cleaning Done")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
