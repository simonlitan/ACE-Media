page 52178485 "Gen_Journal Card1"
{
    PageType = Document;
    SourceTable = "Journal Voucher Header1";
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            Group(General)
            {
                //Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }

                field("Total Amount"; Rec."Total Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }

                field(Posted; Rec.Posted)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }


            }
            group("Posting Details")
            {
                Visible = false;
                Editable = editability;
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Postind Date field.';
                }


            }

            group("Lines")
            {
                Editable = editability;
                ShowCaption = false;
                part(lists; "Journal Voucher Lines1")
                {
                    ApplicationArea = All;
                    SubPageLink = "No." = field("No.");
                }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action("Send Approval")
            {
                ApplicationArea = All;
                image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    // approvalmgt.OnSendJvsforApproval(Rec);
                end;
            }
            action("Cancel Approval")
            {
                ApplicationArea = All;
                image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    // approvalmgt.OnCancelJvsforApproval(Rec);

                end;

            }
            action(Approvals)
            {
                ApplicationArea = All;

                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Approvals;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("No.");
            }
            action("Post")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    Opheader: Record "Journal Voucher Header1";
                begin

                    Opheader.Reset();
                    Opheader.SetRange("No.", rec."No.");
                    Opheader.SetRange(Posted, false);
                    if Opheader.Find('-') then begin
                        report.Run(report::"Process JVS", true, false, Opheader);
                    end else
                        Error('Already posted');
                    CurrPage.Close();

                end;
            }
            action("Process JVS")
            {
                ApplicationArea = all;
                RunObject = report "Process JVS";
            }
            action("Import Journals")
            {
                ApplicationArea = all;
                //  RunObject = xmlport "Journal Transfer";
            }

        }
    }

    var
        editability: Boolean;
        approvalmgt: Codeunit "Init Code1";

    trigger OnOpenPage()
    begin
        CheckEdit();
        //Rec.SetRange("User Name", UserId);
    end;

    local procedure CheckEdit()
    begin
        editability := true;
        if Rec.Posted = true then
            editability := false;

    end;

}
