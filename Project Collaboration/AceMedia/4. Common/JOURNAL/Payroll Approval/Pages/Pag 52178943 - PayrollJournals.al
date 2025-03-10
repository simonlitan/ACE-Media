page 52178943 "Payroll Journals"
{
    Caption = 'Payroll Journals';
    PageType = Card;
    SourceTable = "Prl-Journal Header";
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';


                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Period field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
            }
            part("Journal"; "Payroll Journal Lines")
            {
                Visible = false;
                Editable = false;
                SubPageLink = "Payroll Period" = field("Payroll Period");
                ApplicationArea = all;
            }
            part("Summary"; "Journal Summary")
            {
                Editable = false;
                SubPageLink = "Payroll Period" = field("Payroll Period");
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Get Transactions")
            {
                ApplicationArea = all;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.GetAmounts();
                end;
            }
            action("Create Journal")
            {
                ApplicationArea = all;
                Image = TransferToGeneralJournal;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.CreateJnlEntry();
                end;
            }
        }
    }
}
