page 52178921 "Contacts listPart"
{
    Caption = 'ISO-Contacts Listpart';
    PageType = ListPart;
    SourceTable = "ISO-AuditReportTable";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Contact No"; Rec."Contact No")
                {
                    ApplicationArea = All;

                }
                field("Name"; Rec."Name")
                {
                    Caption = 'Name';
                    ApplicationArea = All;

                }

                field("Responsibility"; Rec."Responsibility")
                {
                    ApplicationArea = All;


                }


            }
        }
    }

}
