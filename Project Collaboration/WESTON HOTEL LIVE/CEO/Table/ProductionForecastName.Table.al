table 52178902 "CEO-Production Forecast Name"
{
    Caption = 'Production Forecast Name';
    DrillDownPageID = "CEO Calendar Names";
    LookupPageID = "CEO Calendar Names";

    fields
    {
        field(1; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(4; "Budget Dimension 1 Code"; Code[20])
        {
            Caption = 'Budget Dimension 1 Code';
            TableRelation = Dimension;

            // trigger OnValidate()
            // begin
            //     if "Budget Dimension 1 Code" <> xRec."Budget Dimension 1 Code" then
            //         if Dim.CheckIfDimUsed("Budget Dimension 1 Code", 9, Name, '', 0) then
            //             Error(Text000, Dim.GetCheckDimErr);
            // end;
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        ProdForecastEntry: Record "CEO-Production Forecast Entry";
    begin
        ProdForecastEntry.SETRANGE("Calendar Name", Name);
        IF NOT ProdForecastEntry.ISEMPTY THEN BEGIN
            IF GUIALLOWED THEN
                IF NOT CONFIRM(Confirm001Qst, TRUE, Name) THEN
                    ERROR('');
            ProdForecastEntry.DELETEALL;
        END;
    end;

    var
        Confirm001Qst: Label 'The Production Forecast %1 has entries. Do you want to delete it anyway?';
}

