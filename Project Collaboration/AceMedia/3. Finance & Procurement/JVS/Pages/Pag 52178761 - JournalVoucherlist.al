page 52178761 "Journal Voucher list"
{
    PageType = List;
    CardPageId = "Journal Voucher Header";
    SourceTable = "Journal Voucher Header";
    SourceTableView = where(Posted = const(false));
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

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }
                // field("Total Amount"; Rec."Total Amount")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Total Amount field.';
                // }

                // field("User Name"; Rec."User Name")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the User Name field.';
                // }
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        // Rec.Reset();
        // Rec.SetRange("User Name", UserId);
    end;
}