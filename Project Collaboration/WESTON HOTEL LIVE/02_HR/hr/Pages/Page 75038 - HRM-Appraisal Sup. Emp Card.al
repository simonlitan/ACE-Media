page 75038 "HRM-Appraisal Sup. Emp Card"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
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
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Search Name"; Rec."Search Name")
                {

                    Editable = false;
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
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                    Editable = false;
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

            group(Evaluation)
            {
                Caption = 'Perfomance Evaluation';

                part(pg3; 85516)
                {
                    SubPageLink = "PF. No." = FIELD("No.");
                    ApplicationArea = All;
                }
            }
            group(Summary)
            {
                Caption = 'Performance Summary';

                // part(pg; 75036)
                // {
                //     SubPageLink = "PF. No." = FIELD("No.");
                //     ApplicationArea = All;
                // }
            }
            group(Comments)
            {
                Caption = 'Additional Comments';

                field(SupervisorComm; Rec.ApraiseeComm)
                {
                    ApplicationArea = All;
                    Caption = 'Appraisee Comments and Examples';
                }
                field(apprComm; Rec.ApraiserComm)
                {
                    ApplicationArea = All;
                    Caption = 'Appraiser Comments and Examples';
                }
            }
            group(Assesment)
            {
                Caption = 'Assesment Perfomance Against Prier Year Goals';

                // part(pg2; "HRM-Appraisal Training Needs")
                // {
                //     SubPageLink = "PF. No." = FIELD("No.");
                //     ApplicationArea = All;
                // }
            }
            group(coreValues)
            {
                Caption = 'Goals For The Following Year';

                part(pg4; 85517)
                {
                    SubPageLink = "PF. No." = FIELD("No.");
                    ApplicationArea = All;
                }
            }
            group("Training Needs")
            {
                Caption = 'Appraisee Training Needs';
                part("HRM-Appraisal Training Needs"; "HRM-Appraisal Training Needs")
                {
                    SubPageLink = "Training Need Code" = FIELD("No.");
                    ApplicationArea = All;
                }
            }
            // group(comPetence)
            // {
            //     Caption = 'Position Description';

            //     part(pg5; 85518)
            //     {
            //         SubPageLink = "PF. No." = FIELD("No.");
            //         ApplicationArea = All;
            //     }
            // }
            // group(mngcomPetence)
            // {
            //     Caption = 'Managerial Competency';

            //     part(pg6; 85519)
            //     {
            //         SubPageLink = "PF. No." = FIELD("No.");
            //         ApplicationArea = All;
            //     }
            // }
            // group(Bisem)
            // {
            //     Caption = 'Bisemester/Trimester Staff Performance Review';

            //     field(appraisal; appraisal."Bisemester Review")
            //     {
            //         Caption = 'Comments on performance';
            //         ApplicationArea = All;
            //     }
            // }
            // group(midYr)
            // {
            //     Caption = 'Targets Varied Mid Year';

            //     part(pg7; 85520)
            //     {
            //         SubPageLink = "PF. No." = FIELD("No.");
            //         ApplicationArea = All;
            //     }
            // }

            // group(EmployeeTargets)
            // {
            //     Caption = 'Employee Targets';
            //     part("HRM-Appraisal Emp Targets-SUP"; "HRM-Appraisal Emp Targets-SUP")
            //     {
            //         SubPageLink = "PF. No." = FIELD("No.");
            //         ApplicationArea = All;
            //     }
            // }
        }
    }

    actions
    {
        area(creation)
        {
            action("Supervisor Comments")
            {
                Caption = 'Supervisor Comments';
                Image = CalculateWIP;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "HRM-Appraisal Supervisor Com.";
                RunPageLink = "Supervisor Comments" = FIELD("No.");
                ApplicationArea = All;
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
        DVendLedg: Record "Detailed Vendor Ledg. Entry";
        VATEntry: Record "VAT Entry";
        CReg: Record "HRM-Appraisal Registration";
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
        appraisal: Record "HRM Apprisal Values";

}

