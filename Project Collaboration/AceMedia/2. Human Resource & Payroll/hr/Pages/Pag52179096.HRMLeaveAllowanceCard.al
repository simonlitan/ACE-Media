page 52179096 "HRM-Leave  Allowance Card"
{
    Caption = 'HRM-Leave  Allowance Card';
    PageType = Card;
    SourceTable = "HRM-Leave Allowance Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Datefils; dateFilter)
                {
                    ApplicationArea = all;
                    Editable = false;

                    Caption = 'Period Filter';
                    TableRelation = "PRL-Payroll Periods"."Date Opened" where(Closed = filter(false));
                    trigger OnValidate()
                    begin
                        rec.validatePeriod();
                    end;


                }

                field("Payroll Period"; rec."Payroll Period")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }



                field("Period Name"; Rec."Period Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Name field.';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            part("HRM-Leave Allowance Buffer"; "HRM-Leave Allowance Buffer")
            {
                Caption = 'Allowance List';
                SubPageLink = "Payroll Period" = field("Payroll Period");

                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(getLeave)
            {
                ApplicationArea = all;
                Caption = 'Get Leave Allowances';
                Image = GetLines;
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()
                begin

                    leaveAll.GetLeaveAllowance();


                end;


            }

            action(PostLeave)
            {
                ApplicationArea = all;
                Caption = 'Post Leave Allowances';
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()
                begin
                    leaveAll.PostLeaveAllowance();
                end;

            }
        }


    }





    trigger OnOpenPage()
    begin
        payrolPeriod.Reset;
        payrolPeriod.SetFilter(payrolPeriod.Closed, '=%1', false);
        payrolPeriod.SetFilter(payrolPeriod."Date Opened", '<>%1', 0D);
        if payrolPeriod.Find('-') then begin
            dateFilter := payrolPeriod."Date Opened";


        end;
        // if dateFilter <> 0D then
        //Rec.SetFilter("Payroll Period", '=%1', dateFilter);
    end;





    var
        leaveAll: record "HRM-Leave Allowance Reg.";
        dateFilter: Date;
        payrolPeriod: Record "PRL-Payroll Periods";
        HumanResSetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

        salarycard: record "PRL-Salary Card";

        emps: Record "HRM-Employee C";
        salarygrades: Record "HRM-Job_Salary grade/steps";
        emptrans: Record "PRL-Employee Transactions";
        leavereq: Record "HRM-Leave Requisition";
        Allheader: Record "HRM-Leave Allowance Header";





}
