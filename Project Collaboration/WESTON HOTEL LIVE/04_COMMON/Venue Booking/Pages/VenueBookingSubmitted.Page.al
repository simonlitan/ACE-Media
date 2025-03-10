page 52179095 "Venue Booking (Submitted)"
{
    CardPageID = "Venue Booking Header";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Gen-Venue Booking";
    SourceTableView = WHERE(Status = FILTER("Pending Approval"));

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

    trigger OnAfterGetRecord()
    begin
        Rec.SETFILTER("Requested By", '=%1', USERID);
    end;

    var
        //UserMgt: Codeunit "50114";
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
        RespCenter: Code[10];
}

