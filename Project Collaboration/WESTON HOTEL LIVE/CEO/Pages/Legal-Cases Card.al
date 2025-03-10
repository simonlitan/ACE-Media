page 52178924 "Legal-Cases Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Legal-Cases";
    SaveValues = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Case Type"; Rec."Case Type")
                {
                    Caption = 'Case Type';
                    ApplicationArea = All;

                }//Set to autogenerate i.e from number series
                field("Filing Registration(FR) No."; Rec."Filing Registration(FR) No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                    Visible = false;
                }//Set to autogenerate i.e from number series
                field("File Case Number"; Rec."File Case Number")
                {
                    Caption = 'Case Number';
                    ApplicationArea = All;
                }
                field("File Number"; Rec."File Number")
                {
                    Caption = 'File Number';
                    ApplicationArea = All;
                }
                field("Case Title"; Rec."Case Title")
                {
                    ApplicationArea = All;

                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;

                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }
                field("Internal Advocate Name"; Rec."Advocate Name Internal")
                {
                    Caption = 'Inhouse Counsel Name';
                    ApplicationArea = All;
                }



                field("Advocate Name"; Rec."Advocate Name")
                {
                    Caption = 'Plaintiff Advocate Name';
                    ApplicationArea = All;
                }
                field("Case Description"; Rec."Case Description")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }

            }


            part("Legal-Court Proceedings"; "Legal-Court Proceedings")
            {
                SubPageLink = "Code" = FIELD("Filing Registration(FR) No.");
                ApplicationArea = All;
            }

            group(Decree)
            {
                field("Judgement Date"; Rec."Judgement Date")
                {
                    Caption = 'Judgement Start Date';
                    ApplicationArea = All;
                }
                field("Decree Notification"; Rec.Judgement)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Index Sheet"; Rec."Index Sheet")
                {
                    Caption = 'Judges Name';
                    ApplicationArea = All;
                }
            }
            group(Litigation)
            {
                Caption = 'Litigation Register';
                field("Party Name"; Rec.Judgement)
                {
                    Caption = 'Other party(s) name';
                    Description = 'Defines Other party(s) name';
                    ApplicationArea = All;
                }
                field("Legal Representative"; Rec.Judgement)
                {
                    Caption = 'Other party(s) legal representative';
                    Description = 'Defines Other party(s) legal representative';
                    ApplicationArea = All;
                }
                field("Claim Description"; Rec.Judgement)
                {
                    Caption = 'Brief description of the claim';
                    ApplicationArea = All;
                }
                field("Agents involved"; Rec.Judgement)
                {
                    Caption = 'Departmental officres/agents involved';
                    ApplicationArea = All;
                }
                field("File Creation Date"; Rec.Judgement)
                {
                    Caption = 'Date that the file was created';
                    ApplicationArea = All;
                }
                field("Action Commencement Date"; Rec.Judgement)
                {
                    Caption = 'Commencement date of the action';
                    ApplicationArea = All;
                }
                field("Service Writs Date"; Rec.Judgement)
                {
                    Caption = 'Date of the service of writs';
                    ApplicationArea = All;
                }
                field("Departmental Representative"; Rec.Judgement)
                {
                    Caption = 'Departmental legal representative(panel and non-panel)';
                    ApplicationArea = All;
                }
                field("Action Taken"; Rec.Judgement)
                {
                    Caption = 'Action Taken to date';
                    ApplicationArea = All;
                }
                field("Estimate Cost"; Rec.Judgement)
                {
                    Caption = 'Total estimate of the costs,inclusive of legal and damages';
                    ApplicationArea = All;
                }
                field("Legal Cost"; Rec.Judgement)
                {
                    Caption = 'Legal costs(amounts,description and date date)incurred to date';
                    ApplicationArea = All;
                }
                field("Comments"; Rec.Judgement)
                {
                    Caption = 'Any comments,for example,reference to legal opinions received and other pertinent details';
                    ApplicationArea = All;
                }
                field("Claim Status"; Rec.Judgement)
                {
                    Caption = 'Current status of claim,for example,claim settled';
                    ApplicationArea = All;
                }
                field("Remarks"; Rec.Judgement)
                {
                    Caption = 'Current status of claim,for example,claim settled';
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
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                RunObject = Page "Document Attachment Details";
                RunPageLink = "No." = field("Filing Registration(FR) No.");



                // trigger OnAction()
                // var
                //     DocumentAttachmentDetails: Page "Document Attachment Details";
                //     RecRef: RecordRef;
                // begin
                //     RecRef.GetTable(Rec);
                //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                //     DocumentAttachmentDetails.RunModal;
                // end;
            }
            action("Mark as Ongoing")
            {
                ApplicationArea = All;
                Image = Process;
                Promoted = true;
                // PromotedCategory = Process;

                trigger OnAction()
                begin
                    if (xRec.Status <> Rec.Status::Open) OR (xRec.Status <> Rec.Status::Closed) then begin
                        IF CONFIRM('Do you want to mark this case as ongoing?', TRUE) THEN
                            Rec."Status" := Rec.Status::Ongoing;
                        Rec.Modify();
                        MESSAGE('Case Number %1 is marked as ongoing', Rec."File Case Number");
                    end Else
                        Error('This Document is not open or is already closed');
                    ;
                end;
            }
            action("Close Case")
            {
                ApplicationArea = All;
                Image = CloseDocument;
                Promoted = true;

                //   PromotedCategory = Process;

                trigger OnAction()
                begin
                    if (xRec.Status = Rec.Status::Open) OR (xRec.Status <> Rec.Status::Closed) then begin
                        IF CONFIRM('Do you want to mark this case as closed?', TRUE) THEN
                            Rec."Status" := Rec.Status::Closed;
                        Rec.Modify();
                        MESSAGE('Case Number %1 is marked as closed', Rec."File Case Number");
                    end else
                        Error('The Case is not open or it is already closed');
                end;
            }
            action("Appeal Case")
            {
                ApplicationArea = All;
                Image = AddWatch;
                Promoted = true;
                RunObject = Page "Legal-Case Appeal Card";
                // PromotedCategory = Process;


            }
            action("Review Case")
            {
                ApplicationArea = All;
                Image = Addresses;
                Promoted = true;
                RunObject = Page "Legal-Case Review Card";
                //  PromotedCategory = Process;


            }
            action("Legal-Case Settlement Case")
            {
                ApplicationArea = All;
                Image = AuthorizeCreditCard;
                Promoted = true;
                RunObject = Page "Legal-Case Settlement Card";
                //   PromotedCategory = Process;


            }
            action("Legal-Case Renegotiation Card")
            {
                ApplicationArea = All;
                Image = Apply;
                Promoted = true;
                // PromotedCategory = Process;

            }

        }
        area(Reporting)
        {
            action("Legal Cases List Report")
            {
                Image = "Report";
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETFILTER("File Case Number", Rec."File Case Number");
                    IF Rec.FINDFIRST THEN
                        REPORT.RUN(Report::"Legal-CaseList Report", TRUE, FALSE, Rec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}