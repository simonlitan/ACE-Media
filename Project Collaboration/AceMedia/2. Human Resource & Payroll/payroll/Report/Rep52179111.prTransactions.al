report 52179111 "pr Transactions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/pr Transactions.rdl';
    PreviewMode = PrintLayout;
    Description = 'Payroll Transactions';

    dataset
    {
        dataitem("PRL-Employee Transactions"; "PRL-Employee Transactions")
        {
            DataItemTableView = SORTING("Transaction Code", "Period Month", "Payroll Period") WHERE("Emp Status" = CONST(Active));
            RequestFilterFields = "Period Month", "Transaction Code";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }

            column(USERID; UserId)
            {
            }
            column(prEmployee_Transactions__Transaction_Code_; "Transaction Code")
            {
            }
            column(prEmployee_Transactions__Transaction_Name_; "Transaction Name")
            {
            }
            column(pic; companyinfo.Picture)
            {
            }
            column(prEmployee_Transactions__Employee_Code_; "Employee Code")
            {
            }
            column(Emp__First_Name______Emp__Middle_Name______Emp__Last_Name_; Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name")
            {
            }
            column(prEmployee_Transactions_Amount; Amount)
            {
            }
            column(prEmployee_Transactions_Amount_Control1102755000; Amount)
            {
            }
            column(Transactions_DetailsCaption; Transactions_DetailsCaptionLbl)
            {
            }

            column(Employee_No_Caption; Employee_No_CaptionLbl)
            {
            }
            column(NamesCaption; NamesCaptionLbl)
            {
            }
            column(prEmployee_Transactions_AmountCaption; FieldCaption(Amount))
            {
            }
            column(prEmployee_Transactions_Amount_Control1102755000Caption; FieldCaption(Amount))
            {
            }
            column(prEmployee_Transactions_Period_Month; "Period Month")
            {
            }
            column(prEmployee_Transactions_Period_Year; "Period Year")
            {
            }
            column(prEmployee_Transactions_Payroll_Period; "Payroll Period")
            {
            }
            column(prEmployee_Transactions_Reference_No; "Reference No")
            {
            }
            column(compName; companyinfo.Name)
            {
            }
            column(compAddress; companyinfo.Address)
            {
            }
            column(compPhone; companyinfo."Phone No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                if not Emp.Get("PRL-Employee Transactions"."Employee Code") then;
            end;

            trigger OnPreDataItem()
            begin
                //"PRL-Employee Transactions".SetFilter("PRL-Employee Transactions"."Payroll Period"("Payroll Period"));
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        if companyinfo.Get() then begin
            companyinfo.CalcFields(companyinfo.Picture);
        end
    end;

    var
        Emp: Record "HRM-Employee C";
        Transactions_DetailsCaptionLbl: Label 'Transactions Details';

        Employee_No_CaptionLbl: Label 'Employee No.';
        NamesCaptionLbl: Label 'Names';
        companyinfo: Record "Company Information";
}

