/// <summary>
/// Page User Approved Cue (ID 52179113).
/// </summary>
page 52179113 "User Approved Cue"
{
    Caption = 'Approved Entries';
    PageType = CardPart;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = "Approvals Activities Cue";

    layout
    {
        area(content)
        {
            cuegroup(Approvals)
            {
                Caption = 'Approved Requests';
                field("Specific Approved Requests"; Rec."Specific Approved Requests")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "User Approved Requests";
                    ToolTip = 'Specifies the value of the Requests to Approve field.';
                }
            }
        }

    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        Rec.SetRange("User ID Filter", UserId);
        Rec.SetRange("Approver ID", UserId);
    end;
}