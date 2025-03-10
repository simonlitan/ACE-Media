/// <summary>
/// Page Project monitoring Params List (ID 52178480).
/// </summary>
page 52178868 "Project monitoring Params List"
{
    PageType = List;
    SourceTable = "Project monitoring Params";
    layout
    {
        area(content)
        {
            repeater(rep)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Ability to comply"; Rec."Ability to comply")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}