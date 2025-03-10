page 70206 "Performance Criteria Cascade L"
{
    PageType = List;
    SourceTable = "Performance Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Criteria Code"; Rec."Performance Criteria Code")
                {
                    ApplicationArea = All;
                }
                field("Performance Criter Description"; Rec."Performance Criter Description")
                {
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
                field(Directorates; Rec.Directorates)
                {
                    ApplicationArea = All;
                }
                field(Departments; Rec.Departments)
                {
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                }
                field("Contract Period"; Rec."Contract Period")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

