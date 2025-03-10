page 52178931 "Closed Workplan"
{

    PageType = List;
    SourceTable = "PA ToDo";
    CardPageId = "Workplan Card";
    InsertAllowed = false;
    Editable = false;
    SourceTableView = where(Status = const(Closed));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("ToDo ID"; Rec."ToDo ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ToDo ID field.';
                }
                field("ToDO Name"; Rec."ToDO Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ToDO Name field.';
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
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}

