page 52178907 "TR Transport Request Card"
{
    Caption = 'TR Transport Request Card';
    PageType = Card;
    SourceTable = "TR Transport Request";
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Request No"; Rec."Request No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request No field.';
                }
                field("Requested Date"; Rec."Requested Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requested Date field.';
                }
                field("Date of Travel"; Rec."Date of Travel")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Travel field.';
                }
                field("No of days requested"; Rec."No of days requested")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of days requested field.';
                }
                field("Expected Return Date"; Rec."Expected Return Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected Return Date field.';
                }
                field("Commencing Place"; Rec."Commencing Place")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Commencing Place field.';
                }
                field(Destination; Rec.Destination)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("No of Passengers"; Rec."No of Passengers")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Passengers field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field(Status; Rec.Status)
                {
                    StyleExpr = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
            }
            part("Passengers List"; "TR Passengers List")
            {
                ApplicationArea = all;
                SubPageLink = "Requisition No" = field("Request No");
            }
            group("Vehicle Details")
            {
                Editable = Fieleditable;

                field("Vehicle Allocated"; Rec."Vehicle Allocated")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Allocated field.';
                    trigger OnValidate()
                    begin

                        Usersetup.Reset();
                        Usersetup.SetRange("User ID", UserId);
                        if Usersetup.Find('-') then begin
                            Employeec.Reset();
                            Employeec.SetRange("No.", Usersetup."Employee No.");
                            if Employeec.Find('-') then begin
                                rec."Allocating Officer" := Employeec."First Name" + ' ' + Employeec."Middle Name" + ' ' + Employeec."Last Name";
                            end;
                            Vehicle.Reset();
                            Vehicle.SetRange("Registration No", rec."Vehicle Allocated");
                            if Vehicle.Find('-') then begin
                                rec.CalcFields("No of Passengers");
                                if rec."No of Passengers" > Vehicle."No of passengers" then
                                    Error('No of passengers in the request is greater than the vehicle can accomodate');
                            end;
                        end;
                    end;

                }
                field("Allocated Driver"; Rec."Allocated Driver")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocated Driver field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Allocating Officer"; Rec."Allocating Officer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocating Officer field.';
                }
            }

        }
    }
    actions
    {
        area(Processing)
        {

            action(sendApproval)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;

                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;
                trigger OnAction()
                var
                    ApprovalMgnt: Codeunit MaintenanceIntCodeunit;
                begin
                    rec.CalcFields("No of Passengers");
                    TrRequest.Reset();
                    TrRequest.SetRange("Request No", rec."Request No");
                    if TrRequest.Find('-') then
                        if TrRequest."No of Passengers" < 1 then Error('There are no passengers selected!');
                    //  if ApprovalMgnt.IsTransportEnabled(rec) = true then
                    // ApprovalMgnt.OnSendTransportforApproval(Rec);
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
                RunPageLink = "Document No." = field("Request No");
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

                    ApprovalMgnt: Codeunit MaintenanceIntCodeunit;
                begin
                    //if ApprovalMgnt.IsTransportEnabled(Rec) = true then
                    //  ApprovalMgnt.OnCancelSendTransportforApproval(Rec);
                end;
                //ApprovalMgt: Codeunit "Approvals Management";


            }
        }
    }
    trigger OnOpenPage()
    begin
        Usersetup.Reset();
        Usersetup.SetRange("User ID", UserId);
        if Usersetup.Find('-') then begin
            //if Usersetup."Transport Officer" = true then
            // Fieleditable := true
            // else
            // Fieleditable := false;
        end;
    end;

    var

        Usersetup: Record "User Setup";
        Fieleditable: Boolean;
        Employeec: Record "HRM-Employee C";
        Vehicle: record "TR Vehicles";
        TrRequest: Record "TR Transport Request";
}