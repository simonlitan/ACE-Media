page 52178912 "Audit Findings Card"
{
    Caption = 'ISO-Audit Findings Card';
    PageType = Card;
    SourceTable = "Audit Findings";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Audit Number"; Rec."Timetable No.")
                {
                    Caption = 'Audit Number';
                    ApplicationArea = All;
                }

                field("Department"; Rec.Department)
                {
                    ApplicationArea = All;

                }
                field("Auditor name"; Rec."Name of auditor")
                {
                    ApplicationArea = All;

                }
                field("Date of audit"; Rec."Date audited")
                {
                    ApplicationArea = All;

                }


            }
            part("Audit Findings ListPart"; "Audit Findings ListPart")
            {
                SubPageLink = "No." = FIELD("Timetable No.");
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
                Caption = '&Print audit findings';
                Image = SendTo;
                RunObject = report "ISO-Audit Findings Report";

                trigger OnAction()
                begin


                end;
            }


        }
    }

    var
        myInt: Integer;
}
