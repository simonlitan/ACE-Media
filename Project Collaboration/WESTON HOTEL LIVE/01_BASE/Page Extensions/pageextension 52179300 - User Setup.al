/// <summary>
/// PageExtension User Setup Ext (ID 52179300) extends Record User Setup.
/// </summary>
pageextension 52179300 "User Setup Ext" extends "User Setup"
{
    layout
    {
        addafter(PhoneNo)
        {
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

            field("Approval Administrator"; Rec."Approval Administrator")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the user who has rights to unblock approval workflows, for example, by delegating approval requests to new substitute approvers and deleting overdue approval requests.';
            }
            field("Approval Role"; Rec."Approval Role")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Approval Role field.';
            }
            field("Approval Title"; Rec."Approval Title")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Approval Title field.';
            }
            field("Approver ID"; Rec."Approver ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the user ID of the person who must approve records that are made by the user in the User ID field before the record can be released.';
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
            field("Can Stop Reg."; Rec."Can Stop Reg.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Can Stop Reg. field.';
            }
            field("Cash Advance Staff Account"; Rec."Cash Advance Staff Account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Cash Advance Staff Account field.';
            }
            field("Create Course_Reg"; Rec."Create Course_Reg")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create Course_Reg field.';
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
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employee No. field.';
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            }
            field("Imprest Account"; Rec."Imprest Account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Imprest Account field.';
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
            field(Leave; Rec.Leave)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Leave field.';
            }
            field("License Type"; Rec."License Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the License Type field.';
            }
            field("PV Amount Approval Limit"; Rec."PV Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the PV Amount Approval Limit field.';
            }
            field("Petty C Amount Approval Limit"; Rec."Petty C Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Petty C Amount Approval Limit field.';
            }
            field("Post Bank Rec"; Rec."Post Bank Rec")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Post Bank Rec field.';
            }
            field("Purchase Amount Approval Limit"; Rec."Purchase Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the maximum amount in LCY that this user is allowed to approve for this record.';
            }
            field("Request Amount Approval Limit"; Rec."Request Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the maximum amount in LCY that this user is allowed to approve for this record.';
            }
            field("Sales Amount Approval Limit"; Rec."Sales Amount Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the maximum amount in LCY that this user is allowed to approve for this record.';
            }
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
            }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
            }
            field("Staff No"; Rec."Staff No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Staff No field.';
            }
            field(Substitute; Rec.Substitute)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the User ID of the user who acts as a substitute for the original approver.';
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
            field("Store Req. Amt Approval Limit"; Rec."Store Req. Amt Approval Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Store Req. Amt Approval Limit field.';
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
                PromotedIsBig = true;
                RunObject = page "APP-User-Setup Signatures";
                RunPageLink = "User ID" = field("User ID");
            }
        }
    }

}