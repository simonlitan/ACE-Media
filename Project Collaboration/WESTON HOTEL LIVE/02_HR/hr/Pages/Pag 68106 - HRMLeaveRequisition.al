/// <summary>
/// Page HRM-Leave Requisition (ID 68106).
/// </summary>
page 68106 "HRM-Leave Requisition"
{

    PageType = Card;
    SourceTable = "HRM-Leave Requisition";
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
                field("Reliever No."; Rec."Reliever No.")
                {
                    ApplicationArea = all;
                    Editable = RelNoEditable;
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = all;
                    Editable = RelNameEditable;
                }
                field("Campus Code";Rec."Campus Code")
                {
                    ApplicationArea = all;
                    Caption = 'Branch';
                }

                field("Department Code"; Rec."Department Code")
                {
                    
                    ApplicationArea = all;
                    Editable = true;
                }
                field("Shortcut Dimension  3"; Rec."Shortcut Dimension  3")
                {
                    visible = false;
                    Caption = 'Division';
                    Editable = RelNoEditable;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension  3 field.';
                }

                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = all;
                    Editable = LeaveTypeEditable;
                }
                field("Applied Days"; Rec."Applied Days")
                {
                    ApplicationArea = all;
                    Editable = AppliedDaysEditable;
                }

                field("Off Day"; Rec."Off Day")
                {
                    ApplicationArea = All;
                    ;
                }

                field("Total Off-Days Within Leave"; Rec."Total Off Days")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the total number of Off Days within the leave period you are applying.';
                }
                field("Pending Off Days"; Rec."Pending Off Days")
                {
                    ApplicationArea = all;
                }

                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = all;
                    Editable = StartingDateEditable;
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
                    Editable = PurposeEditable;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {

                }

                field("Availlable Days"; Rec."Availlable Days")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = all;
                    Editable = RelNoEditable;

                }
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


            action(sendApproval)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;

                PromotedCategory = Category4;
                ApplicationArea = All;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ApprovalMgnt: Codeunit IntCodeunit2;
                begin
                    ApprovalMgnt.OnSendLeaveforApproval(Rec);
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
                    //rec.TestField(Status, Rec.Status::Posted);
                    Rec.Reset;
                    Rec.SetFilter("No.", Rec."No.");
                    REPORT.Run(report::"HR Leave Application (1)", true, true, Rec);
                    Rec.Reset;
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


            }

        }
    }

    trigger OnOpenPage()
    begin
        UpdateControls;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec.Status = Rec.Status::Released then
            PostLeave();
    end;

    procedure PostLeave()
    begin
        if Rec.Status <> Rec.Status::Released then Error('The Document Approval is not Complete');

        Rec.TestField("Employee No");
        Rec.TestField("Applied Days");
        Rec.TestField("Starting Date");

        LeaveEntry.Init;
        LeaveEntry."Document No" := Rec."No.";
        LeaveEntry."Leave Period" := Date2DWY(Today, 3);
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

        if HREmp.Get(Rec."Employee No") then begin
            HREmp."On Leave" := true;
            HREmp."Current Leave No" := Rec."No.";
            HREmp.Modify;
        end;
        Message('Leave Posted Successfully');
    end;



    var
        UserMgt: Codeunit "User Setup Management";
        //todo  ApprovalMgt: Codeunit "Approvals Management";
        ReqLine: Record "HMS-Setup Blood Group";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        //   JournlPosted: Codeunit "Journal Post Successful";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
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

