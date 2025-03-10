page 52178715 "NW-Board Members List"
{
    CardPageID = "NW-Board Members Card";
    Editable = false;
    PageType = List;
    SourceTable = "NW-Board Members";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = all;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = All;
                }

                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                }
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                    ToolTip = 'Specifies the value of the Vehicle Model field.';
                    ApplicationArea = All;
                }
                field("Distance to Principal Bus"; Rec."Distance to Principal Bus")
                {
                    ToolTip = 'Specifies the value of the Distance to Principal Bus field.';
                    ApplicationArea = All;
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle Registration No. field.';
                    ApplicationArea = All;
                }
                field("Place of Residence"; Rec."Place of Residence")
                {
                    ToolTip = 'Specifies the value of the Place of Residence field.';
                    ApplicationArea = All;
                }
                field(FC; Rec.FC)
                {
                    ToolTip = 'Specifies the value of the FC field.';
                    ApplicationArea = All;
                }
                field(STBD; Rec.STBD)
                {
                    ToolTip = 'Specifies the value of the STBD field.';
                    ApplicationArea = All;
                }
                field(HRGP; Rec.HRGP)
                {
                    ToolTip = 'Specifies the value of the HRGP field.';
                    ApplicationArea = All;
                }
                field(GRA; Rec.GRA)
                {
                    ToolTip = 'Specifies the value of the GRA field.';
                    ApplicationArea = All;
                }
                field(FB; Rec.FB)
                {
                    ToolTip = 'Specifies the value of the FB field.';
                    ApplicationArea = All;
                }
                field(ADH; Rec.ADH)
                {
                    ToolTip = 'Specifies the value of the ADH field.';
                    ApplicationArea = All;
                }
                field(SPEC; Rec.SPEC)
                {
                    ToolTip = 'Specifies the value of the SPEC field.';
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
