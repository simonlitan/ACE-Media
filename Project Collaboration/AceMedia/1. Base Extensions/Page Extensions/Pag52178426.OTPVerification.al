page 52178426 "OTP Verification"
{
    Caption = 'OTP Verification';
    PageType = Card;
    SourceTable = "OTP Numbers";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                }

                field("E-Mail"; Rec."E-Mail")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the email address of the approver that you can use if you want to send approval mail notifications.';
                }
                field(OTP; Rec."OTP No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the OTP field.';
                }
            }
        }
    }
}
