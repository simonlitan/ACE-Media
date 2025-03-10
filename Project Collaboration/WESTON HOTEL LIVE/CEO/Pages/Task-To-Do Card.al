page 52178940 "To-Do Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "User Tasks";

    layout
    {
        area(Content)
        {
            group(ToDoList)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        NoSeriesMgt: Codeunit NoSeriesManagement;
                    begin
                        if Rec."Code" <> xRec."Code" then begin
                            //HRSetup.Get;
                            NoSeriesMgt.TestManual('TASK');
                            Rec."No Series" := '';
                        end;
                    end;
                }
                field("Task Name"; Rec."Task Name")
                {
                    ApplicationArea = all;
                }

                field("Task Details"; Rec."Task Details")
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field("Comments"; Rec."Comments")
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }

                field("Assign To"; Rec."Assign To")
                {
                    ApplicationArea = all;
                    Caption = 'Assigned To';
                    Enabled = true;
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = all;

                }
                field("Due Time"; Rec."Due Time")
                {
                    ApplicationArea = all;
                }

                field("Created By"; Rec."User Id")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Feedback; Rec.Feedback)
                {
                    ApplicationArea = all;
                    MultiLine = true;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;

                }

                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = all;
                    Editable = false;
                }




            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Submit")
            {
                ApplicationArea = All;
                Caption = '&Submit';
                Image = SendTo;

                trigger OnAction()
                begin

                    IF (xRec."Status" = Rec.Status::Open) AND (xRec."Assign To" <> '') THEN begin
                        Rec."Status" := Rec.Status::Pending;
                        Rec.Modify();
                        MESSAGE('Task Successfully Submitted to %1 for action', Rec."Full Name");
                    end;
                    IF (xRec.Status = Rec.Status::Cancelled) AND (xRec."Assign To" <> '') THEN begin
                        IF CONFIRM('This task was cancelled, do yo want to open and resend it?', TRUE) THEN
                            Rec."Status" := Rec.Status::Pending;
                        Rec.Modify();
                        // MESSAGE('Task assigned to %1 is cancelled', Rec."Full Name");
                        MESSAGE('Task has been reopened and assigned to %1 for action', Rec."Full Name");
                    end;
                end;
            }

            action("Cancel")
            {
                ApplicationArea = All;
                Caption = '&Cancel This Task';
                Image = Cancel;

                trigger OnAction()
                begin
                    IF (xRec."Status" = Rec.Status::Cancelled) THEN begin
                        MESSAGE('Task Submitted to %1 has already been cancelled', Rec."Full Name");
                    end;

                    Rec."Status" := Rec.Status::Cancelled;
                    Rec.Modify();
                    MESSAGE('Task Submitted to %1 is cancelled', Rec."Full Name");

                end;
            }
            action("Close Task")
            {
                ApplicationArea = All;
                Caption = '&Close This Task';
                Image = Cancel;

                trigger OnAction()
                begin
                    IF (xRec."Status" = Rec.Status::Cancelled) THEN begin
                        MESSAGE('Task Submitted to %1 has already been cancelled', Rec."Full Name");
                    end;

                    Rec."Status" := Rec.Status::Closed;
                    Rec.Modify();
                    MESSAGE('Task Submitted to %1 is closed', Rec."Full Name");

                end;
            }
            action("Print Task Details")
            {
                ApplicationArea = All;
                Caption = 'Print Task Details';
                Image = SendTo;
                RunObject = report TasksDetails;

                trigger OnAction()
                begin


                end;
            }
        }
    }

    var
        myInt: Integer;
}