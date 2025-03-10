page 52179009 "CEO-Appointment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CEO-Calendar Entries2";
    //"CEO-Appointments";

    layout
    {
        area(Content)
        {
            group("Appointment Details")
            {
                // field("No."; Rec."No.")
                // {
                //     ApplicationArea = All;
                //     Visible = false;
                // }
                field(Code; Rec.Code1)
                {
                    ApplicationArea = All;
                    Caption = 'Appointment No.';
                }
                field("Officer Internal"; Rec."Requesting Officer")
                {
                    Caption = 'Requesting Employee No.';
                    ApplicationArea = All;
                    //TableRelation = "HRM"
                }
                field("Full Name"; Rec."Full Name")
                {
                    Caption = 'Requesting Employee Name';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Officer External"; Rec."External Requesting Officer")
                {
                    Caption = 'External Request';
                    ApplicationArea = All;
                }
                field(Contact; Rec.Contact)
                {
                    Caption = 'Tel.Contact';
                    ApplicationArea = All;

                }

                field(Date; Rec.Date)
                {
                    ApplicationArea = All;

                }
                field(Time; Rec.Time)
                {
                    Caption = 'Time In';
                    ApplicationArea = All;

                }
                field("Firm/From Where"; Rec."Firm/From Where")
                {
                    Caption = 'Firm/From Where';
                    ApplicationArea = All;

                }

                field("Officer to be seen"; Rec."Officer to be seen")
                {
                    Caption = 'Officer to be seen';
                    ApplicationArea = All;

                }

                field(Reason; Rec.Reason)
                {
                    Caption = 'Reason for Visit';
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Received By"; Rec."Received By")
                {
                    Caption = 'Received By';
                    ApplicationArea = All;
                }
                field("Time Out"; Rec."Time Out")
                {
                    Caption = 'Time Out';
                    ApplicationArea = All;

                }
                field("Comments"; Rec."Comments")
                {
                    Caption = 'Comments';
                    ApplicationArea = All;
                    MultiLine = true;

                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;

                }

            }
            part("CEO-TasksPart"; "CEO-TasksListPart")
            {
                SubPageLink = "No." = FIELD("Code1");
                ApplicationArea = All;

            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(Approve)
            {
                ApplicationArea = All;
                Caption = '&Approve';
                Image = SendTo;

                trigger OnAction()
                begin
                    IF (xRec."Status" = Rec.Status::Open) OR (xRec."Status" = Rec.Status::Cancelled) THEN begin
                        Rec."Status" := Rec.Status::Approved;
                        Rec.Modify();
                        MESSAGE('Appointment has been approved');

                    end;
                end;
            }
            action(Reject)
            {
                ApplicationArea = All;
                Caption = '&Reject This Appointment';
                Image = Cancel;

                trigger OnAction()
                begin
                    IF (xRec."Status" = Rec.Status::Open) OR (xRec."Status" = Rec.Status::Approved) THEN begin
                        Rec."Status" := Rec.Status::Cancelled;
                        Rec.Modify();
                        MESSAGE('Appointment has been cancelled');

                    end;

                end;
            }
            action("Print Tasks")
            {
                ApplicationArea = All;
                Caption = 'Print Task Details';
                Image = Alerts;
                RunObject = report "Appointment TasksDetails";
            }
            action("Link to Task")
            {
                ApplicationArea = All;
                Caption = 'Link to Task';
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Category8;
                // RunObject = report "Appointment TasksDetails";



            }
        }
    }

    var
        myInt: Integer;
}