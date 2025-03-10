page 52179221 "HRM-Back To Office Form"
{
    PageType = Card;
    SourceTable = "HRM-Back To Office Form";
    PromotedActionCategories = 'New,Process,Report,Attachments,Approvals,';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = all;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = all;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = all;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = all;
                }
                field(Trainer; Rec.Trainer)
                {
                    ApplicationArea = all;
                }
                field("Training Institution"; Rec."Training Institution")
                {
                    ApplicationArea = all;
                }
                field("Purpose of Training"; Rec."Purpose of Training")
                {
                    ApplicationArea = all;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }

            }
            group(Remarks)
            {
                field("Text 1"; Rec."Text 1")
                {
                    ApplicationArea = all;
                    Caption = '1.Please state how the course has benefited you and the organization';
                    MultiLine = true;
                }
                field("Text 2"; Rec."Text 2")
                {
                    ApplicationArea = all;
                    Caption = '2.Which specific areas do you think need improvement in your area of operation?';
                    MultiLine = true;
                }
                field("Text 3"; Rec."Text 3")
                {
                    ApplicationArea = all;
                    Caption = '3.How will you use the skills acquired to address the problem?';
                    MultiLine = true;
                }
                field("Text 4"; Rec."Text 4")
                {
                    ApplicationArea = all;
                    Caption = '4.Provide timeline within which you will cascade the skills learned to others in your Department/organization';
                    MultiLine = true;
                }

            }
        }
    }

    actions
    {
        area(navigation)
        {




            action("&Send Approval &Request")
            {
                Caption = '&Send Approval &Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                ApplicationArea = All;

                trigger OnAction()
                begin

                    if Confirm('Send this Application for Approval?', true) = false then exit;
                    if ApprovalMgt.IsBackOfficeTxtEnabled(Rec) = true then
                        ApprovalMgt.OnSendBackOfficeTxtforApproval(Rec);
                end;
            }
            action("&Approvals")
            {
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category5;
                ApplicationArea = All;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("Document No");
            }
            action("&Cancel Approval request")
            {
                Caption = '&Cancel Approval request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category5;
                ApplicationArea = All;

                trigger OnAction()
                begin

                    if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;
                    if ApprovalMgt.IsBackOfficeTxtEnabled(Rec) = true then
                        ApprovalMgt.OnCancelSendBackOfficeTxtforApproval(Rec);
                end;
            }
            action("&Print")
            {
                ApplicationArea = all;
                Caption = '&Print';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                begin
                    rec.Reset();
                    rec.SetRange("Document No", rec."Document No");
                    report.Run(report::"Staff Back To Office", true, true, rec);
                end;

            }
            action("Attachment")
            {
                ApplicationArea = All;
                Image = Attach;
                Promoted = true;
                PromotedCategory = category4;
                trigger OnAction()

                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
                /* trigger OnAction()
                begin
                    DMS.Reset;
                    DMS.SetRange("Document Type", DMS."Document Type"::"Staff File");
                    if DMS.Find('-') then begin
                        Hyperlink(DMS."url path" + Rec."No.");
                    end else
                        Message('No Link ' + format(DMS."Document Type"::"Staff File"));
                end; */

            }
            separator(Separator1)
            {
            }


        }
    }

    var
        ApprovalMgt: Codeunit IntCodeunit;
        HREmp: Record "HRM-Employee C";
        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";
}

