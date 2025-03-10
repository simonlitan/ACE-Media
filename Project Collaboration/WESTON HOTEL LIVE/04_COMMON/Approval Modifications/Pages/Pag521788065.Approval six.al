/// <summary>
/// Page Approvals Activities SIX (ID 52179114).
/// </summary>
page 52179114 "Approvals Activities SIX"
{
    Caption = 'Purchase Orders';
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
                Caption = 'Approvals';

                field("Approval Document"; Rec."Approval Document")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Requests to Approve";
                    ToolTip = 'Specifies the value of the Approval Document field.';
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
        Rec.SetRange("Document Type", Rec."Document Type"::Order);
    end;
}