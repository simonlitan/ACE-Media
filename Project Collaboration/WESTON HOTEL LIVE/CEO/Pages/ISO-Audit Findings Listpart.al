page 52178914 "Audit Findings ListPart"
{
    Caption = 'Audit Findings';
    PageType = ListPart;
    SourceTable = "ISO-Findings Listpart Table";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No"; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field("Findings"; Rec."Findings")
                {
                    Caption = 'Aspect of the system to be checked';
                    ApplicationArea = All;

                }
                field("Name/signature of auditee"; Rec."Name/signature of auditee")
                {
                    MultiLine = true;
                    ApplicationArea = All;

                }
                field("Relevant clause"; Rec."Relevant clause")
                {
                    MultiLine = true;
                    ApplicationArea = All;

                }


            }
        }
    }

}
