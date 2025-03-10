/// <summary>
/// Page PROC-Procurement Plan Header (ID 52178773).
/// </summary>
page 52178773 "PROC-Procurement Plan Header"
{
    PageType = card;
    SourceTable = "PROC-Procurement Plan Header";


    layout
    {

        area(content)
        {

            group(General)
            {
                Caption = 'General';
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = all;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                    Caption = 'Branch Code';
                }

                field("Project Code"; Rec.Projects)
                {
                    ApplicationArea = all;
                    Caption = 'Cost_Center Code';

                    trigger OnValidate()
                    begin
                        Dim.RESET;
                        Dim.SETRANGE(Dim.Code, Rec."Department Code");
                        IF Dim.FIND('-') THEN BEGIN
                            DptName := Dim.Name;
                        END;
                    end;
                }
                // field(DptName; DptName)
                // {
                //     ApplicationArea = all;
                //     Editable = false;
                //     Caption = 'Branch Name';
                // }

                field("Procurement Plan Period"; Rec."Procurement Plan Period")
                {
                    ApplicationArea = all;
                }
            }
            part(part; "PROC-Procurement Plan Lines")
            {
                ApplicationArea = all;
                SubPageLink = "Budget Name" = FIELD("Budget Name"),
                              Department = FIELD("Department Code"),
                              Campus = FIELD(Projects),
                              "Procurement Plan Period" = FIELD("Procurement Plan Period");
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action(Print)
            {
                Caption = 'Print Plan';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = report "Procurement Plan";

                /* trigger OnAction()
                begin
                    Rec.RESET();
                    Rec.SETRANGE("Budget Name", Rec."Budget Name");
                    REPORT.RUN(52178711, TRUE, TRUE, Rec);
                    Rec.RESET;
                    //DocPrint.PrintPurchHeader(Rec);
                end; */
            }
        }
    }

    var
        DptName: Text[50];
        Dim: Record "Dimension Value";
}

