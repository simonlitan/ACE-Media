page 52178915 "ISO-Audit List"
{
    Caption = 'ISO-Audit List';
    PageType = List;
    SourceTable = "ISO-Audit Checklist Table";

    // CardPageId = "ISO-Audit Items ListPart";
    CardPageId = "ISO-Audit CheckList Card";



    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Form No"; Rec."Form No")
                {
                    ApplicationArea = All;

                }

                field("AuditType"; Rec."AuditType")
                {
                    ApplicationArea = All;

                }

            }

        }
    }
}
