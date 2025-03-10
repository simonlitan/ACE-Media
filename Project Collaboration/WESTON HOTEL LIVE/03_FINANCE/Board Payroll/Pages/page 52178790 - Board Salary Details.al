page 52178790 "Board Salary Details"
{
    Editable = true;
    PageType = ListPart;
    SourceTable = "Board Salary Details";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("Board Payroll Code"; Rec."Board Payroll Code")
                {
                    ToolTip = 'Specifies the value of the Board Payroll Code field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }

                field("First Name"; Rec."Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("ID Number"; Rec."ID Number")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("tax Code"; Rec."tax Code")
                {
                    ToolTip = 'Specifies the value of the tax Code field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Tax Rate"; Rec."Tax Rate")
                {
                    ToolTip = 'Specifies the value of the Tax Rate field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Sitting Allowance"; Rec."Sitting Allowance")
                {
                    ToolTip = 'Specifies the value of the Sitting Allowance field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Sitting Allowance tax"; Rec."Sitting Allowance tax")
                {
                    ToolTip = 'Specifies the value of the Sitting Allowance tax field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Sitting Allowance Net"; Rec."Sitting Allowance Net")
                {
                    ToolTip = 'Specifies the value of the Sitting Allowance Net field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Distance to Principal Bus"; Rec."Distance to Principal Bus")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Distance to Principal Bus field.';
                    ApplicationArea = All;
                }
                field("Mileage Claim"; Rec."Mileage Claim")
                {
                    ToolTip = 'Specifies the value of the Mileage Claim field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Mileage  Allowance Tax "; Rec."Mileage  Allowance Tax ")
                {
                    ToolTip = 'Specifies the value of the Mileage  Allowance Tax  field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Mileage  Allowance Net "; Rec."Mileage  Allowance Net ")
                {
                    ToolTip = 'Specifies the value of the Mileage  Allowance Net  field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Lunch Allowance"; Rec."Lunch Allowance")
                {
                    ToolTip = 'Specifies the value of the Lunch Allowance field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Lunch Allowance Tax"; Rec."Lunch Allowance Tax")
                {
                    ToolTip = 'Specifies the value of the Lunch Allowance Tax field.';
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Lunch Allowance Net"; Rec."Lunch Allowance Net")
                {
                    ToolTip = 'Specifies the value of the Lunch Allowance Net field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Accomodation Allowance"; Rec."Accomodation Allowance")
                {
                    ToolTip = 'Specifies the value of the Accomodation Allowance field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Accomodation Days"; Rec."Accomodation Days")
                {
                    ToolTip = 'Specifies the value of the Accomodation Days field.';
                    ApplicationArea = All;
                }
                field("Accomodation Totals"; Rec."Accomodation Totals")
                {
                    ToolTip = 'Specifies the value of the Accomodation Totals field.';
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Board Gross Totals"; Rec."Board Gross Totals")
                {
                    ToolTip = 'Specifies the value of the Board Gross Totals field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Board Tax Totals"; Rec."Board Tax Totals")
                {
                    ToolTip = 'Specifies the value of the Board Tax Totals field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Board Net Totals"; Rec."Board Net Totals")
                {
                    ToolTip = 'Specifies the value of the Board Net Totals field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle Registration No. field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                    ToolTip = 'Specifies the value of the Vehicle Model field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Chair's Honoraria"; Rec."Chair's Honoraria")
                {
                    ToolTip = 'Specifies the value of the Chair''s Honoraria field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Meeting Sitting Allowance"; Rec."Meeting Sitting Allowance")
                {
                    ToolTip = 'Specifies the value of the Meeting Sitting Allowance field.';
                    ApplicationArea = All;
                }
                field("Meeting Mileage Allowance"; Rec."Meeting Mileage Allowance")
                {
                    ToolTip = 'Specifies the value of the Meeting Mileage Allowance field.';
                    ApplicationArea = All;
                }
                field("Meeting Lunch Allowance"; Rec."Meeting Lunch Allowance")
                {
                    ToolTip = 'Specifies the value of the Meeting Lunch Allowance field.';
                    ApplicationArea = All;
                }
                field("Meeting Accomodation Allowance"; Rec."Meeting Accomodation Allowance")
                {
                    ToolTip = 'Specifies the value of the Meeting Accomodation Allowance field.';
                    ApplicationArea = All;
                }
                field("Meeting Gross Allowances"; Rec."Meeting Gross Allowances")
                {
                    ToolTip = 'Specifies the value of the Meeting Gross Allowances field.';
                    ApplicationArea = All;
                }
                field("Meeting Tax Deductions"; Rec."Meeting Tax Deductions")
                {
                    ToolTip = 'Specifies the value of the Meeting Tax Deductions field.';
                    ApplicationArea = All;
                }
                field("Meeting Net Allowance"; Rec."Meeting Net Allowance")
                {
                    ToolTip = 'Specifies the value of the Meeting Net Allowance field.';
                    ApplicationArea = All;
                }



            }
        }
    }

    actions
    {


    }

    trigger OnOpenPage()
    begin
        if (DepCode <> '') then
            Rec.SetFilter("Department Code", ' = %1', DepCode);
        if (OfficeCode <> '') then
            Rec.SetFilter(Office, ' = %1', OfficeCode);
    end;

    var
        //  Mail: Codeunit Mail;
        PictureExists: Boolean;
        DepCode: Code[10];
        OfficeCode: Code[10];
        objEmp: Record "HRM-Employee C";
        SalCard: Record "PRL-Salary Card";
        objPeriod: Record "PRL-Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit prPayrollProcessing;
        HrEmployee: Record "HRM-Employee C";
        ProgressWindow: Dialog;
        prPeriodTransactions: Record "PRL-Period Transactions";
        prEmployerDeductions: Record "PRL-Employer Deductions";
        PayrollType: Record "PRL-Payroll Type";
        Selection: Integer;
        PayrollDefined: Text[30];
        PayrollCode: Code[10];
        NoofRecords: Integer;
        i: Integer;
        ContrInfo: Record "HRM-Control-Information";
        HREmp: Record "HRM-Employee C";
        j: Integer;
        PeriodTrans: Record "PRL-Period Transactions";
        salaryCard: Record "PRL-Salary Card";
        dateofJoining: Date;
        dateofLeaving: Date;
        GetsPAYERelief: Boolean;
        DOJ: Date;
        SalCard2: Record "PRL-Salary Card";

    procedure SetNewFilter(var DepartmentCode: Code[10]; var "Office Code": Code[10])
    begin
        DepCode := DepartmentCode;
        OfficeCode := "Office Code";
    end;
}
