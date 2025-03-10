/// <summary>
/// Page HRM-Leave Approved Leave List.
/// </summary>
page 52179099 "HRM-Leave Approved Leave List"
{
    CardPageID = "HRM-Leave Requisition";
    Editable = false;
    DeleteAllowed = false;
    insertallowed = false;
    DelayedInsert = false;
    PageType = List;
    SourceTable = "HRM-Leave Requisition";
    SourceTableView = WHERE(status = const(Approved));

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
                field("Availlable Days"; Rec."Availlable Days")
                {
                    ApplicationArea = all;
                }
                field("Applied Days"; Rec."Applied Days")
                {
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

                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = all;
                }


                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; Rec."Institution Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                // field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                // }
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



            action("Post Leave Application")
            {
                Caption = 'Post Leave Application';
                Image = Post;
                PromotedCategory = Process;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    HrmLeavePeriod: Record "HRM-Leave Periods";
                begin
                    if Rec.Status <> Rec.Status::approved then Error('The Document Approval is not Complete');
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
                    rec.Status := rec.status::Posted;
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
            }



        }
    }
    /*   trigger OnAfterGetRecord()
      begin
          Rec.SETFILTER("User ID", USERID);
      end;
   */


    /* trigger OnOpenPage()
    begin
        Rec.SETFILTER("User ID", USERID);
    end; */



    trigger OnInit()
    begin
        //Rec.SETFILTER("User ID", USERID);
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
        LeaveEntry: Record "HRM-Leave Ledger";

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

    /// <summary>
    /// UpdateControls.
    /// </summary>
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

