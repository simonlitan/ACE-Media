page 52178910 "CEO-Forecast Matrix"
{
    Caption = 'Calendar Matrix';
    //DataCaptionExpression = "Calendar Name";
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "CEO-Calendar Entries";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Planning;
                    Editable = false;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookUpCode(LineDimOption, LineDimCode, Rec.Code);
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Planning;
                    Editable = false;
                    ToolTip = 'Specifies a description of the item.';
                }
                field(Field1; MATRIX_CellData[1])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[1];
                    DecimalPlaces = 0 : 5;
                    Visible = Field1Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(1);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(1);
                    end;
                }
                field(Field2; MATRIX_CellData[2])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[2];
                    DecimalPlaces = 0 : 5;
                    Visible = Field2Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(2);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(2);
                    end;
                }
                field(Field3; MATRIX_CellData[3])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[3];
                    DecimalPlaces = 0 : 5;
                    Visible = Field3Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(3);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(3);
                    end;
                }
                field(Field4; MATRIX_CellData[4])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[4];
                    DecimalPlaces = 0 : 5;
                    Visible = Field4Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(4);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(4);
                    end;
                }
                field(Field5; MATRIX_CellData[5])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[5];
                    DecimalPlaces = 0 : 5;
                    Visible = Field5Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(5);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(5);
                    end;
                }
                field(Field6; MATRIX_CellData[6])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[6];
                    DecimalPlaces = 0 : 5;
                    Visible = Field6Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(6);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(6);
                    end;
                }
                field(Field7; MATRIX_CellData[7])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[7];
                    DecimalPlaces = 0 : 5;
                    Visible = Field7Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(7);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(7);
                    end;
                }
                field(Field8; MATRIX_CellData[8])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[8];
                    DecimalPlaces = 0 : 5;
                    Visible = Field8Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(8);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(8);
                    end;
                }
                field(Field9; MATRIX_CellData[9])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[9];
                    DecimalPlaces = 0 : 5;
                    Visible = Field9Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(9);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(9);
                    end;
                }
                field(Field10; MATRIX_CellData[10])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[10];
                    DecimalPlaces = 0 : 5;
                    Visible = Field10Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(10);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(10);
                    end;
                }
                field(Field11; MATRIX_CellData[11])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[11];
                    DecimalPlaces = 0 : 5;
                    Visible = Field11Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(11);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(11);
                    end;
                }
                field(Field12; MATRIX_CellData[12])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[12];
                    DecimalPlaces = 0 : 5;
                    Visible = Field12Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(12);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(12);
                    end;
                }
                field(Field13; MATRIX_CellData[13])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[13];
                    DecimalPlaces = 0 : 5;
                    Visible = Field13Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(13);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(13);
                    end;
                }
                field(Field14; MATRIX_CellData[14])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[14];
                    DecimalPlaces = 0 : 5;
                    Visible = Field14Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(14);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(14);
                    end;
                }
                field(Field15; MATRIX_CellData[15])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[15];
                    DecimalPlaces = 0 : 5;
                    Visible = Field15Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(15);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(15);
                    end;
                }
                field(Field16; MATRIX_CellData[16])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[16];
                    DecimalPlaces = 0 : 5;
                    Visible = Field16Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(16);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(16);
                    end;
                }
                field(Field17; MATRIX_CellData[17])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[17];
                    DecimalPlaces = 0 : 5;
                    Visible = Field17Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(17);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(17);
                    end;
                }
                field(Field18; MATRIX_CellData[18])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[18];
                    DecimalPlaces = 0 : 5;
                    Visible = Field18Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(18);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(18);
                    end;
                }
                field(Field19; MATRIX_CellData[19])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[19];
                    DecimalPlaces = 0 : 5;
                    Visible = Field19Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(19);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(19);
                    end;
                }
                field(Field20; MATRIX_CellData[20])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[20];
                    DecimalPlaces = 0 : 5;
                    Visible = Field20Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(20);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(20);
                    end;
                }
                field(Field21; MATRIX_CellData[21])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[21];
                    DecimalPlaces = 0 : 5;
                    Visible = Field21Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(21);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(21);
                    end;
                }
                field(Field22; MATRIX_CellData[22])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[22];
                    DecimalPlaces = 0 : 5;
                    Visible = Field22Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(22);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(22);
                    end;
                }
                field(Field23; MATRIX_CellData[23])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[23];
                    DecimalPlaces = 0 : 5;
                    Visible = Field23Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(23);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(23);
                    end;
                }
                field(Field24; MATRIX_CellData[24])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[24];
                    DecimalPlaces = 0 : 5;
                    Visible = Field24Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(24);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(24);
                    end;
                }
                field(Field25; MATRIX_CellData[25])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[25];
                    DecimalPlaces = 0 : 5;
                    Visible = Field25Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(25);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(25);
                    end;
                }
                field(Field26; MATRIX_CellData[26])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[26];
                    DecimalPlaces = 0 : 5;
                    Visible = Field26Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(26);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(26);
                    end;
                }
                field(Field27; MATRIX_CellData[27])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[27];
                    DecimalPlaces = 0 : 5;
                    Visible = Field27Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(27);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(27);
                    end;
                }
                field(Field28; MATRIX_CellData[28])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[28];
                    DecimalPlaces = 0 : 5;
                    Visible = Field28Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(28);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(28);
                    end;
                }
                field(Field29; MATRIX_CellData[29])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[29];
                    DecimalPlaces = 0 : 5;
                    Visible = Field29Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(29);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(29);
                    end;
                }
                field(Field30; MATRIX_CellData[30])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[30];
                    DecimalPlaces = 0 : 5;
                    Visible = Field30Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(30);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(30);
                    end;
                }
                field(Field31; MATRIX_CellData[31])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[31];
                    DecimalPlaces = 0 : 5;
                    Visible = Field31Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(31);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(31);
                    end;
                }
                field(Field32; MATRIX_CellData[32])
                {
                    ApplicationArea = Planning;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[32];
                    DecimalPlaces = 0 : 5;
                    Visible = Field32Visible;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(32);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(32);
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    var
        MATRIX_CurrentColumnOrdinal: Integer;
    begin
        MATRIX_CurrentColumnOrdinal := 0;
        while MATRIX_CurrentColumnOrdinal < MATRIX_NoOfMatrixColumns do begin
            MATRIX_CurrentColumnOrdinal := MATRIX_CurrentColumnOrdinal + 1;
            MATRIX_OnAfterGetRecord(MATRIX_CurrentColumnOrdinal);
        end;
        if (MATRIX_CurrentColumnOrdinal > 0) and (QtyType = QtyType::"Net Change") then
            Rec.SetRange("Date Filter", MatrixRecords[1]."Period Start", MatrixRecords[MATRIX_CurrentColumnOrdinal]."Period End");
    end;

    trigger OnInit()
    begin
        Field32Visible := true;
        Field31Visible := true;
        Field30Visible := true;
        Field29Visible := true;
        Field28Visible := true;
        Field27Visible := true;
        Field26Visible := true;
        Field25Visible := true;
        Field24Visible := true;
        Field23Visible := true;
        Field22Visible := true;
        Field21Visible := true;
        Field20Visible := true;
        Field19Visible := true;
        Field18Visible := true;
        Field17Visible := true;
        Field16Visible := true;
        Field15Visible := true;
        Field14Visible := true;
        Field13Visible := true;
        Field12Visible := true;
        Field11Visible := true;
        Field10Visible := true;
        Field9Visible := true;
        Field8Visible := true;
        Field7Visible := true;
        Field6Visible := true;
        Field5Visible := true;
        Field4Visible := true;
        Field3Visible := true;
        Field2Visible := true;
        Field1Visible := true;
    end;

    var
        LineDimCode: Text[30];
        LineDimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4";
        MatrixRecords: array[32] of Record Date;
        QtyType: Option "Net Change","Balance at Date";
        ForecastType: Option "Sales Item",Component,Both;
        ProductionForecastName: Code[10];
        LocationFilter: Text;
        DateFilter: Text;
        Text000: Label 'The Forecast On field must be Sales Items or Component.';
        Text001: Label 'A forecast was previously made on the %1. Do you want all forecasts of the period %2-%3 moved to the start of the period?', Comment = 'A forecast was previously made on the 01-10-11. Do you want all forecasts of the period 12/02/2012-12/03/2012 moved to the start of the period?';
        Text003: Label 'You must set a location filter.';
        Text004: Label 'You must change view to Sales Items or Component.';
        [InDataSet]
        Field1Visible: Boolean;
        [InDataSet]
        Field2Visible: Boolean;
        [InDataSet]
        Field3Visible: Boolean;
        [InDataSet]
        Field4Visible: Boolean;
        [InDataSet]
        Field5Visible: Boolean;
        [InDataSet]
        Field6Visible: Boolean;
        [InDataSet]
        Field7Visible: Boolean;
        [InDataSet]
        Field8Visible: Boolean;
        [InDataSet]
        Field9Visible: Boolean;
        [InDataSet]
        Field10Visible: Boolean;
        [InDataSet]
        Field11Visible: Boolean;
        [InDataSet]
        Field12Visible: Boolean;
        [InDataSet]
        Field13Visible: Boolean;
        [InDataSet]
        Field14Visible: Boolean;
        [InDataSet]
        Field15Visible: Boolean;
        [InDataSet]
        Field16Visible: Boolean;
        [InDataSet]
        Field17Visible: Boolean;
        [InDataSet]
        Field18Visible: Boolean;
        [InDataSet]
        Field19Visible: Boolean;
        [InDataSet]
        Field20Visible: Boolean;
        [InDataSet]
        Field21Visible: Boolean;
        [InDataSet]
        Field22Visible: Boolean;
        [InDataSet]
        Field23Visible: Boolean;
        [InDataSet]
        Field24Visible: Boolean;
        [InDataSet]
        Field25Visible: Boolean;
        [InDataSet]
        Field26Visible: Boolean;
        [InDataSet]
        Field27Visible: Boolean;
        [InDataSet]
        Field28Visible: Boolean;
        [InDataSet]
        Field29Visible: Boolean;
        [InDataSet]
        Field30Visible: Boolean;
        [InDataSet]
        Field31Visible: Boolean;
        [InDataSet]
        Field32Visible: Boolean;

    protected var
        MATRIX_NoOfMatrixColumns: Integer;
        MATRIX_CellData: array[32] of Decimal;
        MATRIX_CaptionSet: array[32] of Text[80];
    //copy-pasted
    local procedure LookUpCode(DimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4"; DimCode: Text[30]; "Code": Text[30])
    var
        GLAcc: Record "G/L Account";
        BusUnit: Record "Business Unit";
        DimVal: Record "Dimension Value";
    begin
        case DimOption of
            DimOption::"G/L Account":
                begin
                    GLAcc.Get(Code);
                    PAGE.RunModal(PAGE::"G/L Account List", GLAcc);
                end;
            DimOption::Period:
                ;
            DimOption::"Business Unit":
                begin
                    BusUnit.Get(Code);
                    PAGE.RunModal(PAGE::"Business Unit List", BusUnit);
                end;
            DimOption::"Global Dimension 1", DimOption::"Global Dimension 2",
            DimOption::"Budget Dimension 1", DimOption::"Budget Dimension 2",
            DimOption::"Budget Dimension 3", DimOption::"Budget Dimension 4":
                begin
                    DimVal.SetRange("Dimension Code", DimCode);
                    DimVal.Get(DimCode, Code);

                    PAGE.RunModal(PAGE::"Dimension Value List", DimVal);
                end;
        end;
    end;
    //copy-pasted

    local procedure SetDateFilter(ColumnID: Integer)
    begin
        if DateFilter <> '' then
            MatrixRecords[ColumnID].SetFilter("Period Start", DateFilter)
        else
            MatrixRecords[ColumnID].SetRange("Period Start");

        if QtyType = QtyType::"Net Change" then
            if MatrixRecords[ColumnID]."Period Start" = MatrixRecords[ColumnID]."Period End" then
                Rec.SetRange("Date Filter", MatrixRecords[ColumnID]."Period Start")
            else
                Rec.SetRange("Date Filter", MatrixRecords[ColumnID]."Period Start", MatrixRecords[ColumnID]."Period End")
        else
            Rec.SetRange("Date Filter", 0D, MatrixRecords[ColumnID]."Period End");
    end;

    procedure Load(MatrixColumns1: array[32] of Text[1024]; var MatrixRecords1: array[32] of Record Date; ProductionForecastName1: Code[10]; DateFilter1: Text; LocationFilter1: Text; ForecastType1: Option "Sales Item",Component,Both; QtyType1: Option "Net Change","Balance at Date"; NoOfMatrixColumns1: Integer)
    begin
        CopyArray(MATRIX_CaptionSet, MatrixColumns1, 1);
        CopyArray(MatrixRecords, MatrixRecords1, 1);

        ProductionForecastName := ProductionForecastName1;
        DateFilter := DateFilter1;
        LocationFilter := LocationFilter1;
        ForecastType := ForecastType1;
        QtyType := QtyType1;
        MATRIX_NoOfMatrixColumns := NoOfMatrixColumns1;

        if ForecastType = ForecastType::Component then
            Rec.SetRange("Calendar Component", true);
        if ForecastType = ForecastType::"Sales Item" then
            Rec.SetRange("Calendar Component", false);
        if ForecastType = ForecastType::Both then
            Rec.SetRange("Calendar Component");

        SetVisible;
    end;

    local procedure MatrixOnDrillDown(ColumnID: Integer)
    var
        ProductionForecastEntry: Record "CEO-Production Forecast Entry";
    begin
        SetDateFilter(ColumnID);
        ProductionForecastEntry.SetCurrentKey(
          "Calendar Name", "Item No.", "Location Code", "Calendar Date", "Calendar Component");
        ProductionForecastEntry.SetRange("Item No.", Rec.Code);
        if QtyType = QtyType::"Net Change" then
            ProductionForecastEntry.SetRange("Calendar Date", MatrixRecords[ColumnID]."Period Start", MatrixRecords[ColumnID]."Period End")
        else
            ProductionForecastEntry.SetRange("Calendar Date", 0D, MatrixRecords[ColumnID]."Period End");
        if ProductionForecastName <> '' then
            ProductionForecastEntry.SetRange("Calendar Name", ProductionForecastName)
        else
            ProductionForecastEntry.SetRange("Calendar Name");
        if LocationFilter <> '' then
            ProductionForecastEntry.SetFilter("Location Code", LocationFilter)
        else
            ProductionForecastEntry.SetRange("Location Code");
        ProductionForecastEntry.SetFilter("Calendar Component", Rec.GetFilter("Calendar Component"));
        PAGE.Run(0, ProductionForecastEntry);
    end;

    local procedure MATRIX_OnAfterGetRecord(ColumnOrdinal: Integer)
    begin
        SetDateFilter(ColumnOrdinal);
        if ProductionForecastName <> '' then
            Rec.SetRange("Calendar Name", ProductionForecastName)
        else
            Rec.SetRange("Calendar Name");
        if LocationFilter <> '' then
            Rec.SetFilter("Location Filter", LocationFilter)
        else
            Rec.SetRange("Location Filter");

        if ForecastType = ForecastType::Component then
            Rec.SetRange("Calendar Component", true);
        if ForecastType = ForecastType::"Sales Item" then
            Rec.SetRange("Calendar Component", false);
        if ForecastType = ForecastType::Both then
            Rec.SetRange("Calendar Component");

        Rec.CalcFields("No. of People");
        MATRIX_CellData[ColumnOrdinal] := Rec."No. of People";
    end;

    procedure SetVisible()
    begin
        Field1Visible := MATRIX_CaptionSet[1] <> '';
        Field2Visible := MATRIX_CaptionSet[2] <> '';
        Field3Visible := MATRIX_CaptionSet[3] <> '';
        Field4Visible := MATRIX_CaptionSet[4] <> '';
        Field5Visible := MATRIX_CaptionSet[5] <> '';
        Field6Visible := MATRIX_CaptionSet[6] <> '';
        Field7Visible := MATRIX_CaptionSet[7] <> '';
        Field8Visible := MATRIX_CaptionSet[8] <> '';
        Field9Visible := MATRIX_CaptionSet[9] <> '';
        Field10Visible := MATRIX_CaptionSet[10] <> '';
        Field11Visible := MATRIX_CaptionSet[11] <> '';
        Field12Visible := MATRIX_CaptionSet[12] <> '';
        Field13Visible := MATRIX_CaptionSet[13] <> '';
        Field14Visible := MATRIX_CaptionSet[14] <> '';
        Field15Visible := MATRIX_CaptionSet[15] <> '';
        Field16Visible := MATRIX_CaptionSet[16] <> '';
        Field17Visible := MATRIX_CaptionSet[17] <> '';
        Field18Visible := MATRIX_CaptionSet[18] <> '';
        Field19Visible := MATRIX_CaptionSet[19] <> '';
        Field20Visible := MATRIX_CaptionSet[20] <> '';
        Field21Visible := MATRIX_CaptionSet[21] <> '';
        Field22Visible := MATRIX_CaptionSet[22] <> '';
        Field23Visible := MATRIX_CaptionSet[23] <> '';
        Field24Visible := MATRIX_CaptionSet[24] <> '';
        Field25Visible := MATRIX_CaptionSet[25] <> '';
        Field26Visible := MATRIX_CaptionSet[26] <> '';
        Field27Visible := MATRIX_CaptionSet[27] <> '';
        Field28Visible := MATRIX_CaptionSet[28] <> '';
        Field29Visible := MATRIX_CaptionSet[29] <> '';
        Field30Visible := MATRIX_CaptionSet[30] <> '';
        Field31Visible := MATRIX_CaptionSet[31] <> '';
        Field32Visible := MATRIX_CaptionSet[32] <> '';
    end;

    local procedure QtyValidate(ColumnID: Integer)
    begin
        EnterBaseQty(ColumnID);
        ProdForecastQtyBase_OnValidate(ColumnID);
    end;

    local procedure EnterBaseQty(ColumnID: Integer)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeEnterBaseQty(Rec, ColumnID, IsHandled);
        if IsHandled then
            exit;

        SetDateFilter(ColumnID);
        if QtyType = QtyType::"Net Change" then
            Rec.SetRange("Date Filter", MatrixRecords[ColumnID]."Period Start", MatrixRecords[ColumnID]."Period End")
        else
            Rec.SetRange("Date Filter", 0D, MatrixRecords[ColumnID]."Period End");
        if ProductionForecastName <> '' then
            Rec.SetRange("Calendar Name", ProductionForecastName)
        else
            Rec.SetRange("Calendar Name");
        if LocationFilter <> '' then
            Rec.SetFilter("Location Filter", LocationFilter)
        else
            Rec.SetRange("Location Filter");

        if ForecastType = ForecastType::Component then
            Rec.SetRange("Calendar Component", true);
        if ForecastType = ForecastType::"Sales Item" then
            Rec.SetRange("Calendar Component", false);
        if ForecastType = ForecastType::Both then
            Rec.SetRange("Calendar Component");
        Rec.Validate("No. of People", MATRIX_CellData[ColumnID]);
    end;

    local procedure ProdForecastQtyBase_OnValidate(ColumnID: Integer)
    var
        ProdForecastEntry: Record "CEO-Production Forecast Entry";
        ProdForecastEntry2: Record "CEO-Production Forecast Entry";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeProdForecastQtyBase_OnValidate(Rec, ColumnID, IsHandled);
        if IsHandled then
            exit;

        if ForecastType = ForecastType::Both then
            Error(Text000);

        ProdForecastEntry.SetCurrentKey("Calendar Name", "Item No.", "Location Code", "Calendar Date", "Calendar Component");
        ProdForecastEntry.SetRange("Calendar Name", Rec.GetFilter("Calendar Name"));
        ProdForecastEntry.SetRange("Item No.", Rec."No.");
        ProdForecastEntry.SetFilter("Location Code", Rec.GetFilter("Location Filter"));
        ProdForecastEntry.SetRange(
          "Calendar Date",
          MatrixRecords[ColumnID]."Period Start",
          MatrixRecords[ColumnID]."Period End");
        ProdForecastEntry.SetFilter("Calendar Component", Rec.GetFilter("Calendar Component"));
        if ProdForecastEntry.FindLast then
            if ProdForecastEntry."Calendar Date" > MatrixRecords[ColumnID]."Period Start" then
                if Confirm(
                     Text001,
                     false,
                     ProdForecastEntry."Calendar Date",
                     MatrixRecords[ColumnID]."Period Start",
                     MatrixRecords[ColumnID]."Period End")
                then
                    ProdForecastEntry.ModifyAll("Calendar Date", MatrixRecords[ColumnID]."Period Start")
                else
                    Error(Text004);
        ProdForecastEntry2.SetCurrentKey(
          "Calendar Name", "Item No.", "Location Code", "Calendar Date", "Calendar Component");
        if Rec.GetFilter("Location Filter") = '' then begin
            ProdForecastEntry2.CopyFilters(ProdForecastEntry);
            ProdForecastEntry2.SetFilter("Location Code", '>%1', '');
            if ProdForecastEntry2.FindSet then
                repeat
                    if ProdForecastByLocationQtyBase(ProdForecastEntry2) <> 0 then
                        Error(Text003);
                    ProdForecastEntry2.SetFilter("Location Code", '>%1', ProdForecastEntry2."Location Code");
                until ProdForecastEntry2.Next() = 0;
        end;
    end;

    local procedure ProdForecastByLocationQtyBase(var SourceProdForecastEntry: Record "CEO-Production Forecast Entry"): Decimal
    var
        ProductionForecastEntry: Record "CEO-Production Forecast Entry";
    begin
        ProductionForecastEntry.CopyFilters(SourceProdForecastEntry);
        ProductionForecastEntry.SetRange("Location Code", SourceProdForecastEntry."Location Code");
        ProductionForecastEntry.CalcSums("Number of People");
        exit(ProductionForecastEntry."Number of People");
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeEnterBaseQty(var Item: Record "CEO-Calendar Entries"; ColumnID: Integer; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeProdForecastQtyBase_OnValidate(var Item: Record "CEO-Calendar Entries"; ColumnID: Integer; var IsHandled: Boolean);
    begin
    end;
}

