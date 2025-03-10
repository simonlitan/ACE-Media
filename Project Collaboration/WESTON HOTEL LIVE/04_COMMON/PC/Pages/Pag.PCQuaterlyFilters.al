page 52179126 "PC Quaterly Filters"
{
    PageType = Card;
    SourceTable = "PC Quaterly Periods";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(accPeriod; accPeriod)
                {
                    ApplicationArea = All;
                    TableRelation = "PC Periods"."PC Period";
                }
                field(Quater; Quaters)
                {
                    ApplicationArea = All;
                    TableRelation = "PC Quaterly Periods".Quater;

                    trigger OnValidate()
                    var
                        qp: Record "PC Quaterly Periods";
                    begin
                        Clear(sdate);
                        Clear(edate);
                        qp.Reset();
                        qp.SetRange("PC Period", accPeriod);
                        qp.SetRange(Quater, Quaters);
                        if qp.Find('-') then begin
                            qp.TestField("Submission Start Date");
                            qp.TestField("Submission End Date");
                            edate := qp."Submission End Date";
                            sdate := qp."Submission Start Date";
                        end;
                    end;
                }
                field(Department; Depart)
                {
                    ApplicationArea = All;
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
                }
                field("Submission Start Date"; sdate)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Submission Start Date field.';
                }
                field("Submission End Date"; edate)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Submission End Date field.';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Submit Filters")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    tday: date;
                begin
                    Clear(tday);
                    tday := Today();
                    if ((tday >= sdate) And (tday <= edate)) then begin
                        indicatorScore.Reset();
                        indicatorScore.SetRange("PC Period", accPeriod);
                        indicatorScore.SetRange(Department, Depart);
                        indicatorScore.SetRange("Quater Period", Quaters);
                        indicatorScore.SetRange("Head of Department", UserId);
                        if indicatorScore.Find('-') then begin
                            page.Run(Page::"PC Indicator Results", indicatorScore);
                        end
                        else begin
                            indcatorParams.Reset();
                            indcatorParams.SetRange("PC Period", accPeriod);
                            indcatorParams.SetRange(Department, Depart);
                            indcatorParams.SetRange("Head of Department", UserId);
                            if indcatorParams.Find('-') then begin
                                repeat
                                    indicatorScore.Init;
                                    indicatorScore."PC Period" := indcatorParams."PC Period";
                                    indicatorScore."Indicator Code" := indcatorParams."Indicator Code";
                                    indicatorScore."No." := indcatorParams."No.";
                                    indicatorScore."Head of Department" := indcatorParams."Head of Department";
                                    indicatorScore.Department := Depart;
                                    indicatorScore.Description := indcatorParams.Description;
                                    indicatorScore."Q1 Target" := indcatorParams."Q1 Target";
                                    indicatorScore."Q2 Target" := indcatorParams."Q2 Target";
                                    indicatorScore."Q3 Target" := indcatorParams."Q3 Target";
                                    indicatorScore."Q4 Target" := indcatorParams."Q4 Target";
                                    indicatorScore."Quater Period" := Quaters;
                                    indicatorScore.Unit := indcatorParams.Unit;
                                    indicatorScore.Weight := indcatorParams.Weight;
                                    indicatorScore."Annual Target" := indcatorParams."Annual Target";
                                    indicatorScore.Insert(true);
                                until indcatorParams.Next() = 0;
                            end;

                            page.Run(Page::"PC Indicator Results", indicatorScore);
                        end;
                    end else
                        Message('Submission timelines Violated');

                end;
            }
        }
    }



    var
        accPeriod: code[20];
        Quaters: code[20];
        Depart: code[30];
        indcatorParams: Record "PC Indicator Params";
        indicatorScore: Record "PC Indicator Results";
        //indicatorBuffer: Record "PC Indicator Results Buffer";
        usersetup: Record "User Setup";
        empNo: code[20];
        sdate: date;
        edate: date;
}