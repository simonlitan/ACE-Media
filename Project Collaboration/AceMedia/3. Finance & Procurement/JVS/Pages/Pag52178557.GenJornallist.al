page 52178763 "Gen_Jornal list"
{
    PageType = List;
    CardPageId = "Journal Voucher Header";
    SourceTable = "Journal Voucher Header";
    DeleteAllowed = false;
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }

                // field("Postind Date"; Rec."Posting Date")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Postind Date field.';
                // }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }


                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User Name field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        //Rec.Reset();
        // Rec.SetRange("User Name", UserId);
    end;
}
