page 52178928 "Legal-Contract Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Legal-Contracts";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;


                }
                field("Contract Number"; Rec."Contract Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contract Number field.';
                }


                field("Contract Amount"; Rec."Contract Amount")
                {
                    Editable = true;
                    ApplicationArea = All;
                }

                field("Paid Amount"; Rec."Paid Amount")
                {
                    ApplicationArea = All;

                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;

                }
                field("Tender No."; Rec."Tender No.")
                {
                    ApplicationArea = All;

                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    Caption = 'Client NO.';
                    ApplicationArea = All;


                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    Caption = 'Client Name';
                    ApplicationArea = All;


                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;

                }
                field("Completion Date"; Rec."Completion Date")
                {
                    ApplicationArea = All;

                }
                field("Region Code"; Rec."Region Code")
                {
                    Caption = 'Region Code';
                    ApplicationArea = All;

                }
                field("Region Name"; Rec."Region Name")
                {
                    Caption = 'Region Name';
                    ApplicationArea = All;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = All;

                }
                field("User Id"; Rec."User Id")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("Performance Bonds")
            {

                group("Terms of Reference")
                {
                    field("(1))"; Rec."First ToR")
                    {
                        // ToolTip = 'Specifies the value of the Basic Salary field.';
                        ApplicationArea = All;
                        Editable = true;
                        MultiLine = true;
                        Caption = '(1)';
                    }
                    field("(2))"; Rec."Second ToR")
                    {
                        //ToolTip = 'Specifies the value of the House Allowance field.';
                        ApplicationArea = All;
                        Editable = true;
                        MultiLine = true;
                        Caption = '(2)';
                    }
                    field("(3))"; Rec."Third ToR")
                    {
                        //ToolTip = 'Specifies the value of the House Allowance field.';
                        ApplicationArea = All;
                        Editable = true;
                        MultiLine = true;
                        Caption = '(3)';
                    }
                    field("(4))"; Rec."Fourth ToR")
                    {
                        // ToolTip = 'Specifies the value of the House Allowance field.';
                        ApplicationArea = All;
                        MultiLine = true;
                        Editable = true;
                        Caption = '(4)';
                    }
                    field("(5))"; Rec."Fifth ToR")
                    {
                        //ToolTip = 'Specifies the value of the House Allowance field.';
                        ApplicationArea = All;
                        MultiLine = true;
                        Editable = true;
                        Caption = '(5)';
                    }

                }
                field("Startt Date"; Rec."Startt Date")
                {
                    Caption = 'Start Date';
                    ApplicationArea = All;
                }
                field("End Date"; Rec."Endd Date")
                {
                    Caption = 'End Date';
                    ApplicationArea = All;
                }
                field("Insurance Company"; Rec."Insurance Company")
                {
                    Caption = 'Bank Name(Insurance Company)';
                    ApplicationArea = All;
                }
                field("Amount"; Rec."Amount")
                {
                    Caption = 'Amount';
                    ApplicationArea = All;
                }
            }
            part("Milestones"; "Milestones Lispart Page")
            {
                SubPageLink = "Code" = FIELD("Code");
                ApplicationArea = All;
            }
            group(Termination)
            {
                field("Termination Reason"; Rec."Termination Reason")
                {
                    MultiLine = true;
                    Caption = 'Reason for Termination';
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
                // PromotedCategory = Category8;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                RunObject = Page "Document Attachment Details";
                RunPageLink = "No." = field("Code");

            }
            action("Payments Processing")
            {
                ApplicationArea = All;
                Image = ReceivablesPayables;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Legal-Contract Processing";
                Caption = 'Payments Processing';
            }
            action("Terminate Contract")
            {
                ApplicationArea = All;
                Image = CloseDocument;
                Promoted = true;

                trigger OnAction()
                begin
                    if (xRec.Status <> Rec.Status::Terminated) then begin
                        if xRec."Termination Reason" <> '' then begin
                            IF CONFIRM('Do you want to terminate this contract?', TRUE) THEN
                                Rec."Status" := Rec.Status::Terminated;
                            Rec.Modify();
                            MESSAGE('Contract Number %1 is terminated', Rec.Code);
                        end else
                            Error('Please provide reason for termination!');
                    end;
                end;
            }
        }
        area(Reporting)
        {
            action("Contracts List Report")
            {
                Image = ContractPayment;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETFILTER("Code", Rec."Code");
                    IF Rec.FINDFIRST THEN
                        REPORT.RUN(Report::"Legal-Contract Report", TRUE, FALSE, Rec);
                end;
            }
        }
    }

    var
        myInt: Integer;

        LPO: Record "Purchase Line";
}