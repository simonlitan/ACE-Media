page 50221 "PayChange Advice Role Centre"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {

        }
    }

    actions
    {

        area(sections)
        {
            group(PerformanceContracts)

            {
                Caption = 'Perfomance Contract Management';

                action("Performance Contracts")
                {
                    Image = "1099Form";
                    Caption = 'Performance Criteria Category';

                    RunObject = page "Performance Criteria Category";
                    ApplicationArea = All;
                }
                action("Performance Criterial")
                {
                    Image = "1099Form";
                    Caption = 'Performance Criterial List';

                    RunObject = page "Performance Criterial List";
                    ApplicationArea = All;
                }
                action("Performance Contract Director")
                {
                    Image = "1099Form";
                    Caption = 'Performance Contract Director';

                    RunObject = page "Performance Criterial Line";
                    ApplicationArea = All;
                }
                action("Performance Contracts BOD, Director")
                {
                    Image = "1099Form";
                    Caption = 'Performance Contract BOD, Director';

                    RunObject = page "Performance Criterial Line Cas";
                    ApplicationArea = All;
                }
                action("Performance Citeria DDs")
                {
                    Image = "1099Form";
                    Caption = 'Performance Contract DDs';

                    RunObject = page "Criterial Line Cascade 2";
                    ApplicationArea = All;
                }
                action("Performance Citeria SDDRD, DD, RD, DRD, ")
                {
                    Image = "1099Form";
                    Caption = 'Performance Contract SDDRD, DD, RD, DRD, ';

                    RunObject = page "Criterial Line Cascade 3";
                    ApplicationArea = All;
                }
                action("Performance Citeria Heads of Sections")
                {
                    Image = "1099Form";
                    Caption = 'Performance Contract Heads of Sections';

                    RunObject = page "Criterial Line Cascade 4";
                    ApplicationArea = All;
                }
                action("Performance Citeria Technical staff")
                {
                    Image = "1099Form";
                    Caption = 'Performance Contract Technical staff';

                    RunObject = page "Criterial Line Cascade 5";
                    ApplicationArea = All;
                }
                action("Performance Setup")
                {
                    Image = "1099Form";
                    Caption = 'Performance  Setup';

                    RunObject = page "Project Setup";
                    ApplicationArea = All;
                }


            }
            group("Appraisal")
            {
                Caption = 'HRM-Appraisals';
                Image = Setup;
                action("HRM- Setup")
                {
                    Caption = 'HRM-Setup';
                    Image = Card;

                    RunObject = Page "HRM-Setup";
                    ApplicationArea = All;
                }
                action("PRL-Transaction Code List")
                {
                    Caption = 'Transaction Code List';
                    Image = Card;

                    RunObject = Page "PRL-Transaction Codes List";
                    ApplicationArea = All;
                }
                action("Payroll Period List")
                {
                    Caption = 'Payroll Period List';
                    Image = Card;

                    RunObject = Page "PRL-Payroll Periods";
                    ApplicationArea = All;
                }
                action("HRM-Setup List")
                {
                    Caption = 'HRM-Setup List';
                    Image = Card;

                    RunObject = Page "HRM-SetUp List";
                    ApplicationArea = All;
                }
                action("HRM-Score Setup")
                {
                    Caption = 'HRM-Score Setup';
                    Image = Card;

                    RunObject = Page "HRM-Score Setup";
                    ApplicationArea = All;
                }
                action("HRM-JOB Requirements")
                {
                    Caption = 'HRM-Job Requiremnts';
                    Image = ViewDetails;

                    RunObject = Page "HRM-Job Requirements (B)";
                    ApplicationArea = All;
                }
                // action("HRM-Appraisal Types")
                // {
                //     Caption = 'HRM-Apparaisal Types';
                //     Image = ViewDetails;
                //     Promoted = true;
                //     PromotedIsBig = true;
                //     RunObject = Page 68456;
                // }
                action("HRM-Appraisal Indicators")
                {
                    Caption = 'HRM-appraisal Indicators';
                    Image = ViewDetails;

                    RunObject = Page "Appraisal Indicators";
                    ApplicationArea = All;
                }
                action("HRM-Appraisal Appraisee")
                {
                    Caption = 'HRM-Appraisal (Individual staff)';
                    Image = ViewDetails;

                    RunObject = Page "Appraisal Appraisee";
                    ApplicationArea = All;
                }
                action("Appraisal-Sup")
                {
                    Caption = 'HRM-Appraisal-Supervisor';
                    Image = ViewDetails;

                    RunObject = Page "Appraisal Supervisor";
                    ApplicationArea = All;
                }
                action("Appraisal-HOD")
                {
                    Caption = 'HRM-Appraisal HOD';
                    Image = ViewDetails;

                    RunObject = Page "Appraisal HOD List";
                    ApplicationArea = All;
                }
                action("Appraisal-HR")
                {
                    Caption = 'HRM-Appraisal-DDHR';
                    Image = ViewDetails;

                    RunObject = Page "Appraisal HR";
                    ApplicationArea = All;
                }
                action("HRM-Confirmation Employee Appraisal List")
                {
                    Caption = 'HRM-Confirmation JSAC SSASC';
                    Image = ViewDetails;

                    RunObject = Page "Appraisal JSAC/SSASC List";
                    ApplicationArea = All;
                }
                action("HRM-Confirmation HR Appraisal List")
                {
                    Caption = 'HRM-Confirmation Full Board';
                    Image = ViewDetails;

                    RunObject = Page "Appraisal Full Board List";
                    ApplicationArea = All;
                }
                action("HRM-Appraisal Closed List")
                {
                    Caption = 'HRM-Appraisal Closed List';
                    Image = ViewDetails;

                    RunObject = Page "Appraisal  Closed List";
                    ApplicationArea = All;
                }
            }
            group(ProcessPCA)
            {
                Caption = 'Pay Change Advice Processing';
                action(PCA)
                {
                    Caption = 'PR-PCA List';
                    Image = Change;

                    RunObject = page "prPCA list";
                    ApplicationArea = All;
                }
                action(prPostedPCAMassList)
                {
                    Caption = 'Mass PCA List';
                    Image = Change;

                    RunObject = page prPCAMassList;
                    ApplicationArea = All;
                }
                action(PostedMAssPCAList)
                {
                    Caption = 'Posted Mass PCA List';
                    Image = Change;

                    RunObject = page prPostedPCAMassList;
                    ApplicationArea = All;
                }
                action(OthermPCAList)
                {
                    Caption = 'Other Mass PCA List';
                    Image = Change;

                    RunObject = page "Other mPCA list";
                    ApplicationArea = All;
                }
            }

        }



    }
}
