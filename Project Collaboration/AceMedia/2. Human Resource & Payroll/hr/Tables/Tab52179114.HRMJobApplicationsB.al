table 52179114 "HRM-Job Applications (B)"
{




    fields
    {
        field(1; "Application No"; Code[10])
        {
        }
        field(2; "First Name"; Text[100])
        {
        }
        field(3; "Middle Name"; Text[50])
        {
        }
        field(4; "Last Name"; Text[50])
        {

            trigger OnValidate()
            var
                Reason: Text[30];
            begin
            end;
        }
        field(5; Initials; Text[15])
        {
        }
        field(6; "P.W.D"; Text[250])
        {

        }
        field(7; "Search Name"; Code[50])
        {
        }
        field(8; "Postal Address"; Text[80])
        {
        }
        field(9; "Residential Address"; Text[80])
        {
        }
        field(10; City; Text[30])
        {
        }
        field(11; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(12; County; code[100])
        {
            tablerelation = Counties.code;
        }
        field(13; "Home Phone Number"; Text[30])
        {
        }
        field(14; "Cell Phone Number"; Text[30])
        {
        }
        field(15; "Work Phone Number"; Text[30])
        {
        }
        field(16; "Ext."; Text[7])
        {
        }
        field(17; "E-Mail"; Text[80])
        {
        }
        field(18; Picture; BLOB)
        {
            SubType = Bitmap;
        }
        field(19; "ID Number"; Text[30])
        {
            Caption = 'ID/Passport Number';
            trigger OnValidate()
            begin
                HRJobApp.Reset;
                HRJobApp.SetRange(HRJobApp."ID Number", "ID Number");
                if HRJobApp.Find('-') then begin
                    Error('This ID Number has been used in a prior Job Application.');
                end;
            end;
        }
        field(20; Gender; Option)
        {
            OptionMembers = Male,Female;
        }
        field(21; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(22; Status; Option)
        {
            OptionMembers = New,Submitted,Processing,"Not Successful",Successful;
        }
        field(23; Comment; Boolean)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(24; "Fax Number"; Text[30])
        {
        }
        field(25; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
        }
        field(26; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;
        }
        field(27; "First Language (R/W/S)"; Code[10])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = FILTER(Language));
        }
        field(28; "Driving Licence"; Code[10])
        {
        }
        field(29; Disabled; Option)
        {
            OptionMembers = " ",No,Yes;
        }
        field(30; "Health Assesment?"; Boolean)
        {
        }
        field(31; "Health Assesment Date"; Date)
        {
        }
        field(32; "Date Of Birth"; Date)
        {

            trigger OnValidate()
            begin
                if "Date Of Birth" >= Today then begin
                    Error('Date of Birth cannot be after %1', Today);
                end;
                if ("Date Of Birth" <> 0D) then
                    Age := Dates.DetermineAge("Date Of Birth", Today);
            end;
        }
        field(33; Age; Text[80])
        {
            Editable = false;
        }
        field(34; "Second Language (R/W/S)"; Code[10])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = FILTER(Language));
        }
        field(35; "Additional Language"; Code[10])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = FILTER(Language));
        }
        field(36; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(37; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";
        }
        field(38; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
            end;
        }
        field(39; "Postal Address2"; Text[30])
        {
        }
        field(40; "Postal Address3"; Text[20])
        {
        }
        field(41; "Residential Address2"; Text[30])
        {
        }
        field(42; "Residential Address3"; Text[20])
        {
        }
        field(43; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(44; Citizenship; Code[10])
        {
            TableRelation = "Country/Region".Code;

            trigger OnValidate()
            begin
                Country.Reset;
                Country.SetRange(Country.Code, Citizenship);
                if Country.Find('-') then begin
                    "Citizenship Details" := Country.Name;
                end;
            end;
        }
        field(45; "Disabling Details"; Text[250])
        {
            Caption = 'Disability Type';
        }
        field(46; "Disability Grade"; Text[30])
        {
        }
        field(47; "Passport Number"; Text[30])
        {
        }
        field(48; "2nd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(49; "3rd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(50; Region; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(51; "First Language Read"; Boolean)
        {
        }
        field(52; "First Language Write"; Boolean)
        {
        }
        field(53; "First Language Speak"; Boolean)
        {
        }
        field(54; "Second Language Read"; Boolean)
        {
        }
        field(55; "Second Language Write"; Boolean)
        {
        }
        field(56; "Second Language Speak"; Boolean)
        {
        }
        field(57; "PIN Number"; Code[20])
        {
        }
        field(58; "Job Applied For"; code[30])
        {
            Editable = false;
            TableRelation = "HRM-Jobs"."Job ID";
            trigger OnValidate()
            begin

                Jobs.Reset;
                Jobs.SetRange(Jobs."Job ID", "Job Applied For");
                if Jobs.Find('-') then
                    "Job Applied for Description" := Jobs."Job title";
            end;
        }
        field(59; "Employee Requisition No"; Code[20])
        {
            TableRelation = "HRM-Employee Requisitions"."Requisition No." WHERE(Closed = CONST(false),
                                                                                 Status = CONST(Approved));

            trigger OnValidate()
            begin

                HREmpReq.Reset;
                HREmpReq.SetRange(HREmpReq."Requisition No.", "Employee Requisition No");
                if HREmpReq.Find('-') then
                    "Job Applied For" := HREmpReq."Job ID";
                "Job Applied for Description" := HREmpReq."Job title";
            end;
        }
        field(60; "Total Score"; Decimal)
        {
            CalcFormula = Sum("HRM-Job Applic.- Appt. Res".Score WHERE("Applicant No" = FIELD("Application No")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(61; Shortlist; Boolean)
        {
        }
        field(62; Qualified; Boolean)
        {

        }
        field(63; Stage; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(64; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(65; "Employee No"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                //COPY EMPLOYEE DETAILS FROM EMPLOYEE TABLE
                Employee.Reset;
                if Employee.Get("Employee No") then begin
                    "First Name" := Employee."First Name";
                    "Middle Name" := Employee."Middle Name";
                    "Last Name" := Employee."Last Name";
                    "Search Name" := Employee."Search Name";
                    "Postal Address" := Employee."Postal Address";
                    "Residential Address" := Employee."Residential Address";
                    City := Employee.City;
                    "Post Code" := Employee."Post Code";
                    County := Employee.County;
                    "Home Phone Number" := Employee."Home Phone Number";
                    "Cell Phone Number" := Employee."Cellular Phone Number";
                    "Work Phone Number" := Employee."Work Phone Number";
                    "Ext." := Employee."Ext.";
                    "E-Mail" := Employee."E-Mail";
                    "ID Number" := Employee."ID Number";
                    Gender := Employee.Gender;
                    "Country Code" := Employee.Citizenship;
                    "Fax Number" := Employee."Fax Number";
                    "Marital Status" := Employee."Marital Status";
                    "Ethnic Origin" := Employee."Ethnic Origin";
                    "First Language (R/W/S)" := Employee."First Language (R/W/S)";
                    //"Driving Licence":=Employee."Has Driving Licence";
                    Disabled := Employee.Disabled;
                    "Health Assesment?" := Employee."Health Assesment?";
                    "Health Assesment Date" := Employee."Health Assesment Date";
                    "Date Of Birth" := Employee."Date Of Birth";
                    Age := Employee.Age;
                    "Second Language (R/W/S)" := Employee."Second Language (R/W/S)";
                    "Additional Language" := Employee."Additional Language";
                    "Postal Address2" := Employee."Postal Address";
                    "Postal Address3" := Employee."Post Code";
                    "Residential Address2" := Employee."Residential Address";
                    //"Residential Address3":=Employee."Residential Address 3";
                    "Post Code2" := Employee."Post Code";
                    Citizenship := Employee.Citizenship;
                    "Passport Number" := Employee."Passport Number";
                    "First Language Read" := Employee."First Language Read";
                    "First Language Write" := Employee."First Language Write";
                    "First Language Speak" := Employee."First Language Speak";
                    "Second Language Read" := Employee."Second Language Read";
                    "Second Language Write" := Employee."Second Language Write";
                    "Second Language Speak" := Employee."Second Language Speak";
                    "PIN Number" := Employee."PIN Number";

                    "Applicant Type" := "Applicant Type"::Internal;
                    Modify;

                    //DELETE QUALIFICATIONS PREVIOUSLY COPIED
                    AppQualifications.Reset;
                    AppQualifications.SetRange(AppQualifications."Application No", "Application No");
                    if AppQualifications.Find('-') then
                        AppQualifications.DeleteAll;

                    //GET EMPL0YEE QUALIFICATIONS
                    EmpQualifications.Reset;
                    EmpQualifications.SetRange(EmpQualifications."Employee No.", Employee."No.");
                    if EmpQualifications.Find('-') then
                        EmpQualifications.FindFirst;
                    begin
                        AppQualifications.Reset;

                        repeat
                            AppQualifications.Init;
                            AppQualifications."Application No" := "Application No";
                            AppQualifications."Employee No." := "Employee No";
                            AppQualifications."Qualification Type" := EmpQualifications."Qualification Type";
                            AppQualifications."Qualification Code" := EmpQualifications."Qualification Code";
                            AppQualifications."Qualification Description" := EmpQualifications."Qualification Description";
                            AppQualifications."From Date" := EmpQualifications."From Date";
                            AppQualifications."To Date" := EmpQualifications."To Date";
                            AppQualifications.Type := EmpQualifications.Type;
                            AppQualifications."Institution/Company" := EmpQualifications."Institution/Company";
                            AppQualifications.Insert();

                        until EmpQualifications.Next = 0;
                    end
                end;



            end;
        }
        field(66; "Applicant Type"; Option)
        {

            OptionCaption = 'External,Internal';
            OptionMembers = External,Internal;
        }
        field(67; "Interview Invitation Sent"; Boolean)
        {
            Editable = false;
        }
        field(68; "Date Applied"; Date)
        {
        }
        field(69; "Citizenship Details"; Text[60])
        {
        }
        field(70; "Date of Interview"; Date)
        {
        }
        field(71; "From Time"; Time)
        {
        }
        field(72; "To Time"; Time)
        {
        }
        field(73; Venue; Text[30])
        {
        }
        field(74; "Interview Type"; Option)
        {
            OptionCaption = 'Writen,Practicals,Oral,Oral&Written';
            OptionMembers = Writen,Practicals,Oral,"Oral&Written";
        }
        field(75; Select; Boolean)
        {
        }
        field(76; "Job Applied for Description"; Text[250])
        {
        }
        field(77; "Selection Count"; Integer)
        {
            CalcFormula = Count("HRM-Applicants Shortlist" WHERE("Job Application No" = FIELD("Application No")));
            FieldClass = FlowField;
        }
        field(78; "Marked For Interview(Stage1)"; Boolean)
        {
        }
        field(79; "Marked For Interview(Stage2)"; Boolean)
        {
        }
        field(80; "Qualified To Hire"; Boolean)
        {
        }
        field(81; "Room No"; Text[30])
        {
        }
        field(82; Floor; Text[30])
        {
        }
        field(83; "CV Path"; Text[30])
        {
        }
        field(84; "Cover Letter Path"; Text[30])
        {
        }
        field(85; Submitted; Text[30])
        {
        }
        field(86; Tribe; code[100])
        {
            tablerelation = tribes."Tribe Code";
        }
        field(87; "Current Workplace"; text[250])
        {

        }
        field(88; "Current Position"; text[250])
        {

        }
        field(89; Experience; Text[2048])
        {

        }
        field(90; Expertise; Text[2048])
        {

        }
        field(91; Qualified2; Option)
        {
            OptionMembers = " ",No,Yes;
        }

    }

    keys
    {
        key(Key1; "Application No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Application No" = '' then begin
            HRSetup.Reset;
            if HRSetup.Find('-') then begin
                HRSetup.TestField(HRSetup."Job Application Nos");
                NoSeriesMgt.InitSeries(HRSetup."Job Application Nos", xRec."No. Series", 0D, "Application No", "No. Series");
            end;
        end;

        "Date Applied" := Today;
    end;

    var
        HREmpReq: Record "HRM-Employee Requisitions";
        Employee: Record "HRM-Employee C";
        HRSetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmpQualifications: Record "HRM-Employee Qualifications";
        AppQualifications: Record "HRM-Applicant Qualifications";
        AppRefferees: Record "HRM-Applicant Referees";
        AppHobbies: Record "HRM-Applicant Hobbies";
        HRJobApp: Record "HRM-Job Applications (B)";
        Country: Record "Country/Region";
        Jobs: Record "HRM-Jobs";
        Dates: Codeunit "HR Dates";

    procedure FullName(): Text[100]
    begin
        if "Middle Name" = '' then
            exit("First Name" + ' ' + "Last Name")
        else
            exit("First Name" + ' ' + "Middle Name" + ' ' + "Last Name");
    end;
}

