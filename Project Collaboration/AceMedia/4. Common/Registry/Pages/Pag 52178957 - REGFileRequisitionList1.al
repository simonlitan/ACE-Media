page 52178957 "REG-File Requisition List1"
{
    CardPageID = "REG-File Requisition1";
    PageType = List;
    SourceTable = "REG-File Requisition1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Designation; Rec.Designation)
                {
                }
                field("Collecting Officer"; Rec."Collecting Officer")
                {
                }
                field(Purpose; Rec.Purpose)
                {
                }
                field("File No"; Rec."File No")
                {
                }
                field("File Name"; Rec."File Name")
                {
                }
                field("Authorized By"; Rec."Authorized By")
                {
                }
                field("Served By"; Rec."Served By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

