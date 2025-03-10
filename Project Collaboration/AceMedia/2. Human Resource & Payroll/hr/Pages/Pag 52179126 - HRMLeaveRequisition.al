/// <summary>
/// Page HRM-Leave Requisition (ID 68106).
/// </summary>
page 52179126 "HRM-Leave Requisition"
{

    PageType = Card;
    SourceTable = "HRM-Leave Requisition";
    DeleteAllowed = false;
    PromotedActionCategories = 'New,Report,Process,Approvals,Report';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    Editable = NoEditable;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = all;
                    Editable = false;

                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                    Editable = RelNoEditable;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;

                    Editable = EmpNameEditable;
                    

                }

                // field("Reliever No."; Rec."Reliever No.")
                // {
                //     ApplicationArea = all;
                //     Editable = RelNoEditable;

                // }
                // field("Reliever Name"; Rec."Reliever Name")
                // {
                //     ApplicationArea = all;
                //     Editable = RelNameEditable;
                // }
                field("Global Dimension 1 Code"; Rec."Institution Code")
                {
                    Editable = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                    Visible = true;

                }

                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = all;
                    Editable = true;
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = all;
                }
                field("Applied Days"; Rec."Applied Days")
                {
                    ApplicationArea = all;
                    Editable = true;
                }

                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = all;
                    Editable = true;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = all;
                    Editable = RelNoEditable;
                }
                field("Availlable Days"; Rec."Availlable Days")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                    Editable = false;

                }

                // field("Reliever Accepted"; Rec."Reliever Accepted")
                // {
                //     Editable = false;
                //     ApplicationArea = All;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Reliever Accepted field.';
                //     trigger onvalidate()
                //     var
                //         ApprovalMgnt: Codeunit IntCodeunit2;
                //     begin
                //         rec.Reset();
                //         rec.SetRange("No.", rec."No.");
                //         //  rec.SetRange("Reliever Accepted", rec."Reliever Accepted"::Accepted);
                //         if rec.Find('-') then begin
                //             if ApprovalMgnt.IsLeaveEnabled(Rec) = true then
                //                 ApprovalMgnt.OnSendLeaveforApproval(Rec)
                //             else
                //                 Error('No workflow enabled!');
                //         end;
                //     end;
                // }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("User ID"; Rec."User ID")
                {
                    Caption = 'Requestor Id';
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            // action("Reliever Accept")
            // {
            //     Image = Approve;
            //     Promoted = true;
            //     PromotedCategory = Category4;
            //     Visible = Reliveraccept;
            //     trigger OnAction()
            //     begin
            //         rec.RelieverAccept();
            //         rec.Validate("Reliever Accepted");
            //     end;
            // }
            // action("Reliever Decline")
            // {
            //     Image = Cancel;
            //     Promoted = true;
            //     PromotedCategory = Category4;
            //     Visible = Reliveraccept;
            //     trigger OnAction()
            //     begin
            //         rec.RelieverDecline();
            //     end;
            // }


            action(sendApproval)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Visible = true;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;
                trigger OnAction()
                var
                    ApprovalMgnt: Codeunit IntCodeunit2;
                begin
                    if ApprovalMgnt.IsLeaveEnabled(Rec) = true then
                        ApprovalMgnt.OnSendLeaveforApproval(Rec)
                    else
                        Error('No workflow enabled!');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';
                Visible = Approvalvisible;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("No.");
            }
            action(cancellsApproval)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Visible = Approvalvisible;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;


                trigger OnAction()
                var

                    ApprovalMgnt: Codeunit IntCodeunit2;
                begin
                    ApprovalMgnt.OnCancelLeaveforApproval(Rec);
                end;
                //ApprovalMgt: Codeunit "Approvals Management";


            }
            separator(Separator15)
            {
            }
            action("Print/Preview")
            {
                ApplicationArea = all;
                Caption = 'Leave Application';
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    //  rec.TestField(Status, Rec.Status::Posted);
                    Rec.Reset;
                    Rec.SetFilter("No.", Rec."No.");
                    REPORT.Run(report::"HR Leave Application (1)", true, true, Rec);

                end;
            }
            separator(Separator24)
            {
            }
            action("Post Leave Application")
            {
                ApplicationArea = all;
                Caption = 'Post Leave Application';
                Image = Post;
                Promoted = true;
                Visible = false;

                trigger OnAction()
                var
                    HrmLeavePeriod: Record "HRM-Leave Periods";
                begin
                    if Rec.Status <> Rec.Status::Approved then Error('The Document Approval is not Complete');

                    Rec.TestField("Employee No");
                    Rec.TestField("Applied Days");
                    Rec.TestField("Starting Date");
                    LeaveEntry.Init;
                    LeaveEntry."Document No" := Rec."No.";
                    LeaveEntry."Leave Period" := Date2DWY(Today, 3);
                    //LeaveEntry."Leave Period" := HrmLeavePeriod.Year;
                    LeaveEntry."Transaction Date" := Rec.Date;
                    LeaveEntry."Employee No" := Rec."Employee No";
                    LeaveEntry."Leave Type" := Rec."Leave Type";
                    LeaveEntry."No. of Days" := -Rec."Applied Days";
                    LeaveEntry."Transaction Description" := Rec.Purpose;
                    LeaveEntry."Entry Type" := LeaveEntry."Entry Type"::Application;
                    LeaveEntry."Created By" := UserId;
                    LeaveEntry."Transaction Type" := LeaveEntry."Transaction Type"::Application;
                    LeaveEntry.Insert(true);
                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."Posting Date" := Today;
                    Rec.Modify;
                    HREmp.Reset();
                    HREmp.SetRange("No.", rec."Employee No");
                    if HREmp.find('-') then begin
                        HREmp."On Leave" := true;
                        HREmp."Current Leave No" := Rec."No.";
                        HREmp.Modify;
                    end;
                    Message('Leave Posted Successfully');
                end;
            }

        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if rec."No." = '' then begin
            GenLedgerSetup.Get();
            GenLedgerSetup.TestField(GenLedgerSetup."Leave Application Nos.");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Leave Application Nos.", xRec."No. Series", 0D, rec."No.", rec."No. Series");
        end;
        rec."User ID" := UserId;
        rec.Date := Today;
        rec.Status := rec.Status::Open;
        rec.SETRANGE(rec."User ID", USERID);
        rec.SETRANGE(rec.Status, Rec.Status::Open);
        IF rec.COUNT > 10 THEN BEGIN
            ERROR('There are still some open applications in your account. First utilize them.');
        END;
        rec.SETRANGE(rec."User ID", USERID);
        rec.SETRANGE(rec.Status, Rec.Status::"Pending Approval");
        IF rec.COUNT > 10 THEN BEGIN
            ERROR('There are still some pending applications in your account. First utilize them.');
        END;
        rec.SETRANGE(rec."User ID", USERID);
        rec.SETRANGE(rec.Status, Rec.Status::Approved);
        IF rec.COUNT > 10 THEN BEGIN
            ERROR('There are still some unposted applications in your account.');
        END;
        if usersetup.Get(rec."User ID") then begin
            rec."Employee No" := usersetup."Employee No.";
            if Emp.Get(rec."Employee No") then begin
                rec."Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                rec."Institution Code" := emp."Global Dimension 1 Code";
                rec."Department Code" := emp."Global Dimension 2 Code";
                // rec."Shortcut Dimension 3 Code" := emp."Shortcut Dimension 3 Code";
                // rec.Salutation := emp.Salutation;
                rec."Job title" := EMP."Job Title";
                // rec.HOD := emp.HOD;
                rec."Phone No" := emp."Work Phone Number";
                rec."Phone No" := emp."Home Phone Number";
                rec."Days Carried forward" := emp."Reimbursed Leave Days";
            end;
        end;
        //  if rec."Reliever User Name" = UserId then Reliveraccept := true else Reliveraccept := false;
        if rec."User ID" = UserId then Approvalvisible := true else Approvalvisible := false;
        UpdateControls;
    end;

    trigger OnOpenPage()
    begin
        // if rec."Reliever User Name" = UserId then Reliveraccept := true else Reliveraccept := false;
        // if rec."User ID" = UserId then Approvalvisible := true else Approvalvisible := false;
        // UpdateControls;
    end;

    trigger OnAfterGetRecord()
    begin
        // if rec."Reliever User Name" = UserId then Reliveraccept := true else Reliveraccept := false;
        // if rec."User ID" = UserId then Approvalvisible := true else Approvalvisible := false;
        // UpdateControls;
        // Rec.Validate(Status);
    end;



    var
        UserMgt: Codeunit "User Setup Management";
        //todo  ApprovalMgt: Codeunit "Approvals Management";
        Approvalvisible: Boolean;
        usersetup: Record "User Setup";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        Emp: Record "HRM-Employee C";
        LineNo: Integer;
        Post: Boolean;
        //   JournlPosted: Codeunit "Journal Post Successful";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FixedAsset: Record "Fixed Asset";
        //MinorAssetsIssue: Record "HMS-Patient";
        LeaveEntry: Record "HRM-Leave Ledger";
        [InDataSet]
        NoEditable: Boolean;
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        EmployeeNoEditable: Boolean;
        [InDataSet]
        CampusCodeEditable: Boolean;
        [InDataSet]
        DepartmentCodeEditable: Boolean;
        [InDataSet]
        AppliedDaysEditable: Boolean;
        [InDataSet]
        StartingDateEditable: Boolean;
        [InDataSet]
        PurposeEditable: Boolean;
        ApprovalEntries: Page "Fin-Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application";
        HREmp: Record "HRM-Employee C";
        RelNoEditable: Boolean;
        RelNameEditable: Boolean;
        EmpNameEditable: Boolean;
        LeaveTypeEditable: Boolean;
        Reliveraccept: Boolean;
        GenLedgerSetup: Record "HRM-Setup";

    /// <summary>
    /// UpdateControls.
    /// </summary>
    procedure UpdateControls()
    begin
        if Rec.Status <> Rec.Status::Open then begin
            NoEditable := false;
            DateEditable := false;
            //EmployeeNoEditable:=FALSE;
            CampusCodeEditable := false;
            DepartmentCodeEditable := false;



            RelNoEditable := false;
            RelNameEditable := false;
            EmpNameEditable := false;



            //  CurrForm."Process Leave Allowance".EDITABLE:=FALSE;
        end else begin
            NoEditable := false;
            DateEditable := true;
            //EmployeeNoEditable:=FALSE;
            CampusCodeEditable := false;
            DepartmentCodeEditable := true;
            AppliedDaysEditable := true;
            StartingDateEditable := true;
            PurposeEditable := true;
            RelNoEditable := true;
            RelNameEditable := false;
            EmpNameEditable := false;
            LeaveTypeEditable := true;
            // CurrForm."Process Leave Allowance".EDITABLE:=TRUE;

        end;
    end;
}

