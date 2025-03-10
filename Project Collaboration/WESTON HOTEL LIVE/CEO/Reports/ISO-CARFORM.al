report 52178867 "Car form"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './CEO/Reports/SSR/ISO-CARFORM.rdl';


    dataset
    {
        dataitem("ISO-CarFormTable"; "ISO-CarFormTable")
        {
            DataItemTableView = SORTING("Form No");
            RequestFilterFields = "Form No";

            column(CompPic; info.Picture)
            {
            }
            column(companyName; info.Name)
            {
            }
            column(companyAddress; info."Address 2")
            {
            }
            column(Organization; Organization)
            {

            }
            // column(CompInfoPicture; CompInfo.Picture)
            // {
            // }

            column("Car_No"; "Car No")
            {

            }
            column(AUDIT_DATE; "AUDIT DATE")
            {

            }
            column(AUDIT_NO; "AUDIT NO.")
            {

            }

            column("Area_under_review"; "Area under review")
            {

            }
            column("ISO_9001_CLAUSE"; "ISO 9001 CLAUSE")
            {

            }



            column(Requirement; Requirement)
            {

            }
            column("Non_conformity_evidence"; "Non conformity evidence")
            {

            }
            column(Auditor; Auditor1)
            {

            }
            column(Auditee; Auditee1)
            {

            }
            column(Minor; Minor)
            {

            }
            column(Major; Major)
            {

            }
            column(Root_cause; "Root cause")
            {

            }
            column(Correction; "Correction")
            {

            }
            column(Corrective_action; "Corrective action")
            {

            }
            column(Auditee2; Auditee2)
            {

            }
            column(Auditor2; Auditor2)
            {

            }
            column(Date_of_completion; "Date of completion")
            {

            }
            column(Fully_completed; "Fully completed")
            {

            }
            column(Partially_completed; "Partially completed")
            {

            }
            column(No_action_taken; "No action taken")
            {

            }
            column(Details1; Details1)
            {

            }
            column(Auditor3; Auditor3)
            {

            }
            column(Auditee3; Auditee3)
            {

            }
            column(Effectiveness; Effectiveness)
            {

            }
            column(Details2; Details2)
            {

            }
            column(Auditor4; Auditor4)
            {

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
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }
    trigger OnInitReport()
    begin
        info.reset;
        if info.get() then
            info.CalcFields(Picture);

    end;

    var
        myInt: Integer;
        Info: Record "Company Information";
}