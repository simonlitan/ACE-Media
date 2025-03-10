/// <summary>
/// Page Contract Categories List (ID 52178482).
/// </summary>
page 52178861 "Contract Categories List"
{
    PageType = list;
    SourceTable = "Contract Categories";


    layout
    {
        area(content)
        {
            repeater(rep)
            {
                field("Contract Code"; Rec.code)
                {
                    ApplicationArea = All;
                }
                field("Category Description"; Rec."Contract Category")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}