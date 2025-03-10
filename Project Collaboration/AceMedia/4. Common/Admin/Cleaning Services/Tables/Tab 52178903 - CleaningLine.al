table 52178903 "Cleaning Line"
{
    Caption = 'Cleaning Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[50])
        {
            Editable = false;
            Caption = 'No';
            DataClassification = ToBeClassified;
        }
        field(2; "Cleaning Date"; Date)
        {
            Caption = 'Cleaning Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Cleaningheader.Reset();
                Cleaningheader.SetRange(No, rec.No);
                if Cleaningheader.Find('-') then begin
                    if (rec."Cleaning Date" < Cleaningheader."Start Date") or (rec."Cleaning Date" > Cleaningheader."End Date") then
                        Error('The date does not fall within the range of %1 .. %2', Cleaningheader."Start Date", Cleaningheader."End Date");
                end;
            end;
        }
        field(3; "Line No"; Integer)
        {
            Editable = false;
            AutoIncrement = true;
            Caption = 'Line No';
            DataClassification = ToBeClassified;
        }
        field(4; "Cleaner No"; Code[50])
        {
            Caption = 'Cleaner No';
            DataClassification = ToBeClassified;
        }
        field(5; "Cleaner Name"; Text[150])
        {
            Caption = 'Cleaner Name';
            DataClassification = ToBeClassified;
        }
        field(6; "Office Space"; Code[100])
        {
            Caption = 'Office Space';
            DataClassification = ToBeClassified;
        }
        field(7; "Cleaning Done"; Option)
        {
            Caption = 'Cleaning Done';
            OptionMembers = " ",Yes,No;
            DataClassification = ToBeClassified;
        }

        field(8; "Cleaning Time"; Time)
        {
            Caption = 'Cleaning Time';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; No, "Cleaning Date", "Line No")
        {
            Clustered = true;
        }
    }
    trigger OnModify()
    begin
        Cleaningheader.Reset();
        Cleaningheader.SetRange(Cleaningheader.No, rec.No);
        if Cleaningheader.Find('-') then
            if Cleaningheader.Closed = true then
                Error('Cleaning Schedule' + ' ' + Format(No) + ' ' + 'is already Closed!');
    end;

    trigger OnDelete()
    begin
        Cleaningheader.Reset();
        Cleaningheader.SetRange(Cleaningheader.No, rec.No);
        if Cleaningheader.Find('-') then
            if Cleaningheader.Closed = true then
                Error('Cleaning Schedule' + ' ' + Format(No) + ' ' + 'is already Closed!');
    end;

    var
        Cleaningheader: record "Cleaning Header";
}
