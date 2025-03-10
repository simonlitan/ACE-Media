page 52178913 "TR Driver Allocation"
{
    Caption = 'TR Driver Allocation';
    PageType = ListPart;
    SourceTable = "TR Driver Allocations";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Registration No"; Rec."Registration No")
                {
                    ApplicationArea = All;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("Driver No"; Rec."Driver No")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = All;
                }
                field("To"; Rec."To")
                {
                    ApplicationArea = All;
                }
                field(Current; Rec.Current)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnClosePage()
    begin
        Dallocation.Reset();
        Dallocation.SetRange(Current, true);
        if Dallocation.Count > 1 then error('Current driver cannot be more than 1!');
    end;

    var
        Vehicles: Record "TR Vehicles";
        Dallocation: Record "TR Driver Allocations";
}
