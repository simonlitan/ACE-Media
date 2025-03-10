page 52178484 "Gen_Jornal list1"
{
    PageType = List;
    CardPageId = "Gen_Journal Card1";
    SourceTable = "Journal Voucher Header1";
    DeleteAllowed = false;
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

                field("Postind Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Postind Date field.';
                }
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
        Rec.Reset();
        // Rec.SetRange("User Name", UserId);
    end;
}
