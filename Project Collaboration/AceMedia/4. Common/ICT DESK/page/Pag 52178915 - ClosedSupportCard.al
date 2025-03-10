page 52178967 "Closed Support Card"
{
    PageType = Card;
    SourceTable = "ICT Support Desk";
    DeleteAllowed = false;
    SourceTableView = where("Issue Status" = filter(Closed));


    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Issue Area"; Rec."Issue Area")
                {
                    ApplicationArea = All;
                }
                field("Issue Description"; Rec."Issue Description")
                {
                    ApplicationArea = All;
                }
                /*  field("No."; Rec."No.")
                 {
                     Visible = false;
                     Importance = Promoted;
                     ApplicationArea = All;

                 } */
                field(Status; Rec."Issue Status")
                {
                    ApplicationArea = All;
                }

                group("User Information")
                {
                    field("Requesting User"; Rec."Requesting User")
                    {
                        ApplicationArea = All;
                    }
                    field("Assignining Adminstrator"; Rec."Assignining Adminstrator")
                    {
                        ApplicationArea = All;
                    }
                    field("Assigned Technician"; Rec."Assigned Technician")
                    {
                        ApplicationArea = All;
                    }
                    field("Escalation Levels"; Rec."Escalation Levels")
                    {
                        ApplicationArea = All;
                    }
                    field("Level 2 USERID"; Rec."Level 2 USERID")
                    {
                        ApplicationArea = All;
                    }
                    field("Level 3 USERID"; Rec."Level 3 USERID")
                    {
                        ApplicationArea = All;
                    }
                    field("Consultant Resolving"; Rec."Consultant Resolving")
                    {
                        ApplicationArea = All;
                    }
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {


            action(SubmitRequest)
            {
                Caption = 'Submit Support request';
                Image = Insert;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if Rec."Issue Status" = Rec."Issue Status"::New then begin
                        Rec."Issue Status" := Rec."Issue Status"::Submitted;

                    end
                    else begin
                        Message('The requests sent are not new');
                    end;

                end;



            }
        }
    }

}