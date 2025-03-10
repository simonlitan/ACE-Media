page 52179078 "Training and Development List2"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Training and Development";

    layout
    {
        area(Content)
        {
            repeater(List)
            {
                field("Ref. No."; Rec."Ref. No.")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Err: Label 'Sorry, you have selected %1 Courses you can only select maximum of 2.';
                        MaxItem: Integer;
                    begin
                        MaxItem := 0;
                        rec.Reset();
                        rec.SetRange(Rec."Ref. No.", Rec."Ref. No.");
                        if rec.FindSet() then
                            repeat
                                MaxItem += 1
                            until rec.Next() = 0;
                        if MaxItem > 0 then
                            Error(Err, MaxItem);

                    end;

                }
                field("Last Training Attended"; Rec."Last Training Attended")
                {
                    ApplicationArea = all;
                    Caption = 'Training attended in the last financial Year';
                }

                field("Type of Training"; Rec."Type of Training")
                {
                    ApplicationArea = all;
                }



                field("Name of Training"; Rec."Name of Training")
                {
                    ApplicationArea = All;
                    Caption = 'Projected training';


                }

                field("Relevance of Training"; Rec."Relevance of Training")
                {
                    ApplicationArea = all;
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = all;
                }

                field("Implematation Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';

                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = all;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Full Board"; Rec."Full Board")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        UpdateControls();
                    end;
                }

                field("Full Board Amount"; Rec."Full Board Amount")
                {
                    ApplicationArea = all;
                    Editable = FullBoardAmount;


                }

                field(Tution; Rec.Tution)
                {
                    ApplicationArea = All;
                    Editable = Isvisible;

                }
                field(DSA; Rec.DSA)
                {
                    ApplicationArea = All;
                    Editable = DSA;

                }
                field(Logistics; Rec.Logistics)
                {
                    Caption = 'Transport';
                    ApplicationArea = All;

                }
                field(Cost; Rec.Cost)
                {
                    Caption = 'Total Cost';
                    ApplicationArea = All;

                }
                field("Supervisor Comment"; Rec."Supervisor Comment")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Training Period"; Rec."Training Period")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }

    }



    var
        Isvisible: Boolean;
        DSA: Boolean;
        FullBoardAmount: Boolean;

    procedure UpdateControls()
    begin
        if rec."Full Board" = false then begin
            Isvisible := true;
        end else begin
            Isvisible := false;
        end;
        if rec."Full Board" = false then begin
            DSA := true;
        end else begin
            DSA := false;
        end;
        if rec."Full Board" = false then begin
            FullBoardAmount := false;
        end else begin
            FullBoardAmount := true;
        end;

    end;

    procedure MaxLines()
    var
        Err: Label 'Sorry, you have selected %1 Courses you can only select maximum of 2.';
        MaxItem: Integer;
    begin
        rec.Reset();
        rec.SetRange(Rec."Ref. No.", Rec."Ref. No.");
        if rec.FindSet() then
            repeat
                MaxItem += 1
            until rec.Next() = 0;
        if MaxItem > 0 then
            Error(Err, MaxItem);

    end;

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        UpdateControls();
    end;


}

