page 52178881 "Audit-Risk analysis Header"
{
    PageType = Card;
    SourceTable = "AUDIT-Risk Analysis Header";

    layout
    {
        area(content)
        {
            group("General Info.")
            {
                Caption = 'General Info.';
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Process; Rec.Process)
                {
                    ApplicationArea = All;
                }
                field("Department Code"; Rec."Departmant Name")
                {
                    ApplicationArea = All;
                }
                field(Risk; Rec.Risks)
                {
                    Caption = 'Risk';
                    MultiLine = true;
                    ApplicationArea = All;
                }

                field(Session; Rec.Session)
                {
                    ApplicationArea = All;
                }
                field(Likelihood; Rec.Likelihood)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        IF Rec.Likelihood > 5 THEN ERROR('Value cannot be greater than 5');
                    end;
                }
                field(Impact; Rec.Impact)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        IF Rec.Impact > 5 THEN ERROR('Value cannot be greater than 5');
                    end;
                }
                field("Responsible Persons"; Rec."Responsible Persons")
                {
                    ApplicationArea = All;
                }
                /* field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                } */
                field("Budget Period"; Rec."Budget Period")
                {
                    ApplicationArea = All;
                }
                field("Department Name"; Rec."Department Name2")
                {
                    ApplicationArea = All;
                }
                field(status; Rec.status)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Risk Processes")
            {
                Caption = '&Risk Processes';
                action(Causes)
                {
                    Image = LotInfo;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Audit Risk Caues Lines";
                    RunPageLink = "Risk Code" = FIELD(No);
                    ApplicationArea = All;
                }
                action(Impacts)
                {
                    Image = Allocate;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Audit Risk Impacts Lines";
                    RunPageLink = "Risk Code" = FIELD(No);
                    ApplicationArea = All;
                }
                action("Risk Actions")
                {
                    Image = Answers;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Audit Risk Actions lines";
                    RunPageLink = "Risk Code" = FIELD(No);
                    ApplicationArea = All;
                }
            }
            separator("&Submit")
            {
                Caption = '&Submit';
            }
            action("Send for Monitoring")
            {
                Image = Shipment;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    IF Rec.status <> Rec.status::New THEN ERROR('Status has to be new');

                    IF CONFIRM('Send For Audit', TRUE) THEN
                        Rec.status := Rec.status::"In Audit";
                end;
            }
        }
    }

    var
        DimensionValue: Record "Dimension Value";
}

