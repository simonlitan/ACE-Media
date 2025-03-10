page 52178707 "PRN Memo Header"
{
    CardPageID = "FIN-Memo Header Card";
    PageType = List;
    SourceTable = "FIN-Memo Header";
    SourceTableView = WHERE(PRN = filter(true), "Memo Status" = CONST(Approved));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Date/Time"; Rec."Date/Time")
                {
                    ApplicationArea = All;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = All;
                }
                field(Through; Rec.Through)
                {
                    ApplicationArea = All;
                }
                field("To"; Rec."To")
                {
                    ApplicationArea = All;
                }
                field("PRN No."; Rec."PRN No.")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = All;
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = All;
                }
                field("Memo Status"; Rec."Memo Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

