page 78897 "HRM-Attachment Register"
{
    PageType = List;
    SourceTable = "HRM-Attachment Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Names; rec.Names)
                {
                    ApplicationArea = All;
                }
                field(Institution; rec.Institution)
                {
                    ApplicationArea = All;
                }
                field("Course/Level"; rec."Course/Level")
                {
                    ApplicationArea = All;
                }
                field("Attachement Period"; rec."Attachement Period")
                {
                    ApplicationArea = All;
                }
                field("Contract No"; rec."Contract No")
                {
                    ApplicationArea = All;
                }
                field("Department Attached"; rec."Department Attached")
                {
                    ApplicationArea = All;
                }
                field("Department Name"; rec."Department Name")
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

