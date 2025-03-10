page 69785 "HRM-Appraisal Registration 2"
{
    Editable = true;
    PageType = Document;
    SourceTable = "HRM-Employee C";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = true;
                field("No."; Rec."No.")
                {
                    Caption = 'No.(*)';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = All;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;

                }
                field("Postal Address"; Rec."Postal Address")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(County; Rec.County)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = All;
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                    ApplicationArea = All;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Student)
            {
                Caption = 'Student';
                action("Appraisal Registration")
                {
                    Caption = 'Appraisal Registration';
                    Image = Register;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "HRM-Appraisal Registration";
                    ApplicationArea = All;
                    //RunPageLink = PF No.=FIELD(No.);
                }
                action("Staff Targets")
                {
                    Caption = 'Staff Targets';
                    Image = BOMRegisters;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "HRM-Appraisal Appraisee Target";
                    ApplicationArea = All;
                    //RunPageLink = PF. No.=FIELD(No.);
                }
                action("Appraisal Reg. Details")
                {
                    Caption = 'Appraisal Reg. Details';
                    Image = Info;
                    RunObject = Page "HRM-Appraisal Registration 2";
                    ApplicationArea = All;
                    // RunPageLink = No.=FIELD(No.);
                }
            }
        }
    }

    var
        stud: Record Customer;
        PictureExists: Boolean;
        GenJnl: Record "Gen. Journal Line";
        Units: Record "HRM-Appraisal Targets";
        GenSetUp: Record "HRM-Appraisal Gen. Setup";
        CourseReg: Record "HRM-Appraisal Registration";
        CurrentBill: Decimal;
        GLEntry: Record "G/L Entry";
        CustLed: Record "Cust. Ledger Entry";
        BankLedg: Record "Bank Account Ledger Entry";
        DCustLedg: Record "Detailed Cust. Ledg. Entry";
        PDate: Date;
        DocNo: Code[20];
        VendLedg: Record "Vendor Ledger Entry";
        DVendLedg: Record "Purchase Header";
        VATEntry: Record "VAT Entry";
        CustLed2: Record "Cust. Ledger Entry";
        Cont: Boolean;
        Cust: Record Customer;
        CustPostGroup: Record "Customer Posting Group";
        window: Dialog;
        GLPosting: Codeunit "Gen. Jnl.-Post Line";
        CustLedg: Record "Cust. Ledger Entry";
        DueDate: Date;
        Sems: Record "HRM-Appraisal Periods";
        ChangeLog: Record "Change Log Entry";
        CurrentBal: Decimal;
        Prog: Record "HRM-Appraisal Jobs";
        "Settlement Type": Record "HRM-Employee Category";
        AccPayment: Boolean;
        SettlementType: Code[20];
        CustL: Record "Cust. Ledger Entry";
        Units3: Record "HRM-Appraisal Targets";
}

