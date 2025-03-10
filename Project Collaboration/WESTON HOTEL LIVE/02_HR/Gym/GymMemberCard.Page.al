page 50053 "Gym Member Card"
{
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = true;
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
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
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
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = All;
                }
                field(Citizenship; Rec.Citizenship)
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
                field("Balance Due"; Rec."Balance Due")
                {
                    ApplicationArea = All;
                }
                field("ID Number"; Rec."ID No")
                {
                    ApplicationArea = All;
                }
                field("Gym Status"; Rec."Gym Status")
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }
                field("Date of Registration"; Rec."Date of Registration")
                {
                    ApplicationArea = All;
                }
                field("Date of Expiry"; Rec."Date of Expiry")
                {
                    ApplicationArea = All;
                }
                field("Gym Rate"; Rec."Gym Rate")
                {
                    ApplicationArea = All;
                }
                field("Gym Membership Type"; Rec."Gym Membership Type")
                {
                    ApplicationArea = All;
                }
                field("Gym Remarks"; Rec."Gym Remarks")
                {
                    ApplicationArea = All;
                    Caption = 'Remarks';
                }
                field("Gym Amount Paid"; Rec."Gym Amount Paid")
                {
                    ApplicationArea = All;
                    Caption = 'Amount Paid';
                }
                // field("Gym Balance"; Rec."Gym Balance")
                // {
                //     Caption = 'Balance';
                // }
                field("Gym Payment Status"; Rec."Gym Payment Status")
                {
                    ApplicationArea = All;
                    Caption = 'Gym Payment Status';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Customer Type" := "Customer Type"::'Gym';
    end;
}

