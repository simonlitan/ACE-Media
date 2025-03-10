report 51118 "Staff Confirm Appraisal"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Appraisal/SSR/Staff Confirm Appraisal.rdl';

    dataset
    {
        dataitem(DataItem1; "Appraisal Card Confirmation")
        {
            column(Text1_AppraisalCardConfirmation; Text1)
            {
            }
            column(Text2_AppraisalCardConfirmation; Text2)
            {
            }
            column(Text3_AppraisalCardConfirmation; Text3)
            {
            }
            column(Text4_AppraisalCardConfirmation; Text4)
            {
            }
            column(Text5_AppraisalCardConfirmation; Text5)
            {
            }
            column(Text6_AppraisalCardConfirmation; Text6)
            {
            }
            column(Text7_AppraisalCardConfirmation; Text7)
            {
            }
            column(Text8_AppraisalCardConfirmation; Text8)
            {
            }
            column(Text9_AppraisalCardConfirmation; Text9)
            {
            }
            column(Text10_AppraisalCardConfirmation; Text10)
            {
            }
            column(Text11_AppraisalCardConfirmation; Text11)
            {
            }
            column(SupervisorID_AppraisalCardConfirmation; "Supervisor ID")
            {
            }
            column(Text12_AppraisalCardConfirmation; Text12)
            {
            }
            column(Text13_AppraisalCardConfirmation; Text13)
            {
            }
            column(NoSeries_AppraisalCardConfirmation; "No. Series")
            {
            }
            column(CommentsbyHR_AppraisalCardConfirmation; "Comments by HR")
            {
            }
            column(ApprovalbyVCDVC_AppraisalCardConfirmation; "Approval by VC/DVC")
            {
            }
            column(Defferedfor_AppraisalCardConfirmation; "Deffered for")
            {
            }
            column(VCDVCAction_AppraisalCardConfirmation; "VC/DVC Action")
            {
            }
            column(VCDVCComments_AppraisalCardConfirmation; "VC/DVC Comments")
            {
            }
            column(Grade_AppraisalCardConfirmation; Grade)
            {
            }
            column(PositionHeldSince_AppraisalCardConfirmation; "Position Held Since")
            {
            }
            column(StaffName_AppraisalCardConfirmation; "Staff Name")
            {
            }
            column(AppraisalCode_AppraisalCardConfirmation; "Appraisal Code")
            {
            }
            column(StaffNo_AppraisalCardConfirmation; "Staff No")
            {
            }
            column(AppraisalType_AppraisalCardConfirmation; "Appraisal Type")
            {
            }
            column(AppraisalPeriod_AppraisalCardConfirmation; "Appraisal Period")
            {
            }
            column(PromotionRecommended_AppraisalCardConfirmation; "Promotion Recommended")
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
}

