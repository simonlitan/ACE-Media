page 75026 "HRM-Appraisal Gen. Setup"
{
    PageType = Card;
    SourceTable = "HRM-Appraisal Gen. Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Appraisal Nos."; Rec."Appraisal Nos.")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Registration Nos."; Rec."Appraisal Registration Nos.")
                {
                    ApplicationArea = All;
                }
                field("Clearance Nos"; Rec."Clearance Nos")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    var
        CReg: Record "HRM-Appraisal Registration";
        PDate: Date;
        StudUnit: Record "HRM-Appraisal Emp. Targets";
        Prog: Record "HRM-Appraisal Jobs";
        Units: Record "HRM-Appraisal Targets";
        Cust: Record Customer;
        GLEntry: Record "G/L Entry";
        CustEntry: Record "Cust. Ledger Entry";
        CustDet: Record "Detailed Cust. Ledg. Entry";
        HMSP: Record "FIN-Lost Table";
        i: Integer;
        ExResults: Record "HRM-Appraisal Results";
        BankL: Record "Bank Account Ledger Entry";
        vendL: Record "Vendor Ledger Entry";
        vedDetailed: Record "Detailed Vendor Ledg. Entry";
}

