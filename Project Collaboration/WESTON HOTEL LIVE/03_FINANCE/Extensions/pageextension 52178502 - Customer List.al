/// <summary>
/// PageExtension MyExtension (ID 52178502) extends Record MyTargetPage.
/// </summary>
pageextension 52178502 "Customer List" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Sales)
        {
            group(FinanceReport)
            {
                Caption = 'Finance Reports';
                Image = "Report";
                action(Statemens)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Statement';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = Report "Customer Statement";
                    ToolTip = 'View a list of a customer''s transactions for a selected period, for example, to send to the customer at the close of an accounting period. You can choose to have all overdue balances displayed regardless of the period specified, or you can choose to include an aging band.';
                }
                action(BackgroundStatements)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Scheduled Statements';
                    Image = "Report";
                    ToolTip = 'Schedule Customer Statements in the Job Queue.';

                    trigger OnAction()
                    var
                        CustomerLayoutStatement: Codeunit "Customer Layout - Statement";
                    begin
                        // CustomerLayoutStatement.EnqueueReport;
                    end;
                }
                action(ReportCustomerBalancesToDate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer - Balance to Date';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = Report "Customer - Balance to Date";
                    ToolTip = 'View a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.';
                }
                action(ReportCustomerTrialBalances)
                {
                    ApplicationArea = Suite;
                    Caption = 'Customer - Trial Balance';
                    Image = "Report";
                    RunObject = Report "Customer - Trial Balance";
                    ToolTip = 'View the beginning and ending balance for customers with entries within a specified period. The report can be used to verify that the balance for a customer posting group is equal to the balance on the corresponding general ledger account on a certain date.';
                }
                action(ReportCustomerDetailTrials)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer - Detail Trial Bal.';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = Report "Customer - Detail Trial Bal.";
                    ToolTip = 'View the balance for customers with balances on a specified date. The report can be used at the close of an accounting period, for example, or for an audit.';
                }
                action(ReportCustomerSummarryAging)
                {
                    ApplicationArea = Suite;
                    Caption = 'Customer - Summary Aging';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = Report "Customer - Summary Aging";
                    ToolTip = 'View, print, or save a summary of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.';
                }
                action(ReportCustomerDetailledAging)
                {
                    ApplicationArea = Suite;
                    Caption = 'Customer - Detailed Aging';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = Report "Customer Detailed Aging";
                    ToolTip = 'View, print, or save a detailed list of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.';
                }
                action(ReportAgedAccountsReceivables)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Aged Accounts Receivable';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = Report "Aged Accounts Receivable";
                    ToolTip = 'View an overview of when customer payments are due or overdue, divided into four periods. You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
                }
                action(ReportCustomerPaymentReceipts)
                {
                    ApplicationArea = Suite;
                    Caption = 'Customer - Payment Receipt';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = Report "Customer - Payment Receipt";
                    ToolTip = 'View a document showing which customer ledger entries that a payment has been applied to. This report can be used as a payment receipt that you send to the customer.';
                }
                action(CustomerStatement)
                {
                    ApplicationArea = Suite;
                    Caption = 'Customer Statement Report';
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = Report "Customer Report Statement";
                    ToolTip = 'View a document showing which customer ledger entries that a payment has been applied to. This report can be used as a payment receipt that you send to the customer.';
                }
                //      action(CustomerStatement1)
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Customer Statnt';
                //     Promoted = true;
                //     PromotedCategory = Report;
                //     RunObject = Report "Customer Statement Report";
                //     ToolTip = 'View a document showing which customer ledger entries that a payment has been applied to. This report can be used as a payment receipt that you send to the customer.';
                // }
                action("Projectiion Report")
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = report "Projection Report";
                }

            }
            action(Reminders)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Reminder';
                Image = Reminder;
                RunObject = Report Reminder;
                ToolTip = 'Create a new reminder for the customer.';
            }
        }




        //Add changes to page actions here
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        USetup.RESET;
        USetup.SETRANGE(USetup."User ID", USERID);
        USetup.SETRANGE(USetup."Create Customer", false);
        IF USetup.FIND('-') THEN ERROR('You are not authorised');


    end;

    var
        myInt: Integer;
        USetup: record "User Setup";
}