report 52179095 "UPDATE P9"
{
    Caption = 'UPDATE P9';
    ProcessingOnly = TRUE;
    procedure UpdateP9()
    begin
        Prtransactions.Reset();
        Prtransactions.SetRange("Employee Code", Prtransactions."Employee Code");
        Prtransactions.SetRange("Period Month", Prtransactions."Period Month");
        Prtransactions.SetRange("Period Year", Prtransactions."Period Year");
        Prtransactions.SetRange("Payroll Period", Prtransactions."Payroll Period");
        if Prtransactions.Find('-') then begin
            repeat
                P9table.Reset();
                P9table.SetRange("Employee Code", Prtransactions."Employee Code");
                P9table.SetRange("Payroll Period", Prtransactions."Payroll Period");
                P9table.SetRange("Period Month", Prtransactions."Period Month");
                P9table.SetRange("Period Year", Prtransactions."Period Year");

                if P9table.Find('-') then
                    P9table.Init();
                P9table.Pension := Prtransactions.Amount;
                P9table.Insert()


            until Prtransactions.Next() = 0;

        end;
    end;

    var
        P9table: record "PRL-Employee P9 Info";
        Prtransactions: record "PRL-Period Transactions";
}
