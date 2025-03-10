report 52179097 "Update p9 transaction"
{
    Caption = 'Update p9 transaction';
    ProcessingOnly = true;


    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    procedure UpdateP92()
    begin
        Periodtrans.Reset();
        Periodtrans.SetRange("Employee Code", P9Table."Employee Code");
        Periodtrans.SetRange("Payroll Period", P9Table."Payroll Period");
        Periodtrans.SetRange("Period Month", P9Table."Period Month");
        Periodtrans.SetRange("Period Year", P9Table."Period Year");
        Periodtrans.SetRange("Transaction Code", 'NHIFINSR');
        if Periodtrans.Find('-') then begin
            P9Table.Init();
            P9Table."Insurance Relief" := Periodtrans.Amount;
            P9Table.Insert();

        end;
    end;

    procedure UpdateP9()
    begin
        Periodtrans.Reset();
        Periodtrans.SetRange("Employee Code", Periodtrans."Employee Code");
        Periodtrans.SetRange("Period Month", Periodtrans."Period Month");
        Periodtrans.SetRange("Period Year", Periodtrans."Period Year");
        Periodtrans.SetRange("Payroll Period", Periodtrans."Payroll Period");
        Periodtrans.SetRange("Transaction Code", 'NHIFINSR');
        if Periodtrans.Find('-') then begin
            repeat
                P9table.Reset();
                P9table.SetRange("Employee Code", Periodtrans."Employee Code");
                P9table.SetRange("Payroll Period", Periodtrans."Payroll Period");
                P9table.SetRange("Period Month", Periodtrans."Period Month");
                P9table.SetRange("Period Year", Periodtrans."Period Year");
                if P9table.Find('-') then
                    P9table.Init();
                P9table."Insurance Relief" := Periodtrans.Amount;
                P9table.Insert()


            until Periodtrans.Next() = 0;

        end;
    end;

    var
        P9Table: record "PRL-Employee P9 Info";
        Periodtrans: record "PRL-Period Transactions";
}
