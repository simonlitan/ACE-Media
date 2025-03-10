table 52178781 "Board Almanac"
{
    DrillDownPageId = "Board Almanac ListView";
    LookupPageId = "Board Almanac ListView";
    fields
    {
        field(1; "No."; Code[50])
        {

        }
        field(2; "Quater"; Option)
        {
            OptionMembers = "First Quater","Second Quater","Third Quater","Fourth Quater";
        }

        field(3; "Period Month"; Text[50])
        {

        }
        field(4; "Period Week"; Text[100])
        {


        }
        field(5; "Meeting Date"; Date)
        {

        }
        field(6; "Committee Code"; Code[50])
        {
            TableRelation = "Board Committes Listing"."Commitee Code";
            trigger OnValidate()
            var
                committees: Record "Board Committes Listing";
            begin
                committees.Reset();
                committees.SetRange("Commitee Code", Rec."Committee Code");
                if committees.Find('-') then begin
                    Rec."Committee Name" := committees."Committee Name";
                end;
            end;

        }
        field(7; "Committee Name"; Text[100])
        {
            Editable = false;
        }
        field(8; "Meeting Details 1"; Text[250])
        {

        }
        field(9; "Meeting Details 2"; Text[250])
        {

        }
        field(10; "Estimated Budget"; Decimal)
        {

        }
        field(11; "Meeting Attended"; Boolean)
        {

        }
        field(12; "Accounting Period"; Code[50])
        {

        }
        field(13; "No. Series"; Code[50])
        {

        }
        field(14; "Budget Period"; code[50])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(15; Closed; Boolean)
        {

        }
        field(16; "Approved"; Boolean)
        {

        }
        field(17; "User ID"; Code[50])
        {

        }


    }
    keys
    {
        key(key1; "No.", Quater, "Committee Code", "Meeting Date")
        {

        }
    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            NoSeriesMgt.InitSeries('BRD ALMANAC', xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "User ID" := UserId;
    end;

}