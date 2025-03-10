page 68108 "HRM-Leave Requisition Posted"
{
    Editable = false;
    PageType = List;
    SourceTable = "HRM-Leave Requisition";
    SourceTableView = WHERE(Posted = CONST(true));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    Editable = "No.Editable";
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = all;
                    Editable = DateEditable;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                    Editable = "Employee NoEditable";
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Campus Code"; Rec."Campus Code")
                {
                    ApplicationArea = all;
                    Editable = "Campus CodeEditable";
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                    Editable = "Department CodeEditable";
                }
                field("Applied Days"; Rec."Applied Days")
                {
                    ApplicationArea = all;
                    Editable = "Applied DaysEditable";
                }
                field("Availlable Days"; Rec."Availlable Days")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = all;
                    Editable = "Starting DateEditable";
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
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = all;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = all;
                    Editable = PurposeEditable;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                    Editable = false;
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
                ApplicationArea = all;
                Caption = 'Print Application Form';
                Promoted = true;
                PromotedCategory = process;

                trigger OnAction()
                begin
                    // rec.TestField("Annual Leave days");
                    //rec.TestField("Days Carried forward");
                    rec.TestField(status, rec.Status::Posted);
                    Rec.Reset;
                    Rec.SetFilter("No.", Rec."No.");
                    REPORT.Run(Report::"HR Leave Application (1)", true, true, Rec);
                    Rec.Reset;
                end;
            }




        }
    }

    trigger OnInit()
    begin
         UpdateControls;
        //ProcessLeaveAllowanceEditable := TRUE;
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
        UpdateControls;

    end;

    var
        UserMgt: Codeunit "User Setup Management";
        //todo  ApprovalMgt: Codeunit "Approvals Management";
        ReqLine: Record "HMS-Setup Blood Group";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        // JournlPosted: Codeunit "Journal Post Successful";
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
        if Rec.Status <> 0 then begin
            "No.Editable" := false;
            DateEditable := false;
            "Employee NoEditable" := false;
            "Campus CodeEditable" := false;
            "Department CodeEditable" := false;
            "Applied DaysEditable" := false;
            "Starting DateEditable" := false;
            PurposeEditable := false;
            //  ProcessLeaveAllowanceEditable :=FALSE;
        end else begin
            "No.Editable" := true;
            DateEditable := true;
            "Employee NoEditable" := true;
            "Campus CodeEditable" := true;
            "Department CodeEditable" := true;
            "Applied DaysEditable" := true;
            "Starting DateEditable" := true;
            PurposeEditable := true;
            //ProcessLeaveAllowanceEditable :=TRUE;

        end;
    end;
}

