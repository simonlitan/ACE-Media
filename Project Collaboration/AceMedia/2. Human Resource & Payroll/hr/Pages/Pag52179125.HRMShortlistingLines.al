page 52179125 "HRM-Shortlisting Lines"
{
    Caption = 'Shorlisted Candidates';

    PageType = ListPart;
    SourceTable = "HRM-Shortlisted Applicants";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field(Select; Rec.Select)
                {
                    Editable = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Select field.';
                }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = all;
                    Caption = 'Qualified';
                    // Editable = false;

                    trigger OnValidate()
                    begin
                        Rec."Manual Change" := true;
                        Rec.Modify;
                    end;
                }
                field("Job Application No"; Rec."Job Application No")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("ID No"; Rec."ID No")
                {
                    Editable = false;
                    ApplicationArea = all;
                }



                field("Reporting Date"; Rec."Reporting Date")
                {

                    ApplicationArea = all;
                }

            }
        }
    }

    actions
    {
    }

    var
        MyCount: Integer;

    procedure GetApplicantNo() AppicantNo: Code[20]
    begin
        //AppicantNo:=Applicant;
    end;
}

