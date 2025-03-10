pageextension 52178514 "ExtApproval Entries" extends "Approval Entries"
{
    layout
    {

    }

    actions
    {
        addafter("&delegate")
        {
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                RunObject = page "Fin-Approval Entries";
                // RunPageLink = "Document No." = field("No.");
                trigger OnAction()
                begin
                    // DocumentType := DocumentType::casual
                    //ApprovalEntries.Setfilters(DATABASE::"Casual Requisition", DocumentType, Rec."No.");
                    //ApprovalEntries.RUN;
                end;
            }

        }
    }
}
