page 52178934 "Registry Cues"
{
    Caption = 'Registry Cues';
    PageType = CardPart;
    SourceTable = "Registry Cue";

    layout
    {
        area(content)
        {
            cuegroup(General)
            {
                field("Inbound Mails"; Rec."Inbound Mails")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Departmental Files";
                    ToolTip = 'Specifies the value of the Inbound Mails field.';
                }
                field("Outbound Mails"; Rec."Outbound Mails")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Outbound Mails";
                    ToolTip = 'Specifies the value of the Outbound Mails field.';
                }
                field("Mails Brought Up"; Rec."Mails Brought Up")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Departmental Files";
                    ToolTip = 'Specifies the value of the Mails Brought Up field.';
                }
                field("Personal Mails"; Rec."Personal Mails")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Departmental Files";
                    ToolTip = 'Specifies the value of the Personal Mails field.';
                }
                field("Official Mails"; Rec."Official Mails")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Departmental Files";
                    ToolTip = 'Specifies the value of the Departmental Mails field.';
                }
                //field("My Assigned Mails"; Rec.)
                field("Collected Mails"; Rec."Collected Mails")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Departmental Files";
                    ToolTip = 'Specifies the value of the Mails Brought Up field.';
                }
                field("My Assined Mail"; Rec."My Assined Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the My Assigned Mails field.';
                }
            }
        }
    }
}
