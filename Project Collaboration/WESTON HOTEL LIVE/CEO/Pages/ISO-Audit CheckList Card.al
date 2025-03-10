page 52178911 "ISO-Audit CheckList Card"
{
    Caption = 'INTERNAL AUDIT QUALITY CHECKLIST';
    PageType = Card;
    SourceTable = "ISO-Audit Checklist Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Form No"; Rec."Form No")
                {
                    ApplicationArea = All;


                }

                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;

                }
                field(Department; Rec.Department)
                {
                    Caption = 'Department code';
                    ApplicationArea = All;

                }
                field("Department Name"; Rec."Department Name")
                {
                    Caption = 'Department name';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("AuditType"; Rec."AuditType")
                {
                    ApplicationArea = All;

                }
                field("Location"; Rec."Location")
                {
                    ApplicationArea = All;

                }

            }
            part("Audit Items ListPart"; "ISO-Audit Items ListPart")
            {
                SubPageLink = "No." = FIELD("Form No");
                ApplicationArea = All;

            }



        }
    }
    actions
    {
        area(Processing)
        {
            action("Submit")
            {
                ApplicationArea = All;
                Caption = '&Print form';
                Image = SendTo;
                RunObject = report "ISO-Audit Checklist Report";

                trigger OnAction()
                begin
                    // Rec.RESET;
                    // Rec.SETFILTER("File Case Number", Rec."File Case Number");
                    // IF Rec.FINDFIRST THEN
                    //     REPORT.RUN(50100, TRUE, FALSE, Rec);
                end;



            }


        }
    }

    var
        myInt: Integer;
}
