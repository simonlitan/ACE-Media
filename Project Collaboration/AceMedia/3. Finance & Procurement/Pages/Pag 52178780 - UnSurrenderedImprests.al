page 52178780 "Un_Surrendered Imprests"
{
    Caption = 'Un_Surrendered Imprests';
    PageType = List;
    Editable = false;
    CardPageID = "FIN-Travel Advance Req. UP";
    InsertAllowed = false;
    DeleteAllowed = false;

    SourceTable = "FIN-Imprest Header";
    SourceTableView = sorting("No.") order(descending) where("Surrender Status" = filter(<> Full), Status = const(Posted));

    layout
    {
        area(content)
        {
            repeater(____________)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    ApplicationArea = all;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = all;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = all;
                }
                field(Purpose;Rec.Purpose)
                {
                    ApplicationArea=all;

                }
                field("Total Net Amount";Rec."Total Net Amount")
                {
                   ApplicationArea = all;
                   Caption = 'Amount';
                }

            }
        }
    }
  
}