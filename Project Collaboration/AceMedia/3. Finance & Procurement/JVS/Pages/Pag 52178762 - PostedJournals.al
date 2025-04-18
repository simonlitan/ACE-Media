page 52178762 "Posted Journals"
{
    PageType = List;
    CardPageId = "Journal Voucher Header";
    SourceTable = "Journal Voucher Header";
    DeleteAllowed = false;
    SourceTableView = where(Posted = const(true));
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
                field(Posted; Rec.Posted)
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
