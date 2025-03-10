page 52178716 "NW-Board Members Card"
{
    PageType = Document;
    SaveValues = true;
    DeleteAllowed = true;
    ModifyAllowed = true;

    SourceTable = "NW-Board Members";
    SourceTableView = SORTING("No.") ORDER(Ascending);

    layout
    {
        area(content)
        {
            group("BoardMember")
            {
                Caption = 'Board Member Details';
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                    Enabled = true;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = all;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                }

                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = all;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = all;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
                }

                field("PIN Number"; Rec."PIN Number")
                {
                    ApplicationArea = all;
                }

                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = all;
                }
                field("Physical Disability"; Rec."Physical Disability")
                {
                    ApplicationArea = all;
                }
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                    ToolTip = 'Specifies the value of the Vehicle Model field.';
                    ApplicationArea = All;
                }
                field("Distance to Principal Bus"; Rec."Distance to Principal Bus")
                {
                    ToolTip = 'Specifies the value of the Distance to Principal Bus field.';
                    ApplicationArea = All;
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle Registration No. field.';
                    ApplicationArea = All;
                }
                field("Place of Residence"; Rec."Place of Residence")
                {
                    ToolTip = 'Specifies the value of the Place of Residence field.';
                    ApplicationArea = All;
                }



            }
            group(Commitees)
            {
                Caption = 'Member Committees';
                field(FC; Rec.FC)
                {
                    ToolTip = 'Specifies the value of the FC field.';
                    ApplicationArea = All;
                }
                field(STBD; Rec.STBD)
                {
                    ToolTip = 'Specifies the value of the STBD field.';
                    ApplicationArea = All;
                }
                field(HRGP; Rec.HRGP)
                {
                    ToolTip = 'Specifies the value of the HRGP field.';
                    ApplicationArea = All;
                }
                field(GRA; Rec.GRA)
                {
                    ToolTip = 'Specifies the value of the GRA field.';
                    ApplicationArea = All;
                }
                field(FB; Rec.FB)
                {
                    ToolTip = 'Specifies the value of the FB field.';
                    ApplicationArea = All;
                }
                field(ADH; Rec.ADH)
                {
                    ToolTip = 'Specifies the value of the ADH field.';
                    ApplicationArea = All;
                }
                field(SPEC; Rec.SPEC)
                {
                    ToolTip = 'Specifies the value of the SPEC field.';
                    ApplicationArea = All;
                }

            }
            part("Board Qualifications"; "Board Members Qualifications")
            {
                ApplicationArea = all;
                Caption = 'Academic Qualifications';
                SubPageLink = "Board No." = FIELD("No.");
            }
            group(Posting)
            {
                Caption = 'Bank Details';
                field("Main Bank1"; Rec."Main Bank")
                {
                    ApplicationArea = all;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ToolTip = 'Specifies the value of the Bank Name field.';
                    ApplicationArea = All;
                }
                field("Branch Bank1"; Rec."Branch Bank")
                {
                    ApplicationArea = all;
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ToolTip = 'Specifies the value of the Branch Name field.';
                    ApplicationArea = All;
                }
                field("Bank Account Number1"; Rec."Bank Account Number")
                {
                    ApplicationArea = all;
                }
            }

            group(Allowances)
            {

                field("Sitting Allowance"; Rec."Sitting Allowance")
                {
                    ToolTip = 'Specifies the value of the Sitting Allowance field.';
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Accomodation Allowance"; Rec."Accomodation Allowance")
                {
                    ToolTip = 'Specifies the value of the Accomodation Allowance field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Chair's Honoraria"; Rec."Chair's Honoraria")
                {
                    ToolTip = 'Specifies the value of the Chair''s Honoraria field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Sitting Allowance tax"; Rec."Sitting Allowance tax")
                {
                    ToolTip = 'Specifies the value of the Sitting Allowance tax field.';
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Lunch Allowance Tax"; Rec."Lunch Allowance Tax")
                {
                    ToolTip = 'Specifies the value of the Lunch Allowance Tax field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Sitting Allowance Net"; Rec."Sitting Allowance Net")
                {
                    ToolTip = 'Specifies the value of the Sitting Allowance Net field.';
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Lunch Allowance Net"; Rec."Lunch Allowance Net")
                {
                    ToolTip = 'Specifies the value of the Lunch Allowance Net field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Lunch Allowance"; Rec."Lunch Allowance")
                {
                    ToolTip = 'Specifies the value of the Lunch Allowance field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Mileage Claim"; Rec."Mileage Claim")
                {
                    ToolTip = 'Specifies the value of the Mileage Claim field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Mileage  Allowance Tax"; Rec."Mileage  Allowance Tax")
                {
                    ToolTip = 'Specifies the value of the Mileage  Allowance Tax  field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                // field("Mileage  Allowance Net"; Rec."Mileage  Allowance Net")
                // {
                //     ToolTip = 'Specifies the value of the Mileage  Allowance Net  field.';
                //     ApplicationArea = All;
                //     Editable = false;
                // }
                field("Mileage Rate"; Rec."Mileage Rate")
                {
                    ToolTip = 'Specifies the value of the Mileage Rate field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Mileage Ceiling"; Rec."Mileage Ceiling")
                {
                    ToolTip = 'Specifies the value of the Mileage Ceiling field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Tax Code"; Rec."Tax Code")
                {
                    ToolTip = 'Specifies the value of the Tax Code field.';
                    ApplicationArea = All;

                }
                field("tax Rate"; Rec."tax Rate")
                {
                    ToolTip = 'Specifies the value of the tax Rate field.';
                    ApplicationArea = All;
                    Editable = false;
                }

            }
            /* part("Salary Details"; "PRL-SalaryCard")
            {
                ApplicationArea = all;
                Caption = 'Salary Details';
                SubPageLink = "Employee Code" = FIELD("No.");
            } */
        }
    }

    actions
    {
        area(navigation)
        {

            group("Other Info")
            {
                Caption = 'Other Info';
                action("Banking Details")
                {
                    ApplicationArea = all;
                    Caption = 'Banking Details';
                    Image = BankAccount;
                    RunObject = Page "PRL-Employee Banks";
                    RunPageLink = "Employee Code" = FIELD("No.");
                }

            }
        }


    }

    trigger OnInit()
    begin

        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            SelectedPeriod := objPeriod."Date Opened";
            PeriodName := objPeriod."Period Name";
            PeriodMonth := objPeriod."Period Month";
            PeriodYear := objPeriod."Period Year";
        end;
    end;

    var
        objPeriod: Record "PRL-Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;

}