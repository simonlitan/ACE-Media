page 52178538 "Casual Requisition Lines"
{
    PageType = ListPart;
    SourceTable = "Casual Requisition Lines";
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Visible = false;

                }
                field("ID NO"; Rec."ID NO")
                {
                    ApplicationArea = all;
                    ShowMandatory = true;
                }

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("No of Days"; Rec."No of Days")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                
                field(Total; Rec.Total)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Confirmed; Rec.Confirmed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Confirmed field.';
                }
                field("Confirmed Days";Rec."No of Days")
                {
                    ApplicationArea = all;
                    Caption = 'Confirmed Days';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        //UpdateControls();
        
    end;

    var
        StatusEditable: Boolean;

    local procedure UpdateControls()
    var
        CasualHeader: Record "Casual Requisition";
    begin
    end;
}

