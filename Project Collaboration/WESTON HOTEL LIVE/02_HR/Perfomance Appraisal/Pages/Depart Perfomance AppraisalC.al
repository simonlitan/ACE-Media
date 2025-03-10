page 50028 "Depart Perfomance AppraisalC"
{
    PageType = Card;
    SourceTable = "Depart Perfomance Appraisal";
    //Editable = false;

    layout
    {
        area(Content)
        {
            group(general)
            {

                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(UserName; Rec.UserName)
                {
                    ToolTip = 'Specifies the value of the UserName field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Institution Code"; Rec."Institution Code")
                {
                    ToolTip = 'Specifies the value of the Institution Code field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Department Code field.';
                    ApplicationArea = All;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ToolTip = 'Specifies the value of the Department Name field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ToolTip = 'Specifies the value of the Supervisor field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Closed; Rec.Closed)
                {
                    ToolTip = 'Specifies the value of the Closed field.';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            part(targets; "Periodic Appraisal TargetsL")
            {

                SubPageLink = "Appraisal Period" = field("Appraisal Period"), "Institution Code" = field("Institution Code"),
                "Department Code" = field("Department Code"), Supervisor = field(Supervisor);
                ApplicationArea = All;
            }
        }

    }
}