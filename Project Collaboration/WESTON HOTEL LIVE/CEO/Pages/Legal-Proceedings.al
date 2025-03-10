page 52178931 "Legal-Court Proceedings"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Court Attendance Record';
    SourceTable = "Legal-Court Proceedings";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    

                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = All;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }
                field(Remarks; Rec.Remarks)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field(ModifiedBy; Rec."Modified By")
                {
                    Caption = 'Modified By';
                    ApplicationArea = All;

                }
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}