page 52178973 "ICT Support Consult Card"
{
    PageType = Card;
    SourceTable = "ICT Support Desk";
    DeleteAllowed = false;
    SourceTableView = where("Escalation Levels" = filter("Service Provider"));

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
                    Importance = Promoted;
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
            action(ResolvedIssues)
            {
                Caption = 'Successfully resolved';
                Image = Insert;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if Rec."Issue Status" = Rec."Issue Status"::escalated then begin
                        Rec."Issue Status" := Rec."Issue Status"::Resolved;
                    end
                    else begin
                        Message('Ensure that the issue is resolved');
                    end;

                end;
            }
            action(UnderReview)
            {
                Caption = 'Post to review';
                Image = Insert;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;

            }
            /* action(EscalateIssue)
            {
                Caption = 'Escalating of the issue';
                Image = Insert;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if Rec."Issue Status" = Rec."Issue Status"::Assigned then begin
                        if (Rec."Level 2 USERID" <> '') AND (Rec."Level 3 USERID" = '') then begin
                            Rec."Escalation Levels" := Rec."Escalation Levels"::"Level 2";
                            Rec."Issue Status" := rec."Issue Status"::Escalated;
                        end
                        else
                            Message('Level 2 Escalate user not linked')
                    end

                    else
                        if Rec."Issue Status" = Rec."Issue Status"::Escalated then begin
                            if (Rec."Level 2 USERID" <> '') AND (Rec."Level 3 USERID" <> '') then begin
                                Rec."Escalation Levels" := Rec."Escalation Levels"::"Level 3";
                                Rec."Issue Status" := rec."Issue Status"::Escalated;
                            end
                            else
                                Message('Level 3 Escalate user not linked')
                        end


                        else begin
                            Message('Ensure that the issue is resolved');
                        end;
                end;
            }
            action(RequestConsultancy)
            {
                Caption = 'Escalate to Consultant';
                Image = Insert;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if Rec."Issue Status" = Rec."Issue Status"::Escalated then begin
                        if (Rec."Level 2 USERID" <> '') AND (Rec."Level 3 USERID" <> '')
                        AND (Rec."Escalation Levels" = Rec."Escalation Levels"::"Level 3")
                         then begin
                            Rec."Escalation Levels" := Rec."Escalation Levels"::"Service Provider";
                            Message('The issue has been escalated to the service provider');
                        end
                        else
                            Message('Exhaust internal internal escalation levels')
                    end
                end;

            } */
        }
    }

}