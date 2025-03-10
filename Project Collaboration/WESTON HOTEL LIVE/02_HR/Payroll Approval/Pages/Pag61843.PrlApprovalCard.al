page 61843 "Prl-Approval Card"
{
    PageType = Card;
    SourceTable = "Prl-Approval";
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {

                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field("Period Name"; Rec."Period Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Net Amount field.';
                    Editable = false;
                }
                field("Gross Amount"; Rec."Gross Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gross Amount field.';
                    Editable = false;
                }
                field("Total deductions"; Rec."Total deductions")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total deductions field.';
                }
            }
            part(PRL; "PRL Approval Active List")
            {
                SubPageLink = Status = filter(Active);
                ApplicationArea = All;
            }
            part(Journals; "Payroll Journal Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Payroll Period" = field("Payroll Period");

            }
        }
    }

    actions
    {

        area(processing)
        {
            group("Request Approval")
            {
                action(Sendapproval)
                {
                    Caption = 'Send for Approval';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit IntCodeunit;
                    begin
                        if ApprovalMgt.IsPrlPendAppTxtEnabled(Rec) = true then begin
                            ApprovalMgt.OnSendPrlPendAppTxtforApproval(Rec);

                        end else
                            Message('Check Your Approval Workflow');
                    end;
                }
                action(Cancelapproval)
                {
                    Caption = 'Cancel Request';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit IntCodeunit;
                    begin
                        ApprovalMgt.OnCancelPrlPendAppTxtforApproval(Rec);
                    end;
                }

                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        Approvalentries: Page "Fin-Approval Entries";
                    begin
                        Approvalentries.Setfilters(DATABASE::"Prl-Approval", 6, format(Rec."Payroll Period"));
                        Approvalentries.RUN;
                    end;
                }


            }
            action(payrollvar)
            {
                Visible = true;
                ApplicationArea = all;
                Caption = 'Payroll Summary variance';
                Image = Aging;
                RunObject = Report "PR Payroll Summary - Variance";
            }
            action("Master Payroll Summary")
            {
                ApplicationArea = all;
                Caption = 'Master Payroll Summary';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Payroll Summary 3";
            }


            action("Deductions Summary")
            {
                ApplicationArea = all;
                Caption = 'Deductions Summary';
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "PRL-Deductions Summary 2 a";
            }
            action("Earnings Summary")
            {
                ApplicationArea = all;
                Caption = 'Earnings Summary';
                Image = DepositSlip;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "PRL-Earnings Summary 5";
            }

            action("Third Rule")
            {
                ApplicationArea = all;
                Caption = 'Third Rule';
                Image = AddWatch;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "A third Rule Report";

            }

            action("bank Schedule")
            {
                ApplicationArea = all;
                Caption = 'bank Schedule';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "PRL-Bank Schedule";
            }
             action("Journal Lines")
                {
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = process;
                    image = JobJournal;
                    trigger OnAction()
                    begin
                        Rec.GetPayrollJournal();
                    end;
                }
                action(PostPayrollJournal)
                {
                    ApplicationArea = ALl;
                    Promoted = true;
                    Image = ApplyTemplate;
                    PromotedCategory = process;
                    trigger OnAction()
                    begin
                        Rec.PostPayrollJournal();
                    end;
                }


        }
    }
}