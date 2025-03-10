report 51117 "Staff Appraisal"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Appraisal/Reports/SSR/Appraisal/SSR/Staff Appraisal.rdl';

    dataset
    {
        dataitem(DataItem1; "Appraisal Card")
        {
            column(StaffName_AppraisalCard; "Staff Name")
            {
            }
            column(AppraisalCode_AppraisalCard; "Appraisal Code")
            {
            }
            column(StaffNo_AppraisalCard; "Staff No")
            {
            }
            column(AppraisalType_AppraisalCard; "Appraisal Type")
            {
            }
            column(AppraisalPeriod_AppraisalCard; "Appraisal Period")
            {
            }
            column(DateOfFirstAppointment_AppraisalCard; "Position Held Since")
            {
            }
            column(NoofChildren_AppraisalCard; "No.of Children")
            {
            }
            column(CurrentDivision_AppraisalCard; "Current Division")
            {
            }
            column(CurrentDepartment_AppraisalCard; "Current Department")
            {
            }
            column(PresentDesignation_AppraisalCard; "Job Title")
            {
            }
            column(WorkRewarding_AppraisalCard; "Work Rewarding")
            {
            }
            column(Text1_AppraisalCard; Text1)
            {
            }
            // column(Text2_AppraisalCard;.Text2)
            // {
            // }
            column(Text3_AppraisalCard; Text3)
            {
            }
            column(Text4_AppraisalCard; Text4)
            {
            }
            column(Text5_AppraisalCard; Text5)
            {
            }
            column(Text6_AppraisalCard; Text6)
            {
            }
            column(Text7_AppraisalCard; Text7)
            {
            }
            column(Text8_AppraisalCard; Text8)
            {
            }
            column(Text9_AppraisalCard; Text9)
            {
            }
            column(Text10_AppraisalCard; Text10)
            {
            }
            column(Text11_AppraisalCard; Text11)
            {
            }
            column(DesignationatFirstAppoint_AppraisalCard; "Designation at First Appoint")
            {
            }
            column(DateofLastpromotion_AppraisalCard; "Date of Last promotion")
            {
            }
            column(CI_Picture; CI.Picture)
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
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(Text12_AppraisalCard; Text12)
            {
            }
            column(DateOfBirth_AppraisalCard; "Date Of Birth")
            {
            }
            dataitem(DataItem34; "Appraisal Objective")
            {
                DataItemLink = "Appraisal Code" = FIELD("Appraisal Code");
                column(CriteriaDescription_AppraisalObjective; "Criteria Description")
                {
                }
                column(SupervisorComments_AppraisalObjective; "HOD  Comments")
                {
                }
                column(AppraiseeComments_AppraisalObjective; "Appraisee Comments")
                {
                }
                column(PerformanceIndicatorDescript_AppraisalObjective; "Performance Indicator Descript")
                {
                }
                // column(Ratings_AppraisalObjective;"Ratings)
                // {
                // }
            }

            trigger OnAfterGetRecord()
            begin
                HrEmp.RESET;
                HrEmp.SETRANGE(HrEmp."No.", "Staff No");
                IF HrEmp.FIND('-') THEN
                    "Staff Name" := HrEmp."First Name" + ' ' + ' ' + HrEmp."Middle Name" + ' ' + ' ' + HrEmp."Last Name";
                "Current Department" := HrEmp."Department Name";
                ;
                Grade := HrEmp.Grade;
                "Job Title" := HrEmp."Job Specification";
                "Email Address" := HrEmp."Company E-Mail";

                //HrEmp.RESET;
                HrEmp.SETRANGE(HrEmp."No.", Supervisor);
                IF HrEmp.FIND('-') THEN
                    "Supervisor Name" := HrEmp."First Name" + ' ' + ' ' + HrEmp."Middle Name" + ' ' + ' ' + HrEmp."Last Name";
                "Supervisor Email" := HrEmp."Company E-Mail";
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CI.RESET;
        CI.GET();
        CI.CALCFIELDS(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        HrEmp: Record "HRM-Employee C";
        HrGoalOb: Record "Appraisal Objective";
        COUNTED: Integer;
        TotalRatingAgreedPoint: Decimal;
        TotalRatingAgreedPercentage: Decimal;
        TotalRatingEmpPoint: Decimal;
        TotalRatingEmpPercentage: Decimal;
        TotalRatingValAssessAgreedPoint: Decimal;
        TotalRatingAgreedValAssessPercentage: Decimal;
        TotalRatingEmpValAssessPercentage: Decimal;
        GrandTotalEmp: Decimal;
        GrandTotalAgreed: Decimal;
}

