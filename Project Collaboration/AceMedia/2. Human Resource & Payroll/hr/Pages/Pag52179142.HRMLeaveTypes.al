page 52179142 "HRM-Leave Types"
{
    PageType = List;
    SourceTable = "HRM-Leave Types";
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Annual; Rec.Annual)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Annual field.';
                }
                field(Days; Rec.Days)
                {
                    ApplicationArea = all;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = all;
                }
                field("Max Carry Forward Days"; Rec."Max Carry Forward Days")
                {
                    ApplicationArea = all;
                }
                field("Acrue Days"; rec."Acrue Days")
                {
                    ApplicationArea = all;
                }
                field("Deduct From Leave Days"; Rec."Deduct From Leave Days")
                {
                    ApplicationArea = all;
                }
                field("Unlimited Days"; Rec."Unlimited Days")
                {
                    ApplicationArea = all;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = all;
                }


                field("Inclusive of Holidays"; Rec."Inclusive of Holidays")
                {
                    ApplicationArea = all;
                }
                field("Inclusive of Saturday"; Rec."Inclusive of Saturday")
                {
                    ApplicationArea = all;
                }
                field("Inclusive of Sunday"; Rec."Inclusive of Sunday")
                {
                    ApplicationArea = all;
                }
                field("Off/Holidays Days Leave"; Rec."Off/Holidays Days Leave")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;
}

