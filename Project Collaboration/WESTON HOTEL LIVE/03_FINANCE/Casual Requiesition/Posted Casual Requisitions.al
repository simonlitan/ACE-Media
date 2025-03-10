page 52178552 "Posted Casual Requisitions"
{
    CardPageID = "Casual Requisition Card";
    Editable = false;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Casual Requisition";
    SourceTableView = where(Status = filter(Approved));//, status = filter(<>"Pending Approval"), status = filter(<> Approved));


    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                Editable = true;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                }
                field("Date From"; Rec."Date From")
                {
                    Caption = 'Start Date';
                    ApplicationArea = All;
                }
                field("Date To"; Rec."Date To")
                {
                    Caption = 'End Date';
                    ApplicationArea = All;
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = All;
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }
                field("Cost Center"; Rec."Cost Center")
                {
                    ApplicationArea = All;
                }
                field("Cost Center Name"; Rec."Cost Center Name")
                {
                    ApplicationArea = All;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = All;
                }
                field(Responsibilities; Rec.Responsibilities)
                {
                    ApplicationArea = All;
                }
                field(Narration; Rec.Narration)
                {
                    Caption = 'Explanation';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {

                action(Approvals)
                {
                    ApplicationArea = All;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "Fin-Approval Entries";
                    RunPageLink = "Document No." = field("No.");
                }
                action(sendApproval)
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;

                    PromotedCategory = Process;
                    ApplicationArea = All;
                    PromotedIsBig = true;


                    // trigger OnAction()
                    // var
                    //     //todo  ApprovalMgt: Codeunit "Approvals Management";
                    //     showmessage: Boolean;
                    //     ManualCancel: Boolean;
                    //     State: Option Open,"Pending Approval",Cancelled,Approved;
                    //     DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                    //     tableNo: Integer;
                    // begin
                    //     Rec.TestField("Employee No");
                    //     Rec.TestField("Applied Days");
                    //     Rec.TestField("Starting Date");
                    //     Rec.TestField("Reliever No.");
                    //     Rec.TestField(Purpose);
                    //     Rec.CalcFields("Availlable Days");
                    //     // if Rec."Availlable Days" < 1 then Error('Please note that you dont have enough leave balance');


                    //     //Release the Leave for Approval
                    //     State := State::Open;
                    //     if Rec.Status <> Rec.Status::Open then State := State::"Pending Approval";
                    //     DocType := DocType::"Leave Application";
                    //     Clear(tableNo);
                    //     tableNo := 61125;
                    //     //todo if ApprovalMgt.SendApproval(tableNo, Rec."No.", DocType, State) then;
                    //     //  IF ApprovalMgt.SendLeaveApprovalRequest(Rec) THEN;
                    // end;

                    trigger OnAction()
                    var
                        ApprovalMgnt: Codeunit IntCodeunit2;
                    begin
                        //ApprovalMgnt.OnSendLeaveforApproval(Rec);
                    end;
                }
                action(cancellsApproval)
                {

                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;

                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var

                        ApprovalMgnt: Codeunit IntCodeunit2;
                    begin
                        //ApprovalMgnt.OnCancelLeaveforApproval(Rec);
                    end;
                    //ApprovalMgt: Codeunit "Approvals Management";


                }
                separator(Separator1000000003)
                {
                }
                action("Print/Preview")
                {
                    Caption = 'Print/Preview';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetFilter("No.", Rec."No.");
                        //REPORT.Run(report::"HR Leave Application (1)", true, true, Rec);
                        Rec.Reset;
                    end;
                }
                separator(Separator1000000001)
                {
                }
                action("Post Leave Application")
                {
                    Caption = 'Post Casual Requisition';
                    Image = Post;
                    PromotedCategory = Process;
                    Promoted = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if Rec.Status <> Rec.Status::Approved then Error('The Document Approval is not Complete');
                    end;
                }
            }
        }
    }




    trigger OnInit()
    begin
        Rec.SETFILTER("User ID", USERID);
        PurposeEditable := true;
        "Starting DateEditable" := true;
        "Applied DaysEditable" := true;
        "Department CodeEditable" := true;
        "Campus CodeEditable" := true;
        "Employee NoEditable" := true;
        DateEditable := true;
        "No.Editable" := true;
    end;





    var
        UserMgt: Codeunit "User Setup Management";
        //todo ApprovalMgt: Codeunit "Approvals Management";
        ReqLine: Record "HMS-Setup Blood Group";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        //JournlPosted: Codeunit "Journal Post Successful";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        FixedAsset: Record "Fixed Asset";
        //MinorAssetsIssue: Record "HMS-Patient";
        LeaveEntry: Record "HRM-Leave Ledger";
        [InDataSet]
        "No.Editable": Boolean;
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
        if Rec.Status <> Rec.Status::Open then begin
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
    end;
}