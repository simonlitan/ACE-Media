/// <summary>
/// Report HR Job Applications (ID 51169).
/// </summary>
report 52179170 "HR Job Applications"
{
    DefaultLayout = RDLC;
    RDLCLayout = './HR/Reports/SSR/HR Job Applications.rdl';

    dataset
    {
        dataitem(Jobapplications; "HRM-Job Applications (B)")
        {
            RequestFilterFields = "Employee Requisition No", "Job Applied For";
            column(EmployeeRequisitionNo_Jobapplications; "Employee Requisition No")
            {
            }
            column(CurrentPosition_Jobapplications; "Current Position")
            {
            }
            column(CurrentWorkplace_Jobapplications; "Current Workplace")
            {
            }
            column(DisabilityGrade_Jobapplications; "Disability Grade")
            {
            }
            column(DateApplied_Jobapplications; "Date Applied")
            {
            }
            column(Expertise_Jobapplications; Expertise)
            {
            }
            column(Experience_Jobapplications; Experience)
            {
            }
            column(Qualified2_Jobapplications; Qualified2)
            {
            }
            column(Status_Jobapplications; Status)
            {
            }

            column(Age_Jobapplications; Age)
            {
            }
            column(ApplicantType_Jobapplications; "Applicant Type")
            {
            }
            column(ApplicationNo_Jobapplications; "Application No")
            {
            }
            column(Comment_Jobapplications; Comment)
            {
            }
            column(Citizenship_Jobapplications; Citizenship)
            {
            }
            column(CitizenshipDetails_Jobapplications; "Citizenship Details")
            {
            }
            column(CVPath_Jobapplications; "CV Path")
            {
            }
            column(Disabled_Jobapplications; Disabled)
            {
            }

            column(DisablingDetails_Jobapplications; "Disabling Details")
            {
            }
            column(EmployeeNo_Jobapplications; "Employee No")
            {
            }
            column(MaritalStatus_Jobapplications; "Marital Status")
            {
            }
            column(PINNumber_Jobapplications; "PIN Number")
            {
            }
            column(PWD_Jobapplications; "P.W.D")
            {
            }
            column(Region_Jobapplications; Region)
            {
            }
            column(Tribe_Jobapplications; Tribe)
            {
            }
            column(FirstName_HRJobApplications; "First Name")
            {
                IncludeCaption = true;
            }
            column(MiddleName_HRJobApplications; "Middle Name")
            {
                IncludeCaption = true;
            }
            column(LastName_HRJobApplications; "Last Name")
            {
                IncludeCaption = true;
            }
            column(JobAppliedFor_HRJobApplications; "Job Applied For")
            {
                IncludeCaption = true;
            }
            column(JobAppliedforDescription_HRJobApplications; "Job Applied for Description")
            {
            }
            column(City_HRJobApplications; City)
            {
                IncludeCaption = true;
            }
            column(PostCode_HRJobApplications; "Post Code")
            {
                IncludeCaption = true;
            }
            column(IDNumber_HRJobApplications; "ID Number")
            {
                IncludeCaption = true;
            }
            column(Gender_HRJobApplications; Gender)
            {
                IncludeCaption = true;
            }
            column(County_HRMJobApplicationsB; County)
            {
            }
            column(DateOfBirth_HRMJobApplicationsB; "Date Of Birth")
            {
            }
            column(EthnicOrigin_HRMJobApplicationsB; "Ethnic Origin")
            {
            }
            column(CountryCode_HRJobApplications; "Country Code")
            {
                IncludeCaption = true;
            }
            column(HomePhoneNumber_HRJobApplications; "Home Phone Number")
            {
                IncludeCaption = true;
            }
            column(CellPhoneNumber_HRJobApplications; "Cell Phone Number")
            {
                IncludeCaption = true;
            }
            column(WorkPhoneNumber_HRJobApplications; "Work Phone Number")
            {
                IncludeCaption = true;
            }
            column(EMail_HRJobApplications; "E-Mail")
            {
                IncludeCaption = true;
            }
            column(PostalAddress_HRJobApplications; "Postal Address")
            {
                IncludeCaption = true;
            }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(CI_EMail; CI."E-Mail")
            {
                IncludeCaption = true;
            }
            column(CI_HomePage; CI."Home Page")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(seq; seq)
            {

            }
            column(Qualification; Qualification)
            {

            }

            dataitem("HRM-Applicant Qualifications"; "HRM-Applicant Qualifications")
            {
                RequestFilterFields = "Qualification Type";
                DataItemLink = "Application No" = field("Application No");
                column(Description_HRMApplicantQualifications; Description)
                {
                }
                column(ExpirationDate_HRMApplicantQualifications; "Expiration Date")
                {
                }
                column(FromDate_HRMApplicantQualifications; "From Date")
                {
                }
                column(QualificationCode_HRMApplicantQualifications; "Qualification Code")
                {
                }
                column(QualificationDescription_HRMApplicantQualifications; "Qualification Description")
                {
                }
                column(EmployeeStatus_HRMApplicantQualifications; "Employee Status")
                {
                }
                column(ToDate_HRMApplicantQualifications; "To Date")
                {
                }
                column(QualificationType_HRMApplicantQualifications; "Qualification Type")
                {
                }
                column(ApplicationNo_HRJobApplications; "Application No")
                {
                    IncludeCaption = true;
                }
                column(seq1; seq1)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    seq1 := seq1 + 1;

                end;

            }
            trigger OnAfterGetRecord()
            begin
                seq := seq + 1;

            end;
        }




    }


    requestpage
    {

        layout
        {
            area(Content)
            {


            }
        }

        actions
        {
        }
    }

    labels
    {
    }
    trigger OnInitReport()
    begin

    end;


    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(CI.Picture);
        Clear(seq);


        //GET FILTER

        //    MESSAGE('Please select a Job Requisition No  Number before printing a report');
        //    CurrReport.QUIT;

    end;

    var
        age: text[100];
        seq1: Integer;
        seq: Integer;
        Qualification: code[30];
        CI: Record "Company Information";
        qualifications: record "HRM-Applicant Qualifications";
        SectionA: Label 'Section A :: Personal Details';
        SectionB: Label 'Section B :: Contact Details';
        SectionC: Label 'Section C :: Academic and Qualification Information';
        SectionD: Label 'Section D :: Applicant''s Refferees';
        JobApplicationName: Text;
        Jobapplication: record "HRM-Job Applications (B)";
        applications: Record "HRM-Job Applications (B)";
}

