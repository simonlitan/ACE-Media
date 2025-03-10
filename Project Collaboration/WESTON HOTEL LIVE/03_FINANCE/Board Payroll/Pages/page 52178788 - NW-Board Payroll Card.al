page 52178788 "NW-Board Payroll Card"
{
    PageType = Document;
    SourceTable = "NW-Board Payroll";
    layout
    {
        area(Content)
        {
            group(General)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Almanac Ref."; Rec."Almanac Ref.")
                {
                    ToolTip = 'Specifies the value of the Almanac Ref. field.';
                    ApplicationArea = All;
                }
                field(Quater; Rec.Quater)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Quater field.';
                    ApplicationArea = All;
                }
                field("Period Month"; Rec."Period Month")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Month field.';
                    ApplicationArea = All;
                }
                field("Period Week"; Rec."Period Week")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Week field.';
                    ApplicationArea = All;
                }
                field("Meeting Date"; Rec."Meeting Date")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Meeting Date field.';
                    ApplicationArea = All;
                }
                field("Committee Code"; Rec."Committee Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Committee Code field.';
                    ApplicationArea = All;
                }
                field("Committee Name"; Rec."Committee Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Committee Name field.';
                    ApplicationArea = All;
                }
                field("Meeting Details 1"; Rec."Meeting Details 1")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Meeting Details 1 field.';
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Meeting Details 2"; Rec."Meeting Details 2")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Meeting Details 2 field.';
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Estimated Budget"; Rec."Estimated Budget")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Estimated Budget field.';
                    ApplicationArea = All;
                }
                field("Sitting Allowance Acc"; Rec."Sitting Allowance Acc")
                {
                    ToolTip = 'Specifies the value of the Sitting Allowance Acc field.';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Mileage Claim Acc"; Rec."Mileage Claim Acc")
                {
                    ToolTip = 'Specifies the value of the Mileage Claim Acc field.';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Accomodation Allowance Acc"; Rec."Accomodation Allowance Acc")
                {
                    ToolTip = 'Specifies the value of the Accomodation Allowance Acc field.';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Lunch Allowance Acc"; Rec."Lunch Allowance Acc")
                {
                    ToolTip = 'Specifies the value of the Lunch Allowance Acc field.';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Net Acc"; Rec."Net Acc")
                {
                    ToolTip = 'Specifies the value of the Net Acc field.';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Tax Acc"; Rec."Tax Acc")
                {
                    ToolTip = 'Specifies the value of the Tax Acc field.';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Honoraria Acc"; Rec."Honoraria Acc")
                {
                    ToolTip = 'Specifies the value of the Honoraria Acc field.';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ToolTip = 'Specifies the value of the Cheque No. field.';
                    ApplicationArea = All;
                }


            }
            part("Salary Card"; "Board Salary Details")
            {
                ApplicationArea = all;
                Caption = 'Payroll Details';
                SubPageLink = "Board Payroll Code" = FIELD("No.");
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(PreparePayroll)
            {
                Caption = 'Prepare Payroll';
                ApplicationArea = All;
                Image = "Invoicing-Document";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    PayrlMembers: Record "NW-Board Members";
                    salryDetails: Record "Board Salary Details";
                begin
                    Rec.TestField(Rec."Payroll Period");
                    // Financial Committee Allowance
                    PayrlMembers.Reset();
                    if Rec."Committee Code" = 'FC' then begin
                        PayrlMembers.SetRange(Status, PayrlMembers.Status::Active);
                        PayrlMembers.SetRange(FC, true);
                        if PayrlMembers.Find('-') then begin
                            repeat
                                PayrlMembers.CalcFields("Sitting Allowance", "Sitting Allowance tax", "Sitting Allowance Net", "Accomodation Allowance", "Lunch Allowance",
                                "Lunch Allowance Tax", "Lunch Allowance Net", "Tax Code", "tax Rate");
                                salryDetails.Init();
                                salryDetails."Board Payroll Code" := Rec."No.";
                                salryDetails."No." := PayrlMembers."No.";
                                salryDetails."Name" := PayrlMembers."First Name" + ' ' + PayrlMembers."Middle Name" + ' ' + PayrlMembers."Last Name";
                                salryDetails."ID Number" := PayrlMembers."ID Number";
                                salryDetails.Gender := PayrlMembers.Gender;
                                salryDetails.Status := PayrlMembers.Status;
                                salryDetails."Home Phone Number" := PayrlMembers."Home Phone Number";
                                salryDetails."E-Mail" := PayrlMembers."E-Mail";
                                salryDetails."Company E-Mail" := PayrlMembers."Company E-Mail";
                                salryDetails.Title := PayrlMembers.Title;
                                salryDetails.Disabled := PayrlMembers.Disabled;
                                salryDetails."Date Of Birth" := PayrlMembers."Date Of Birth";
                                salryDetails."Date Of Join" := PayrlMembers."Date Of Join";
                                salryDetails."PIN Number" := PayrlMembers."PIN Number";
                                salryDetails."NSSF No." := PayrlMembers."NSSF No.";
                                salryDetails."NHF No." := PayrlMembers."NHF No.";
                                salryDetails."HELB No" := PayrlMembers."HELB No";
                                salryDetails.Tribe := PayrlMembers.Tribe;
                                salryDetails."Main Bank" := PayrlMembers."Main Bank";
                                salryDetails."Bank Name" := PayrlMembers."Bank Name";
                                salryDetails."Branch Bank" := PayrlMembers."Branch Bank";
                                salryDetails."Branch Name" := PayrlMembers."Branch Name";
                                salryDetails."Sitting Allowance" := PayrlMembers."Sitting Allowance";
                                salryDetails."Sitting Allowance tax" := PayrlMembers."Sitting Allowance tax";
                                salryDetails."Sitting Allowance Net" := PayrlMembers."Sitting Allowance Net";
                                salryDetails."Accomodation Allowance" := PayrlMembers."Accomodation Allowance";
                                salryDetails."Lunch Allowance" := PayrlMembers."Lunch Allowance";
                                salryDetails."Lunch Allowance Tax" := PayrlMembers."Lunch Allowance Tax";
                                salryDetails."Lunch Allowance Net" := PayrlMembers."Lunch Allowance Net";
                                salryDetails."Chair's Honoraria" := PayrlMembers."Chair's Honoraria";
                                salryDetails."Distance to Principal Bus" := PayrlMembers."Distance to Principal Bus";
                                salryDetails."Mileage Claim" := PayrlMembers."Mileage Claim";
                                salryDetails."Mileage  Allowance Tax " := PayrlMembers."Mileage  Allowance Tax";
                                salryDetails."Mileage  Allowance Net " := PayrlMembers."Mileage  Allowance Net ";
                                salryDetails."tax Code" := PayrlMembers."Tax Code";
                                salryDetails."Tax Rate" := PayrlMembers."tax Rate";
                                salryDetails."Payroll Period" := Rec."Payroll Period";
                                salryDetails.Insert();
                            until PayrlMembers.Next() = 0;

                        end;

                    end else
                        if Rec."Committee Code" = 'STBD' then begin
                            PayrlMembers.SetRange(Status, PayrlMembers.Status::Active);
                            PayrlMembers.SetRange(STBD, true);
                            if PayrlMembers.Find('-') then begin
                                repeat
                                    PayrlMembers.CalcFields("Sitting Allowance", "Sitting Allowance tax", "Sitting Allowance Net", "Accomodation Allowance", "Lunch Allowance",
                                    "Lunch Allowance Tax", "Lunch Allowance Net", "Tax Code", "tax Rate");
                                    salryDetails.Init();
                                    salryDetails."Board Payroll Code" := Rec."No.";
                                    salryDetails."No." := PayrlMembers."No.";
                                    salryDetails."Name" := PayrlMembers."First Name" + ' ' + PayrlMembers."Middle Name" + ' ' + PayrlMembers."Last Name";
                                    salryDetails."ID Number" := PayrlMembers."ID Number";
                                    salryDetails.Gender := PayrlMembers.Gender;
                                    salryDetails.Status := PayrlMembers.Status;
                                    salryDetails."Home Phone Number" := PayrlMembers."Home Phone Number";
                                    salryDetails."E-Mail" := PayrlMembers."E-Mail";
                                    salryDetails."Company E-Mail" := PayrlMembers."Company E-Mail";
                                    salryDetails.Title := PayrlMembers.Title;
                                    salryDetails.Disabled := PayrlMembers.Disabled;
                                    salryDetails."Date Of Birth" := PayrlMembers."Date Of Birth";
                                    salryDetails."Date Of Join" := PayrlMembers."Date Of Join";
                                    salryDetails."PIN Number" := PayrlMembers."PIN Number";
                                    salryDetails."NSSF No." := PayrlMembers."NSSF No.";
                                    salryDetails."NHF No." := PayrlMembers."NHF No.";
                                    salryDetails."HELB No" := PayrlMembers."HELB No";
                                    salryDetails.Tribe := PayrlMembers.Tribe;
                                    salryDetails."Main Bank" := PayrlMembers."Main Bank";
                                    salryDetails."Bank Name" := PayrlMembers."Bank Name";
                                    salryDetails."Branch Bank" := PayrlMembers."Branch Bank";
                                    salryDetails."Branch Name" := PayrlMembers."Branch Name";
                                    salryDetails."Sitting Allowance" := PayrlMembers."Sitting Allowance";
                                    salryDetails."Sitting Allowance tax" := PayrlMembers."Sitting Allowance tax";
                                    salryDetails."Sitting Allowance Net" := PayrlMembers."Sitting Allowance Net";
                                    salryDetails."Accomodation Allowance" := PayrlMembers."Accomodation Allowance";
                                    salryDetails."Lunch Allowance" := PayrlMembers."Lunch Allowance";
                                    salryDetails."Lunch Allowance Tax" := PayrlMembers."Lunch Allowance Tax";
                                    salryDetails."Lunch Allowance Net" := PayrlMembers."Lunch Allowance Net";
                                    salryDetails."Chair's Honoraria" := PayrlMembers."Chair's Honoraria";
                                    salryDetails."Distance to Principal Bus" := PayrlMembers."Distance to Principal Bus";
                                    salryDetails."Mileage Claim" := PayrlMembers."Mileage Claim";
                                    salryDetails."Mileage  Allowance Tax " := PayrlMembers."Mileage  Allowance Tax";
                                    salryDetails."Mileage  Allowance Net " := PayrlMembers."Mileage  Allowance Net ";
                                    salryDetails."tax Code" := PayrlMembers."Tax Code";
                                    salryDetails."Tax Rate" := PayrlMembers."tax Rate";
                                    salryDetails."Payroll Period" := Rec."Payroll Period";
                                    salryDetails.Insert();
                                until PayrlMembers.Next() = 0;

                            end;
                        end else
                            if Rec."Committee Code" = 'HRGP' then begin
                                PayrlMembers.SetRange(Status, PayrlMembers.Status::Active);
                                PayrlMembers.SetRange(STBD, true);
                                if PayrlMembers.Find('-') then begin
                                    repeat
                                        PayrlMembers.CalcFields("Sitting Allowance", "Sitting Allowance tax", "Sitting Allowance Net", "Accomodation Allowance", "Lunch Allowance",
                                   "Lunch Allowance Tax", "Lunch Allowance Net", "Tax Code", "tax Rate");
                                        salryDetails.Init();
                                        salryDetails."Board Payroll Code" := Rec."No.";
                                        salryDetails."No." := PayrlMembers."No.";
                                        salryDetails."Name" := PayrlMembers."First Name" + ' ' + PayrlMembers."Middle Name" + ' ' + PayrlMembers."Last Name";
                                        salryDetails."ID Number" := PayrlMembers."ID Number";
                                        salryDetails.Gender := PayrlMembers.Gender;
                                        salryDetails.Status := PayrlMembers.Status;
                                        salryDetails."Home Phone Number" := PayrlMembers."Home Phone Number";
                                        salryDetails."E-Mail" := PayrlMembers."E-Mail";
                                        salryDetails."Company E-Mail" := PayrlMembers."Company E-Mail";
                                        salryDetails.Title := PayrlMembers.Title;
                                        salryDetails.Disabled := PayrlMembers.Disabled;
                                        salryDetails."Date Of Birth" := PayrlMembers."Date Of Birth";
                                        salryDetails."Date Of Join" := PayrlMembers."Date Of Join";
                                        salryDetails."PIN Number" := PayrlMembers."PIN Number";
                                        salryDetails."NSSF No." := PayrlMembers."NSSF No.";
                                        salryDetails."NHF No." := PayrlMembers."NHF No.";
                                        salryDetails."HELB No" := PayrlMembers."HELB No";
                                        salryDetails.Tribe := PayrlMembers.Tribe;
                                        salryDetails."Main Bank" := PayrlMembers."Main Bank";
                                        salryDetails."Bank Name" := PayrlMembers."Bank Name";
                                        salryDetails."Branch Bank" := PayrlMembers."Branch Bank";
                                        salryDetails."Branch Name" := PayrlMembers."Branch Name";
                                        salryDetails."Sitting Allowance" := PayrlMembers."Sitting Allowance";
                                        salryDetails."Sitting Allowance tax" := PayrlMembers."Sitting Allowance tax";
                                        salryDetails."Sitting Allowance Net" := PayrlMembers."Sitting Allowance Net";
                                        salryDetails."Accomodation Allowance" := PayrlMembers."Accomodation Allowance";
                                        salryDetails."Lunch Allowance" := PayrlMembers."Lunch Allowance";
                                        salryDetails."Lunch Allowance Tax" := PayrlMembers."Lunch Allowance Tax";
                                        salryDetails."Lunch Allowance Net" := PayrlMembers."Lunch Allowance Net";
                                        salryDetails."Chair's Honoraria" := PayrlMembers."Chair's Honoraria";
                                        salryDetails."Distance to Principal Bus" := PayrlMembers."Distance to Principal Bus";
                                        salryDetails."Mileage Claim" := PayrlMembers."Mileage Claim";
                                        salryDetails."Mileage  Allowance Tax " := PayrlMembers."Mileage  Allowance Tax";
                                        salryDetails."Mileage  Allowance Net " := PayrlMembers."Mileage  Allowance Net ";
                                        salryDetails."tax Code" := PayrlMembers."Tax Code";
                                        salryDetails."Tax Rate" := PayrlMembers."tax Rate";
                                        salryDetails."Payroll Period" := Rec."Payroll Period";
                                        salryDetails.Insert();
                                    until PayrlMembers.Next() = 0;
                                end;

                            end else
                                if Rec."Committee Code" = 'GRA' then begin
                                    PayrlMembers.SetRange(Status, PayrlMembers.Status::Active);
                                    PayrlMembers.SetRange(GRA, true);
                                    if PayrlMembers.Find('-') then begin
                                        repeat
                                            PayrlMembers.CalcFields("Sitting Allowance", "Sitting Allowance tax", "Sitting Allowance Net", "Accomodation Allowance", "Lunch Allowance",
                                       "Lunch Allowance Tax", "Lunch Allowance Net", "Tax Code", "tax Rate");
                                            salryDetails.Init();
                                            salryDetails."Board Payroll Code" := Rec."No.";
                                            salryDetails."No." := PayrlMembers."No.";
                                            salryDetails."Name" := PayrlMembers."First Name" + ' ' + PayrlMembers."Middle Name" + ' ' + PayrlMembers."Last Name";
                                            salryDetails."ID Number" := PayrlMembers."ID Number";
                                            salryDetails.Gender := PayrlMembers.Gender;
                                            salryDetails.Status := PayrlMembers.Status;
                                            salryDetails."Home Phone Number" := PayrlMembers."Home Phone Number";
                                            salryDetails."E-Mail" := PayrlMembers."E-Mail";
                                            salryDetails."Company E-Mail" := PayrlMembers."Company E-Mail";
                                            salryDetails.Title := PayrlMembers.Title;
                                            salryDetails.Disabled := PayrlMembers.Disabled;
                                            salryDetails."Date Of Birth" := PayrlMembers."Date Of Birth";
                                            salryDetails."Date Of Join" := PayrlMembers."Date Of Join";
                                            salryDetails."PIN Number" := PayrlMembers."PIN Number";
                                            salryDetails."NSSF No." := PayrlMembers."NSSF No.";
                                            salryDetails."NHF No." := PayrlMembers."NHF No.";
                                            salryDetails."HELB No" := PayrlMembers."HELB No";
                                            salryDetails.Tribe := PayrlMembers.Tribe;
                                            salryDetails."Main Bank" := PayrlMembers."Main Bank";
                                            salryDetails."Bank Name" := PayrlMembers."Bank Name";
                                            salryDetails."Branch Bank" := PayrlMembers."Branch Bank";
                                            salryDetails."Branch Name" := PayrlMembers."Branch Name";
                                            salryDetails."Sitting Allowance" := PayrlMembers."Sitting Allowance";
                                            salryDetails."Sitting Allowance tax" := PayrlMembers."Sitting Allowance tax";
                                            salryDetails."Sitting Allowance Net" := PayrlMembers."Sitting Allowance Net";
                                            salryDetails."Accomodation Allowance" := PayrlMembers."Accomodation Allowance";
                                            salryDetails."Lunch Allowance" := PayrlMembers."Lunch Allowance";
                                            salryDetails."Lunch Allowance Tax" := PayrlMembers."Lunch Allowance Tax";
                                            salryDetails."Lunch Allowance Net" := PayrlMembers."Lunch Allowance Net";
                                            salryDetails."Chair's Honoraria" := PayrlMembers."Chair's Honoraria";
                                            salryDetails."Distance to Principal Bus" := PayrlMembers."Distance to Principal Bus";
                                            salryDetails."Mileage Claim" := PayrlMembers."Mileage Claim";
                                            salryDetails."Mileage  Allowance Tax " := PayrlMembers."Mileage  Allowance Tax";
                                            salryDetails."Mileage  Allowance Net " := PayrlMembers."Mileage  Allowance Net ";
                                            salryDetails."tax Code" := PayrlMembers."Tax Code";
                                            salryDetails."Tax Rate" := PayrlMembers."tax Rate";
                                            salryDetails."Payroll Period" := Rec."Payroll Period";
                                            salryDetails.Insert();
                                        until PayrlMembers.Next() = 0;
                                    end;
                                end else
                                    if Rec."Committee Code" = 'FB' then begin
                                        PayrlMembers.SetRange(Status, PayrlMembers.Status::Active);
                                        PayrlMembers.SetRange(FB, true);
                                        if PayrlMembers.Find('-') then begin
                                            repeat
                                                PayrlMembers.CalcFields("Sitting Allowance", "Sitting Allowance tax", "Sitting Allowance Net", "Accomodation Allowance", "Lunch Allowance",
                                           "Lunch Allowance Tax", "Lunch Allowance Net", "Tax Code", "tax Rate");
                                                salryDetails.Init();
                                                salryDetails."Board Payroll Code" := Rec."No.";
                                                salryDetails."No." := PayrlMembers."No.";
                                                salryDetails."Name" := PayrlMembers."First Name" + ' ' + PayrlMembers."Middle Name" + ' ' + PayrlMembers."Last Name";
                                                salryDetails."ID Number" := PayrlMembers."ID Number";
                                                salryDetails.Gender := PayrlMembers.Gender;
                                                salryDetails.Status := PayrlMembers.Status;
                                                salryDetails."Home Phone Number" := PayrlMembers."Home Phone Number";
                                                salryDetails."E-Mail" := PayrlMembers."E-Mail";
                                                salryDetails."Company E-Mail" := PayrlMembers."Company E-Mail";
                                                salryDetails.Title := PayrlMembers.Title;
                                                salryDetails.Disabled := PayrlMembers.Disabled;
                                                salryDetails."Date Of Birth" := PayrlMembers."Date Of Birth";
                                                salryDetails."Date Of Join" := PayrlMembers."Date Of Join";
                                                salryDetails."PIN Number" := PayrlMembers."PIN Number";
                                                salryDetails."NSSF No." := PayrlMembers."NSSF No.";
                                                salryDetails."NHF No." := PayrlMembers."NHF No.";
                                                salryDetails."HELB No" := PayrlMembers."HELB No";
                                                salryDetails.Tribe := PayrlMembers.Tribe;
                                                salryDetails."Main Bank" := PayrlMembers."Main Bank";
                                                salryDetails."Bank Name" := PayrlMembers."Bank Name";
                                                salryDetails."Branch Bank" := PayrlMembers."Branch Bank";
                                                salryDetails."Branch Name" := PayrlMembers."Branch Name";
                                                salryDetails."Sitting Allowance" := PayrlMembers."Sitting Allowance";
                                                salryDetails."Sitting Allowance tax" := PayrlMembers."Sitting Allowance tax";
                                                salryDetails."Sitting Allowance Net" := PayrlMembers."Sitting Allowance Net";
                                                salryDetails."Accomodation Allowance" := PayrlMembers."Accomodation Allowance";
                                                salryDetails."Lunch Allowance" := PayrlMembers."Lunch Allowance";
                                                salryDetails."Lunch Allowance Tax" := PayrlMembers."Lunch Allowance Tax";
                                                salryDetails."Lunch Allowance Net" := PayrlMembers."Lunch Allowance Net";
                                                salryDetails."Chair's Honoraria" := PayrlMembers."Chair's Honoraria";
                                                salryDetails."Distance to Principal Bus" := PayrlMembers."Distance to Principal Bus";
                                                salryDetails."Mileage Claim" := PayrlMembers."Mileage Claim";
                                                salryDetails."Mileage  Allowance Tax " := PayrlMembers."Mileage  Allowance Tax";
                                                salryDetails."Mileage  Allowance Net " := PayrlMembers."Mileage  Allowance Net ";
                                                salryDetails."tax Code" := PayrlMembers."Tax Code";
                                                salryDetails."Tax Rate" := PayrlMembers."tax Rate";
                                                salryDetails."Payroll Period" := Rec."Payroll Period";
                                                salryDetails.Insert();
                                            until PayrlMembers.Next() = 0;
                                        end;

                                    end else
                                        if Rec."Committee Code" = 'ADH' then begin
                                            PayrlMembers.SetRange(Status, PayrlMembers.Status::Active);
                                            PayrlMembers.SetRange(ADH, true);
                                            if PayrlMembers.Find('-') then begin
                                                repeat
                                                    PayrlMembers.CalcFields("Sitting Allowance", "Sitting Allowance tax", "Sitting Allowance Net", "Accomodation Allowance", "Lunch Allowance",
                                               "Lunch Allowance Tax", "Lunch Allowance Net", "Tax Code", "tax Rate");
                                                    salryDetails.Init();
                                                    salryDetails."Board Payroll Code" := Rec."No.";
                                                    salryDetails."No." := PayrlMembers."No.";
                                                    salryDetails."Name" := PayrlMembers."First Name" + ' ' + PayrlMembers."Middle Name" + ' ' + PayrlMembers."Last Name";
                                                    salryDetails."ID Number" := PayrlMembers."ID Number";
                                                    salryDetails.Gender := PayrlMembers.Gender;
                                                    salryDetails.Status := PayrlMembers.Status;
                                                    salryDetails."Home Phone Number" := PayrlMembers."Home Phone Number";
                                                    salryDetails."E-Mail" := PayrlMembers."E-Mail";
                                                    salryDetails."Company E-Mail" := PayrlMembers."Company E-Mail";
                                                    salryDetails.Title := PayrlMembers.Title;
                                                    salryDetails.Disabled := PayrlMembers.Disabled;
                                                    salryDetails."Date Of Birth" := PayrlMembers."Date Of Birth";
                                                    salryDetails."Date Of Join" := PayrlMembers."Date Of Join";
                                                    salryDetails."PIN Number" := PayrlMembers."PIN Number";
                                                    salryDetails."NSSF No." := PayrlMembers."NSSF No.";
                                                    salryDetails."NHF No." := PayrlMembers."NHF No.";
                                                    salryDetails."HELB No" := PayrlMembers."HELB No";
                                                    salryDetails.Tribe := PayrlMembers.Tribe;
                                                    salryDetails."Main Bank" := PayrlMembers."Main Bank";
                                                    salryDetails."Bank Name" := PayrlMembers."Bank Name";
                                                    salryDetails."Branch Bank" := PayrlMembers."Branch Bank";
                                                    salryDetails."Branch Name" := PayrlMembers."Branch Name";
                                                    salryDetails."Sitting Allowance" := PayrlMembers."Sitting Allowance";
                                                    salryDetails."Sitting Allowance tax" := PayrlMembers."Sitting Allowance tax";
                                                    salryDetails."Sitting Allowance Net" := PayrlMembers."Sitting Allowance Net";
                                                    salryDetails."Accomodation Allowance" := PayrlMembers."Accomodation Allowance";
                                                    salryDetails."Lunch Allowance" := PayrlMembers."Lunch Allowance";
                                                    salryDetails."Lunch Allowance Tax" := PayrlMembers."Lunch Allowance Tax";
                                                    salryDetails."Lunch Allowance Net" := PayrlMembers."Lunch Allowance Net";
                                                    salryDetails."Chair's Honoraria" := PayrlMembers."Chair's Honoraria";
                                                    salryDetails."Distance to Principal Bus" := PayrlMembers."Distance to Principal Bus";
                                                    salryDetails."Mileage Claim" := PayrlMembers."Mileage Claim";
                                                    salryDetails."Mileage  Allowance Tax " := PayrlMembers."Mileage  Allowance Tax";
                                                    salryDetails."Mileage  Allowance Net " := PayrlMembers."Mileage  Allowance Net ";
                                                    salryDetails."tax Code" := PayrlMembers."Tax Code";
                                                    salryDetails."Tax Rate" := PayrlMembers."tax Rate";
                                                    salryDetails."Payroll Period" := Rec."Payroll Period";
                                                    salryDetails.Insert();
                                                until PayrlMembers.Next() = 0;
                                            end;
                                        end else
                                            if Rec."Committee Code" = 'SPEC' then begin
                                                PayrlMembers.SetRange(Status, PayrlMembers.Status::Active);
                                                PayrlMembers.SetRange(SPEC, true);
                                                if PayrlMembers.Find('-') then begin
                                                    repeat
                                                        PayrlMembers.CalcFields("Sitting Allowance", "Sitting Allowance tax", "Sitting Allowance Net", "Accomodation Allowance", "Lunch Allowance",
                                                   "Lunch Allowance Tax", "Lunch Allowance Net", "Tax Code", "tax Rate");
                                                        salryDetails.Init();
                                                        salryDetails."Board Payroll Code" := Rec."No.";
                                                        salryDetails."No." := PayrlMembers."No.";
                                                        salryDetails."Name" := PayrlMembers."First Name" + ' ' + PayrlMembers."Middle Name" + ' ' + PayrlMembers."Last Name";
                                                        salryDetails."ID Number" := PayrlMembers."ID Number";
                                                        salryDetails.Gender := PayrlMembers.Gender;
                                                        salryDetails.Status := PayrlMembers.Status;
                                                        salryDetails."Home Phone Number" := PayrlMembers."Home Phone Number";
                                                        salryDetails."E-Mail" := PayrlMembers."E-Mail";
                                                        salryDetails."Company E-Mail" := PayrlMembers."Company E-Mail";
                                                        salryDetails.Title := PayrlMembers.Title;
                                                        salryDetails.Disabled := PayrlMembers.Disabled;
                                                        salryDetails."Date Of Birth" := PayrlMembers."Date Of Birth";
                                                        salryDetails."Date Of Join" := PayrlMembers."Date Of Join";
                                                        salryDetails."PIN Number" := PayrlMembers."PIN Number";
                                                        salryDetails."NSSF No." := PayrlMembers."NSSF No.";
                                                        salryDetails."NHF No." := PayrlMembers."NHF No.";
                                                        salryDetails."HELB No" := PayrlMembers."HELB No";
                                                        salryDetails.Tribe := PayrlMembers.Tribe;
                                                        salryDetails."Main Bank" := PayrlMembers."Main Bank";
                                                        salryDetails."Bank Name" := PayrlMembers."Bank Name";
                                                        salryDetails."Branch Bank" := PayrlMembers."Branch Bank";
                                                        salryDetails."Branch Name" := PayrlMembers."Branch Name";
                                                        salryDetails."Sitting Allowance" := PayrlMembers."Sitting Allowance";
                                                        salryDetails."Sitting Allowance tax" := PayrlMembers."Sitting Allowance tax";
                                                        salryDetails."Sitting Allowance Net" := PayrlMembers."Sitting Allowance Net";
                                                        salryDetails."Accomodation Allowance" := PayrlMembers."Accomodation Allowance";
                                                        salryDetails."Lunch Allowance" := PayrlMembers."Lunch Allowance";
                                                        salryDetails."Lunch Allowance Tax" := PayrlMembers."Lunch Allowance Tax";
                                                        salryDetails."Lunch Allowance Net" := PayrlMembers."Lunch Allowance Net";
                                                        salryDetails."Chair's Honoraria" := PayrlMembers."Chair's Honoraria";
                                                        salryDetails."Distance to Principal Bus" := PayrlMembers."Distance to Principal Bus";
                                                        salryDetails."Mileage Claim" := PayrlMembers."Mileage Claim";
                                                        salryDetails."Mileage  Allowance Tax " := PayrlMembers."Mileage  Allowance Tax";
                                                        salryDetails."Mileage  Allowance Net " := PayrlMembers."Mileage  Allowance Net ";
                                                        salryDetails."tax Code" := PayrlMembers."Tax Code";
                                                        salryDetails."Tax Rate" := PayrlMembers."tax Rate";
                                                        salryDetails."Payroll Period" := Rec."Payroll Period";
                                                        salryDetails.Insert();
                                                    until PayrlMembers.Next() = 0;
                                                end;
                                            end;

                end;
            }

            action(PayrolPeriods)
            {
                ApplicationArea = All;
                Caption = 'Payrol Periods';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "NW-Board Payroll Periods";
            }
            action(ProcessPayroll)
            {
                ApplicationArea = All;
                Caption = 'Process';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    PayrlMembers: Record "NW-Board Members";
                    salryDetails: Record "Board Salary Details";
                begin
                    salryDetails.Reset();
                    salryDetails."Meeting Gross Allowances" := 0;
                    salryDetails.SetRange("Board Payroll Code", Rec."No.");
                    if salryDetails.Find('-') then begin

                        repeat
                            salryDetails."Board Gross Totals" := (salryDetails."Sitting Allowance" + salryDetails."Mileage Claim" + salryDetails."Lunch Allowance"
                            + salryDetails."Accomodation Totals");

                            salryDetails."Board Tax Totals" := (salryDetails."Sitting Allowance tax" + salryDetails."Mileage  Allowance tax " + salryDetails."Lunch Allowance Tax");

                            salryDetails."Board Net Totals" := (salryDetails."Sitting Allowance Net" + salryDetails."Mileage  Allowance Net "
                            + salryDetails."Lunch Allowance Net" + salryDetails."Accomodation Totals");

                            //salryDetails."Meeting Gross Allowances" := salryDetails."Meeting Gross Allowances" + salryDetails."Board Gross Totals";
                            salryDetails.Modify();
                        until salryDetails.Next() = 0;
                    end;
                    Message('Processing Successiful');
                end;
            }
            action(PayrollJournals)
            {
                Caption = 'Payroll journals';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    BSD: Record "Board Salary Details";
                    GeneraljnlLine: Record "Gen. Journal Line";
                    GenJnlBatch: Record "Gen. Journal Batch";
                    LineNumber: Integer;
                    TaxableAmount: Decimal;
                    AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";
                begin
                    BSD.Reset();
                    BSD.SetRange("Board Payroll Code", Rec."No.");
                    BSD.SetRange("Payroll Period", Rec."Payroll Period");
                    if BSD.Find('-') then begin
                        BSD.CalcSums("Sitting Allowance", "Mileage Claim", "Lunch Allowance", "Accomodation Totals",
                         "Board Tax Totals", "Board Net Totals");
                        Rec.CalcFields("Sitting Allowance Acc", "Net Acc", "Accomodation Allowance Acc",
                        "Mileage Claim Acc", "Honoraria Acc", "Lunch Allowance Acc");
                        //Create batch
                        GenJnlBatch.RESET;
                        GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name", 'GENERAL');
                        GenJnlBatch.SETRANGE(GenJnlBatch.Name, 'BoardPay');

                        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                        GeneraljnlLine.RESET;
                        GeneraljnlLine.SETRANGE(GeneraljnlLine."Journal Template Name", 'General');
                        GeneraljnlLine.SETRANGE(GeneraljnlLine."Journal Batch Name", 'BoardPay');
                        GeneraljnlLine.DELETEALL;

                        IF GenJnlBatch.GET('GENERAL', 'BoardPay') THEN
                            GenJnlBatch.DELETE;

                        GenJnlBatch.RESET();
                        GenJnlBatch."Journal Template Name" := 'GENERAL';
                        GenJnlBatch.Name := 'BoardPay';
                        GenJnlBatch.INSERT;
                        LineNumber := 1000;
                        IF BSD."Board Net Totals" <> 0 THEN begin
                            //Sitting Allowance
                            GeneraljnlLine.INIT;
                            GeneraljnlLine."Line No." := LineNumber + 10;
                            GeneraljnlLine."Journal Template Name" := 'GENERAL';
                            GeneraljnlLine."Journal Batch Name" := 'BoardPay';
                            GeneraljnlLine."Posting Date" := Rec."Payroll Period";
                            GeneraljnlLine."Document No." := Rec."No.";
                            GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                            GeneraljnlLine."Account No." := Rec."Sitting Allowance Acc";
                            GeneraljnlLine.Description := 'Board Sitting Allowance Payments';
                            GeneraljnlLine.Amount := BSD."Sitting Allowance";
                            if GeneraljnlLine.Amount <> 0 then
                                GeneraljnlLine.Insert();

                            //Mileage Claim
                            GeneraljnlLine.INIT;
                            GeneraljnlLine."Line No." := LineNumber + 20;
                            GeneraljnlLine."Journal Template Name" := 'GENERAL';
                            GeneraljnlLine."Journal Batch Name" := 'BoardPay';
                            GeneraljnlLine."Posting Date" := Rec."Payroll Period";
                            GeneraljnlLine."Document No." := Rec."No.";
                            GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                            GeneraljnlLine."Account No." := Rec."Mileage Claim Acc";
                            GeneraljnlLine.Description := 'Board Milleage Allowance Payments';
                            GeneraljnlLine.Amount := BSD."Mileage Claim";
                            if GeneraljnlLine.Amount <> 0 then
                                GeneraljnlLine.Insert();

                            //Accomodation Claim
                            GeneraljnlLine.INIT;
                            GeneraljnlLine."Line No." := LineNumber + 30;
                            GeneraljnlLine."Journal Template Name" := 'GENERAL';
                            GeneraljnlLine."Journal Batch Name" := 'BoardPay';
                            GeneraljnlLine."Posting Date" := Rec."Payroll Period";
                            GeneraljnlLine."Document No." := Rec."No.";
                            GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                            GeneraljnlLine."Account No." := Rec."Accomodation Allowance Acc";
                            GeneraljnlLine.Description := 'Accomodation Allowance Payments';
                            GeneraljnlLine.Amount := BSD."Accomodation Totals";
                            if GeneraljnlLine.Amount <> 0 then
                                GeneraljnlLine.Insert();

                            //Lunch Allowance
                            GeneraljnlLine.INIT;
                            GeneraljnlLine."Line No." := LineNumber + 40;
                            GeneraljnlLine."Journal Template Name" := 'GENERAL';
                            GeneraljnlLine."Journal Batch Name" := 'BoardPay';
                            GeneraljnlLine."Posting Date" := Rec."Payroll Period";
                            GeneraljnlLine."Document No." := Rec."No.";
                            GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                            GeneraljnlLine."Account No." := Rec."Lunch Allowance Acc";
                            GeneraljnlLine.Description := 'Lunch Allowance Payments';
                            GeneraljnlLine.Amount := BSD."Lunch Allowance";
                            if GeneraljnlLine.Amount <> 0 then
                                GeneraljnlLine.Insert();

                            //Net Pay
                            GeneraljnlLine.INIT();
                            GeneraljnlLine."Line No." := LineNumber + 50;
                            GeneraljnlLine."Journal Template Name" := 'GENERAL';
                            GeneraljnlLine."Journal Batch Name" := 'BoardPay';
                            GeneraljnlLine."Posting Date" := Rec."Payroll Period";
                            GeneraljnlLine."Document No." := Rec."No.";
                            GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                            GeneraljnlLine."Account No." := Rec."Net Acc";
                            GeneraljnlLine.Description := 'Board Net  Payments';
                            GeneraljnlLine.Amount := -(BSD."Board Net Totals");

                            if GeneraljnlLine.Amount <> 0 then
                                GeneraljnlLine.Insert();

                            //Tax Payments
                            GeneraljnlLine.INIT();
                            GeneraljnlLine."Line No." := LineNumber + 60;
                            GeneraljnlLine."Journal Template Name" := 'GENERAL';
                            GeneraljnlLine."Journal Batch Name" := 'BoardPay';
                            GeneraljnlLine."Posting Date" := Rec."Payroll Period";
                            GeneraljnlLine."Document No." := Rec."No.";
                            GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
                            GeneraljnlLine."Account No." := Rec."Tax Acc";
                            GeneraljnlLine.Description := 'Tax Payments';
                            GeneraljnlLine.Amount := -(BSD."Board Tax Totals");

                            if GeneraljnlLine.Amount <> 0 then
                                GeneraljnlLine.Insert();
                        end else
                            Message('Its Zero');
                    END;

                    Rec.Posted := true;
                    GeneraljnlLine.RESET;
                    GeneraljnlLine.SETRANGE(GeneraljnlLine."Journal Template Name", 'General');
                    GeneraljnlLine.SETRANGE(GeneraljnlLine."Journal Batch Name", 'BoardPay');

                    //AdjustGenJnl.RUN(GeneraljnlLine);
                    // CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GeneraljnlLine);
                    GeneratePVS();
                end;
            }
            group("EFT Generation")
            {
                Caption = 'EFT Generation';
                action("Generate EFT")
                {
                    Caption = 'Generate EFT';
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        EFTHeader: Record "EFT Batch Header";
                        EFTline: Record "EFT batch Lines";
                        salryDetails: Record "Board Salary Details";
                        LineNo: Integer;
                    begin
                        IF Rec.Status <> Rec.Status::Approved THEN ERROR('Payroll must be approved');
                        Rec.TESTFIELD("Cheque No.");

                        EFTHeader.RESET;
                        EFTHeader.SETRANGE("No.", Rec."Cheque No.");
                        IF EFTHeader.FIND('-') THEN BEGIN

                            salryDetails.RESET;
                            salryDetails.SETRANGE("Board Payroll Code", Rec."No.");
                            IF salryDetails.FIND('-') THEN BEGIN
                                repeat
                                    //  EFTline.INIT;
                                    EFTline."Line No" := EFTline."Line No" + 10;
                                    EFTline."Doc No" := EFTHeader."No.";
                                    EFTline.Date := EFTHeader.Date;
                                    EFTline."Bank Code" := salryDetails."Main Bank";
                                    EFTline."Bank Branch No" := salryDetails."Branch Bank";
                                    EFTline."Bank A/C Name" := salryDetails."Bank Name";
                                    EFTline.Payee := salryDetails.Name;
                                    EFTline."Bank A/C No" := salryDetails."Bank Account Number";
                                    EFTline.Amount := salryDetails."Board Net Totals";
                                    EFTline."PV Number" := Rec."No.";
                                    EFTline.Description := Rec."Committee Code" + ' Board Committee Payment';
                                    EFTline.INSERT;
                                until salryDetails.Next() = 0;

                            END;
                        END;
                        // EFTHeader.Posted := TRUE;
                        //  EFTHeader."Posted by" := USERID;
                        EFTHeader.MODIFY;
                        // ExpenseBudget;
                        //Post PV Entries
                        //TESTFIELD("Expense Code");
                        CurrPage.SAVERECORD;
                        //CheckPVRequiredItems(Rec);
                        // PostPaymentVoucher(Rec);
                    end;
                }
            }
            group(SendAppr)
            {
                Caption = 'Approval';
                action(RequestApp)
                {
                    Caption = 'Request Approval';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Init Code";
                    begin
                        if ApprovalMgt.IsBPRLEnabled(Rec) = true then
                            ApprovalMgt.OnSendBPRLforApproval(Rec)
                        else
                            Message('No Workflow is enabled');
                    end;
                }
                action(RequestAppCan)
                {
                    Caption = 'Cancel Approval Request';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Init Code";
                    begin
                        if ApprovalMgt.IsBPRLEnabled(Rec) = true then
                            ApprovalMgt.OnCancelBPRLforApproval(Rec)
                        else
                            Message('No Workflow is enabled');
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = All;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "Fin-Approval Entries";
                    RunPageLink = "Document No." = field("No.");
                }
            }
        }
        area(Creation)
        {

        }
    }

    local procedure UpdateSalaryCard()
    var
        PayrlMembers: Record "NW-Board Members";
        salryDetails: Record "Board Salary Details";
    begin
        PayrlMembers.CalcFields("Sitting Allowance", "Sitting Allowance tax", "Sitting Allowance Net", "Accomodation Allowance", "Lunch Allowance",
                                    "Lunch Allowance Tax", "Lunch Allowance Net", "Tax Code", "tax Rate");
        salryDetails.Init();
        salryDetails."Board Payroll Code" := Rec."No.";
        salryDetails."No." := PayrlMembers."No.";
        salryDetails."Name" := PayrlMembers."First Name" + ' ' + PayrlMembers."Middle Name" + ' ' + PayrlMembers."Last Name";
        salryDetails."ID Number" := PayrlMembers."ID Number";
        salryDetails.Gender := PayrlMembers.Gender;
        salryDetails.Status := PayrlMembers.Status;
        salryDetails."Home Phone Number" := PayrlMembers."Home Phone Number";
        salryDetails."E-Mail" := PayrlMembers."E-Mail";
        salryDetails."Company E-Mail" := PayrlMembers."Company E-Mail";
        salryDetails.Title := PayrlMembers.Title;
        salryDetails.Disabled := PayrlMembers.Disabled;
        salryDetails."Date Of Birth" := PayrlMembers."Date Of Birth";
        salryDetails."Date Of Join" := PayrlMembers."Date Of Join";
        salryDetails."PIN Number" := PayrlMembers."PIN Number";
        salryDetails."NSSF No." := PayrlMembers."NSSF No.";
        salryDetails."NHF No." := PayrlMembers."NHF No.";
        salryDetails."HELB No" := PayrlMembers."HELB No";
        salryDetails.Tribe := PayrlMembers.Tribe;
        salryDetails."Main Bank" := PayrlMembers."Main Bank";
        salryDetails."Bank Name" := PayrlMembers."Bank Name";
        salryDetails."Branch Bank" := PayrlMembers."Branch Bank";
        salryDetails."Branch Name" := PayrlMembers."Branch Name";
        salryDetails."Sitting Allowance" := PayrlMembers."Sitting Allowance";
        salryDetails."Sitting Allowance tax" := PayrlMembers."Sitting Allowance tax";
        salryDetails."Sitting Allowance Net" := PayrlMembers."Sitting Allowance Net";
        salryDetails."Accomodation Allowance" := PayrlMembers."Accomodation Allowance";
        salryDetails."Lunch Allowance" := PayrlMembers."Lunch Allowance";
        salryDetails."Lunch Allowance Tax" := PayrlMembers."Lunch Allowance Tax";
        salryDetails."Lunch Allowance Net" := PayrlMembers."Lunch Allowance Net";
        salryDetails."Chair's Honoraria" := PayrlMembers."Chair's Honoraria";
        salryDetails."Distance to Principal Bus" := PayrlMembers."Distance to Principal Bus";
        salryDetails."Mileage Claim" := PayrlMembers."Mileage Claim";
        salryDetails."Mileage  Allowance Tax " := PayrlMembers."Mileage  Allowance Tax";
        salryDetails."Mileage  Allowance Net " := PayrlMembers."Mileage  Allowance Net ";
        salryDetails."tax Code" := PayrlMembers."Tax Code";
        salryDetails."Tax Rate" := PayrlMembers."tax Rate";
        salryDetails."Payroll Period" := Rec."Payroll Period";
        salryDetails.Insert();
    end;

    local procedure GeneratePVS()
    var
        pheader: Record "FIN-Payments Header";
        plines: Record "FIN-Payment Line";
        BpayDetails: Record "Board Salary Details";
        BpayHeader: Record "NW-Board Payroll";
        GenLedgerSetup: Record "Cash Office Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Nextno: code[20];

    begin
        BpayDetails.Reset();
        BpayDetails.SetRange("Board Payroll Code", Rec."No.");
        BpayDetails.SetRange("Payroll Period", Rec."Payroll Period");

        if BpayDetails.Find('-') then begin
            BpayDetails.CalcSums("Board Net Totals", "Board Tax Totals");
            if BpayDetails."Board Net Totals" <> 0 then begin
                GenLedgerSetup.GET;
                GenLedgerSetup.TESTFIELD(GenLedgerSetup."Normal Payments No");
                NoSeriesMgt.InitSeries(GenLedgerSetup."Normal Payments No", xRec."No. Series", 0D, pheader."No.", pheader."No. Series");
                pheader."Date" := Rec."Meeting Date";
                pheader."Global Dimension 1 Code" := 'BU';
                pheader."Shortcut Dimension 2 Code" := 'BADASA';
                pheader.Payee := 'Board Members';
                pheader."On Behalf Of" := 'NWHSA';
                pheader."Payment Narration" := 'Net Payment of Board Allowances';
                pheader.Cashier := UserId;
                pheader."Responsibility Center" := 'NWHSA';
                pheader.Insert();

                plines.Init();
                plines.No := pheader."No.";
                plines.Type := 'Board NET';
                plines."Account Type" := plines."Account Type"::"G/L Account";
                plines."Account No." := Rec."Net Acc";
                plines."Account Name" := 'Net Pay to Board Members';
                plines.Amount := BpayDetails."Board Net Totals";
                plines."Net Amount" := BpayDetails."Board Net Totals";
                plines.Insert();
            end;
            if BpayDetails."Board Tax Totals" <> 0 then begin
                GenLedgerSetup.GET;
                GenLedgerSetup.TESTFIELD(GenLedgerSetup."Normal Payments No");
                Nextno := NoSeriesMgt.GetNextNo(GenLedgerSetup."Normal Payments No", today, true);
                pheader."Date" := Rec."Meeting Date";
                pheader."No." := Nextno;
                pheader."Global Dimension 1 Code" := 'BU';
                pheader."Shortcut Dimension 2 Code" := 'BADASA';
                pheader.Payee := 'Board Members';
                pheader."On Behalf Of" := 'NWHSA';
                pheader."Payment Narration" := 'Payee  Payment of Board Allowances';
                pheader.Cashier := UserId;
                pheader."Responsibility Center" := 'NWHSA';
                pheader.Insert();

                plines.Init();
                plines.No := pheader."No.";
                plines.Type := 'BOARD PAYE';
                plines."Account Type" := plines."Account Type"::"G/L Account";
                plines."Account No." := Rec."Tax Acc";
                plines."Account Name" := 'Payee Pay to Board Members';
                plines.Amount := BpayDetails."Board Tax Totals";
                plines."Net Amount" := BpayDetails."Board Tax Totals";
                plines.Insert();
            end;


        end;
    end;
}