page 52178958 "REG-Registry Files Card1"

{
    PageType = Card;
    SourceTable = "REG-Registry Files";
    SourceTableView = WHERE("File Status" = FILTER(New));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("File No."; Rec."File No.")
                {
                }
                field("File Subject/Description"; Rec."File Subject/Description")
                {
                }
                field("Date Created"; Rec."Date Created")
                {
                }
                field("Date Closed"; Rec."Date Closed")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("File Type"; Rec."File Type")
                {
                }
                field("Maximum Allowable Files"; Rec."Maximum Allowable Files")
                {
                }
                field("Date of Issue"; Rec."Date of Issue")
                {
                }
                field("Issuing Officer"; Rec."Issuing Officer")
                {
                }
                field("Circulation Reason"; Rec."Circulation Reason")
                {
                }
                field("Expected Return Date"; Rec."Expected Return Date")
                {
                }
                field("Receiving Officer"; Rec."Receiving Officer")
                {
                }
                field("Delivery Officer"; Rec."Delivery Officer")
                {
                }
                field("File Status"; Rec."File Status")
                {
                }
                field("Dispatch Status"; Rec."Dispatch Status")
                {
                }
                field("Issuing Office Name"; Rec."Issuing Office Name")
                {
                }
                field("Recieving Officer Name"; Rec."Recieving Officer Name")
                {
                }
                field("Delivery Officer Name"; Rec."Delivery Officer Name")
                {
                }
                field("Folio No"; Rec."Folio No")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
            }
        }
        /* area(factboxes)
        {
            systempart(; Notes)
            {
            }
            systempart(; MyNotes)
            {
            }
            systempart(; Links)
            {
            }
        } */
    }

    actions
    {
        area(creation)
        {
            action("Dispatch ")
            {
                Caption = 'Dispatch File';

                trigger OnAction()
                begin
                    IF (CONFIRM('Dispatch File?', TRUE) = FALSE) THEN ERROR('Cancelled!');
                    Rec."Dispatch Status" := Rec."Dispatch Status"::Dispatched;
                    Rec.MODIFY;
                    MESSAGE('File Dispatched!')
                end;
            }
            action(Archive)
            {
                Caption = 'Archive File';

                trigger OnAction()
                begin
                    IF CONFIRM('Archive File?', FALSE) = FALSE THEN EXIT;

                    Rec."File Status" := Rec."File Status"::Archived;
                    Rec.MODIFY;
                    MESSAGE('File archived!');
                end;
            }
        }
    }
}

