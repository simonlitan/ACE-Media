page 52178975 "ICT Support Desk Submitted"
{
    PageType = Card;
    SourceTable = "ICT Support Desk";
    DeleteAllowed = false;
    SourceTableView = where("Issue Status" = filter(Submitted));

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
                /*   field("No."; Rec."No.")
                  {
                      Visible = false;
                      Importance = Promoted;
                      ApplicationArea = All;
                  } */
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


            action(AssignOfficer)
            {
                Caption = 'Assign Officer';
                Image = Insert;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    supportTeam: Record "ICT Support Desk team";
                    "User ID": code[30];
                begin
                    if Rec."Issue Status" <> Rec."Issue Status"::Assigned
                    then begin
                        if Rec."Assigned Technician" <> '' then begin
                            //  "User ID" := UserID;
                            supportTeam.Reset();
                            supportTeam.SetRange("User ID", UserID);
                            supportTeam.SetRange(Responsibility, 'Admin');
                            if supportTeam.Find('-') then
                                Rec."Issue Status" := Rec."Issue Status"::Assigned;
                            Message('Issue Successifully Assigned ');
                        end
                        else
                            Message('Already Assigned');

                    end;

                end;



            }
        }
    }
}