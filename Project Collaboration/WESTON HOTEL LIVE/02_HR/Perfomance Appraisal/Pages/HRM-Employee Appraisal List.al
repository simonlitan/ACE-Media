page 50019 "HRM-Employee Appraisal List"
{
    CardPageID = "HRM-Employee (B)";
    DeleteAllowed = true;
    Editable = false;
    PageType = List;
    SourceTable = "HRM-Employee C";
    PromotedActionCategories = 'New,Process,Functions,Reports,Action,General Information';

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

                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ToolTip = 'Specifies the value of the Supervisor field.';
                    ApplicationArea = All;
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
            group(Appraisals)
            {
                Caption = 'Appraisals';
                action(AppraisalT)
                {
                    Caption = 'Appraisal Targets';
                    ApplicationArea = All;
                    Image = ApplicationWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Employee Perf AppraisalsL";
                    RunPageLink = "Employee No" = field("No.");
                }
                action(AppraisalM)
                {
                    Caption = 'Mid Year Review';
                    ApplicationArea = All;
                    Image = ApplicationWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Employee MidYR Appraisal";
                    RunPageLink = "Employee No" = field("No.");
                }
                action(AppraisalE)
                {
                    Caption = ' End Year Review';
                    ApplicationArea = All;
                    Image = ApplicationWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Employee EndYR Appraisal";
                    RunPageLink = "Employee No" = field("No.");
                }
                action(AppraisalJ)
                {
                    Caption = 'Joint Review';
                    ApplicationArea = All;
                    Image = ApplicationWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Employee Joint Appraisal";
                    RunPageLink = "Employee No" = field("No.");
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
        //Mail: Codeunit Mail;
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