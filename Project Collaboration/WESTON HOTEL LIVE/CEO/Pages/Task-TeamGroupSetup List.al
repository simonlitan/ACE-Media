page 52178939 "Task Group Setup List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Task-Group Setup";
    CardPageId = "Task Group Setup";

    layout
    {
        area(Content)
        {
            repeater("Task Team Setup")
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field("Team Name"; Rec."Team Name")
                {
                    ApplicationArea = All;

                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = All;

                }
                field("Region Name"; Rec."Region Name")
                {
                    Editable = false;
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
            }
        }
    }

    /* actions
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
    } */

    var
        myInt: Integer;
}