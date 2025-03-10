table 50048 "Payroll Journal Transfer"
{
    LookupPageId = "Payroll Journal Transfer";
    DrillDownPageId = "Payroll Journal Transfer";

    fields
    {
        field(1; "No."; code[20])
        {
            Editable = false;
        }
        field(2; "Payroll Period"; Date)
        {
            TableRelation = "PRL-Payroll Periods"."Date Opened" where(Closed = filter(false));
            trigger OnValidate()
            var
                pjt: Record "Payroll Journal Transfer";
            begin
                pjt.Reset();
                pjt.SetRange("Payroll Period", "Payroll Period");
                if pjt.Find('-') then
                    error('The Period Journals Already Transferred');
                objPeriod.Reset();
                objPeriod.SetRange("Date Opened", Rec."Payroll Period");
                if objPeriod.Find('-') then begin
                    "Period Month" := objPeriod."Period Month";
                    "Period Year" := objPeriod."Period Year";
                    "Period Name" := objPeriod."Period Name";
                end;
            end;
        }
        field(3; "Period Month"; integer)
        {
            Editable = false;
        }
        field(4; "Period Year"; integer)
        {
            Editable = false;
        }
        field(5; "Period Name"; Text[50])
        {
            Editable = false;
        }
    }

    keys
    {
        key(key1; "No.")
        {

        }
    }
    var
        objPeriod: Record "PRL-Payroll Periods";
        NoSeriesManagement: Codeunit NoSeriesManagement;



    trigger OnInsert()
    begin

        if "No." = '' then begin
            "No." := NoSeriesManagement.GetNextNo('PJT', today, true);
        end;

    end;

    procedure UpdateTransactions()
    begin

    end;

}