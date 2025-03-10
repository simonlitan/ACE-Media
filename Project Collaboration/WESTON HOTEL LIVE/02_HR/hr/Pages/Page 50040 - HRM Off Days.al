page 50040 "HRM Off Days"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "HRM Off Days";
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(EmplNo; Rec.EmplNo)
                {
                    ApplicationArea = All;
                    Caption = 'Staff No';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    Caption = 'Department';
                }
                field(OffDay; Rec.OffDay)
                {
                    ApplicationArea = All;
                    Caption = 'Off-Day';
                }
                field(OffDayDate; Rec.OffDayDate)
                {
                    ApplicationArea = All;
                    Caption = 'Off Day Date';
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

            action("Base Calendar")
            {
                ApplicationArea = all;
                Caption = 'Base Calendar';
                Image = QualificationOverview;
                Promoted = true;
                RunObject = Page "Base Calendar Card";
            }
        }
    }
    
    var
        myInt: Integer;
}