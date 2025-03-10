/// <summary>
/// Page Contractors Roster List (ID 52178478).
/// </summary>
page 52178865 "Contractors Roster List"
{
    PageType = List;
    SourceTable = "Contractors Roster";

    layout
    {
        area(content)
        {
            repeater(rep)
            {
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = All;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = All;
                }
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Start Day"; Rec."Start Day")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

            }
        }
    }


}