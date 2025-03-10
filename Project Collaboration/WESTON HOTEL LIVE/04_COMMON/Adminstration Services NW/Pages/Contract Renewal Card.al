/// <summary>
/// Page Contract Renewal Card (ID 52178492).
/// </summary>
page 52178863 "Contract Renewal Card"
{
    PageType = card;
    SourceTable = "Outsourced Services";

    layout
    {
        area(Content)
        {

            field("No."; Rec."No.")
            {
                ApplicationArea = All;
            }
            field("Contract Type"; Rec."Contract Type")
            {
                ApplicationArea = All;
            }
            field("Contract Description"; Rec."Contract Description")
            {
                ApplicationArea = All;

            }
            field("Start Date"; Rec."Start Date")
            {
                ApplicationArea = All;

            }
            field("End Date"; Rec."End Date")
            {
                ApplicationArea = All;

            }
            field(Status; Rec.Status)
            {
                Editable = false;
                ApplicationArea = All;
            }
            field(Renewable; Rec.Renewable)
            {
                ApplicationArea = All;

            }
            field("Date Renewed"; Rec."Date Renewed")
            {
                ApplicationArea = All;

            }
            field("End Of renewal Period"; Rec."End Of renewal Period")
            {
                ApplicationArea = All;

            }
        }

    }

    actions
    {
        area(Navigation)
        {
            action(ContractorsRoster)
            {
                Caption = 'Rosters List';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;
                RunObject = Page "Contractors Roster List";
                RunPageLink = "Contract No." = FIELD("No.");




            }
            action(ContractorsEvaluation)
            {
                Caption = 'Monitoring List';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;
                RunObject = Page "Project monitoring Params List";
                //RunPageLink = "Contract No." = FIELD("No.");

            }
            action(InitiateRenewal)
            {
                Caption = 'Initiate Contract Renewal';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;

                trigger OnAction()
                begin
                    if rec."Renewal Status" = Rec."Renewal Status"::"  " then begin
                        Rec."Renewal Status" := Rec."Renewal Status"::New;
                    end;
                end;
            }

            action(Archive)
            {
                Caption = 'Archive the contract';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;

                //RunPageLink = "Contract No." = FIELD("No.");

                trigger OnAction()
                begin
                    if rec.Status = rec.Status::Active then begin
                        rec.Status := rec.Status::Active;
                    end;
                end;

            }
        }

    }
}