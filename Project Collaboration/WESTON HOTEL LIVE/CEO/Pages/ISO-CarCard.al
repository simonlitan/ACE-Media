page 52178919 "ISO-CarCard"
{
    Caption = 'ISO-CarCard';
    PageType = Card;
    SourceTable = "ISO-CarFormTable";

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
                field("Organization"; Rec."Organization")
                {
                    ApplicationArea = All;

                }
                field("Car No"; Rec."Car No")
                {
                    Caption = 'CAR NO.';
                    ApplicationArea = All;
                }


            }

            group(Audit)
            {


                field("AUDIT DATE"; Rec."AUDIT DATE")
                {
                    ApplicationArea = All;

                }
                field("AUDIT NO."; Rec."AUDIT NO.")
                {
                    ApplicationArea = All;

                }

            }
            group(Review)
            {


                field("Area under review"; Rec."Area under review")
                {
                    ApplicationArea = All;

                }
                field("ISO 9001 CLAUSE"; Rec."ISO 9001 CLAUSE")
                {
                    Caption = 'Clause of criteria document';
                    ApplicationArea = All;
                }

            }
            group(Requirements)
            {
                field("Requirement"; Rec."Requirement")
                {
                    MultiLine = true;
                    ApplicationArea = All;

                }
                field("Non conformity evidence"; Rec."Non conformity evidence")
                {
                    MultiLine = true;
                    ApplicationArea = All;

                }
                field("Auditor"; Rec."Auditor1")
                {
                    Caption = 'Signed:Auditor';
                    ApplicationArea = All;
                }
                field("Auditee"; Rec."Auditee1")
                {
                    Caption = 'Auditee';
                    ApplicationArea = All;
                }

            }
            group(Category)
            {


                field("Minor"; Rec."Minor")
                {
                    ApplicationArea = All;

                }
                field("Major"; Rec."Major")
                {
                    ApplicationArea = All;

                }

            }
            group(Cause)
            {


                field("Root cause"; Rec."Root cause")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }


            }
            group(Corrections)
            {


                field("Correction"; Rec."Correction")
                {
                    Caption = 'Correction (as applicable)';
                    MultiLine = true;
                    ApplicationArea = All;
                }


            }
            group("Corrective Actions")
            {


                field("Corrective action"; Rec."Corrective action")
                {
                    Caption = 'Corrective action to be taken to prevent recurrence';
                    MultiLine = true;
                    ApplicationArea = All;
                }

                field("Auditee2"; Rec."Auditee2")
                {
                    Caption = 'Signed:Auditee';
                    ApplicationArea = All;
                }
                field("Auditor2"; Rec."Auditor2")
                {
                    Caption = 'Auditor';
                    ApplicationArea = All;
                }
                field("Date of completion"; Rec."Date of completion")
                {
                    ApplicationArea = All;


                }


            }
            group("Follow Up")
            {


                field("Fully completed"; Rec."Fully completed")
                {
                    Caption = 'Action fully completed';
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Partially completed"; Rec."Partially completed")
                {
                    Caption = 'Action partially completed';
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("No action taken"; Rec."No action taken")
                {
                    Caption = 'No action taken';
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Details1"; Rec."Details1")
                {
                    Caption = 'Details';
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Auditor3"; Rec."Auditor3")
                {
                    Caption = 'Auditor';
                    ApplicationArea = All;
                }
                field("Auditee3"; Rec."Auditee3")
                {
                    Caption = 'Auditee';
                    ApplicationArea = All;
                }


            }
            group(Effectiveness)
            {


                field("Effectiveness of action taken"; Rec."Effectiveness")
                {
                    Caption = 'Was the corrective action taken effective?';
                    ApplicationArea = All;
                }
                field("Details2"; Rec."Details2")
                {
                    Caption = 'Details(as necessary):';
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Auditor4"; Rec."Auditor4")
                {
                    Caption = 'Auditor';
                    ApplicationArea = All;
                }

                field("Name"; Rec."Name")
                {
                    Caption = 'Name';
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date3")
                {
                    Caption = 'Date';
                    ApplicationArea = All;
                }



            }


        }
    }
    actions
    {
        area(Processing)
        {
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Document Attachments';
                Image = Attach;
                // Promoted = true;
                // PromotedCategory = Category8;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
            action("Submit")
            {
                ApplicationArea = All;
                Caption = '&Print form';
                Image = SendTo;
                RunObject = report "Car form";

                trigger OnAction()
                begin


                end;
            }


        }
    }

    var
        myInt: Integer;
}
