page 52178946 "REG-Registry Files List1"
{
    CardPageID = "REG-Registry Files Card1";
    PageType = List;
    SourceTable = "REG-Registry Files";
    SourceTableView = WHERE("File Status" = FILTER(Active));

    layout
    {
        area(content)
        {
            repeater(Group)
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
                Image = PostDocument;
                Promoted = true;
                PromotedIsBig = true;

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
                Image = Archive;
                Promoted = true;
                PromotedIsBig = true;

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

