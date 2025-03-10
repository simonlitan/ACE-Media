report 52178890 "PC Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './PC/Reports/SSR/PCReports.rdl';

    dataset
    {
        dataitem(Indicator; "PC Indicator Name")
        {

            column(IndicatorCode_Indicator; "Indicator Code")
            {
            }
            column(Description_Indicator; Description)
            {
            }
            column(DepartmentCode_Indicator; "Department Code")
            {
            }
            column(DepartmentName_Indicator; "Department Name")
            {
            }
            column(HeadofDepartment_Indicator; "Head of Department")
            {
            }
            column(IndicatorTotalweight_Indicator; "Indicator Total weight")
            {
            }
            column(PCPeriod_Indicator; "PC Period")
            {
            }
            column(complogo; info.Picture)
            {

            }
            column(compName; info.Name)
            {

            }
            column(CompAddress; info.Address)
            {

            }
            column(compEmail; info."E-Mail")
            {

            }
            column(compUrl; info."Home Page")
            {

            }
            dataitem(Params; "PC Indicator Params")
            {
                DataItemLink = "PC Period" = field("PC Period"), "Indicator Code" = field("Indicator Code");

                column(No_Params; "No.")
                {
                }
                column(IndicatorCode_Params; "Indicator Code")
                {
                }
                column(Department_Params; Department)
                {
                }
                column(HeadofDepartment_Params; "Head of Department")
                {
                }
                column(Description_Params; Description)
                {
                }
                column(Weight_Params; Weight)
                {
                }
                column(Unit_Params; Unit)
                {
                }
                column(PCPeriod_Params; "PC Period")
                {
                }
                column(AnnualTarget_Params; "Annual Target")
                {
                }
                column(Q1Target_Params; "Q1 Target")
                {
                }
                column(Q2Target_Params; "Q2 Target")
                {
                }
                column(Q3Target_Params; "Q3 Target")
                {
                }
                column(Q4Target_Params; "Q4 Target")
                {
                }
                column(AnnualAchievement_Params; "Annual Achievement")
                {
                }
                column(Q1Achievement_Params; "Q1 Achievement")
                {
                }
                column(Q2Achievement_Params; "Q2 Achievement")
                {
                }
                column(Q3Achievement_Params; "Q3 Achievement")
                {
                }
                column(Q4Achievement_Params; "Q4 Achievement")
                {
                }
                column(Change_Params; "% Change")
                {
                }
                column(RawScore_Params; "Raw Score")
                {
                }
                column(WeightedScore_Params; "Weighted Score")
                {
                }
                column(Remarks_Params; Remarks)
                {
                }
                column(Comments_Params; Comments)
                {
                }
                column(change; change)
                {

                }
                column(Rawscore; Rawscore)
                {

                }
                column(weightedScore; weightedScore)
                {

                }
                column(WRemark; WRemark)
                {

                }

                trigger OnAfterGetRecord()
                begin
                    change := 0;
                    Rawscore := 0;
                    weightedScore := 0;

                    Params2.Reset();
                    Params2.SetRange("PC Period", Indicator."PC Period");
                    Params2.SetRange("Indicator Code", Indicator."Indicator Code");
                    Params2.SetRange("No.", Params."No.");
                    Params2.SetRange(Department, Params.Department);
                    Params2.SetRange("Head of Department", Params."Head of Department");
                    if Params2.Find('-') then begin
                        Params2.CalcFields("Annual Achievement");
                        Clear(change);
                        Clear(WRemark);
                        if ((Params2."Annual Target" <> 0) and (Params2."Annual Achievement" <> 0)) then begin
                            change := (Params2."Annual Achievement" - Params2."Annual Target") / Params2."Annual Target";
                            /* if change <> 0 then
                                Message('Change ' + Format(change)); */
                            Rawscore := 1 + (((4 * Params2."Annual Target") - (2 * Params2."Annual Achievement"))) / Params2."Annual Target";
                            weightedScore := Rawscore * Params2.Weight;
                            if Rawscore <> 0 then begin
                                if ((Rawscore > 4) and (Rawscore <= 5)) then
                                    WRemark := 'POOR';
                                if ((Rawscore > 3.6) and (Rawscore <= 4)) then
                                    WRemark := 'FAIR';
                                if ((Rawscore > 3) and (Rawscore <= 3.6)) then
                                    WRemark := 'GOOD';
                                if ((Rawscore > 2.4) and (Rawscore <= 3)) then
                                    WRemark := 'VERY GOOD';
                                if ((Rawscore = 1) and (Rawscore <= 2.4)) then
                                    WRemark := 'FAIR';
                            end;
                        end;

                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                info.get;
                info.CalcFields(Picture);
            end;
        }
    }

    var
        info: Record "Company Information";
        change: Decimal;
        Params2: Record "PC Indicator Params";
        Rawscore: Decimal;
        weightedScore: Decimal;
        WRemark: Text[100];
}