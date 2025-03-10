page 52178909 "TR Pending Approval List"
{
    Caption = 'TR Pending Approval List';
    CardPageId = "TR Transport Request Card";
    Editable = false;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "TR Transport Request";
    sourceTableView = where(Status = const("Pending Approval"));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Request No"; Rec."Request No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request No field.';
                }
                field("Requested Date"; Rec."Requested Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requested Date field.';
                }
                field("Date of Travel"; Rec."Date of Travel")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Travel field.';
                }
                field("No of days requested"; Rec."No of days requested")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of days requested field.';
                }
                field("Expected Return Date"; Rec."Expected Return Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected Return Date field.';
                }
                field("Commencing Place"; Rec."Commencing Place")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Commencing Place field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
            }
        }
    }
}
