page 52179244 "HRM-Return to Office Card"
{
    Caption = 'Return to Office';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HRM-Return To Office(Leave)";
    PromotedActionCategories = 'New,Process,Report,Approvals';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Date; Rec.Date)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Leave No"; Rec."Leave No")
                {
                    //Editable = false;
                    ApplicationArea = all;
                }



                field("Applied Days"; Rec."Applied Days")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("End Date"; Rec."End Date")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }


                field("Leave Type"; Rec."Leave Type")
                {
                    Editable = false;
                    ApplicationArea = all;
                }

                field("Return Date"; Rec."Return Date")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    Editable = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {


            action(sendApproval)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;

                ApplicationArea = All;

                trigger OnAction()
                var

                begin
                    if Approvalsmgt.IsLeaveReturnTxtEnabled(Rec) = true then
                        Approvalsmgt.OnSendLeaveReturnTxtforApproval(Rec) else
                        Error('No Workflow enabled!');



                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("No.");

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

                begin

                end;
            }
            separator(Separator1000000003)
            {
            }
            action("Print/Preview")
            {
                Caption = 'Print/Preview';
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Report;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetFilter("No.", Rec."No.");
                    REPORT.Run(Report::"HR Leave Application (1)", true, true, Rec);
                    Rec.Reset;
                end;
            }
            separator(Separator1000000001)
            {
            }
            action("Post Return to Office")
            {
                ApplicationArea = all;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Rec.TestField("Leave No");
                    HRMEmployee.Reset();
                    HRMEmployee.SetRange("No.", rec."Employee No");
                    HRMEmployee.SetRange("Current Leave No", Rec."Leave No");
                    if HRMEmployee.Findset(true, true) then begin
                        HRMEmployee."On Leave" := false;
                        HRMEmployee.Modify();
                        Rec."Posting Date" := Today;
                        Rec."Posted By" := UserId;
                        Rec.Posted := true;
                        IF REc.Modify() then
                            Message('Employee %1 Updated Successfully', rec."Employee Name");
                        HRMPostedLeaves.Reset();
                        HRMPostedLeaves.SetRange("No.", rec."Leave No");
                        //  HRMPostedLeaves.SetRange(Returned, false);
                        if HRMPostedLeaves.Find('-') then begin
                            // HRMPostedLeaves.Returned := true;
                            HRMPostedLeaves.Modify();
                        end;
                    end;
                end;
            }

        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls;
    end;

    trigger OnInit()
    begin
        PurposeEditable := true;
        "Starting DateEditable" := true;
        "Applied DaysEditable" := true;
        "Department CodeEditable" := true;
        "Campus CodeEditable" := true;
        "Employee NoEditable" := true;
        DateEditable := true;
        "No.Editable" := true;
    end;

    trigger OnOpenPage()
    begin
        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */
        Rec.SetFilter("User ID", UserId);
        UpdateControls;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if rec."No." = '' then begin
            GenLedgerSetup.Get();
            GenLedgerSetup.TestField(GenLedgerSetup."Back To Office Nos.");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Back To Office Nos.", xRec."No. Series", 0D, rec."No.", xrec."No. Series");
        end;
        rec."User ID" := UserId;
        rec.Date := Today;
    end;

    var
        UserMgt: Codeunit "User Setup Management";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "HRM-Setup";

        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        Approvalsmgt: Codeunit "IntCodeunit2";
        LineNo: Integer;
        Post: Boolean;
        //JournlPosted: Codeunit "Journal Post Successful";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        FixedAsset: Record "Fixed Asset";
        HRMPostedLeaves: Record "HRM-Leave Requisition";
        //MinorAssetsIssue: Record "HMS-Patient";
        LeaveEntry: Record "HRM-Leave Ledger";
        [InDataSet]
        "No.Editable": Boolean;
        HRMEmployee: Record "HRM-Employee C";
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        "Employee NoEditable": Boolean;
        [InDataSet]
        "Campus CodeEditable": Boolean;
        [InDataSet]
        "Department CodeEditable": Boolean;
        [InDataSet]
        "Applied DaysEditable": Boolean;
        [InDataSet]
        "Starting DateEditable": Boolean;
        [InDataSet]
        PurposeEditable: Boolean;
        ApprovalEntries: Page "Fin-Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application";
        HREmp: Record "HRM-Employee C";

    procedure UpdateControls()
    begin
        /* if Rec.Status <> Rec.Status::Open then begin
             "No.Editable" := false;
             DateEditable := false;
             "Employee NoEditable" := false;
             "Campus CodeEditable" := false;
             "Department CodeEditable" := false;
             "Applied DaysEditable" := false;
             "Starting DateEditable" := false;
             PurposeEditable := false;
             //  CurrForm."Process Leave Allowance".EDITABLE:=FALSE;
         end else begin
             "No.Editable" := true;
             DateEditable := true;
             "Employee NoEditable" := true;
             "Campus CodeEditable" := true;
             "Department CodeEditable" := true;
             "Applied DaysEditable" := true;
             "Starting DateEditable" := true;
             PurposeEditable := true;
             // CurrForm."Process Leave Allowance".EDITABLE:=TRUE;

         end;
         */
    end;

}

