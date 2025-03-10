page 52179318 "Appraisal Comments"
{
    Caption = 'Appraisal Comments';
    PageType = List;
    SourceTable = "Appraisal Comments";

    layout
    {
        area(content)
        {
            Repeater(General)
            {
                Caption = 'General';

                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appraisal No field.';
                    Editable = False;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                    MultiLine = True;
                }
                field("Comment Date"; Rec."Comment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment Date field.';
                    Editable = false;
                }
                field("Rating Status"; Rec."Rating Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rating Status field.';
                    Editable = False;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = False;
                }
                field(UserId; Rec.UserId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the UserId field.';
                    Editable = False;
                }
            }
        }
    }
}
