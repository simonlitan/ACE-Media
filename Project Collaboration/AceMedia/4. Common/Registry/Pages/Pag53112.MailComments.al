page 52179067 "Mail Comments"
{
    Caption = 'Mail Comments';
    PageType = ListPart;
    SourceTable = "Mail Comment";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("PF No."; Rec."PF No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value launof the Employee Name field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    // Editable = Enable;
                    ToolTip = 'Specifies the value of the Comment1 field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                    trigger OnValidate()
                    begin
                        if Rec.Posted = true then
                            // Editable := False;
                            Rec.Modify();
                    end;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
        }
    }
    actions
    {
        // area(Processing)
        // {
        //     action(Post)
        //     {
        //         ApplicationArea = All;
        //         Promoted = true;
        //         Image = MailAttachment;
        //         PromotedCategory = Category5;
        //         PromotedIsBig = true;
        //         //Visible = IsForwarded;
        //         PromotedOnly = true;
        //         trigger OnAction()
        //         var
        //             Text000: Label 'Do you wish Post This comment ';
        //             Text001: Label 'Your Comment has been Posted!';
        //             Enabled: Boolean;
        //         begin
        //             if Confirm(Text000, true) then begin
        //                 Rec.Posted := true;
        //                 // if Rec.Posted = true then
        //                 //     //Editable := False;
        //                 //     //Rec.Modify();

        //                 //     Message(Text001);
        //             end;
        //         end;
        //     }
    }
}
// var
//     Enable: Boolean;

