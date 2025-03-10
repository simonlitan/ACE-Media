/// <summary>
/// Page HRM-Employee (B) (ID 68159).
/// </summary>
page 68159 "HRM-Employee (B)"
{
    Caption = 'Card';
    PageType = Document;
    RefreshOnActivate = true;
    SaveValues = true;
    SourceTable = "HRM-Employee C";

    layout
    {
        area(content)
        {
            group(Control168)
            {
                ShowCaption = false;
                field("gOpt Active"; "gOpt Active")
                {
                    ApplicationArea = all;
                    OptionCaption = 'Show Active Employees,Show Archived Employees,Show All Employees';
                    ShowCaption = false;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        if "gOpt Active" = "gOpt Active"::All then
                            AllgOptActiveOnValidate;
                        if "gOpt Active" = "gOpt Active"::Archive then
                            ArchivegOptActiveOnValidate;
                        if "gOpt Active" = "gOpt Active"::Active then
                            ActivegOptActiveOnValidate;
                    end;
                }
                field("Employee Act. Qty"; Rec."Employee Act. Qty")
                {
                    ApplicationArea = all;

                    Editable = false;
                }
                field("Employee Arc. Qty"; Rec."Employee Arc. Qty")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Employee Qty"; Rec."Employee Qty")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            group("General Information")
            {
                Caption = 'General Information';
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    AssistEdit = true;
                    Caption = 'Employee No.';
                    Editable = true;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                }
                field("Employee Category"; Rec."Employee Category")
                {
                    ApplicationArea = all;
                }
                field("Employee Type"; Rec."Employee Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Type field.';
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = all;
                    Caption = 'Initials';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = all;
                }
                field("Salary Category"; Rec."Salary Category")
                {
                    Caption = 'Job Category';
                    ApplicationArea = all;
                }
                field("Grade Level"; Rec."Grade Level")
                {
                    Caption = 'Job Grade';
                    ApplicationArea = all;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = all;

                }

                field("Salary Step"; rec."Salary Step")
                {
                    Editable = false;
                    ApplicationArea = all;

                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Id field.';
                }

                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field(Profession; Rec.Profession)
                {
                    ApplicationArea = all;
                }
                field("Physical Disability"; Rec."Physical Disability")
                {
                    ApplicationArea = all;
                    Caption = 'P.W.D';
                    Visible = false;
                }

                field("Drive to Work"; Rec."Drive to Work")
                {
                    Caption = 'Drive to Work?';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = all;
                }
                field(Salutation; Rec.Salutation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salutation field.';
                }

                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = all;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = all;
                }
                field("Postal Address2"; Rec."Postal Address2")
                {
                    ApplicationArea = all;
                }
                field("Post Code2"; Rec."Post Code2")
                {
                    ApplicationArea = all;
                    Caption = 'Post Code';
                    LookupPageID = "Post Codes";
                }
                field("Probation Start Date"; Rec."Probation Start Date")
                {
                    ApplicationArea = all;
                }
                field("Leave Balances"; Rec."Leave Balance")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

                field("Off-Day Balances"; Rec.OffDays)
                {
                    ApplicationArea = all;
                    Editable = false;
                }

                field(HOD; Rec.HOD)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOD field.';
                }


                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = all;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = all;
                    Editable = true;
                }
                field("Payroll Posting Group"; Rec."Payroll Posting Group")
                {
                    Editable = true;
                    ApplicationArea = all;
                }
                group("Password Management")
                {
                    field(Password; Rec.Password)
                    {
                        ApplicationArea = all;
                    }
                    field("Portal Password"; Rec."Portal Password")
                    {
                        ApplicationArea = all;
                    }

                }

            }
            group("Employee Qualifications")
            {
                part(Qualificationss; "HRM-Emp. Qualifications (B)")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Qualifications';
                    SubPageLink = "Employee No." = FIELD("No.");
                }

            }

            group("Personal Details")
            {
                Caption = 'Personal Details';
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = all;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = all;
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = all;
                }
                field(Denomination; Rec.Denomination)
                {
                    ApplicationArea = All;
                }
                field(Tribe; Rec.Tribe)
                {
                    ApplicationArea = All;
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = all;
                    //todo  LookupPageID = "HRM-Drivers List";
                }
                field("Pension Cleared"; Rec."Pension Cleared")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Vehicle Registration Number"; Rec."Vehicle Registration Number")
                {
                    ApplicationArea = all;
                    Caption = 'Vehicle Reg Number';
                    Visible = false;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = all;
                    Caption = 'P.W.D';

                    trigger OnValidate()
                    begin
                        if Rec.Disabled = Rec.Disabled::No then begin
                            "Disabling DetailsEditable" := false;
                            "Disability GradeEditable" := false;
                        end
                        else
                            "Disabling DetailsEditable" := true;
                        "Disability GradeEditable" := true;
                    end;
                }
                field("Disabling Details"; Rec."Disabling Details")
                {
                    ApplicationArea = all;
                    Caption = 'P.W.D Details';
                    Editable = "Disabling DetailsEditable";
                }
                field("Disability Grade"; Rec."Disability Grade")
                {
                    ApplicationArea = all;
                    Caption = 'P.W.D Grade';
                    Editable = "Disability GradeEditable";
                    Visible = false;
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    ApplicationArea = all;
                    Caption = 'Health Assessment?';
                    Visible = false;
                }
                field("Medical Scheme No."; Rec."Medical Scheme No.")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme Head Member"; Rec."Medical Scheme Head Member")
                {
                    ApplicationArea = all;
                }
                field("Number Of Dependants"; Rec."Number Of Dependants")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme Name"; Rec."Medical Scheme Name")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme Name #2"; Rec."Medical Scheme Name #2")
                {
                    ApplicationArea = all;
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    ApplicationArea = all;
                }
                field(Cleared; Rec.Cleared)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Health Assesment Date"; Rec."Health Assesment Date")
                {
                    ApplicationArea = all;
                    Caption = 'Health Assessment Date';
                }
                field("Notice Period Days Served"; Rec."Notice Period Days Served")
                {
                    ApplicationArea = all;
                    Visible = false;
                }

            }
            group("Important Dates")
            {
                Caption = 'Important Dates';
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = all;
                }
                field(DAge; DAge)
                {
                    ApplicationArea = all;
                    Caption = 'Age';
                    Editable = false;

                }

                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = all;
                    Caption = 'Date Of Joining The Company';
                }
                field(DService; DService)
                {
                    ApplicationArea = all;
                    Caption = 'Length of Service';
                    Editable = false;
                }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = all;
                }
                field("Pension Scheme Join"; Rec."Pension Scheme Join")
                {
                    ApplicationArea = all;
                    Caption = 'Pension Scheme Join Date';
                }
                field(DPension; DPension)
                {
                    ApplicationArea = all;
                    Caption = 'Time On Pension Scheme';
                    Editable = false;
                }
                field("Medical Scheme Join"; Rec."Medical Scheme Join")
                {
                    ApplicationArea = all;
                    Caption = 'Medical Aid Scheme Join Date';
                }
                field(DMedical; DMedical)
                {
                    ApplicationArea = all;
                    Caption = 'Medical Scheme Duration';
                    Editable = false;
                }
                field("Contract End Date1"; Rec."Contract End Date")
                {
                    ApplicationArea = all;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        FrmCalendar.SetDate(Rec."Contract End Date");
                        FrmCalendar.RunModal;
                        D := FrmCalendar.GetDate;
                        Clear(FrmCalendar);
                        if D <> 0D then
                            Rec."Contract End Date" := D;
                    end;
                }
                field(RetirementDur; RetirementDur)
                {
                    ApplicationArea = all;
                    Caption = 'Duration to retirement';
                    Editable = false;
                }
                field("Retirement date"; Rec."Retirement date")
                {
                    ApplicationArea = all;
                }
                field("Wedding Anniversary"; Rec."Wedding Anniversary")
                {
                    ApplicationArea = all;
                }
            }
            group("Contact Numbers")
            {
                Caption = 'Contact Numbers';
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = all;
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                    ApplicationArea = all;
                }
                field("Fax Number"; Rec."Fax Number")
                {
                    ApplicationArea = all;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = all;
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = all;
                }
                field("Post Office No"; Rec."Post Office No")
                {
                    ApplicationArea = all;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = all;
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                }
                field("Department Name"; Rec."Department Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }

                field("Division Code"; Rec."Division Code")
                {
                    ApplicationArea = all;
                }
                field("Payroll Departments"; Rec."Payroll Departments")
                {
                    ApplicationArea = all;
                }
                field("PIN Number"; Rec."PIN Number")
                {
                    ApplicationArea = all;
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    ApplicationArea = all;
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    ApplicationArea = all;
                }
                field("PAYROLL NO"; Rec."PAYROLL NO")
                {
                    ApplicationArea = all;
                }
                field("HELB No"; Rec."HELB No")
                {
                    ApplicationArea = all;
                }
                field("Co-Operative No"; Rec."Co-Operative No")
                {
                    ApplicationArea = all;
                }
                field("Main Bank"; Rec."Main Bank")
                {
                    ToolTip = 'Specifies the value of the Main Bank field.';
                    ApplicationArea = All;
                }
                field("Main Bank Name"; Rec."Main Bank Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Main Bank Name field.';
                    ApplicationArea = All;

                }
                field("Branch Bank"; Rec."Branch Bank")
                {
                    ToolTip = 'Specifies the value of the Branch Bank field.';
                    ApplicationArea = All;
                }
                field("Branch Bank Name"; Rec."Branch Bank Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Branch Bank Name field.';
                    ApplicationArea = All;
                }

                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = all;
                }



            }
            group(Leave)
            {
                Caption = 'Leave';

                field("Total Leave Taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Leave Taken field.';
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocated Leave Days field.';
                }
                field("Reimbursed Leave Days"; Rec."Reimbursed Leave Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reimbursed Leave Days field.';
                }
                field("Total (Leave Days)"; Rec."Total (Leave Days)")
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the value of the Total (Leave Days) field.';
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = true;
                }
                field("Paid Leave Allowance"; Rec."Paid Leave Allowance")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Paid Leave Allowance field.';
                }


            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Print")
            {
                Caption = 'Print';

                action("Value Change Report")
                {
                    ApplicationArea = all;
                    Caption = 'Value Change Report';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        HRValueChange.Reset;
                        HRValueChange.SetRange(HRValueChange."Employee No", Rec."No.");
                        if HRValueChange.Find('-') then
                            REPORT.Run(39003910, true, true, HRValueChange)
                        else
                            Error('No value changes have been recorded for this employee');
                    end;
                }
            }
            group("&Functions")
            {
                Caption = 'Functions';
                action("Update Payroll Data")
                {
                    Caption = 'Update Payroll Data';
                    Image = PayrollStatistics;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin

                        if Confirm('Update Payroll Data?', true) = false then exit;

                        HREmp.Reset;
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        if HREmp.Find('-') then begin

                            repeat

                            begin
                                //CHECK IF EMPLOYEE IS ALREADY IN THE PAYROLL TABLE
                                //IF HE IS MODIFY INFORMATION TO REFLECT ANY CHANGES MADE
                                prEmployees.Reset;
                                prEmployees.SetRange(prEmployees."No.", HREmp."No.");
                                if prEmployees.Find('-') then begin
                                    prEmployees."First Name" := HREmp."First Name";
                                    prEmployees."Middle Name" := HREmp."Middle Name";
                                    prEmployees."Last Name" := HREmp."Last Name";
                                    prEmployees."Search Name" := HREmp."Search Name";
                                    prEmployees."Postal Address" := HREmp."Postal Address";
                                    prEmployees."Residential Address" := HREmp."Residential Address";
                                    prEmployees."Employee Category" := HREmp."Employee Category";
                                    prEmployees.City := HREmp.City;
                                    prEmployees."Post Code" := HREmp."Post Code";
                                    prEmployees.County := HREmp.County;
                                    prEmployees."Home Phone Number" := HREmp."Home Phone Number";
                                    prEmployees."Work Phone Number" := HREmp."Work Phone Number";
                                    prEmployees."Ext." := HREmp."Ext.";
                                    prEmployees."E-Mail" := HREmp."E-Mail";
                                    prEmployees."ID Number" := HREmp."ID Number";
                                    HREmp.Get(HREmp."No.");
                                    HREmp.CalcFields(HREmp.Picture);
                                    prEmployees.Picture := HREmp.Picture;
                                    prEmployees."Union Code" := HREmp."Union Code";
                                    prEmployees."UIF Number" := HREmp."UIF Number";
                                    prEmployees.Gender := HREmp.Gender;
                                    prEmployees.Status := HREmp.Status;
                                    prEmployees."Resource No." := HREmp."Resource No.";
                                    prEmployees."Last Date Modified" := HREmp."Last Date Modified";
                                    prEmployees."Fax Number" := HREmp."Fax Number";
                                    prEmployees."Company E-Mail" := HREmp."Company E-Mail";
                                    prEmployees.Title := HREmp.Title;
                                    prEmployees."Salespers./Purch. Code" := HREmp."Salespers./Purch. Code";
                                    prEmployees."No. Series" := HREmp."No. Series";
                                    prEmployees."Known As" := HREmp."Known As";
                                    prEmployees."Full / Part Time" := HREmp."Full / Part Time";
                                    prEmployees."Contract End Date" := HREmp."Contract End Date";
                                    prEmployees."Notice Period" := HREmp."Notice Period";
                                    prEmployees."Union Member?" := HREmp."Union Member?";
                                    prEmployees."Shift Worker?" := HREmp."Shift Worker?";
                                    prEmployees."Contracted Hours" := HREmp."Contracted Hours";
                                    prEmployees."Pay Period" := HREmp."Pay Period";
                                    prEmployees."Pay Per Period" := HREmp."Pay Per Period";
                                    prEmployees."Cost Code" := HREmp."Cost Code";
                                    prEmployees."PAYE Number" := HREmp."PAYE Number";
                                    prEmployees."Marital Status" := HREmp."Marital Status";
                                    prEmployees."Ethnic Origin" := HREmp."Ethnic Origin";
                                    prEmployees."First Language (R/W/S)" := HREmp."First Language (R/W/S)";
                                    prEmployees."Vehicle Registration Number" := HREmp."Vehicle Registration Number";
                                    prEmployees.Disabled := HREmp.Disabled;
                                    prEmployees."Health Assesment?" := HREmp."Health Assesment?";
                                    prEmployees."Health Assesment Date" := HREmp."Health Assesment Date";
                                    prEmployees."Date Of Birth" := HREmp."Date Of Birth";
                                    prEmployees.Age := HREmp.Age;
                                    prEmployees."Date Of Join" := HREmp."Date Of Join";
                                    prEmployees."Length Of Service" := HREmp."Length Of Service";
                                    prEmployees."End Of Probation Date" := HREmp."End Of Probation Date";
                                    prEmployees."Branch Bank" := HREmp."Branch Bank";
                                    prEmployees."Main Bank" := HREmp."Main Bank";
                                    prEmployees."Bank Account Number" := HREmp."Bank Account Number";
                                    prEmployees."Per Annum" := HREmp."Per Annum";
                                    prEmployees."Allow Overtime" := HREmp."Allow Overtime";
                                    prEmployees."Medical Scheme No." := HREmp."Medical Scheme No.";
                                    prEmployees."Medical Scheme Head Member" := HREmp."Medical Scheme Head Member";
                                    prEmployees."Number Of Dependants" := HREmp."Number Of Dependants";
                                    prEmployees."Medical Scheme Name" := HREmp."Medical Scheme Name";
                                    prEmployees."Amount Paid By Employee" := HREmp."Amount Paid By Employee";
                                    prEmployees."Amount Paid By Company" := HREmp."Amount Paid By Company";
                                    prEmployees."Second Language (R/W/S)" := HREmp."Second Language (R/W/S)";
                                    prEmployees."Additional Language" := HREmp."Additional Language";
                                    prEmployees."UIF Country" := HREmp."UIF Country";
                                    prEmployees."Primary Skills Category" := HREmp."Primary Skills Category";
                                    prEmployees.Level := HREmp.Level;
                                    prEmployees."Termination Category" := HREmp."Termination Category";
                                    prEmployees."Job Specification" := HREmp."Job Title";
                                    prEmployees."Postal Address2" := HREmp."Postal Address2";
                                    prEmployees."Postal Address3" := HREmp."Postal Address3";
                                    prEmployees."Residential Address2" := HREmp."Residential Address2";
                                    prEmployees."Residential Address3" := HREmp."Residential Address3";
                                    prEmployees."Post Code2" := HREmp."Post Code2";
                                    prEmployees.Citizenship := HREmp.Citizenship;
                                    prEmployees."Name Of Manager" := HREmp."Name Of Manager";
                                    prEmployees."User ID" := HREmp."User ID";
                                    prEmployees."Disabling Details" := HREmp."Disabling Details";
                                    prEmployees."Passport Number" := HREmp."Passport Number";
                                    prEmployees."2nd Skills Category" := HREmp."2nd Skills Category";
                                    prEmployees."3rd Skills Category" := HREmp."3rd Skills Category";
                                    prEmployees.PensionJoin := HREmp.PensionJoin;
                                    prEmployees.Temp := HREmp.Temp;
                                    prEmployees."Contract Location" := HREmp."Contract Location";
                                    prEmployees."First Language Read" := HREmp."First Language Read";
                                    prEmployees."First Language Write" := HREmp."First Language Write";
                                    prEmployees."First Language Speak" := HREmp."First Language Speak";
                                    prEmployees."Second Language Read" := HREmp."Second Language Read";
                                    prEmployees."Second Language Write" := HREmp."Second Language Write";
                                    prEmployees."Second Language Speak" := HREmp."Second Language Speak";
                                    prEmployees."Custom Grading" := HREmp."Custom Grading";
                                    prEmployees."PIN Number" := HREmp."PIN Number";
                                    prEmployees."NSSF No." := HREmp."NSSF No.";
                                    prEmployees."NHIF No." := HREmp."NHIF No.";
                                    prEmployees."Cause of Inactivity Code" := HREmp."Cause of Inactivity Code";
                                    prEmployees."Payroll Code" := HREmp."No.";
                                    prEmployees."HELB No" := HREmp."HELB No";
                                    prEmployees."Co-Operative No" := HREmp."Co-Operative No";
                                    prEmployees."Wedding Anniversary" := HREmp."Wedding Anniversary";
                                    prEmployees."Position To Succeed" := HREmp."Position To Succeed";
                                    prEmployees."Succesion Date" := HREmp."Succesion Date";
                                    prEmployees."Send Alert to" := HREmp."Send Alert to";
                                    prEmployees.Tribe := HREmp.Tribe;
                                    prEmployees.Religion := HREmp.Religion;
                                    prEmployees."Job Title" := HREmp."Job Title";
                                    prEmployees."Posting Group" := HREmp."Posting Group";
                                    prEmployees."Payroll Posting Group" := HREmp."Payroll Posting Group";
                                    prEmployees."Served Notice Period" := HREmp."Served Notice Period";
                                    prEmployees."Exit Interview Date" := HREmp."Exit Interview Date";
                                    prEmployees."Exit Interview Done by" := HREmp."Exit Interview Done by";
                                    prEmployees."Allow Re-Employment In Future" := HREmp."Allow Re-Employment In Future";
                                    prEmployees."Medical Scheme Name #2" := HREmp."Medical Scheme Name #2";
                                    prEmployees."Payroll Departments" := HREmp."Payroll Departments";
                                    prEmployees.Comment := HREmp.Comment;
                                    prEmployees."Competency Area" := HREmp."Competency Area";
                                    prEmployees."Employee Qty" := HREmp."Employee Qty";
                                    prEmployees."Employee Act. Qty" := HREmp."Employee Act. Qty";
                                    prEmployees."Employee Arc. Qty" := HREmp."Employee Arc. Qty";
                                    prEmployees."Payroll Code" := HREmp."No.";
                                    prEmployees.Modify;
                                    prEmployees.Validate("No.");

                                end else begin
                                    prEmployees.Init;
                                    prEmployees."No." := HREmp."No.";
                                    prEmployees."First Name" := HREmp."First Name";
                                    prEmployees."Middle Name" := HREmp."Middle Name";
                                    prEmployees."Last Name" := HREmp."Last Name";
                                    prEmployees."Search Name" := HREmp."Search Name";
                                    prEmployees."Postal Address" := HREmp."Postal Address";
                                    prEmployees."Residential Address" := HREmp."Residential Address";
                                    prEmployees."Employee Category" := HREmp."Employee Category";
                                    prEmployees.City := HREmp.City;
                                    prEmployees."Post Code" := HREmp."Post Code";
                                    prEmployees.County := HREmp.County;
                                    prEmployees."Home Phone Number" := HREmp."Home Phone Number";
                                    prEmployees."Work Phone Number" := HREmp."Work Phone Number";
                                    prEmployees."Ext." := HREmp."Ext.";
                                    prEmployees."E-Mail" := HREmp."E-Mail";
                                    prEmployees."ID Number" := HREmp."ID Number";
                                    prEmployees.Picture := HREmp.Picture;
                                    prEmployees."Union Code" := HREmp."Union Code";
                                    prEmployees."UIF Number" := HREmp."UIF Number";
                                    prEmployees.Gender := HREmp.Gender;
                                    prEmployees.Status := HREmp.Status;
                                    prEmployees."Resource No." := HREmp."Resource No.";
                                    prEmployees."Last Date Modified" := HREmp."Last Date Modified";
                                    prEmployees."Fax Number" := HREmp."Fax Number";
                                    prEmployees."Company E-Mail" := HREmp."Company E-Mail";
                                    prEmployees.Title := HREmp.Title;
                                    prEmployees."Salespers./Purch. Code" := HREmp."Salespers./Purch. Code";
                                    prEmployees."No. Series" := HREmp."No. Series";
                                    prEmployees."Known As" := HREmp."Known As";
                                    prEmployees."Full / Part Time" := HREmp."Full / Part Time";
                                    prEmployees."Contract End Date" := HREmp."Contract End Date";
                                    prEmployees."Notice Period" := HREmp."Notice Period";
                                    prEmployees."Union Member?" := HREmp."Union Member?";
                                    prEmployees."Shift Worker?" := HREmp."Shift Worker?";
                                    prEmployees."Contracted Hours" := HREmp."Contracted Hours";
                                    prEmployees."Pay Period" := HREmp."Pay Period";
                                    prEmployees."Pay Per Period" := HREmp."Pay Per Period";
                                    prEmployees."Cost Code" := HREmp."Cost Code";
                                    prEmployees."PAYE Number" := HREmp."PAYE Number";
                                    prEmployees."Marital Status" := HREmp."Marital Status";
                                    prEmployees."Ethnic Origin" := HREmp."Ethnic Origin";
                                    prEmployees."First Language (R/W/S)" := HREmp."First Language (R/W/S)";
                                    prEmployees."Vehicle Registration Number" := HREmp."Vehicle Registration Number";
                                    prEmployees.Disabled := HREmp.Disabled;
                                    prEmployees."Health Assesment?" := HREmp."Health Assesment?";
                                    prEmployees."Health Assesment Date" := HREmp."Health Assesment Date";
                                    prEmployees."Date Of Birth" := HREmp."Date Of Birth";
                                    prEmployees.Age := HREmp.Age;
                                    prEmployees."Date Of Join" := HREmp."Date Of Join";
                                    prEmployees."Length Of Service" := HREmp."Length Of Service";
                                    prEmployees."End Of Probation Date" := HREmp."End Of Probation Date";
                                    prEmployees."Per Annum" := HREmp."Per Annum";
                                    prEmployees."Allow Overtime" := HREmp."Allow Overtime";
                                    prEmployees."Medical Scheme No." := HREmp."Medical Scheme No.";
                                    prEmployees."Medical Scheme Head Member" := HREmp."Medical Scheme Head Member";
                                    prEmployees."Number Of Dependants" := HREmp."Number Of Dependants";
                                    prEmployees."Medical Scheme Name" := HREmp."Medical Scheme Name";
                                    prEmployees."Amount Paid By Employee" := HREmp."Amount Paid By Employee";
                                    prEmployees."Amount Paid By Company" := HREmp."Amount Paid By Company";
                                    prEmployees."Second Language (R/W/S)" := HREmp."Second Language (R/W/S)";
                                    prEmployees."Additional Language" := HREmp."Additional Language";
                                    prEmployees."UIF Country" := HREmp."UIF Country";
                                    prEmployees."Primary Skills Category" := HREmp."Primary Skills Category";
                                    prEmployees.Level := HREmp.Level;
                                    prEmployees."Termination Category" := HREmp."Termination Category";
                                    prEmployees."Job Specification" := HREmp."Job Title";
                                    prEmployees."Postal Address2" := HREmp."Postal Address2";
                                    prEmployees."Postal Address3" := HREmp."Postal Address3";
                                    prEmployees."Residential Address2" := HREmp."Residential Address2";
                                    prEmployees."Residential Address3" := HREmp."Residential Address3";
                                    prEmployees."Post Code2" := HREmp."Post Code2";
                                    prEmployees.Citizenship := HREmp.Citizenship;
                                    prEmployees."Name Of Manager" := HREmp."Name Of Manager";
                                    prEmployees."User ID" := HREmp."User ID";
                                    prEmployees."Disabling Details" := HREmp."Disabling Details";
                                    prEmployees."Passport Number" := HREmp."Passport Number";
                                    prEmployees."2nd Skills Category" := HREmp."2nd Skills Category";
                                    prEmployees."3rd Skills Category" := HREmp."3rd Skills Category";
                                    prEmployees.PensionJoin := HREmp.PensionJoin;
                                    prEmployees.Temp := HREmp.Temp;
                                    prEmployees."Contract Location" := HREmp."Contract Location";
                                    prEmployees."First Language Read" := HREmp."First Language Read";
                                    prEmployees."First Language Write" := HREmp."First Language Write";
                                    prEmployees."First Language Speak" := HREmp."First Language Speak";
                                    prEmployees."Second Language Read" := HREmp."Second Language Read";
                                    prEmployees."Second Language Write" := HREmp."Second Language Write";
                                    prEmployees."Second Language Speak" := HREmp."Second Language Speak";
                                    prEmployees."Custom Grading" := HREmp."Custom Grading";
                                    prEmployees."PIN Number" := HREmp."PIN Number";
                                    prEmployees."NSSF No." := HREmp."NSSF No.";
                                    prEmployees."NHIF No." := HREmp."NHIF No.";
                                    prEmployees."Cause of Inactivity Code" := HREmp."Cause of Inactivity Code";
                                    prEmployees."Payroll Code" := HREmp."PAYROLL NO";
                                    //prEmployees."HELB No":=HREmp."HELB No";
                                    prEmployees."Co-Operative No" := HREmp."Co-Operative No";
                                    prEmployees."Wedding Anniversary" := HREmp."Wedding Anniversary";
                                    prEmployees."Position To Succeed" := HREmp."Position To Succeed";
                                    prEmployees."Succesion Date" := HREmp."Succesion Date";
                                    prEmployees."Send Alert to" := HREmp."Send Alert to";
                                    prEmployees.Tribe := HREmp.Tribe;
                                    prEmployees.Religion := HREmp.Religion;
                                    prEmployees."Job Title" := HREmp."Job Title";
                                    prEmployees."Posting Group" := HREmp."Posting Group";
                                    prEmployees."Payroll Posting Group" := HREmp."Payroll Posting Group";
                                    prEmployees."Served Notice Period" := HREmp."Served Notice Period";
                                    prEmployees."Exit Interview Date" := HREmp."Exit Interview Date";
                                    prEmployees."Exit Interview Done by" := HREmp."Exit Interview Done by";
                                    prEmployees."Allow Re-Employment In Future" := HREmp."Allow Re-Employment In Future";
                                    prEmployees."Medical Scheme Name #2" := HREmp."Medical Scheme Name #2";
                                    prEmployees."Payroll Departments" := HREmp."Payroll Departments";
                                    prEmployees.Comment := HREmp.Comment;
                                    prEmployees."Competency Area" := HREmp."Competency Area";
                                    prEmployees."Employee Qty" := HREmp."Employee Qty";
                                    prEmployees."Employee Act. Qty" := HREmp."Employee Act. Qty";
                                    prEmployees."Employee Arc. Qty" := HREmp."Employee Arc. Qty";
                                    prEmployees."Payroll Code" := HREmp."No.";
                                    prEmployees.Insert;
                                    prEmployees.Validate("No.");

                                    prPayrollType.Reset;
                                    prPayrollType.SetRange(prPayrollType."Payroll Code", HREmp."No.");
                                    if prPayrollType.Find('-') then begin
                                        prPayrollType."Payroll Code" := HREmp."No.";
                                        prPayrollType."Payroll Name" := HREmp."First Name" + '' + HREmp."Middle Name" + '' + HREmp."Last Name";
                                        prPayrollType.Modify;
                                    end else begin
                                        prPayrollType.Init;
                                        prPayrollType."Payroll Code" := HREmp."No.";
                                        prPayrollType."Payroll Name" := HREmp."First Name" + '' + HREmp."Middle Name" + '' + HREmp."Last Name";
                                        prPayrollType.Insert;
                                    end;


                                end;

                            end;
                            until HREmp.Next = 0;
                        end;

                        Message('Payroll data Successfully Updated.');
                    end;
                }
            }
            group("&Employee")
            {
                Caption = 'Employee';
                action("Employee Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Summary';
                    Image = SuggestGrid;
                    Promoted = true;
                    PromotedCategory = process;



                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        if HREmp.Find('-') then begin
                            REPORT.Run(Report::"Employee Details Summary", true, true, HREmp);
                        end;
                    end;
                }
                action("Upload Attachments")
                {
                    ApplicationArea = all;
                    Caption = 'Upload Attachments';
                    Image = Attachments;
                    Visible = false;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HRM- Emp. Attachments (B)";
                    RunPageLink = "Employee No" = FIELD("No.");
                }
                action("File Attachment")
                {
                    ApplicationArea = All;
                    Caption = 'Edms';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        DMS.Reset;
                        DMS.SetRange("Document Type", DMS."Document Type"::"Staff File");
                        if DMS.Find('-') then begin
                            Hyperlink(DMS."url path" + Rec."No.");
                        end else
                            Message('No Link ' + format(DMS."Document Type"::"Staff File"));
                    end;

                }
                action(SelfAssesment)
                {
                    ApplicationArea = all;
                    Caption = 'Self Assesment';
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    //todo   RunObject = Page "HRm-Self Assesment";
                    //todo  RunPageLink = "Emp. No" = FIELD("No.");
                }
                action("Next of Kin")
                {
                    ApplicationArea = all;
                    Caption = 'Next of Kin';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HRM-Employees Kin";
                    RunPageLink = "Employee Code" = FIELD("No."),
                                  Type = FILTER("Next of Kin");
                    RunPageView = WHERE(Type = FILTER("Next of Kin"));
                }
                action(Beneficiaries)
                {
                    ApplicationArea = all;
                    Caption = 'Beneficiaries';
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HRM-Emp. Beneficiary";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    RunPageView = WHERE(Type = FILTER(Beneficiary));
                }
                action(Dependants)
                {
                    ApplicationArea = all;
                    Caption = 'Dependants';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HRM-Employees Dependants";
                    RunPageLink = "Employee Code" = FIELD("No."),
                                  Type = FILTER(Dependant);
                    RunPageView = WHERE(Type = FILTER(Dependant));
                }
                action(Qualifications)
                {
                    ApplicationArea = all;
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HRM-Emp. Qualifications (B)";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Employment History")
                {
                    ApplicationArea = all;
                    Caption = 'Employment History';
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HRM-Employment History (B)";
                    RunPageLink = "No." = FIELD("No.");
                }
                action("Proffessional Membership")
                {
                    ApplicationArea = all;
                    Caption = 'Proffessional Membership';
                    Image = Group;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HRM-Proffessional Membership";
                    RunPageLink = "Employee Code" = FIELD("No.");
                }
                action("Training History")
                {
                    ApplicationArea = all;
                    Caption = 'Training History';
                    Image = Certificate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    RunObject = Page "HRM-Training History";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Employee Responsibilities")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Responsibilities';
                    Image = ResourcePlanning;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    RunObject = Page "HRM-Job Responsiblities (B)";
                    RunPageLink = "Job ID" = FIELD("Job Title");
                }
                action("Misc. Articles Overview")
                {
                    ApplicationArea = all;
                    Caption = 'Misc. Articles Overview';
                    Image = ViewSourceDocumentLine;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Misc. Articles Overview";
                }
                action("&Confidential Information")
                {
                    ApplicationArea = all;
                    Caption = '&Confidential Information';
                    Image = SNInfo;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Co&nfidential Info. Overview")
                {
                    ApplicationArea = all;
                    Caption = 'Co&nfidential Info. Overview';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Confidential Info. Overview";
                }
                action("A&bsences")
                {
                    ApplicationArea = all;
                    Caption = 'A&bsences';
                    Image = AbsenceCalendar;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = all;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(5200),
                                  "No." = FIELD("No.");
                }
                action("Employee Picture")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Picture';
                    Image = Picture;
                    RunObject = Page "HRM-Emp. Picture";
                }
                action("Hiring Details")
                {
                    ApplicationArea = all;
                    Caption = 'Hiring Details';
                    Image = Answers;
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Page "HRM-Job Interview";
                    RunPageLink = "Applicant No" = FIELD("Job Application No");
                    Visible = false;
                }
                action("Employee Disciplinary Cases")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Disciplinary Cases';
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HRM-Disciplinary Cases List";
                    RunPageLink = "Accused Employee" = FIELD("No.");
                }
                action("Committe Membership")
                {
                    ApplicationArea = all;
                    Caption = 'Committe Membership';
                    Image = Calls;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HRM-Commitee Membership";
                    RunPageLink = "Member No." = FIELD("No.");
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DAge := '';
        DService := '';
        DPension := '';
        DMedical := '';

        if Rec."Contract End Date" = 0D then
            RetirementDur := 'Contract or retirement end Date Not specified!'
        else
            RetirementDur := Dates.DetermineAge(Today, Rec."Contract End Date");
        RetirementDur := Dates.DetermineAge(Today, Rec."Retirement date");

        //Recalculate Important Dates
        if (Rec."Date Of Leaving" = 0D) then begin
            if (Rec."Date Of Birth" <> 0D) then
                DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
            if (Rec."Date Of Join" <> 0D) then
                DService := Dates.DetermineAge(Rec."Date Of Join", Today);
            if (Rec."Pension Scheme Join" <> 0D) then
                DPension := Dates.DetermineAge(Rec."Pension Scheme Join", Today);
            if (Rec."Medical Scheme Join" <> 0D) then
                DMedical := Dates.DetermineAge(Rec."Medical Scheme Join", Today);
            //MODIFY;
        end else begin
            if (Rec."Date Of Birth" <> 0D) then
                DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
            if (Rec."Date Of Join" <> 0D) then
                DService := Dates.DetermineAge(Rec."Date Of Join", Rec."Date Of Leaving");
            if (Rec."Pension Scheme Join" <> 0D) then
                DPension := Dates.DetermineAge(Rec."Pension Scheme Join", Rec."Date Of Leaving");
            if (Rec."Medical Scheme Join" <> 0D) then
                DMedical := Dates.DetermineAge(Rec."Medical Scheme Join", Rec."Date Of Leaving");
            //MODIFY;
        end;
    end;

    trigger OnInit()
    begin
        "Disability GradeEditable" := true;
        "Disabling DetailsEditable" := true;
        HrEmp.Age := DAge;
    end;

    trigger OnClosePage()
    begin
        HrEmp.Age := DAge;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        HrEmp.Age := DAge;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        //RESET;
        "gOpt Active" := "gOpt Active"::All;
        //MESSAGE('All employee information must be completed.')
    end;

    trigger OnOpenPage()
    begin
        "gOpt Active" := "gOpt Active"::Active;
        Rec.SetCurrentKey("Termination Category");
        "Filter Employees"(0);
        DAge := '';
        DService := '';
        DPension := '';
        DMedical := '';
        RetirementDur := '';


        if Rec."Contract End Date" = 0D then
            RetirementDur := 'Contract or retirement end Date Not specified!'
        else
            RetirementDur := Dates.DetermineAge(Today, Rec."Contract End Date");
        RetirementDur := Dates.DetermineAge(Today, Rec."Retirement date");
        //Recalculate Important Dates
        if (Rec."Date Of Leaving" = 0D) then begin
            if (Rec."Date Of Birth" <> 0D) then
                DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
            if (Rec."Date Of Join" <> 0D) then
                DService := Dates.DetermineAge(Rec."Date Of Join", Today);
            if (Rec."Pension Scheme Join" <> 0D) then
                DPension := Dates.DetermineAge(Rec."Pension Scheme Join", Today);
            if (Rec."Medical Scheme Join" <> 0D) then
                DMedical := Dates.DetermineAge(Rec."Medical Scheme Join", Today);

            //MODIFY;
        end else begin
            if (Rec."Date Of Birth" <> 0D) then
                DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
            if (Rec."Date Of Join" <> 0D) then
                DService := Dates.DetermineAge(Rec."Date Of Join", Rec."Date Of Leaving");
            if (Rec."Pension Scheme Join" <> 0D) then
                DPension := Dates.DetermineAge(Rec."Pension Scheme Join", Rec."Date Of Leaving");
            if (Rec."Medical Scheme Join" <> 0D) then
                DMedical := Dates.DetermineAge(Rec."Medical Scheme Join", Rec."Date Of Leaving");
            //MODIFY;
        end;
    end;

    var
        edms: page EDMS;
        PictureExists: Boolean;
        //CheckList: Codeunit "HR CheckList";
        ACheckListTable: Record "HRM-Induction Schedule";
        SICNumbersTable: Record "HRM-Appraisal Evaluation Areas";
        //SICNumbersList: Codeunit "HR SIC Numbers";
        Dates: Codeunit "HR Dates";
        "gOpt Active": Option Active,Archive,All;
        D: Date;
        DAge: Text[100];
        DMS: RECORD EDMS;
        DService: Text[100];
        DPension: Text[100];
        DMedical: Text[100];
        [InDataSet]
        "Disabling DetailsEditable": Boolean;
        [InDataSet]
        "Disability GradeEditable": Boolean;
        Text19004462: Label 'Union Worker?';
        Text19012299: Label 'Per Week';
        FrmCalendar: Page "GEN--Calendar Small";
        "FORM HR Employee": Page "HRM-Employee-List";
        HREmp: Record "HRM-Employee C";
        RetirementDur: Text[250];
        DoclLink: Record "HRM-Employee Attachments";
        "Filter": Boolean;
        prEmployees: Record "HRM-Employee C";
        prPayrollType: Record "PRL-Payroll Type";
        Mail: Codeunit Mail;
        SupervisorNames: Text[30];
        HRValueChange: Record "HRM-Value Change";
        Dretirement: Text;
        DRetire: Text;

    /// <summary>
    /// Filter Employees.
    /// </summary>
    /// <param name="Type">Option Active,Archive,All.</param>
    procedure "Filter Employees"(Type: Option Active,Archive,All)
    begin
        if Type = Type::Active then begin
            Rec.Reset;
            Rec.SetFilter("Termination Category", '=%1', Rec."Termination Category"::" ");
        end
        else
            if Type = Type::Archive then begin
                Rec.Reset;
                Rec.SetFilter("Termination Category", '<>%1', Rec."Termination Category"::" ");
            end
            else
                if Type = Type::All then
                    Rec.Reset;

        CurrPage.Update(false);
        Rec.FilterGroup(20);
    end;

    local procedure ActivegOptActiveOnPush()
    begin
        "Filter Employees"(0); //Active Employees
    end;

    local procedure ArchivegOptActiveOnPush()
    begin
        "Filter Employees"(1); //Archived Employees
    end;

    local procedure AllgOptActiveOnPush()
    begin
        "Filter Employees"(2); //  Show All Employees
    end;

    local procedure ActivegOptActiveOnValidate()
    begin
        ActivegOptActiveOnPush;
    end;

    local procedure ArchivegOptActiveOnValidate()
    begin
        ArchivegOptActiveOnPush;
    end;

    local procedure AllgOptActiveOnValidate()
    begin
        AllgOptActiveOnPush;
    end;
}

