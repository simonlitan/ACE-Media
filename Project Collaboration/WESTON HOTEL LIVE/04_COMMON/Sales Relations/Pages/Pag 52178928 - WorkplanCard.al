page 52178928 "Workplan Card"
{

    PageType = Card;
    SourceTable = "PA ToDo";
    PromotedActionCategories = 'New,Process, Report, Attachment';
    layout
    {
        area(content)
        {
            group(General)
            {
                field("ToDo ID"; Rec."ToDo ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ToDo ID field.';
                }

                field(Schedule; Rec.Schedule)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Schedule field.';
                }
                field(Deadline; Rec.Deadline)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Deadline field.';
                    trigger OnValidate()
                    var
                        ToDoRec: Record "PA ToDo";
                    begin
                        ToDoRec.Reset();
                        ToDoRec.Get(Rec."ToDo ID");
                        if ToDoRec.Deadline > ToDoRec.Schedule then
                            Error('Deadline %1 cannot be before the schedule %2', Rec.Deadline, Rec.Schedule)
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnValidate()
                    begin
                        setActionControls();
                    end;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Created At';
                }
                field(UserID; UserId)
                {
                    ApplicationArea = All;
                    Caption = 'User Id';
                }
            }
            part(PATasks; "Workplan  Task")
            {
                ApplicationArea = All;
                SubPageLink = "ToDo ID" = field("ToDo ID");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Mark as complete")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Visible = not IsClosed;

                trigger OnAction()
                var
                    PAToDo: Record "PA ToDo";
                begin
                    PAToDo.Reset();
                    PAToDo.Get(Rec."ToDo ID");
                    if Rec.Status = Rec.Status::Open then begin
                        PAToDo.Status := Rec.Status::Closed;
                        PAToDo.Modify();
                        Message('%1 closed successfuly', PAToDo."ToDO Name");
                    end
                    else
                        Message('The task must be open');
                end;
            }
            action("Re-Open Task")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Open;
                Visible = IsClosed;

                trigger OnAction()
                var
                    PAToDo: Record "PA ToDo";
                begin
                    PAToDo.Reset();
                    PAToDo.Get(Rec."ToDo ID");
                    PAToDo.Status := Rec.Status::Open;
                    PAToDo.Modify();
                    Message('%1 re-opened successfuly', PAToDo."ToDO Name");
                end;
            }

        }
    }
    trigger OnOpenPage()
    begin
        setActionControls();
    end;

    trigger OnInit()

    begin
        setActionControls();
    end;

    trigger OnAfterGetRecord()

    begin
        setActionControls();
    end;

    procedure setActionControls()
    begin
        if Rec.Status = Rec.Status::Open then
            IsClosed := false;
        if Rec.Status <> Rec.Status::Open then
            IsClosed := true;
    end;

    var
        IsClosed: Boolean;

}

