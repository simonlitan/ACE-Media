page 68435 "HRM-Emp. History Lines"
{
    PageType = ListPart;
    SourceTable = "HRM-Employment History";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = All;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = All;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                }
                field("Key Experience"; Rec."Key Experience")
                {
                    ApplicationArea = All;
                }
                field("Salary On Leaving"; Rec."Salary On Leaving")
                {
                    ApplicationArea = All;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field("Reason For Leaving"; Rec."Reason For Leaving")
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
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

