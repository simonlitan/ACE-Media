page 52178947 "REG-File Requisition1"
{
    PageType = Card;
    SourceTable = "REG-File Requisition1";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Designation; Rec.Designation)
                {
                }
                field("Collecting Officer"; Rec."Collecting Officer")
                {
                }
                field(Purpose; Rec.Purpose)
                {
                }
                field("File No"; Rec."File No")
                {
                }
                field("File Name"; Rec."File Name")
                {
                }
                field("Authorized By"; Rec."Authorized By")
                {
                }
                field("Served By"; Rec."Served By")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    Approvalentries: Page 658;
                begin
                    /*
                   DocumentType:=DocumentType::"Payment Voucher";
                   Approvalentries.Setfilters(DATABASE::"Payments Header",DocumentType,"No.");
                   Approvalentries.RUN;
                    */

                end;
            }
            action(sendApproval)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit 439;
                    showmessage: Boolean;
                    ManualCancel: Boolean;
                    State: Option Open,"Pending Approval",Cancelled,Approved;
                    DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                    tableNo: Integer;
                begin
                    /*
                    IF NOT LinesExists THEN
                       ERROR('There are no Lines created for this Document');
                          TESTFIELD(Status,Status::Pending);
                    //Ensure No Items That should be committed that are not
                    IF LinesCommitmentStatus THEN
                      ERROR('Please Check the Budget before you Proceed');
                    
                    //Release the PV for Approval
                      State:=State::Open;
                     IF Status<>Status::Pending THEN State:=State::"Pending Approval";
                     DocType:=DocType::"Payment Voucher";
                     CLEAR(tableNo);
                     tableNo:=DATABASE::"Payments Header";
                     IF ApprovalMgt.SendApproval(tableNo,Rec."No.",DocType,State) THEN;
                     */

                end;
            }
            action(cancellsApproval)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit 439;
                    showmessage: Boolean;
                    ManualCancel: Boolean;
                    State: Option Open,"Pending Approval",Cancelled,Approved;
                    DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                    tableNo: Integer;
                begin
                    /*
                    DocType:=DocType::"Payment Voucher";
                    showmessage:=TRUE;
                    ManualCancel:=TRUE;
                    CLEAR(tableNo);
                    tableNo:=DATABASE::"Payments Header";
                     IF ApprovalMgt.CancelApproval(tableNo,DocType,Rec."No.",showmessage,ManualCancel) THEN;
                   */

                end;
            }
        }
    }
}


