/// <summary>
/// Page Approvals Activities Ten (ID 52178877).
/// </summary>
page 52178877 "Approvals Activities Ten"
{
    Caption = 'Memo Requests';
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
        Rec.SetRange("Document Type", Rec."Document Type"::"Memo");
    end;
}