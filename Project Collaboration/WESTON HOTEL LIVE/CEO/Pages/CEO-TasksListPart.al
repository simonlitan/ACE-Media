page 52178906 "CEO-TasksListPart"
{
    Caption = 'CEO-TasksListPart';
    PageType = ListPart;
    SourceTable = CEOTasksListPartTable;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    Caption = 'No.';


                }
                // field("Appointment Number"; Rec."Appointment Number")
                // {
                //     Caption = 'Appointment No.';

                // }
                field("Task Code"; Rec."Task Code")
                {
                    ApplicationArea = all;
                    Caption = 'Task Number';
                }
                field("Task Name"; Rec."Task Name")
                {
                    ApplicationArea = all;

                }
                field("Task Details"; Rec."Task Details")
                {
                    ApplicationArea = all;

                }
                field("Assigned To:"; Rec."Assign To")
                {
                    ApplicationArea = all;
                }

                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = all;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = all;
                }
                field("Due  Time"; Rec."Due Time")
                {
                    ApplicationArea = all;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = all;
                }


            }
        }
    }
    actions
    {
        area(processing)
        {
            action(SelectMultiItems)
            {
                AccessByPermission = TableData Item = R;
                ApplicationArea = all;
                Caption = 'Select items';
                Ellipsis = true;
                Image = NewItem;
                ToolTip = 'Add two or more items from the full list of your inventory items.';

                trigger OnAction()
                begin
                    //SelectMultipleItems;
                end;
            }

            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("E&xplode BOM")
                {
                    AccessByPermission = TableData "BOM Component" = R;
                    ApplicationArea = all;
                    Caption = 'Cancel Task';
                    Image = Cancel;
                    //Enabled = Type = Type::Item;
                    ToolTip = 'Cancel this task';

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
                action("Submit")
                {
                    AccessByPermission = TableData "Extended Text Header" = R;
                    ApplicationArea = all;
                    Caption = 'Submit Task';
                    Image = SendTo;
                    ToolTip = 'Submit this task for further action.';

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


            }

        }
    }
}
