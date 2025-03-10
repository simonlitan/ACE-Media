table 52178897 "ICT Support Areas"
{
    DrillDownPageId = "ICT Support Areas";
    LookupPageId = "ICT Support Areas";
    fields
    {
        field(1; "Support Area No."; Code[20])
        {

        }
        field(3; "Area Description"; text[200])
        {

        }
        field(4; "Adding User"; Code[30])
        {

        }
        field(5; "Last Modified"; Date)
        {

        }
        field(6; "Issue Priority"; Option)
        {
            OptionMembers = " ",High,Low;
        }

    }
    keys
    {
        key(key1; "Support Area No.")
        {
            Clustered = true;
        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "Support Area No.", "Area Description") { }
    }
    trigger OnInsert()
    var
        ICTSetUp: Record "ICT Support Desk Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "Support Area No." = '' then begin
            ICTSetUp.Get();
            ICTSetUp.TestField("Support Area No.");
            NoSeriesMgt.InitSeries(ICTSetUp."Support Area No.", ICTSetUp."Support Area No.", WorkDate(), "Support Area No.", ICTSetUp."Support Area No.");
        end;
    end;
}