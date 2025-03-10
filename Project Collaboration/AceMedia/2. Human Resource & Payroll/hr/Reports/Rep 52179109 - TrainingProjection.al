report 52179109 "Training Projection"
{
    Caption = 'Training Projection';
    DefaultLayout = RDLC;
    RDLCLayout = './HR/Reports/SSR/TrainingProjection.rdl';
    dataset
    {
        dataitem(HRMTrainingProjectionHeader; "HRM-Training Projection Header")
        {
            column(Document_No; "Document No")
            {

            }
            column(Employee_No; "Employee No")
            {

            }
            column(Employee_Name; "Employee Name")
            {

            }
            column(Logo; CompInfo.Picture)
            {

            }
            column(CompName; CompInfo.Name)
            {

            }
            column(Supervisor_No; "Supervisor No")
            {

            }
            column(Supervisor_Name; "Supervisor Name")
            {

            }
            dataitem("Training and Development"; "Training and Development")
            {
                DataItemLink = "Ref. No." = field("Document No");
                column(Training_Identification; "Training Identification")
                {

                }
                column(Last_Training_Attended; "Last Training Attended")
                {

                }

                column(Project_Types; "Project Types")
                {

                }
                column(Type_of_Training; "Type of Training")
                {

                }
                column(Name_of_Training; "Name of Training")
                {

                }
                column(Start_Date; "Start Date")
                {

                }
                column(End_Date; "End Date")
                {

                }
                column(Venue; Venue)
                {

                }
                column(Full_Board; "Full Board")
                {

                }
                column(Full_Board_Amount; "Full Board Amount")
                {

                }
                column(Tution; Tution)
                {

                }
                column(DSA; DSA)
                {

                }
                column(Logistics; Logistics)
                {

                }
                column(Cost; Cost)
                {

                }
                column(Relevance_of_Training; "Relevance of Training")
                {

                }

            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }

    }
    trigger OnPreReport()

    begin
        CompInfo.Get;
        CompInfo.CalcFields(Picture)

    end;

    var
        CompInfo: Record "Company Information";
}
