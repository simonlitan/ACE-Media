page 52179184 "HRM-Courses Card"
{

    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions';
    SourceTable = "HRM-Training Courses";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = all;
                }
                field("Course Tittle"; Rec."Course Tittle")
                {
                    ApplicationArea = all;
                }
                field("Course Version"; Rec."Course Version")
                {
                    ApplicationArea = all;
                }
                field("Course Version Description"; Rec."Course Version Description")
                {
                    ApplicationArea = all;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = all;
                    Caption = 'Directorate';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = all;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = all;
                    Caption = 'Department';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = all;
                }
                field("Station Code"; Rec."Station Code")
                {
                    ApplicationArea = all;
                }
                field("Station Name"; Rec."Station Name")
                {
                    ApplicationArea = all;
                }
                field("Need Source"; Rec."Need Source")
                {
                    ApplicationArea = all;
                }
                field("Nature of Training"; Rec."Nature of Training")
                {
                    ApplicationArea = all;
                }
                field("Training Type"; Rec."Training Type")
                {
                    ApplicationArea = all;
                }
                field("No of Participants Required"; Rec."No of Participants Required")
                {
                    ApplicationArea = all;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                }
                field("Duration Units"; Rec."Duration Units")
                {
                    ApplicationArea = all;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = all;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = all;
                }
                field("Quarter Offered"; Rec."Quarter Offered")
                {
                    ApplicationArea = all;
                }
                field("Cost Of Training"; Rec."Cost Of Training")
                {
                    ApplicationArea = all;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = all;
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = all;
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Closing Status"; Rec."Closing Status")
                {
                    ApplicationArea = all;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("&Mark as Closed/Open")
                {
                    Caption = '&Mark as Closed/Open';
                    Image = CloseDocument;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if Rec.Closed then begin
                            Rec.Closed := false;
                            Message('Training need :: %1 :: has been Re-Opened', Rec."Course Tittle");
                        end
                        else begin
                            Rec.Closed := true;
                            Message('Training need :: %1 :: has been closed', Rec."Course Tittle");
                            Rec.Modify;
                        end;
                    end;
                }
            }
        }
    }

    var
        D: Date;
}

