/// <summary>
/// Page HRM-Employee List (ID 68167).
/// </summary>
page 52179131 "HRM-Employee List"
{
    CardPageID = "HRM-Employee (B)";
    PromotedActionCategories = 'New,Process,Report,Attachments, ,Other Info,';
    DeleteAllowed = true;
    Editable = false;
    PageType = List;
    SourceTable = "HRM-Employee C";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
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
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
                {
                   ApplicationArea = all;  
                }
                field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
                {
                     ApplicationArea = all;
                }
                field("Department Code";Rec."Department Code")
                {
                    ApplicationArea = all;

                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }


                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
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
                Caption = '&Print';

                action("All Employees")
                {
                    ApplicationArea = all;
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = report "All employees list";
                }
                action("Master Payroll")
                {
                    ApplicationArea = all;
                    image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = report "Payroll Summary 3";
                }



                action(Addresses)
                {
                    ApplicationArea = all;
                    Caption = 'Addresses';
                    Image = PrintReport;
                    Promoted = true;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    PromotedCategory = Report;

                    trigger OnAction()
                    begin
                        HREmp.RESET;
                        HREmp.SETRANGE(HREmp."No.", Rec."No.");
                        IF HREmp.FIND('-') THEN
                            REPORT.RUN(Report::"Employee - Addresses", TRUE, TRUE, HREmp);


                    end;
                }
                action("Alt. Addresses")
                {

                    Caption = 'Alt. Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        /*HREmp.RESET;
                        HREmp.SETRANGE(HREmp."No.","No.");
                        IF HREmp.FIND('-') THEN
                        REPORT.RUN(5213,TRUE,TRUE,HREmp);  */

                    end;
                }
                action("Phone Nos")
                {

                    Caption = 'Phone Nos';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        /*HREmp.RESET;
                        HREmp.SETRANGE(HREmp."No.","No.");
                        IF HREmp.FIND('-') THEN
                        REPORT.RUN(5210,TRUE,TRUE,HREmp); */

                    end;
                }

            }

            group("&Employee")
            {
                Caption = '&Employee';
                action("Employee Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Summary';
                    Image = SuggestGrid;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Report;

                    trigger OnAction()
                    begin
                        if HREmp.Get(Rec."No.") then begin
                            REPORT.Run(Report::"Employee Details Summary", true, true, HREmp);
                        end;
                    end;
                }
                action("Employee rec")
                {
                    ApplicationArea = all;
                    RunObject = page "Employee Rec";
                }
                action("Upload Attachments")
                {
                    ApplicationArea = all;
                    Caption = 'Upload Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Category6;

                }
                action("Next of Kin")
                {
                    ApplicationArea = All;
                    Caption = 'Next of Kin';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Employees Kin";
                    RunPageLink = "Employee Code" = FIELD("No."), Type = FILTER("Next of Kin");
                    RunPageView = WHERE(Type = FILTER("Next of Kin"));
                }
                action(Beneficiaries)
                {
                    ApplicationArea = All;
                    Caption = 'Beneficiaries';
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Emp. Beneficiary";
                    RunPageLink = "Employee Code" = FIELD("No."), Type = FILTER(Beneficiary);
                    RunPageView = WHERE(Type = FILTER(Beneficiary));
                }
                action(Dependants)
                {
                    ApplicationArea = All;
                    Caption = 'Dependants';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Employees Dependants";
                    RunPageLink = "Employee Code" = FIELD("No."), Type = FILTER(Dependant);
                    RunPageView = WHERE(Type = FILTER(Dependant));
                }
                action(Qualifications)
                {
                    ApplicationArea = All;
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Emp. Qualifications (B)";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Employment History")
                {
                    ApplicationArea = All;
                    Caption = 'Employment History';
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Employment History (B)";
                    RunPageLink = "Employee No. Filter" = FIELD("No.");
                }
                action("Proffessional Membership")
                {
                    ApplicationArea = all;
                    Caption = 'Proffessional Membership';
                    Image = Group;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Proffessional Membership";
                    RunPageLink = "Employee Code" = FIELD("No.");
                }
                action("Training History")
                {
                    ApplicationArea = all;
                    Caption = 'Training History';
                    Image = Certificate;
                    Promoted = true;
                    PromotedCategory = Category6;
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
                    PromotedCategory = Category6;
                    PromotedIsBig = false;
                    RunObject = Page "HRM-Job Responsiblities (B)";
                    RunPageLink = "Job ID" = FIELD("Job Title");
                }
                action("Assign Clearance Items")
                {
                    ApplicationArea = all;
                    Caption = 'Assign Clearance Items';
                    Image = ExternalDocument;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = FIELD("No.");
                    Visible = false;
                }
                action("View Clearance Details")
                {
                    ApplicationArea = all;
                    Caption = 'View Clearance Details';
                    Image = ExternalDocument;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Asset Return Form";
                    RunPageLink = "Employee No." = FIELD("No.");
                    Visible = false;
                }
                action("Misc. Articles Overview")
                {
                    ApplicationArea = All;
                    Caption = 'Misc. Articles Overview';
                    Image = ViewSourceDocumentLine;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Misc. Articles Overview";
                }
                action("&Confidential Information")
                {
                    ApplicationArea = All;
                    Caption = '&Confidential Information';
                    Image = SNInfo;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Co&nfidential Info. Overview")
                {
                    ApplicationArea = All;
                    Caption = 'Co&nfidential Info. Overview';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Confidential Info. Overview";
                }
                action("A&bsences")
                {
                    ApplicationArea = All;
                    Caption = 'A&bsences';
                    Image = AbsenceCalendar;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = All;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(5200),
                                  "No." = FIELD("No.");
                }

                action("Hiring Details")
                {
                    Caption = 'Hiring Details';
                    Image = Answers;
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Page "HRM-Job Interview";
                    RunPageLink = "Applicant No" = FIELD("Job Application No");
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Employee Disciplinary Cases")
                {
                    Caption = 'Employee Disciplinary Cases';
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Disciplinary Cases List";
                    RunPageLink = "Accused Employee" = FIELD("No.");
                    ApplicationArea = All;
                }
                action("Committe Membership")
                {
                    ApplicationArea = All;
                    Caption = 'Committe Membership';
                    Image = Calls;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Commitee Membership";
                    RunPageLink = "Member No." = FIELD("No.");
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        /* IF (DepCode <> '') THEN
            Rec.SETFILTER("Department Code", ' = %1', DepCode);
        IF (OfficeCode <> '') THEN
            Rec.SETFILTER(Office, ' = %1', OfficeCode); */

        USetup.RESET;
        USetup.SETRANGE(USetup."User ID", USERID);
        USetup.SETRANGE(USetup."Create Employee", false);
        IF USetup.FIND('-') THEN ERROR('You are not authorised');


    end;

    var
        USetup: record "User Setup";
        PictureExists: Boolean;
        //CheckList: Codeunit "HR CheckList";
        ACheckListTable: Record "HRM-Induction Schedule";

        //SICNumbersList: Codeunit "HR SIC Numbers";
        Dates: Codeunit "HR Dates";
        "gOpt Active": Option Active,Archive,All;
        D: Date;
        DAge: Text[100];
        DService: Text[100];
        DPension: Text[100];
        DMedical: Text[100];
        [InDataSet]
        "Disabling DetailsEditable": Boolean;
        [InDataSet]
        "Disability GradeEditable": Boolean;

        "FORM HR Employee": Page "HRM-Employee-List";
        HREmp: Record "HRM-Employee C";
        RetirementDur: Text[250];

        "Filter": Boolean;
        prEmployees: Record "HRM-Employee C";
        prPayrollType: Record "PRL-Payroll Type";
        //Mail: Codeunit Mail;
        SupervisorNames: Text[30];

        Dretirement: Text;
        DRetire: Text;
        Text19004462: Label 'Union Worker?';
        Text19012299: Label 'Per Week';

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

