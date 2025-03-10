page 52178698 "FIN-Memo Header Card"
{
    PageType = Card;
    DeleteAllowed = false;
    SourceTable = "FIN-Memo Header";
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")

                {
                    Editable = false;
                    Caption = 'Memo No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';

                }
                field("Date/Time"; Rec."Date/Time")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    NotBlank = true;
                }
                field("To"; Rec."To")
                {
                    ApplicationArea = all;
                    NotBlank = true;
                }
                field(Through; Rec.Through)
                {
                    ApplicationArea = all;
                    NotBlank = true;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = all;
                    Editable = false;
                    NotBlank = true;
                }

                field("REF."; Rec."Title/Ref.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    NotBlank = true;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Grade field.';
                    NotBlank = true;
                }

                field(Title; Rec.Title)
                {
                    Caption = 'Subject';
                    ApplicationArea = all;
                    NotBlank = true;
                }


                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    //  NotBlank = true;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }

                field("Budget Account"; Rec."Budget Account")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                }

                field("Memo Used"; Rec."Memo Used")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                }
                field(PRN; Rec.PRN)
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        CurrPage.UPDATE;
                        if rec.prn = true then setEditable2 := true else setEditable2 := false;
                    end;
                }


                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    NotBlank = true;
                }
                field("PRN No."; Rec."PRN No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    Visible = false;
                }

                field("Associated Document No."; Rec."Associated Document No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    visible = false;
                }
                field("Associated Document Type"; Rec."Associated Document Type")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    Visible = false;
                }
                field("Memo Value"; Rec."Memo Value")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    NotBlank = true;
                }


                field("Responsibility Centre"; Rec."Responsibility Centre")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                }
                field("Memo Status"; Rec."Memo Status")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;

                    trigger OnValidate()
                    begin
                        if Rec."Memo Status" = Rec."Memo Status"::Approved then begin
                            // Rec.GenerateImprests();
                            Rec."Memo Used" := true;
                        end;
                    end;
                }


            }
            group("Description Of Memo")
            {
                field("Paragraph 1"; Rec."Paragraph 1")
                {
                    ShowCaption = false;
                    ApplicationArea = all;
                    MultiLine = true;
                    Caption = 'Subject Of Memo';
                    NotBlank = true;
                }
                field("Paragraph 2"; Rec."Paragraph 2")
                {
                    ShowCaption = false;
                    ApplicationArea = all;
                    MultiLine = true;
                    Caption = 'Subject Continuation';
                }
            }
            part(part; "Memo PRN Details")
            {
                ApplicationArea = all;
                Editable = setEditable2;
                // Enabled = setEditable2;
                SubPageLink = "Document No." = FIELD("No.");
            }
        }
        area(FactBoxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = all;
                SubPageLink = "Table ID" = CONST(52178771),
                               "No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(ExpCodes)
            {
                Caption = 'Roles';
                ApplicationArea = All;
                Image = Allocations;
                Promoted = true;
                PromotedCategory = Process;
                Visible = fieldvisible;
                RunObject = Page "FIN-Memo Expense Codes";
                RunPageLink = "Memo No." = FIELD("No.");
            }
            action(MemRep)
            {
                ApplicationArea = All;
                Caption = 'Imprest Memo Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                var
                    cashoff: Record "Cash Office Setup";
                begin
                    cashoff.Get();
                    Rec."Budget Name" := cashoff."Current Budget";
                    Rec."Budgeted Amount2" := Rec."Budgeted Amount";
                    Rec."Committed Amount2" := Rec."Committed Amount" * -1;
                    Rec."Expensed Amount2" := Rec."Expensed Amount" * -1;
                    FINMemoHeader.RESET;
                    FINMemoHeader.SETRANGE("No.", Rec."No.");
                    IF FINMemoHeader.FIND('-') THEN BEGIN
                        REPORT.RUN(Report::"FIN-Memo Report", TRUE, FALSE, FINMemoHeader);
                    END;
                end;
            }
            action(MemRep1)
            {
                ApplicationArea = All;
                Caption = 'PRN Memo Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                var
                    cashoff: Record "Cash Office Setup";
                begin
                    cashoff.Get();
                    Rec."Budget Name" := cashoff."Current Budget";
                    Rec."Budgeted Amount2" := Rec."Budgeted Amount";
                    Rec."Committed Amount2" := Rec."Committed Amount" * -1;
                    Rec."Expensed Amount2" := Rec."Expensed Amount" * -1;
                    FINMemoHeader.RESET;
                    FINMemoHeader.SETRANGE("No.", Rec."No.");
                    IF FINMemoHeader.FIND('-') THEN BEGIN
                        REPORT.RUN(Report::"PRN Memo Report", TRUE, FALSE, FINMemoHeader);
                    END;
                end;
            }

            action("File Attachment")
            {
                ApplicationArea = All;

                Image = Attach;
                Promoted = true;
                PromotedCategory = category5;

                trigger OnAction()

                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;


            }

            action(sendApproval)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = Category4;
                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Init Code";
                begin
                    Rec.CheckDetails();
                    Rec.CommitBudget();
                    ApprovalMgt.OnSendMemoforApproval(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("No.");
            }
            action(cancellsApproval)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Init Code";
                begin
                    ApprovalMgt.OnCancelMemoForApproval(Rec);
                end;
            }
            /*  action(MarkPost)
             {
                 ApplicationArea = All;
                 Caption = 'Mark Posted';
                 Image = ActivateDiscounts;
                 Promoted = true;
                 PromotedCategory = Process;

                 trigger OnAction()
                 begin
                     IF Rec."Memo Status" <> Rec."Memo Status"::Approved THEN ERROR('Status must be Approved!');
                     IF CONFIRM('Mark as Posted?', FALSE) = FALSE THEN ERROR('Posting Cancelled!');
                     Rec."Memo Status" := Rec."Memo Status"::Posted;
                 end;
             } */




        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec."Memo Status" = Rec."Memo Status"::Pending THEN setEditable := TRUE ELSE setEditable := FALSE;
        IF Rec.PRN THEN setEditable2 := TRUE ELSE setEditable2 := FALSE;
        if rec."Memo Status" <> rec."Memo Status"::Pending then fieldvisible := false else fieldvisible := true;
    end;

    trigger OnInit()
    begin
        IF Rec."Memo Status" = Rec."Memo Status"::Pending THEN setEditable := TRUE ELSE setEditable := FALSE;
        IF Rec.PRN THEN setEditable2 := TRUE ELSE setEditable2 := FALSE;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        IF Rec.PRN THEN setEditable2 := TRUE ELSE setEditable2 := FALSE;
    end;

    var

        fieldvisible: Boolean;
        FINMemoHeader: Record "FIN-Memo Header";

        DateEquivalent: Date;
        setEditable: Boolean;
        setEditable2: Boolean;


        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";









}

