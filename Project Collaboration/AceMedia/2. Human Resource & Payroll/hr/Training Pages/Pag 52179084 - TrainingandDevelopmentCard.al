page 52179084 "Training and Development Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "HRM-Training Projection Header";
    PromotedActionCategories = 'New,Function,Approvals,Approvals,Report';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;


                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;

                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;


                }

                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;

                }
                field(period; Rec.period)
                {
                    ApplicationArea = All;
                    Caption = 'Training Period';

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                    Editable = false;

                }

            }
            group("Training Line")
            {
                part("Training"; "Training and Development List2")
                {
                    ApplicationArea = All;
                    SubPageLink = "Ref. No." = field("Document No");
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            // action("Training Projection")
            // {
            //     ApplicationArea = all;
            //     Promoted = true;
            //     PromotedCategory = Category5;
            //     RunObject = report "Training Projection";
            // }
            action("&Send Approval Request")
            {

                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;


                trigger OnAction()
                var
                    ApprovalMgnt: Codeunit IntCodeunit2;
                begin
                    if ApprovalMgnt.IsTrainingProjectionTxtEnabled(Rec) = true then
                        ApprovalMgnt.OnSendTrainingProjectionTxtforApproval(Rec)
                    else
                        Error('No workflow enabled!');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';

                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("Document No");
            }
            action(cancellsApproval)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;

                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;


                trigger OnAction()
                var

                    ApprovalMgnt: Codeunit IntCodeunit2;
                begin
                    ApprovalMgnt.OnCancelSendTrainingProjectionTxtforApproval(Rec);
                end;
                //ApprovalMgt: Codeunit "Approvals Management";


            }

        }


    }





    var
        Approvalvisible: Boolean;

}