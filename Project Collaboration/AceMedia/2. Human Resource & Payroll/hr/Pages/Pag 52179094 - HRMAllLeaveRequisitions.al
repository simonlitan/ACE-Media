page 52179094 "HRM-All Leave Requisitions"
{
    CardPageID = "HRM-Leave Requisition";
    Editable = false;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HRM-Leave Requisition";
    SourceTableView = sorting("No.") order(ascending) WHERE(Status = FILTER(<> Posted & <> Approved));


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
                field("Global Dimension 1 Code"; Rec."Institution Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }

                field("Leave Type"; Rec."Leave Type")
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
                    REPORT.Run(report::"HR Leave Application (1)", true, true, Rec);
                    Rec.Reset;
                end;
            }
            action("Leave C")
            {
                ApplicationArea = all;
                RunObject = page "Leave Journal Bal";
            }


        }

    }
    trigger OnAfterGetRecord()
    begin
        Rec.SETFILTER("User ID", USERID);
    end;

    // trigger OnInit()
    // begin
    //     Rec.SETFILTER("User ID" ,USERID);
    // end;

    trigger OnOpenPage()
    begin
        Rec.SETFILTER("User ID", USERID);
    end;




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
        Rec.SETFILTER("User ID", USERID);
    end;





    var
        UserMgt: Codeunit "User Setup Management";
        //todo ApprovalMgt: Codeunit "Approvals Management";

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