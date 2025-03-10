page 52179091 "Venue Booking - Allocated"
{
    CardPageID = "Venue Booking Allocated";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Gen-Venue Booking";
    SourceTableView = WHERE(Status = FILTER(Approved));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Booking Id"; Rec."Booking Id")
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                }
                field("Booking Date"; Rec."Booking Date")
                {
                    ApplicationArea = All;
                }
                field("Booking Time"; Rec."Booking Time")
                {
                    ApplicationArea = All;
                }
                field("Meeting Description"; Rec."Meeting Description")
                {
                    ApplicationArea = All;
                }
                field("Required Time"; Rec."Required Time")
                {
                    ApplicationArea = All;
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = All;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = All;
                }
                field("Contact Number"; Rec."Contact Number")
                {
                    ApplicationArea = All;
                }
                field("Contact Mail"; Rec."Contact Mail")
                {
                    ApplicationArea = All;
                }
                field(Pax; Rec.Pax)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(sendApproval)
            {
                Caption = 'Mark as Allocated';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Export F/O Consolidation";
                    showmessage: Boolean;
                    ManualCancel: Boolean;
                    State: Option Open,"Pending Approval",Cancelled,Approved;
                    DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                    tableNo: Integer;
                begin
                    Rec.TESTFIELD(Department);
                    Rec.TESTFIELD("Request Date");
                    Rec.TESTFIELD("Booking Date");
                    Rec.TESTFIELD("Meeting Description");
                    Rec.TESTFIELD("Required Time");
                    Rec.TESTFIELD(Venue);
                    Rec.TESTFIELD("Contact Person");
                    Rec.TESTFIELD("Contact Number");
                    Rec.TESTFIELD(Pax);

                    IF CONFIRM('Confirm Request', TRUE) = FALSE THEN ERROR('Cancelled by user!');
                    Rec.Status := Rec.Status::Approved;
                    Rec.MODIFY;
                    CurrPage.UPDATE;
                end;
            }
            separator(sep)
            {
            }
            action("Print Form")
            {
                Caption = 'Print Form';
                Image = PrintReport;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                begin

                    Rec.RESET;
                    Rec.SETFILTER("Booking Id", Rec."Booking Id");
                    REPORT.RUN(77707, TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
            action("Allocation Schedule")
            {
                Caption = 'Allocation Schedule';
                Image = AmountByPeriod;
                Promoted = true;
                PromotedIsBig = true;
                ApplicationArea = All;
                //RunObject = Report 77707;
            }
        }
    }

    var
        UserMgt: Codeunit "User Setup Management BR";
        ApprovalMgt: Codeunit "Export F/O Consolidation";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        FixedAsset: Record "Fixed Asset";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application";
        RelNoEditable: Boolean;
        RelNameEditable: Boolean;
        EmpNameEditable: Boolean;
        LeaveTypeEditable: Boolean;
        RespCenter: Code[10];
}

