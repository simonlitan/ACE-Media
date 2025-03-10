table 52178669 "NW-Boad Almanac View"
{
    DrillDownPageId = "NW-Boad Almanac ViewL";
    LookupPageId = "NW-Boad Almanac ViewL";
    fields
    {
        field(1; "Board Period"; Code[50])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(2; "Description"; Text[250])
        {

        }
        field(3; "Status"; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Cancelled;
        }
        field(4; "User ID"; Code[50])
        {

        }
    }
    trigger OnInsert()
    begin
        "User ID" := UserId;
    end;

    trigger OnModify()
    begin
        if Status <> Status::Open then
            Error('You can not modify thisn record');
    end;

    trigger OnDelete()
    begin
        if Status <> Status::Open then
            Error('You can not modify thisn record');
    end;

    procedure SetApproved()
    var
        ALMNC: Record "Board Almanac";
        ALMNCV: Record "NW-Boad Almanac View";
    begin

        ALMNC.Reset();
        ALMNC.SetRange("Budget Period", Rec."Board Period");
        if ALMNC.Find('-') then begin
            repeat
                ALMNC.Approved := true;
                ALMNC.Modify();
            until ALMNC.Next() = 0;
        end;

    end;
}