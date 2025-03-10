page 52178933 "CEO-Meetings"
{
    AutoSplitKey = true;
    Caption = 'CEO-Meetings';
    PageType = Document;
    UsageCategory = Administration;
    SourceTable = "CEO-Calendar Entries";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Meetings Participants")
            {
                // field("Participants Code"; Rec."Participants Code")
                // {
                //     ApplicationArea = All;
                //     trigger OnValidate()
                //     var
                //         NoSeriesMgt: Codeunit 396;
                //     begin
                //         if Rec."Participants Code" <> xRec."Participants Code" then begin
                //             //HRSetup.Get;
                //             NoSeriesMgt.TestManual('PARTC');
                //             Rec."No Series" := '';
                //         end;
                //     end;
                // }

            }
            part("Meetings Participants Page"; "CEO-Meeting Participants Page")
            {
                SubPageLink = "Number" = FIELD("Participants Code");
                ApplicationArea = All;
            }
        }
    }
}