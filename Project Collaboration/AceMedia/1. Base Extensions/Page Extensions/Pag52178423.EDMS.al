/// <summary>
/// Page "EDMS" (ID 52179301).
/// </summary>
page 52178423 EDMS
{

    PageType = List;
    SourceTable = EDMS;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Key"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("url path"; Rec."url path")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
    var
        URL: Text;

    procedure SetURL(NavigateToURL: Text)
    begin
        URL := NavigateToURL;
    end;
}

