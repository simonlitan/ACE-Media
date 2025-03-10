pageextension 52178879 "ExtUser Setup1" extends "User Setup"
{
    layout
    {
        addbefore(Email)
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employee No. field.';
                TableRelation = "HRM-Employee C"."No." where(status = const(Active));

                trigger OnValidate()
                begin
                    EmplC.Reset();
                    EmplC.SetRange("No.", rec."Employee No.");
                    IF emplc.find('-') THEN BEGIN
                        rec."E-Mail" := emplc."Company E-Mail";
                        // rec."E-Mail" := EmplC."E-Mail";
                        rec."Global Dimension 1 Code" := emplc."Global Dimension 1 Code";
                        rec."Shortcut Dimension 3 Code" := EmplC."Shortcut Dimension 3 Code";
                        rec."Approval Title" := EmplC."Job Title";
                        rec."Phone No." := EmplC."Home Phone Number";
                        rec."Staff Advance No" := EmplC."Staff Advance No";
                        rec."Staff Claims No" := EmplC."Staff Claims No";
                        rec."Staff PettyC No" := EmplC."Staff PettyC No";
                        rec."Imprest Account" := EmplC."Staff Imprest No";
                        rec."Phone No." := EmplC."Work Phone Number";
                        rec.HOD := EmplC.HOD;
                    END

                end;
            }
            field("Staff Advance No"; Rec."Staff Advance No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Staff Advance No field.';
            }
            field("Staff PettyC No"; Rec."Staff PettyC No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Staff Petty Cash No field.';
            }
            field("Staff Claims No"; Rec."Staff Claims No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Staff Claims No field.';
            }
            field("Imprest Account"; Rec."Imprest Account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Imprest Account field.';
            }
            field("Unlimited Imprest Request"; Rec."Unlimited Imprest Requests")
            {
                ApplicationArea = all;
            }

            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';

            }
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
            }

            field(Substitute; Rec.Substitute)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the User ID of the user who acts as a substitute for the original approver.';
            }

        }
        addafter(PhoneNo)
        {
            // field(Administrator; Rec.Administrator)
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Administrator field.';
            // }
            field("Accounting Officer"; Rec."Accounting Officer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Accounting Officer field.';
            }
            // field("Transport Officer"; Rec."Transport Officer")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Transport Officer field.';
            // }
            field("Delete Attachments"; Rec."Delete Attachments")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Delete Attachments field.';
            }
            // field("Case Notification"; Rec."Case Notification")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Case Notification field.';
            // }
            field(payroll; Rec.Leave)
            {
                ApplicationArea = All;

            }

            field(HOD; Rec.HOD)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HOD field.';
            }


            field("Allow FA Posting From"; Rec."Allow FA Posting From")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow FA Posting From field.';
            }
            field("Allow FA Posting To"; Rec."Allow FA Posting To")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow FA Posting To field.';
            }
            field("Can View Payroll"; Rec."Can View Payroll")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Can View Payroll field.';
            }

            field("Can create vendors"; Rec."Can create vendors")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Can create vendors field.';
            }


            field("Approval Title"; Rec."Approval Title")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Approval Title field.';
            }

            field("Can Post Cust. Deposits"; Rec."Can Post Cust. Deposits")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Can Post Cust. Deposits field.';
            }
            field("Can Post Customer Refund"; Rec."Can Post Customer Refund")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Can Post Customer Refund field.';
            }

            field("Cash Advance Staff Account"; Rec."Cash Advance Staff Account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Cash Advance Staff Account field.';
            }

            field("Create Customer"; Rec."Create Customer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create Customer field.';
            }
            field("Create Emp. Transactions"; Rec."Create Emp. Transactions")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create Emp. Transactions field.';
            }
            field("Create Employee"; Rec."Create Employee")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create Employee field.';
            }
            field("Create FA"; Rec."Create FA")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create FA field.';
            }
            field("Create GL"; Rec."Create GL")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create GL field.';
            }
            field("Create Items"; Rec."Create Items")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create Items field.';
            }
            field("Create PR Transactions"; Rec."Create PR Transactions")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create PR Transactions field.';
            }
            field("Create Salary"; Rec."Create Salary")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create Salary field.';
            }
            field("Create Supplier"; Rec."Create Supplier")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create Supplier field.';
            }
            field("Edit Posted Dimensions"; Rec."Edit Posted Dimensions")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Edit Posted Dimensions field.';
            }



            field("Imprest Amount Approval Limit"; Rec."Imprest Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Imprest Amount Approval Limit field.';
            }
            field("Journal Batch Name"; Rec."Journal Batch Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Journal Batch Name field.';
            }
            field("Journal Template Name"; Rec."Journal Template Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Journal Template Name field.';
            }



            field("Post Bank Rec"; Rec."Post Bank Rec")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Post Bank Rec field.';
            }


            field("Unlimited Imprest Amt Approval"; Rec."Unlimited Imprest Amt Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Unlimited Imprest Amt Approval field.';
            }
            field("Unlimited PV Amount Approval"; Rec."Unlimited PV Amount Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Unlimited PV Amount Approval field.';
            }
            field("Unlimited PettyAmount Approval"; Rec."Unlimited PettyAmount Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Unlimited PettyAmount Approval field.';
            }
            field("Unlimited Purchase Approval"; Rec."Unlimited Purchase Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies that the user on this line is allowed to approve purchase records with no maximum amount. If you select this check box, then you cannot fill the Purchase Amount Approval Limit field.';
            }
            field("Unlimited Request Approval"; Rec."Unlimited Request Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies that the user on this line can approve all purchase quotes regardless of their amount. If you select this check box, then you cannot fill the Request Amount Approval Limit field.';
            }
            field("Unlimited Sales Approval"; Rec."Unlimited Sales Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies that the user on this line is allowed to approve sales records with no maximum amount. If you select this check box, then you cannot fill the Sales Amount Approval Limit field.';
            }
            field("Unlimited Store RqAmt Approval"; Rec."Unlimited Store RqAmt Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Unlimited Store RqAmt Approval field.';
            }
            field("User Signature"; Rec."User Signature")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the User Signature field.';
            }

            field("Allow Change Company"; Rec."Allow Change Company")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Change Company field.';
            }
            field("Allow Change Role"; Rec."Allow Change Role")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Change Role field.';
            }
            field("Allow Open My Settings"; Rec."Allow Open My Settings")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Open My Settings field.';
            }
        }
    }
    actions
    {
        addlast(Processing)
        {
            action(UserSignature)
            {
                Caption = 'Import Signature';
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;

                RunObject = page "APP-User-Setup Signatures";
                RunPageLink = "User ID" = field("User ID");
            }
        }
    }

    trigger OnOpenPage()
    begin
        //   SetPermission.CheckIfAdmin();
    end;

    trigger OnClosePage()
    begin
        //   SetPermission.CheckAdminsAvailable();
    end;

    var
        //  SetPermission: Codeunit "Access Management";
        EmplC: Record "HRM-Employee C";
}
