page 52178563 "HRM-WorkStudy List"
{
    CardPageID = "HRM-Employee (B)";
    DeleteAllowed = true;
    Editable = false;
    PageType = List;
    SourceTable = "Casual Requisition";
   // SourceTableView = WHERE("Posting Group" = CONST('CASUAL'));

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
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = all;
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = all;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = all;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = all;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = all;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = all;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
                }
                field(DateOfBirth; Rec.DateOfBirth)
                {
                    ApplicationArea = all;
                }
                field(DateEngaged; Rec.DateEngaged)
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
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
                action("Personal Information File")
                {
                    ApplicationArea = all;
                    Caption = 'Personal Information File';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        /*HREmp.RESET;
                        HREmp.SETRANGE(HREmp."No.","No.");
                        IF HREmp.FIND('-') THEN
                        REPORT.RUN(39005489,TRUE,TRUE,HREmp);
                          */

                    end;
                }
                action("Misc. Article Info")
                {
                    ApplicationArea = all;
                    Caption = 'Misc. Article Info';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        /*Misc.RESET;
                        Misc.SETRANGE(Misc."Employee No.","No.");
                        IF Misc.FIND('-') THEN
                        REPORT.RUN(5202,TRUE,TRUE,Misc);*/

                    end;
                }
                action("Confidential Info")
                {
                    ApplicationArea = all;
                    Caption = 'Confidential Info';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        /*Conf.RESET;
                        Conf.SETRANGE(Conf."Employee No.","No.");
                        IF Conf.FIND('-') THEN
                        REPORT.RUN(5203,TRUE,TRUE,Conf);
                        */

                    end;
                }
                action(Label)
                {
                    ApplicationArea = all;
                    Caption = 'Label';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        /*HREmp.RESET;
                        HREmp.SETRANGE(HREmp."No.","No.");
                        IF HREmp.FIND('-') THEN
                        REPORT.RUN(5200,TRUE,TRUE,HREmp);
                        */

                    end;
                }
                action(Addresses)
                {
                    ApplicationArea = all;
                    Caption = 'Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        /*HREmp.RESET;
                        HREmp.SETRANGE(HREmp."No.","No.");
                        IF HREmp.FIND('-') THEN
                        REPORT.RUN(5207,TRUE,TRUE,HREmp);
                                    */

                    end;
                }
                action("Alt. Addresses")
                {
                    ApplicationArea = all;
                    Caption = 'Alt. Addresses';
                    Image = PrintReport;
                    Promoted = false;
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
                    ApplicationArea = all;
                    Caption = 'Phone Nos';
                    Image = PrintReport;
                    Promoted = false;
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
                action("Value Change Report")
                {
                    ApplicationArea = all;
                    Caption = 'Value Change Report';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;

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
            // group("&Functions")
            // {
            //     Caption = '&Functions';
                
            // }
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

                    trigger OnAction()
                    begin
                        if HREmp.Get(Rec."No.") then begin
                            REPORT.Run(51829, true, true, HREmp);
                        end;
                    end;
                }
                action("Upload Attachments")
                {
                    ApplicationArea = all;
                    Caption = 'Upload Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM- Emp. Attachments (B)";
                    RunPageLink = "Employee No" = FIELD("No.");
                }
                action("Next of Kin")
                {
                    ApplicationArea = all;
                    Caption = 'Next of Kin';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category6;
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
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Emp. Beneficiary";
                    RunPageLink = "Employee Code" = FIELD("No."),
                                  Type = FILTER(Beneficiary);
                    RunPageView = WHERE(Type = FILTER(Beneficiary));
                }
                action(Dependants)
                {
                    ApplicationArea = all;
                    Caption = 'Dependants';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category6;
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
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Emp. Qualifications (B)";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Employment History")
                {
                    Caption = 'Employment History';
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Employment History (B)";
                    RunPageLink = "Employee No. Filter" = FIELD("No.");
                    ApplicationArea = All;
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
                    //RunPageLink = "Job ID" = FIELD("Job Title");
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
                }
                action("Misc. Articles Overview")
                {
                    ApplicationArea = all;
                    Caption = 'Misc. Articles Overview';
                    Image = ViewSourceDocumentLine;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Misc. Articles Overview";
                }
                action("&Confidential Information")
                {
                    ApplicationArea = all;
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
                    ApplicationArea = all;
                    Caption = 'Co&nfidential Info. Overview';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Confidential Info. Overview";
                }
                action("A&bsences")
                {
                    ApplicationArea = all;
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
                    ApplicationArea = all;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
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
                    //RunPageLink = "Applicant No" = FIELD("Job Application No");
                    Visible = false;
                }
                action("Employee Disciplinary Cases")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Disciplinary Cases';
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Disciplinary Cases List";
                    RunPageLink = "Accused Employee" = FIELD("No.");
                }
                action("Committe Membership")
                {
                    ApplicationArea = all;
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

    var
        PictureExists: Boolean;
        //CheckList: Codeunit "HR CheckList";
        ACheckListTable: Record "HRM-Induction Schedule";
        SICNumbersTable: Record "HRM-Appraisal Evaluation Areas";
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
        Text19004462: Label 'Union Worker?';
        Text19012299: Label 'Per Week';

    procedure "Filter Employees"(Type: Option Active,Archive,All)
    begin
        if Type = Type::Active then begin
            Rec.Reset;
           // Rec.SetFilter("Termination Category", '=%1', Rec."Termination Category"::" ");
        end
        else
            if Type = Type::Archive then begin
                Rec.Reset;
               // Rec.SetFilter("Termination Category", '<>%1', Rec."Termination Category"::" ");
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

