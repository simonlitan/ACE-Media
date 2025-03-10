page 52179090 "Venue Booking Allocated"
{
    Editable = false;
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
                    REPORT.RUN(77706, TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
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
        respCenter: Code[10];
        GenVenueBooking: Record "Gen-Venue Booking";
}

