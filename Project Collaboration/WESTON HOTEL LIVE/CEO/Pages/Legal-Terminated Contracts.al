page 52178932 "Legal-Terminated Contracts"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Legal-Contracts";
    CardPageId = "Legal-Contract Card";
    Caption = 'Terminated Contracts';
    InsertAllowed = false;
    SourceTableView = where(Status = const(Terminated));

    layout
    {
        area(Content)
        {
            repeater("Legal Contracts")
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field("Contract Number"; Rec."Contract Number")
                {
                    ApplicationArea = All;

                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ApplicationArea = All;

                }
                field("Tender No."; Rec."Tender No.")
                {
                    ApplicationArea = All;

                }

                field(Department; Rec.Department)
                {
                    ApplicationArea = All;

                }
                field("Purchase Req. Number"; Rec."Purchase Req. Number")
                {
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
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

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
}