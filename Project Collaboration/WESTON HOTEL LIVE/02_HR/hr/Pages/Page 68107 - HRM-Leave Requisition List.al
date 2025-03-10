page 68107 "HRM-Leave Requisition List"
{
    CardPageID = "HRM-Leave Requisition";
    Editable = false;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HRM-Leave Requisition";
    SourceTableView = WHERE(Posted = FILTER(false));

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
                    ApplicationArea = all;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = all;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = all;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }

                field("Applied Days"; Rec."Applied Days")
                {
                    ApplicationArea = all;
                }
                field("Availlable Days"; Rec."Availlable Days")
                {
                    Caption = 'Remaining Days';
                    ApplicationArea = all;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = all;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = all;
                }

                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                }


                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {

                    ToolTip = 'Specifies the value of the User ID field.';
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


                action(sendApproval)
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;

                    PromotedCategory = Process;
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
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var

                        ApprovalMgnt: Codeunit IntCodeunit2;
                    begin
                        ApprovalMgnt.OnCancelLeaveforApproval(Rec);
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

                        rec.TestField(Status, Rec.Status::Posted);
                        Rec.Reset;
                        Rec.SetFilter("No.", Rec."No.");
                        REPORT.Run(report::"HR Leave Application (1)", true, true, Rec);
                        Rec.Reset;


                    end;
                }


            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.SETFILTER("User ID", USERID);
        UpdateControls;
    end;



    trigger OnOpenPage()
    begin
        Rec.SETFILTER("User ID", USERID);
        UpdateControls;

    end;




    trigger OnInit()
    begin
        Rec.SETFILTER("User ID", USERID);
        UpdateControls;
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

