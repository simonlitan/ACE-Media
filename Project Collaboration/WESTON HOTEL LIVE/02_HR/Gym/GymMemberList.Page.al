page 50054 "Gym Member List"
{
    CardPageID = "Gym Member Card";
    PageType = List;
    SourceTable = Customer;
    //SourceTableView = WHERE ("Customer Type"=filter('Gym'));
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field("Date of Registration"; Rec."Date of Registration")
                {
                    ApplicationArea = All;
                }
                field("Date of Expiry"; Rec."Date of Expiry")
                {
                    ApplicationArea = All;
                }
                field("Gym Status"; Rec."Gym Status")
                {
                    ApplicationArea = All;
                }
                field("Gym Membership Type"; Rec."Gym Membership Type")
                {
                    ApplicationArea = All;
                    Caption = 'Membership Type';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("ID Number"; Rec."ID No")
                {
                    ApplicationArea = All;
                }
                field("Customer Type"; Rec."Customer Type")/////////////////////////////option members////////////////,Member,CPD Provider,Institutions,Normal,Gym,Spa
                {
                    ApplicationArea = All;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = All;
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = All;
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = All;
                }
                field("Passport No"; Rec."Passport No")
                {
                    ApplicationArea = All;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

