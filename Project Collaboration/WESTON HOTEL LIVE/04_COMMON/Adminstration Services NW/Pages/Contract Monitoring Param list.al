/// <summary>
/// Page Contract Monitoring Param List (ID 52178479).
/// </summary>
page 52178862 "Contract Monitoring Param List"
{
    PageType = list;
    SourceTable = "Contract Monitoring Param";
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
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}