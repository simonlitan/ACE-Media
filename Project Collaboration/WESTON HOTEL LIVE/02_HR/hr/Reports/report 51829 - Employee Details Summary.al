report 51829 "Employee Details Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './hr/Reports/SSR/Employee Details Summary.rdl';

    dataset
    {
        dataitem(DataItem1000000001; "HRM-Employee C")
        {
            RequestFilterFields = "No.";
            column(logo; info.Picture)
            {
            }
            column(JobTitle_DataItem1000000001; "Job Title")
            {
            }
            column(DAge; DAge)
            {

            }
            column(RetirementDur; RetirementDur)
            {

            }
            column(CoName; info.Name)
            {
            }
            column(CoAddress; info.Address)
            {
            }
            column(CoCity; info.City)
            {
            }
            column(CoPhone; info."Phone No.")
            {
            }
            column(CoEmail; info."E-Mail")
            {
            }
            column(HomePage; info."Home Page")
            {
            }
            column(Pf_No; "No.")
            {
            }
            column(Picture_DataItem1000000001; Picture)
            {
            }
            column(Title; Title)
            {
            }
            column(FName; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {
            }
            column(EmpTelephone; "Cellular Phone Number")
            {
            }
            column(Status; Status)
            {
            }
            column(IdNo; "ID Number")
            {
            }
            column(Gender; Gender)
            {
            }
            column(Tribe; Tribe)
            {
            }
            column(Disabled; Disabled)
            {
            }
            column(DOB; "Date Of Birth")
            {
            }
            column(DOJ; "Date Of Join")
            {
            }
            column(EmpAge; Age)
            {
            }
            column(LOS; "Length Of Service")
            {
            }
            column(Telephone; "Home Phone Number")
            {
            }
            column(Cell; "Cellular Phone Number")
            {
            }
            column(Extension; "Ext.")
            {
            }
            column(Address; "Postal Address")
            {
            }
            column(Email; "E-Mail")
            {
            }
            column(EMail2; "Company E-Mail")
            {
            }
            column(Department; "Department Code")
            {
            }
            column(Section; "project Code")
            {
            }
            column(PIN; "PIN Number")
            {
            }
            column(NSSF; "NSSF No.")
            {
            }
            column(NHIF; "NHIF No.")
            {
            }
            column(HELB; "HELB No")
            {
            }
            column(CooperateNo; "Co-Operative No")
            {
            }
            column(PayrollNo; "PAYROLL NO")
            {
            }
            dataitem(NxtOfKin; "HRM-Employee Kin")
            {
                DataItemLink = "Employee Code" = FIELD("No.");
                // DataItemTableView = WHERE(Type = FILTER("Next of Kin"));
                //PrintOnlyIfDetail = false;
                column(shownextofkin; shownextofkin)
                {
                }
                column(KinRelationship; NxtOfKin.Relationship)
                {
                }
                column(KinSurName; NxtOfKin.SurName)
                {
                }
                column(KinOtherNames; NxtOfKin."Other Names")
                {
                }
                column(KinId; NxtOfKin."ID No/Passport No")
                {
                }
                column(KinPhone; NxtOfKin."Home Tel No")
                {
                }

                /* trigger OnAfterGetRecord()
                begin
                    shownextofkin := TRUE;
                    IF NxtOfKin.Relationship = '' THEN shownextofkin := FALSE;
                end; */
            }
            dataitem(Beneficiaries; "HRM-Employee Beneficiaries")
            {
                DataItemLink = "Employee Code" = FIELD("No.");
                column(showBeneficiery; showBeneficiery)
                {
                }
                column(BenRelationship; Beneficiaries.Relationship)
                {
                }
                column(BenSurname; Beneficiaries.SurName)
                {
                }
                column(BenOtherNames; Beneficiaries."Other Names")
                {
                }
                column(BenID; Beneficiaries."ID No/Passport No")
                {
                }
                column(BenPhone; Beneficiaries."Home Tel No")
                {
                }

                /*  trigger OnAfterGetRecord()
                 begin
                     showBeneficiery := TRUE;
                     IF Beneficiaries.Relationship = '' THEN showBeneficiery := FALSE;
                 end; */
            }
            dataitem(Dependants; "HRM-Employee Kin")
            {
                DataItemLink = "Employee Code" = FIELD("No.");
                //DataItemTableView = WHERE(Type = FILTER(Dependant));
                column(showDependants; showDependants)
                {
                }
                column(DependantsRela; Dependants.Relationship)
                {
                }
                column(DependantsSurname; Dependants.SurName)
                {
                }
                column(DependantsOtherNames; Dependants."Other Names")
                {
                }
                column(DependantsID; Dependants."ID No/Passport No")
                {
                }
                column(DependantsPhone; Dependants."Home Tel No")
                {
                }

                /* trigger OnAfterGetRecord()
                begin
                    showDependants := TRUE;
                    IF Dependants.Relationship = '' THEN showDependants := FALSE;
                end; */
            }
            dataitem("HRM-Emp. Qualifications Final"; "HRM-Emp. Qualifications Final")
            {
                DataItemLink = "Employee No." = field("No.");
                column(Qualification_HRMEmpQualificationsFinal; Qualification)
                {
                }
                column(Type_HRMEmpQualificationsFinal; "Type")
                {
                }
                column(FromDate_HRMEmpQualificationsFinal; "From Date")
                {
                }
                column(ToDate_HRMEmpQualificationsFinal; "To Date")
                {
                }
                column(Description_HRMEmpQualificationsFinal; Description)
                {
                }
                column(Institution_HRMEmpQualificationsFinal; Institution)
                {
                }
                column(InstitutionName_HRMEmpQualificationsFinal; "Institution Name")
                {
                }
                column(HighestQualification_HRMEmpQualificationsFinal; "Highest Qualification")
                {
                }
            }
            dataitem(EmploymentHistory; "HRM-Employment History")
            {
                DataItemLink = "Employee No." = FIELD("No.");
                column(showEmployHist; showEmployHist)
                {
                }
                column(EmpHistCompany; EmploymentHistory."Company Name")
                {
                }
                column(EmpHistFrom; EmploymentHistory.From)
                {
                }
                column(EmpHistTo; EmploymentHistory."To Date")
                {
                }
                column(EmpHistTitle; EmploymentHistory."Job Title")
                {
                }
                column(EmpHistSalary; EmploymentHistory."Salary On Leaving")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    showEmployHist := TRUE;
                    IF EmploymentHistory."Company Name" = '' THEN showEmployHist := FALSE;
                end;
            }
            dataitem(ProfMembership; "HRM-Proffessional Membership")
            {
                DataItemLink = "Employee Code" = FIELD("No.");
                column(showProfMemberShip; showProfMemberShip)
                {
                }
                column(MembershipNo; ProfMembership."Membership No")
                {
                }
                column(MembershipNameOfBody; ProfMembership."Name of Body")
                {
                }
                column(MembershipDate; ProfMembership."Date of Membership")
                {
                }
                column(MembershipStatus; ProfMembership."Membership Status")
                {
                }
                column(MembershipRemarks; ProfMembership.Remarks)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    showProfMemberShip := TRUE;
                    IF ProfMembership."Membership No" = '' THEN showProfMemberShip := FALSE;
                end;
            }
            dataitem(TrainingHistory; "HRM-Training Applications")
            {
                DataItemLink = "Employee No." = FIELD("No.");
                column(showTrainHist; showTrainHist)
                {
                }
                column(TrainAppcationNo; TrainingHistory."Application No")
                {
                }
                column(TrainCourseTitle; TrainingHistory."Course Title")
                {
                }
                column(TrainFromDate; TrainingHistory."From Date")
                {
                }
                column(TrainToDate; TrainingHistory."To Date")
                {
                }
                /* column(TrainingDuration; TrainingHistory.Durations)
                {
                } */

                trigger OnAfterGetRecord()
                begin
                    showTrainHist := TRUE;
                    IF TrainingHistory."Application No" = '' THEN showTrainHist := FALSE;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                seq := seq + 1;

            end;

        }
    }



    trigger OnInitReport()
    begin
        IF info.GET() THEN BEGIN
            info.CALCFIELDS(info.Picture);
            DataItem1000000001.CalcFields(Picture);
            "gOpt Active" := "gOpt Active"::Active;

            DAge := '';
            DService := '';
            DPension := '';
            DMedical := '';
            RetirementDur := '';


            if HREmp."Contract End Date" = 0D then
                RetirementDur := 'Contract or retirement end Date Not specified!'
            else
                RetirementDur := Dates.DetermineAge(Today, HREmp."Contract End Date");
            RetirementDur := Dates.DetermineAge(Today, HREmp."Retirement date");
            //Recalculate Important Dates
            if (HREmp."Date Of Leaving" = 0D) then begin
                if (HREmp."Date Of Birth" <> 0D) then
                    DAge := Dates.DetermineAge(HREmp."Date Of Birth", Today);
                if (HREmp."Date Of Join" <> 0D) then
                    DService := Dates.DetermineAge(HREmp."Date Of Join", Today);
                if (HREmp."Pension Scheme Join" <> 0D) then
                    DPension := Dates.DetermineAge(HREmp."Pension Scheme Join", Today);
                if (HREmp."Medical Scheme Join" <> 0D) then
                    DMedical := Dates.DetermineAge(HREmp."Medical Scheme Join", Today);

                //MODIFY;
            end else begin
                if (HREmp."Date Of Birth" <> 0D) then
                    DAge := Dates.DetermineAge(HREmp."Date Of Birth", Today);
                if (HREmp."Date Of Join" <> 0D) then
                    DService := Dates.DetermineAge(HREmp."Date Of Join", HREmp."Date Of Leaving");
                if (HREmp."Pension Scheme Join" <> 0D) then
                    DPension := Dates.DetermineAge(HREmp."Pension Scheme Join", HREmp."Date Of Leaving");
                if (HREmp."Medical Scheme Join" <> 0D) then
                    DMedical := Dates.DetermineAge(HREmp."Medical Scheme Join", HREmp."Date Of Leaving");
                //MODIFY;
            end;

        END;
    end;

    var
        info: Record "Company Information";
        seq: Integer;
        shownextofkin: Boolean;
        showBeneficiery: Boolean;
        showDependants: Boolean;
        showQualif: Boolean;
        showEmployHist: Boolean;
        showProfMemberShip: Boolean;
        showTrainHist: Boolean;
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
}

