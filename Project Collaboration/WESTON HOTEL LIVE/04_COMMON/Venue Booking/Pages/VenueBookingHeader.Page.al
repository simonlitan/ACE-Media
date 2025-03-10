page 52179092 "Venue Booking Header"
{
    PageType = Card;
    SourceTable = "Gen-Venue Booking";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Booking Id"; Rec."Booking Id")
                {
                    ApplicationArea = All;
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = All;
                }
                field("Venue Dscription"; Rec."Venue Dscription")
                {
                    Enabled = false;
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Department Name"; Rec."Department Name")
                {
                    Editable = false;
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
                    Caption = 'Description of Meeting';
                    ApplicationArea = All;
                }
                field("Required Time"; Rec."Required Time")
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
                    Caption = 'Number of People';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Requested By"; Rec."Requested By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    Editable = false;
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
                Caption = 'Submit Request';
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

                    IF CONFIRM('Submit request', TRUE) = FALSE THEN ERROR('Cancelled by user!');
                    Rec.Status := Rec.Status::"Pending Approval";
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

                    GenVenueBooking.RESET;
                    GenVenueBooking.SETFILTER(GenVenueBooking."Booking Id", Rec."Booking Id");
                    IF GenVenueBooking.FIND('-') THEN
                        REPORT.RUN(77706, TRUE, TRUE, Rec);
                end;
            }
        }
    }

    var
        // UserMgt: Codeunit "50114";
        ApprovalMgt: Codeunit "Export F/O Consolidation";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        //JournlPosted: Codeunit "50113";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        FixedAsset: Record "Fixed Asset";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application";
        RelNoEditable: Boolean;
        RelNameEditable: Boolean;
        EmpNameEditable: Boolean;
        LeaveTypeEditable: Boolean;
        respCenter: Code[10];
        GenVenueBooking: Record "Gen-Venue Booking";
}

