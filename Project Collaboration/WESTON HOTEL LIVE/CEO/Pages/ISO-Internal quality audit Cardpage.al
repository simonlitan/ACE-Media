page 52178922 "Internal quality audit Card"
{
    Caption = 'ISO-Audit Findings Card';
    PageType = Card;
    SourceTable = "Internal quality audit";

    layout
    {
        area(content)
        {
            group(General)
            {

                field("Audit No"; Rec."Audit No")
                {
                    ApplicationArea = All;

                }
                field("Audit Date"; Rec."Audit Date")
                {
                    ApplicationArea = All;

                }
                field("Scope of audit"; Rec."Scope of audit")
                {
                    ApplicationArea = All;

                }
                field("Audit criteria"; Rec."Audit criteria")
                {
                    ApplicationArea = All;

                }
                field("Audit purpose"; Rec."Audit purpose")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Auditor"; Rec."Auditor")
                {
                    ApplicationArea = All;

                }

            }
            group(Contacts)
            {
                part("Persons contacted"; "Contacts listPart")
                {
                    SubPageLink = "Contact No" = FIELD("Audit No");
                    ApplicationArea = All;

                }
            }
            group(Introduction)
            {
                field("Introductions"; Rec.Introduction)
                {
                    MultiLine = true;
                    Caption = 'Introduction';
                    ApplicationArea = All;
                }
            }
            group(Summary)
            {
                field("Summary of audit findings"; Rec."Summary of audit findings")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Observations"; Rec."Observations")
                {
                    MultiLine = true;
                    Caption = 'Observations';
                    ApplicationArea = All;
                }
            }
            group("Improvement areas")
            {
                field("Areas of improvement"; Rec."Areas of improvement")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
            }
            group(Recommendation)
            {
                field("Recommendations"; Rec.Recommendations)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
            }
            group(Attachment)
            {
                field("Attachments"; Rec.Attachments)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
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
                RunObject = report "ISO-Internal QualiAudit Report";

                trigger OnAction()
                begin


                end;
            }


        }
    }

    var
        myInt: Integer;
}
