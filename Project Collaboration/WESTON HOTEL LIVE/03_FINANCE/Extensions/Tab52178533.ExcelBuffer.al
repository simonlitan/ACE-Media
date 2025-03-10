// table 52178533 "Excel Buffer1"

// {
//     Caption = 'Excel Buffer';

//     fields
//     {
//         field(1; "Row No."; Integer)
//         {
//             Caption = 'Row No.';

//             trigger OnValidate()
//             begin
//                 xlRowID := '';
//                 IF "Row No." <> 0 THEN
//                     xlRowID := FORMAT("Row No.");
//             end;
//         }
//         field(2; xlRowID; Text[10])
//         {
//             Caption = 'xlRowID';
//         }
//         field(3; "Column No."; Integer)
//         {
//             Caption = 'Column No.';

//             trigger OnValidate()
//             var
//                 x: Integer;
//                 i: Integer;
//                 y: Integer;
//                 c: Char;
//                 t: Text[30];
//             begin
//                 xlColID := '';
//                 x := "Column No.";
//                 WHILE x > 26 DO BEGIN
//                     y := x MOD 26;
//                     IF y = 0 THEN
//                         y := 26;
//                     c := 64 + y;
//                     i := i + 1;
//                     t[i] := c;
//                     x := (x - y) DIV 26;
//                 END;
//                 IF x > 0 THEN BEGIN
//                     c := 64 + x;
//                     i := i + 1;
//                     t[i] := c;
//                 END;
//                 FOR x := 1 TO i DO
//                     xlColID[x] := t[1 + i - x];
//             end;
//         }
//         field(4; xlColID; Text[10])
//         {
//             Caption = 'xlColID';
//         }
//         field(5; "Cell Value as Text"; Text[250])
//         {
//             Caption = 'Cell Value as Text';
//         }
//         field(6; Comment; Text[250])
//         {
//             Caption = 'Comment';
//         }
//         field(7; Formula; Text[250])
//         {
//             Caption = 'Formula';
//         }
//         field(8; Bold; Boolean)
//         {
//             Caption = 'Bold';
//         }
//         field(9; Italic; Boolean)
//         {
//             Caption = 'Italic';
//         }
//         field(10; Underline; Boolean)
//         {
//             Caption = 'Underline';
//         }
//         field(11; NumberFormat; Text[30])
//         {
//             Caption = 'NumberFormat';
//         }
//         field(12; Formula2; Text[250])
//         {
//             Caption = 'Formula2';
//         }
//         field(13; Formula3; Text[250])
//         {
//             Caption = 'Formula3';
//         }
//         field(14; Formula4; Text[250])
//         {
//             Caption = 'Formula4';
//         }
//         field(15; "Cell Type"; Option)
//         {
//             Caption = 'Cell Type';
//             OptionCaption = 'Number,Text,Date,Time';
//             OptionMembers = Number,Text,Date,Time;
//         }
//     }

//     keys
//     {
//         key(Key1; "Row No.", "Column No.")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//     }

//     var
//         Text000: Label 'Excel not found.', Comment = '{Locked="Excel"}';
//         Text001: Label 'You must enter a file name.';
//         Text002: Label 'You must enter an Excel worksheet name.', Comment = '{Locked="Excel"}';
//         Text003: Label 'The file %1 does not exist.';
//         Text004: Label 'The Excel worksheet %1 does not exist.', Comment = '{Locked="Excel"}';
//         Text005: Label 'Creating Excel worksheet...\\', Comment = '{Locked="Excel"}';
//         Text006: Label '%1%3%4%3Page %2';
//         Text007: Label 'Reading Excel worksheet...\\', Comment = '{Locked="Excel"}';
//         Text013: Label '&B';
//         Text014: Label '&D';
//         Text015: Label '&P';
//         Text016: Label 'A1';
//         Text017: Label 'SUMIF';
//         Text018: Label '#N/A';
//         Text019: Label 'GLAcc', Comment = '{Locked} Used to define an Excel range name. You must refer to Excel rules to change this term.';
//         Text020: Label 'Period', Comment = '{Locked} Used to define an Excel range name. You must refer to Excel rules to change this term.';
//         Text021: Label 'Budget';
//         InfoExcelBuf: Record 52178533 temporary;
//         FileManagement: Codeunit 419;
//         XlWrkBkWriter: DotNet WorkbookWriter;
//         XlWrkBkReader: DotNet WorkbookReader;
//         XlWrkShtWriter: DotNet WorksheetWriter;
//         XlWrkShtReader: DotNet WorksheetReader;
//         [RunOnClient]
//         XlApp: DotNet ApplicationClass;
//         [RunOnClient]
//         XlWrkBk: DotNet Workbook;
//         [RunOnClient]
//         XlWrkSht: DotNet Worksheet;
//         [RunOnClient]
//         XlHelper: DotNet ExcelHelper;
//         // ActiveSheetName: Text[250];
//         RangeStartXlRow: Text[30];
//         RangeStartXlCol: Text[30];
//         RangeEndXlRow: Text[30];
//         RangeEndXlCol: Text[30];
//         FileNameServer: Text;
//         FriendlyName: Text;
//         CurrentRow: Integer;
//         CurrentCol: Integer;
//         UseInfoSheet: Boolean;
//         Text022: Label 'CostAcc', Comment = '{Locked} Used to define an Excel range name. You must refer to Excel rules to change this term.';
//         Text023: Label 'Information';
//         Text034: Label 'Excel Files (*.xls*)|*.xls*|All Files (*.*)|*.*', Comment = '{Split=r''\|\*\..{1,4}\|?''}{Locked="Excel"}';
//         Text035: Label 'The operation was canceled.';
//         Text036: Label 'The Excel workbook does not exist.', Comment = '{Locked="Excel"}';
//         Text037: Label 'Could not create the Excel workbook.', Comment = '{Locked="Excel"}';
//         Text038: Label 'Global variable %1 is not included for test.';
//         Text039: Label 'Cell type has not been set.';
//         Text040: Label 'Export Excel File', Comment = '{Locked="Excel"}';
//         SavingDocumentMsg: Label 'Saving the following document: %1.';
//         SelectWorksheetMsg: Label 'Choose the Microsoft Excel worksheet.', Comment = '{Locked="Microsoft Excel"}';
//         ExcelFileExtensionTok: Label '.xlsx', Locked = true;

//     [Scope('Internal')]
//     procedure CreateBook(SheetName: Text[250])
//     begin
//         IF SheetName = '' THEN
//             ERROR(Text002);

//         FileNameServer := FileManagement.ServerTempFileName('xlsx');
//         XlWrkBkWriter := XlWrkBkWriter.Create(FileNameServer);
//         IF ISNULL(XlWrkBkWriter) THEN
//             ERROR(Text037);

//         XlWrkShtWriter := XlWrkBkWriter.FirstWorksheet;
//         IF SheetName <> '' THEN BEGIN
//             XlWrkShtWriter.Name := SheetName;
//             ActiveSheetName := SheetName;
//         END
//     end;

//     [Scope('Internal')]
//     procedure OpenBook(FileName: Text; SheetName: Text[250])
//     begin
//         IF FileName = '' THEN
//             ERROR(Text001);

//         IF SheetName = '' THEN
//             ERROR(Text002);

//         XlWrkBkReader := XlWrkBkReader.Open(FileName);
//         IF XlWrkBkReader.HasWorksheet(SheetName) THEN BEGIN
//             XlWrkShtReader := XlWrkBkReader.GetWorksheetByName(SheetName);
//         END ELSE BEGIN
//             QuitExcel;
//             ERROR(Text004, SheetName);
//         END;
//     end;

//     [Scope('Internal')]
//     procedure UpdateBook(FileName: Text; SheetName: Text[250])
//     begin
//         IF FileName = '' THEN
//             ERROR(Text001);

//         IF SheetName = '' THEN
//             ERROR(Text002);

//         FileNameServer := FileName;
//         XlWrkBkWriter := XlWrkBkWriter.Open(FileNameServer);
//         IF XlWrkBkWriter.HasWorksheet(SheetName) THEN BEGIN
//             XlWrkShtWriter := XlWrkBkWriter.GetWorksheetByName(SheetName);
//             ActiveSheetName := SheetName;
//         END ELSE BEGIN
//             QuitExcel;
//             ERROR(Text004, SheetName);
//         END;
//     end;

//     [Scope('Internal')]
//     procedure CloseBook()
//     begin
//         IF NOT ISNULL(XlWrkBkWriter) THEN BEGIN
//             XlWrkBkWriter.ClearFormulaCalculations;
//             XlWrkBkWriter.ValidateDocument;
//             XlWrkBkWriter.Close;
//             CLEAR(XlWrkShtWriter);
//             CLEAR(XlWrkBkWriter);
//         END;

//         IF NOT ISNULL(XlWrkBkReader) THEN BEGIN
//             CLEAR(XlWrkShtReader);
//             CLEAR(XlWrkBkReader);
//         END;
//     end;

//     [Scope('Internal')]
//     procedure WriteSheet(ReportHeader: Text[80]; CompanyName: Text[30]; UserID2: Text)
//     var
//         ExcelBufferDialogMgt: Codeunit 5370;
//         OrientationValues: DotNet OrientationValues;
//         CRLF: Char;
//         RecNo: Integer;
//         InfoRecNo: Integer;
//         TotalRecNo: Integer;
//         LastUpdate: DateTime;
//     begin
//         LastUpdate := CURRENTDATETIME;
//         ExcelBufferDialogMgt.Open(Text005);

//         CRLF := 10;
//         RecNo := 1;
//         TotalRecNo := COUNT + InfoExcelBuf.COUNT;
//         RecNo := 0;

//         XlWrkShtWriter.AddPageSetup(OrientationValues.Landscape);

//         // commit is required because of the result boolean check of ExcelBufferDialogMgt.RUN
//         COMMIT;

//         IF FINDSET THEN
//             REPEAT
//                 RecNo := RecNo + 1;
//                 IF NOT UpdateProgressDialog(ExcelBufferDialogMgt, LastUpdate, RecNo, TotalRecNo) THEN BEGIN
//                     QuitExcel;
//                     ERROR(Text035)
//                 END;
//                 IF Formula = '' THEN
//                     WriteCellValue(Rec)
//                 ELSE
//                     WriteCellFormula(Rec)
//             UNTIL NEXT = 0;

//         IF ReportHeader <> '' THEN
//             XlWrkShtWriter.AddHeader(
//               TRUE,
//               STRSUBSTNO('%1%2%1%3%4', GetExcelReference(1), ReportHeader, CRLF, CompanyName));

//         XlWrkShtWriter.AddHeader(
//           FALSE,
//           STRSUBSTNO(Text006, GetExcelReference(2), GetExcelReference(3), CRLF, UserID2));

//         IF UseInfoSheet THEN
//             IF InfoExcelBuf.FINDSET THEN BEGIN
//                 XlWrkShtWriter := XlWrkBkWriter.AddWorksheet(Text023);
//                 REPEAT
//                     InfoRecNo := InfoRecNo + 1;
//                     IF NOT UpdateProgressDialog(ExcelBufferDialogMgt, LastUpdate, RecNo + InfoRecNo, TotalRecNo) THEN BEGIN
//                         QuitExcel;
//                         ERROR(Text035)
//                     END;
//                     IF InfoExcelBuf.Formula = '' THEN
//                         WriteCellValue(InfoExcelBuf)
//                     ELSE
//                         WriteCellFormula(InfoExcelBuf)
//                 UNTIL InfoExcelBuf.NEXT = 0;
//             END;

//         ExcelBufferDialogMgt.Close;
//     end;

//     local procedure WriteCellValue(ExcelBuffer: Record 52178533)
//     var
//         Decorator: DotNet CellDecorator;
//     begin
//         WITH ExcelBuffer DO BEGIN
//             GetCellDecorator(Bold, Italic, Underline, Decorator);

//             CASE "Cell Type" OF
//                 "Cell Type"::Number:
//                     XlWrkShtWriter.SetCellValueNumber("Row No.", xlColID, "Cell Value as Text", NumberFormat, Decorator);
//                 "Cell Type"::Text:
//                     XlWrkShtWriter.SetCellValueText("Row No.", xlColID, "Cell Value as Text", Decorator);
//                 "Cell Type"::Date:
//                     XlWrkShtWriter.SetCellValueDate("Row No.", xlColID, "Cell Value as Text", NumberFormat, Decorator);
//                 "Cell Type"::Time:
//                     XlWrkShtWriter.SetCellValueTime("Row No.", xlColID, "Cell Value as Text", NumberFormat, Decorator);
//                 ELSE
//                     ERROR(Text039)
//             END;
//         END;
//     end;

//     local procedure WriteCellFormula(ExcelBuffer: Record 52178533)
//     var
//         Decorator: DotNet CellDecorator;
//     begin
//         WITH ExcelBuffer DO BEGIN
//             GetCellDecorator(Bold, Italic, Underline, Decorator);

//             XlWrkShtWriter.SetCellFormula("Row No.", xlColID, GetFormula, NumberFormat, Decorator);
//         END;
//     end;

//     local procedure GetCellDecorator(IsBold: Boolean; IsItalic: Boolean; IsUnderlined: Boolean; var Decorator: DotNet CellDecorator)
//     begin
//         IF IsBold AND IsItalic AND IsUnderlined THEN BEGIN
//             Decorator := XlWrkShtWriter.DefaultBoldItalicUnderlinedCellDecorator;
//             EXIT;
//         END;

//         IF IsBold AND IsItalic THEN BEGIN
//             Decorator := XlWrkShtWriter.DefaultBoldItalicCellDecorator;
//             EXIT;
//         END;

//         IF IsBold AND IsUnderlined THEN BEGIN
//             Decorator := XlWrkShtWriter.DefaultBoldUnderlinedCellDecorator;
//             EXIT;
//         END;

//         IF IsBold THEN BEGIN
//             Decorator := XlWrkShtWriter.DefaultBoldCellDecorator;
//             EXIT;
//         END;

//         IF IsItalic AND IsUnderlined THEN BEGIN
//             Decorator := XlWrkShtWriter.DefaultItalicUnderlinedCellDecorator;
//             EXIT;
//         END;

//         IF IsItalic THEN BEGIN
//             Decorator := XlWrkShtWriter.DefaultItalicCellDecorator;
//             EXIT;
//         END;

//         IF IsUnderlined THEN
//             Decorator := XlWrkShtWriter.DefaultUnderlinedCellDecorator
//         ELSE
//             Decorator := XlWrkShtWriter.DefaultCellDecorator;
//     end;

//     [Scope('Internal')]
//     procedure CreateRangeName(RangeName: Text[30]; FromColumnNo: Integer; FromRowNo: Integer)
//     var
//         TempExcelBuf: Record 52178533 temporary;
//         ToxlRowID: Text[10];
//     begin
//         SETCURRENTKEY("Row No.", "Column No.");
//         IF FIND('+') THEN
//             ToxlRowID := xlRowID;
//         TempExcelBuf.VALIDATE("Row No.", FromRowNo);
//         TempExcelBuf.VALIDATE("Column No.", FromColumnNo);

//         XlWrkShtWriter.AddRange(
//           RangeName,
//           GetExcelReference(4) + TempExcelBuf.xlColID + GetExcelReference(4) + TempExcelBuf.xlRowID +
//           ':' +
//           GetExcelReference(4) + TempExcelBuf.xlColID + GetExcelReference(4) + ToxlRowID);
//     end;

//     [Scope('Internal')]
//     procedure GiveUserControl()
//     begin
//         IF NOT ISNULL(XlApp) THEN BEGIN
//             XlApp.Visible := TRUE;
//             XlApp.UserControl := TRUE;
//             CLEAR(XlApp);
//         END;
//     end;

//     [Scope('Internal')]
//     procedure ReadSheet()
//     var
//         ExcelBufferDialogMgt: Codeunit 5370;
//         CellData: DotNet CellData;
//         Enumerator: DotNet IEnumerator;
//         i: Integer;
//         RowCount: Integer;
//         LastUpdate: DateTime;
//     begin
//         LastUpdate := CURRENTDATETIME;
//         ExcelBufferDialogMgt.Open(Text007);
//         DELETEALL;

//         Enumerator := XlWrkShtReader.GetEnumerator;
//         RowCount := XlWrkShtReader.RowCount;
//         WHILE Enumerator.MoveNext DO BEGIN
//             CellData := Enumerator.Current;
//             IF CellData.HasValue THEN BEGIN
//                 VALIDATE("Row No.", CellData.RowNumber);
//                 VALIDATE("Column No.", CellData.ColumnNumber);
//                 ParseCellValue(CellData.Value, CellData.Format);
//                 INSERT;
//             END;

//             i := i + 1;
//             COMMIT;
//             IF NOT UpdateProgressDialog(ExcelBufferDialogMgt, LastUpdate, i, RowCount) THEN BEGIN
//                 QuitExcel;
//                 ERROR(Text035)
//             END;
//         END;

//         QuitExcel;
//         ExcelBufferDialogMgt.Close;
//     end;

//     local procedure ParseCellValue(Value: Text; FormatString: Text)
//     var
//         Decimal: Decimal;
//     begin
//         // The format contains only en-US number separators, this is an OpenXML standard requirement
//         // The algorithm sieves the data based on formatting as follows (the steps must run in this order)
//         // 1. FormatString = '@' -> Text
//         // 2. FormatString.Contains(':') -> Time
//         // 3. FormatString.ContainsOneOf('y', 'm', 'd') && FormatString.DoesNotContain('Red') -> Date
//         // 4. anything else -> Decimal

//         NumberFormat := COPYSTR(FormatString, 1, 30);

//         IF FormatString = '@' THEN BEGIN
//             "Cell Type" := "Cell Type"::Text;
//             "Cell Value as Text" := Value;
//             EXIT;
//         END;

//         EVALUATE(Decimal, Value);

//         IF STRPOS(FormatString, ':') <> 0 THEN BEGIN
//             // Excel Time is stored in OADate format
//             "Cell Type" := "Cell Type"::Time;
//             "Cell Value as Text" := FORMAT(DT2TIME(ConvertDateTimeDecimalToDateTime(Decimal)));
//             EXIT;
//         END;

//         IF ((STRPOS(FormatString, 'y') <> 0) OR
//             (STRPOS(FormatString, 'm') <> 0) OR
//             (STRPOS(FormatString, 'd') <> 0)) AND
//            (STRPOS(FormatString, 'Red') = 0)
//         THEN BEGIN
//             "Cell Type" := "Cell Type"::Date;
//             "Cell Value as Text" := FORMAT(DT2DATE(ConvertDateTimeDecimalToDateTime(Decimal)));
//             EXIT;
//         END;

//         "Cell Type" := "Cell Type"::Number;
//         "Cell Value as Text" := FORMAT(ROUND(Decimal, 0.000001), 0, 1);
//     end;

//     [Scope('Internal')]
//     procedure SelectSheetsName(FileName: Text): Text[250]
//     var
//         SheetNames: DotNet ArrayList;
//         SheetName: Text[250];
//         SelectedSheetName: Text[250];
//         SheetsList: Text[250];
//         EndOfLoop: Integer;
//         i: Integer;
//         OptionNo: Integer;
//     begin
//         IF FileName = '' THEN
//             ERROR(Text001);

//         XlWrkBkReader := XlWrkBkReader.Open(FileName);

//         SheetNames := SheetNames.ArrayList(XlWrkBkReader.SheetNames);
//         IF NOT ISNULL(SheetNames) THEN BEGIN
//             i := 0;
//             EndOfLoop := SheetNames.Count - 1;
//             WHILE i <= EndOfLoop DO BEGIN
//                 SheetName := SheetNames.Item(i);
//                 IF (SheetName <> '') AND (STRLEN(SheetsList) + STRLEN(SheetName) < 250) THEN
//                     SheetsList := SheetsList + SheetName + ','
//                 ELSE
//                     i := EndOfLoop;
//                 i := i + 1;
//             END;
//             IF i > 1 THEN BEGIN
//                 IF SheetsList <> '' THEN BEGIN
//                     OptionNo := STRMENU(SheetsList, 1, SelectWorksheetMsg);
//                     IF OptionNo <> 0 THEN
//                         SelectedSheetName := SELECTSTR(OptionNo, SheetsList);
//                 END
//             END ELSE
//                 SelectedSheetName := SheetName;
//         END;

//         QuitExcel;
//         EXIT(SelectedSheetName);
//     end;

//     [Scope('Internal')]
//     procedure GetExcelReference(Which: Integer): Text[250]
//     begin
//         CASE Which OF
//             1:
//                 EXIT(Text013);
//                 // DO NOT TRANSLATE: &B is the Excel code to turn bold printing on or off for customized Header/Footer.
//             2:
//                 EXIT(Text014);
//                 // DO NOT TRANSLATE: &D is the Excel code to print the current date in customized Header/Footer.
//             3:
//                 EXIT(Text015);
//                 // DO NOT TRANSLATE: &P is the Excel code to print the page number in customized Header/Footer.
//             4:
//                 EXIT('$');
//                 // DO NOT TRANSLATE: $ is the Excel code for absolute reference to cells.
//             5:
//                 EXIT(Text016);
//                 // DO NOT TRANSLATE: A1 is the Excel reference of the first cell.
//             6:
//                 EXIT(Text017);
//                 // DO NOT TRANSLATE: SUMIF is the name of the Excel function used to summarize values according to some conditions.
//             7:
//                 EXIT(Text018);
//                 // DO NOT TRANSLATE: The #N/A Excel error value occurs when a value is not available to a function or formula.
//             8:
//                 EXIT(Text019);
//                 // DO NOT TRANSLATE: GLAcc is used to define an Excel range name. You must refer to Excel rules to change this term.
//             9:
//                 EXIT(Text020);
//                 // DO NOT TRANSLATE: Period is used to define an Excel range name. You must refer to Excel rules to change this term.
//             10:
//                 EXIT(Text021);
//                 // DO NOT TRANSLATE: Budget is used to define an Excel worksheet name. You must refer to Excel rules to change this term.
//             11:
//                 EXIT(Text022);
//                 // DO NOT TRANSLATE: CostAcc is used to define an Excel range name. You must refer to Excel rules to change this term.
//         END;
//     end;

//     [Scope('Internal')]
//     procedure ExportBudgetFilterToFormula(var ExcelBuf: Record 52178533): Boolean
//     var
//         ExcelBufFormula: Record 52178533 temporary;
//         FirstRow: Integer;
//         LastRow: Integer;
//         HasFormulaError: Boolean;
//         ThisCellHasFormulaError: Boolean;
//         ExcelBufFormula2: Record 52178533 temporary;
//     begin
//         ExcelBuf.SETFILTER(Formula, '<>%1', '');
//         IF ExcelBuf.FINDSET THEN
//             REPEAT
//                 ExcelBufFormula := ExcelBuf;
//                 ExcelBufFormula.INSERT;
//             UNTIL ExcelBuf.NEXT = 0;
//         ExcelBuf.RESET;

//         WITH ExcelBufFormula DO
//             IF FINDSET THEN
//                 REPEAT
//                     ThisCellHasFormulaError := FALSE;
//                     ExcelBuf.SETRANGE("Column No.", 1);
//                     ExcelBuf.SETFILTER("Row No.", '<>%1', "Row No.");
//                     ExcelBuf.SETFILTER("Cell Value as Text", Formula);
//                     ExcelBufFormula2 := ExcelBufFormula;
//                     IF ExcelBuf.FINDSET THEN
//                         REPEAT
//                             IF NOT GET(ExcelBuf."Row No.", "Column No.") THEN
//                                 ExcelBuf.MARK(TRUE);
//                         UNTIL ExcelBuf.NEXT = 0;
//                     ExcelBufFormula := ExcelBufFormula2;
//                     ClearFormula;
//                     ExcelBuf.SETRANGE("Cell Value as Text");
//                     ExcelBuf.SETRANGE("Row No.");
//                     IF ExcelBuf.FINDSET THEN
//                         REPEAT
//                             IF ExcelBuf.MARK THEN BEGIN
//                                 LastRow := ExcelBuf."Row No.";
//                                 IF FirstRow = 0 THEN
//                                     FirstRow := LastRow;
//                             END ELSE
//                                 IF FirstRow <> 0 THEN BEGIN
//                                     IF FirstRow = LastRow THEN
//                                         ThisCellHasFormulaError := AddToFormula(xlColID + FORMAT(FirstRow))
//                                     ELSE
//                                         ThisCellHasFormulaError :=
//                                           AddToFormula('SUM(' + xlColID + FORMAT(FirstRow) + ':' + xlColID + FORMAT(LastRow) + ')');
//                                     FirstRow := 0;
//                                     IF ThisCellHasFormulaError THEN
//                                         SetFormula(ExcelBuf.GetExcelReference(7));
//                                 END;
//                         UNTIL ThisCellHasFormulaError OR (ExcelBuf.NEXT = 0);

//                     IF NOT ThisCellHasFormulaError AND (FirstRow <> 0) THEN BEGIN
//                         IF FirstRow = LastRow THEN
//                             ThisCellHasFormulaError := AddToFormula(xlColID + FORMAT(FirstRow))
//                         ELSE
//                             ThisCellHasFormulaError :=
//                               AddToFormula('SUM(' + xlColID + FORMAT(FirstRow) + ':' + xlColID + FORMAT(LastRow) + ')');
//                         FirstRow := 0;
//                         IF ThisCellHasFormulaError THEN
//                             SetFormula(ExcelBuf.GetExcelReference(7));
//                     END;

//                     ExcelBuf.RESET;
//                     ExcelBuf.GET("Row No.", "Column No.");
//                     ExcelBuf.SetFormula(GetFormula);
//                     ExcelBuf.MODIFY;
//                     HasFormulaError := HasFormulaError OR ThisCellHasFormulaError;
//                 UNTIL NEXT = 0;

//         EXIT(HasFormulaError);
//     end;

//     [Scope('Internal')]
//     procedure AddToFormula(Text: Text[30]): Boolean
//     var
//         Overflow: Boolean;
//         LongFormula: Text[1000];
//     begin
//         LongFormula := GetFormula;
//         IF LongFormula = '' THEN
//             LongFormula := '=';
//         IF LongFormula <> '=' THEN
//             IF STRLEN(LongFormula) + 1 > MAXSTRLEN(LongFormula) THEN
//                 Overflow := TRUE
//             ELSE
//                 LongFormula := LongFormula + '+';
//         IF STRLEN(LongFormula) + STRLEN(Text) > MAXSTRLEN(LongFormula) THEN
//             Overflow := TRUE
//         ELSE
//             SetFormula(LongFormula + Text);
//         EXIT(Overflow);
//     end;

//     [Scope('Internal')]
//     procedure GetFormula(): Text[1000]
//     begin
//         EXIT(Formula + Formula2 + Formula3 + Formula4);
//     end;

//     [Scope('Internal')]
//     procedure SetFormula(LongFormula: Text[1000])
//     begin
//         ClearFormula;
//         IF LongFormula = '' THEN
//             EXIT;

//         Formula := COPYSTR(LongFormula, 1, MAXSTRLEN(Formula));
//         IF STRLEN(LongFormula) > MAXSTRLEN(Formula) THEN
//             Formula2 := COPYSTR(LongFormula, MAXSTRLEN(Formula) + 1, MAXSTRLEN(Formula2));
//         IF STRLEN(LongFormula) > MAXSTRLEN(Formula) + MAXSTRLEN(Formula2) THEN
//             Formula3 := COPYSTR(LongFormula, MAXSTRLEN(Formula) + MAXSTRLEN(Formula2) + 1, MAXSTRLEN(Formula3));
//         IF STRLEN(LongFormula) > MAXSTRLEN(Formula) + MAXSTRLEN(Formula2) + MAXSTRLEN(Formula3) THEN
//             Formula4 := COPYSTR(LongFormula, MAXSTRLEN(Formula) + MAXSTRLEN(Formula2) + MAXSTRLEN(Formula3) + 1, MAXSTRLEN(Formula4));
//     end;

//     [Scope('Internal')]
//     procedure ClearFormula()
//     begin
//         Formula := '';
//         Formula2 := '';
//         Formula3 := '';
//         Formula4 := '';
//     end;

//     [Scope('Internal')]
//     procedure NewRow()
//     begin
//         CurrentRow := CurrentRow + 1;
//         CurrentCol := 0;
//     end;

//     [Scope('Internal')]
//     procedure AddColumn(Value: Variant; IsFormula: Boolean; CommentText: Text[1000]; IsBold: Boolean; IsItalics: Boolean; IsUnderline: Boolean; NumFormat: Text[30]; CellType: Option)
//     begin
//         IF CurrentRow < 1 THEN
//             NewRow;

//         CurrentCol := CurrentCol + 1;
//         INIT;
//         VALIDATE("Row No.", CurrentRow);
//         VALIDATE("Column No.", CurrentCol);
//         IF IsFormula THEN
//             SetFormula(FORMAT(Value))
//         ELSE
//             "Cell Value as Text" := FORMAT(Value);
//         Comment := CommentText;
//         Bold := IsBold;
//         Italic := IsItalics;
//         Underline := IsUnderline;
//         NumberFormat := NumFormat;
//         "Cell Type" := CellType;
//         INSERT;
//     end;

//     [Scope('Internal')]
//     procedure StartRange()
//     var
//         TempExcelBuf: Record 52178533 temporary;
//     begin
//         TempExcelBuf.VALIDATE("Row No.", CurrentRow);
//         TempExcelBuf.VALIDATE("Column No.", CurrentCol);

//         RangeStartXlRow := TempExcelBuf.xlRowID;
//         RangeStartXlCol := TempExcelBuf.xlColID;
//     end;

//     [Scope('Internal')]
//     procedure EndRange()
//     var
//         TempExcelBuf: Record 52178533 temporary;
//     begin
//         TempExcelBuf.VALIDATE("Row No.", CurrentRow);
//         TempExcelBuf.VALIDATE("Column No.", CurrentCol);

//         RangeEndXlRow := TempExcelBuf.xlRowID;
//         RangeEndXlCol := TempExcelBuf.xlColID;
//     end;

//     [Scope('Internal')]
//     procedure CreateRange(RangeName: Text[250]): Boolean
//     begin
//         XlWrkShtWriter.AddRange(
//           RangeName,
//           GetExcelReference(4) + RangeStartXlCol + GetExcelReference(4) + RangeStartXlRow +
//           ':' +
//           GetExcelReference(4) + RangeEndXlCol + GetExcelReference(4) + RangeEndXlRow);
//     end;

//     [Scope('Internal')]
//     procedure AutoFit(RangeName: Text[50])
//     begin
//         IF NOT ISNULL(XlWrkBk) THEN
//             XlHelper.AutoFitRangeColumns(XlWrkBk, ActiveSheetName, RangeName);
//     end;

//     [Scope('Internal')]
//     procedure BorderAround(RangeName: Text[50])
//     begin
//         IF NOT ISNULL(XlWrkBk) THEN
//             XlHelper.BorderAroundRange(XlWrkBk, ActiveSheetName, RangeName, 1);
//     end;

//     [Scope('Internal')]
//     procedure ClearNewRow()
//     begin
//         CurrentRow := 0;
//         CurrentCol := 0;
//     end;

//     [Scope('Internal')]
//     procedure SetUseInfoSheet()
//     begin
//         UseInfoSheet := TRUE;
//     end;

//     [Scope('Internal')]
//     procedure AddInfoColumn(Value: Variant; IsFormula: Boolean; CommentText: Text[1000]; IsBold: Boolean; IsItalics: Boolean; IsUnderline: Boolean; NumFormat: Text[30]; CellType: Option)
//     begin
//         IF CurrentRow < 1 THEN
//             NewRow;

//         CurrentCol := CurrentCol + 1;
//         INIT;
//         InfoExcelBuf.VALIDATE("Row No.", CurrentRow);
//         InfoExcelBuf.VALIDATE("Column No.", CurrentCol);
//         IF IsFormula THEN
//             InfoExcelBuf.SetFormula(FORMAT(Value))
//         ELSE
//             InfoExcelBuf."Cell Value as Text" := FORMAT(Value);
//         InfoExcelBuf.Bold := IsBold;
//         InfoExcelBuf.Italic := IsItalics;
//         InfoExcelBuf.Underline := IsUnderline;
//         InfoExcelBuf.NumberFormat := NumFormat;
//         InfoExcelBuf."Cell Type" := CellType;
//         InfoExcelBuf.INSERT;
//     end;

//     [Scope('Internal')]
//     procedure UTgetGlobalValue(globalVariable: Text[30]; var value: Variant)
//     begin
//         CASE globalVariable OF
//             'CurrentRow':
//                 value := CurrentRow;
//             'CurrentCol':
//                 value := CurrentCol;
//             'RangeStartXlRow':
//                 value := RangeStartXlRow;
//             'RangeStartXlCol':
//                 value := RangeStartXlCol;
//             'RangeEndXlRow':
//                 value := RangeEndXlRow;
//             'RangeEndXlCol':
//                 value := RangeEndXlCol;
//             'XlWrkSht':
//                 value := XlWrkShtWriter;
//             'ExcelFile':
//                 value := FileNameServer;
//             ELSE
//                 ERROR(Text038, globalVariable);
//         END;
//     end;

//     [Scope('Internal')]
//     procedure SetCurrent(NewCurrentRow: Integer; NewCurrentCol: Integer)
//     begin
//         CurrentRow := NewCurrentRow;
//         CurrentCol := NewCurrentCol;
//     end;

//     [Scope('Internal')]
//     procedure CreateValidationRule(Range: Code[20])
//     begin
//         XlWrkShtWriter.AddRangeDataValidation(
//           Range,
//           GetExcelReference(4) + RangeStartXlCol + GetExcelReference(4) + RangeStartXlRow +
//           ':' +
//           GetExcelReference(4) + RangeEndXlCol + GetExcelReference(4) + RangeEndXlRow);
//     end;

//     [Scope('Internal')]
//     procedure QuitExcel()
//     begin
//         // Close and clear the OpenXml book
//         CloseBook;

//         // Clear the worksheet automation
//         IF NOT ISNULL(XlWrkSht) THEN
//             CLEAR(XlWrkSht);

//         // Clear the workbook automation
//         IF NOT ISNULL(XlWrkBk) THEN
//             CLEAR(XlWrkBk);

//         // Clear and quit the Excel application automation
//         IF NOT ISNULL(XlApp) THEN BEGIN
//             XlHelper.CallQuit(XlApp);
//             CLEAR(XlApp);
//         END;
//     end;

//     [Scope('Internal')]
//     procedure OpenExcel()
//     var
//         FileNameClient: Text;
//     begin
//         IF OpenUsingDocumentService('') THEN
//             EXIT;

//         IF NOT PreOpenExcel THEN
//             EXIT;

//         // rename the Temporary filename into a more UI friendly name in a new subdirectory
//         FileNameClient := FileManagement.DownloadTempFile(FileNameServer);
//         FileNameClient := FileManagement.MoveAndRenameClientFile(FileNameClient, GetFriendlyFilename, FORMAT(CREATEGUID));

//         XlWrkBk := XlHelper.CallOpen(XlApp, FileNameClient);

//         PostOpenExcel;
//     end;

//     [Scope('Internal')]
//     procedure DownloadAndOpenExcel()
//     var
//         ClientFilename: Text;
//     begin
//         ClientFilename := GetFriendlyFilename;

//         IF FileManagement.CanRunDotNetOnClient THEN BEGIN
//             ClientFilename := FileManagement.SaveFileDialog('Save file', '', Text034);
//             IF ClientFilename = '' THEN
//                 EXIT;
//             IF FileManagement.GetExtension(ClientFilename) = '' THEN
//                 ClientFilename += ExcelFileExtensionTok;
//         END;

//         OverwriteAndOpenExistingExcel(ClientFilename);
//     end;

//     [Scope('Internal')]
//     procedure OverwriteAndOpenExistingExcel(FileName: Text)
//     begin
//         IF FileName = '' THEN
//             ERROR(Text001);

//         IF OpenUsingDocumentService(FileName) THEN
//             EXIT;

//         IF NOT PreOpenExcel THEN
//             EXIT;

//         FileManagement.DownloadToFile(FileNameServer, FileName);
//         XlWrkBk := XlHelper.CallOpen(XlApp, FileName);

//         PostOpenExcel;
//     end;

//     local procedure OpenUsingDocumentService(FileName: Text): Boolean
//     var
//         DocumentServiceMgt: Codeunit 9510;
//         FileMgt: Codeunit 419;
//         PathHelper: DotNet Path;
//         DialogWindow: Dialog;
//         DocumentUrl: Text;
//     begin
//         IF NOT EXISTS(FileNameServer) THEN
//             ERROR(Text003, FileNameServer);

//         // if document service is configured we save the generated document to SharePoint and open it from there.
//         IF DocumentServiceMgt.IsConfigured THEN BEGIN
//             IF FileName = '' THEN
//                 FileName := 'Book.' + PathHelper.ChangeExtension(PathHelper.GetRandomFileName, 'xlsx')
//             ELSE BEGIN
//                 // if file is not applicable for the service it can not be opened using the document service.
//                 IF NOT DocumentServiceMgt.IsServiceUri(FileName) THEN
//                     EXIT(FALSE);

//                 FileName := FileMgt.GetFileName(FileName);
//             END;

//             DialogWindow.OPEN(STRSUBSTNO(SavingDocumentMsg, FileName));
//             DocumentUrl := DocumentServiceMgt.SaveFile(FileNameServer, FileName, TRUE);
//             DocumentServiceMgt.OpenDocument(DocumentUrl);
//             DialogWindow.CLOSE;
//             EXIT(TRUE);
//         END;

//         EXIT(FALSE);
//     end;

//     local procedure PreOpenExcel(): Boolean
//     begin
//         IF NOT EXISTS(FileNameServer) THEN
//             ERROR(Text003, FileNameServer);

//         // Download file, if none RTC it should return a filename, and use client automation instead.
//         IF NOT FileManagement.CanRunDotNetOnClient THEN BEGIN
//             IF NOT FileManagement.DownloadHandler(FileNameServer, Text040, '', Text034, GetFriendlyFilename) THEN
//                 ERROR(Text001);
//             EXIT(FALSE);
//         END;

//         XlApp := XlApp.ApplicationClass;
//         IF ISNULL(XlApp) THEN
//             ERROR(Text000);

//         EXIT(TRUE);
//     end;

//     local procedure PostOpenExcel()
//     begin
//         XlWrkBk := XlApp.ActiveWorkbook;

//         IF ISNULL(XlWrkBk) THEN
//             ERROR(Text036);

//         // autofit all columns on all worksheets
//         XlHelper.AutoFitColumnsInAllWorksheets(XlWrkBk);

//         // activate the previous saved sheet name in the workbook
//         XlHelper.ActivateSheet(XlWrkBk, ActiveSheetName);
//     end;

//     [Scope('Internal')]
//     procedure CreateBookAndOpenExcel(SheetName: Text[250]; ReportHeader: Text[80]; CompanyName: Text[30]; UserID2: Text)
//     begin
//         CreateBook(SheetName);
//         WriteSheet(ReportHeader, CompanyName, UserID2);
//         CloseBook;
//         OpenExcel;
//         GiveUserControl;
//     end;

//     local procedure UpdateProgressDialog(var ExcelBufferDialogManagement: Codeunit 5370; var LastUpdate: DateTime; CurrentCount: Integer; TotalCount: Integer): Boolean
//     var
//         CurrentTime: DateTime;
//     begin
//         // Refresh at 100%, and every second in between 0% to 100%
//         // Duration is measured in miliseconds -> 1 sec = 1000 ms
//         CurrentTime := CURRENTDATETIME;
//         IF (CurrentCount = TotalCount) OR (CurrentTime - LastUpdate >= 1000) THEN BEGIN
//             LastUpdate := CurrentTime;
//             ExcelBufferDialogManagement.SetProgress(ROUND(CurrentCount / TotalCount * 10000, 1));
//             IF NOT ExcelBufferDialogManagement.RUN THEN
//                 EXIT(FALSE);
//         END;

//         EXIT(TRUE)
//     end;

//     local procedure GetFriendlyFilename(): Text
//     begin
//         IF FriendlyName = '' THEN
//             EXIT('Book1' + ExcelFileExtensionTok);

//         EXIT(FileManagement.StripNotsupportChrInFileName(FriendlyName) + ExcelFileExtensionTok);
//     end;

//     [Scope('Internal')]
//     procedure SetFriendlyFilename(Name: Text)
//     begin
//         FriendlyName := Name;
//     end;

//     [Scope('Internal')]
//     procedure ConvertDateTimeDecimalToDateTime(DateTimeAsOADate: Decimal): DateTime
//     var
//         DotNetDateTime: DotNet DateTime;
//         DotNetDateTimeWithKind: DotNet DateTime;
//         DotNetDateTimeKind: DotNet DateTimeKind;
//     begin
//         DotNetDateTime := DotNetDateTime.FromOADate(DateTimeAsOADate);
//         DotNetDateTimeWithKind := DotNetDateTime.DateTime(DotNetDateTime.Ticks, DotNetDateTimeKind.Local);
//         EXIT(DotNetDateTimeWithKind);
//     end;
// }


