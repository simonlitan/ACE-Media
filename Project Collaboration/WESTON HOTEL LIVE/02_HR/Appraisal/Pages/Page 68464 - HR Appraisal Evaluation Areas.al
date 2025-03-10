page 68464 "HR Appraisal Evaluation Areas"
{
    PageType = List;
    SourceTable = "HR Appraisal Evaluation Areas";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = true;
                field("Categorize As"; Rec."Categorize As")
                {
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("Sub Category"; Rec."Sub Category")
                {
                    ApplicationArea = All;
                }

                field("Assign To"; Rec."Assign To")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Include in Evaluation Form"; Rec."Include in Evaluation Form")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;
}

