report 50234 "Appraisal Report2"
{
    //  5 and above
    ApplicationArea = All;
    Caption = 'Appraisal Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = './Appraisal/Layouts/Appraisal2.docx';
    dataset
    {
        dataitem(SelfAppraisal; "Employee Self-Appraisal")
        {
            column(SelfOperationEfficiency_SelfAppraisal; " Self Operation Efficiency")
            {
                AutoCalcField = true;
            }
            column(AgreedCommunicationSkill_SelfAppraisal; "Agreed Communication Skill")
            {
                AutoCalcField = true;
            }
            column(AgreedLeadershipSkills_SelfAppraisal; "Agreed Leadership Skills")
            {
                AutoCalcField = true;
            }
            column(AgreedOperationEffic_SelfAppraisal; "Agreed Operation Effic")
            {
                AutoCalcField = true;
            }
            column(AgreedPersonalAttributes_SelfAppraisal; "Agreed Personal Attributes")
            {
                AutoCalcField = true;
            }
            column(SelfCommunicationSkills_SelfAppraisal; "Self Communication Skills")
            {
                AutoCalcField = true;
            }
            column(AgreedRoleExecution_SelfAppraisal; "Agreed Role Execution")
            {
                AutoCalcField = true;
            }
            column(SelfLeadershipSkills_SelfAppraisal; "Self Leadership Skills")
            {
                AutoCalcField = true;
            }
            column(SelfPersonalAttributes_SelfAppraisal; "Self Personal Attributes")
            {
                AutoCalcField = true;
            }
            column(SelfRoleExecutionOversite_SelfAppraisal; "Self Role Execution Oversite")
            {
                AutoCalcField = true;


            }
            column(SupervisorCommunicationSkill_SelfAppraisal; "Supervisor Communication Skill")
            {
                AutoCalcField = true;

            }
            column(SupervisorLeadershipSkills_SelfAppraisal; "Supervisor Leadership Skills")
            {
                AutoCalcField = true;

            }
            column(SupervisorOperationEffic_SelfAppraisal; "Supervisor Operation Effic")
            {
                AutoCalcField = true;
            }
            column(SupervisorPersonalAttributes_SelfAppraisal; "Supervisor Personal Attributes")
            {
                AutoCalcField = true;
            }
            column(SupervisorRoleExecution_SelfAppraisal; "Supervisor Role Execution")
            {
                AutoCalcField = true;
            }
            column(Department_SelfAppraisal; Department)
            {
            }
            column(Years_of_service; "Years of service") { }
            column(Divisonsection_SelfAppraisal; "Divison/section")
            {
            }
            column(EmployeeNo_SelfAppraisal; "Employee No")
            {
            }
            column(Grade_SelfAppraisal; Grade)
            {
            }
            column(JobTitle_SelfAppraisal; "Job Title")
            {
            }
            column(LastReviewDate_SelfAppraisal; "Last Review Date")
            {
            }
            column(Name_SelfAppraisal; Name)
            {
            }
            column(No_SelfAppraisal; "No.")
            {
            }
            column(SupervisorsName_SelfAppraisal; "Supervisor’s Name:")
            {
            }
            column(PeriodUnderReview_SelfAppraisal; "Period Under Review")
            {
            }
            dataitem(Operation; "Self Appraisal Line")
            {
                column(Description_Operation; Description)
                {
                }
                column(SupervisorScore_Operation; "Supervisor Score")
                {
                }
                column(SelfScore_Operation; "Self Score")
                {
                }
                column(AgreedScore_Operation; "Agreed Score")
                {
                }
                column(MaxScore_Operation; "Max Score")
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange("Document No.", SelfAppraisal."No.");
                    SetRange(Type, Type::"Operational Efficiency");
                end;
            }
            dataitem(communication; "Self Appraisal Line")
            {
                column(Description_communication; Description)
                {
                }
                column(SupervisorScore_communication; "Supervisor Score")
                {
                }
                column(MaxScore_communication; "Max Score")
                {
                }
                column(AgreedScore_communication; "Agreed Score")
                {
                }
                column(SelfScore_communication; "Self Score")
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange("Document No.", SelfAppraisal."No.");
                    SetRange(Type, Type::"Communication Skills");
                end;
            }
            dataitem(Attribute; "Self Appraisal Line")
            {
                column(Description_Attribute; Description)
                {
                }
                column(SupervisorScore_Attribute; "Supervisor Score")
                {
                }
                column(AgreedScore_Attribute; "Agreed Score")
                {
                }
                column(MaxScore_Attribute; "Max Score")
                {
                }
                column(SelfScore_Attribute; "Self Score")
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange("Document No.", SelfAppraisal."No.");
                    SetRange(Type, Type::"Personal Attributes");
                end;
            }
            dataitem(Leadership; "Self Appraisal Line")
            {
                column(SupervisorScore_Leadership; "Supervisor Score")
                {
                }
                column(Description_Leadership; Description)
                {
                }
                column(MaxScore_Leadership; "Max Score")
                {
                }
                column(SelfScore_Leadership; "Self Score")
                {
                }
                column(AgreedScore_Leadership; "Agreed Score")
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange("Document No.", SelfAppraisal."No.");
                    SetRange(Type, Type::"Leadership Skills");
                end;
            }
            dataitem(RoleExecution; "Self Appraisal Line")
            {
                column(AgreedScore_RoleExecution; "Agreed Score")
                {
                }
                column(Description_RoleExecution; Description)
                {
                }
                column(MaxScore_RoleExecution; "Max Score")
                {
                }
                column(SelfScore_RoleExecution; "Self Score")
                {
                }
                column(SupervisorScore_RoleExecution; "Supervisor Score")
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange("Document No.", SelfAppraisal."No.");
                    SetRange(Type, Type::"Role Execution Oversite");
                end;
            }
            dataitem(Doperation; "Detailed Appraisal Comments")
            {
                column(Comment_Doperation; Comment)
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange("No.", SelfAppraisal."No.");

                end;
            }
            dataitem("Training Lines"; "Training Lines")
            {

                column(Cost_TrainingLines; Cost)
                {
                }
                column(ImplematationDate_TrainingLines; "Implematation Date")
                {
                }
                column(NameofTraining_TrainingLines; "Name of Training")
                {
                }
                column(SupervisorComment_TrainingLines; "Supervisor Comment")
                {
                }
                column(Trainer_TrainingLines; Trainer)
                {
                }
                column(TrainingIdentification_TrainingLines; "Training Identification")
                {
                }
                column(Venue_TrainingLines; Venue)
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange("Document No.", SelfAppraisal."No.");
                end;
            }
            dataitem("Strategic Objective"; "Strategic Objective")
            {
                column(Activities_StrategicObjective; Activities)
                {
                }
                column(AgreedfinalScore_StrategicObjective; "Agreed final Score")
                {
                }
                column(MeansofVerification_StrategicObjective; "Means of Verification")
                {
                }
                column(Reasonsforvariance_StrategicObjective; "Reasons for variance")
                {
                }
                column(SelfRating_StrategicObjective; "Self Rating")
                {
                }
                column(StrategicObjective_StrategicObjective; "Strategic Objective")
                {
                }
                column(SupervisorRating_StrategicObjective; "Supervisor  Rating")
                {
                }
                column(variance_StrategicObjective; variance)
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange("Document No.", SelfAppraisal."No.");
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
