/// <summary>
/// Page Approvals Activities Five (ID 52178884).
/// </summary>
page 52178884 "Approvals Activities Five"
{
    Caption = 'Bank Transfers';
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
        Rec.SetRange("Document Type", Rec."Document Type"::"Staff Claims");
    end;
}