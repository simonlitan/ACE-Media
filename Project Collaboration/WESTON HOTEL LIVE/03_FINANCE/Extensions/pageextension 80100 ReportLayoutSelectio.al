// pageextension 52178513 CustomerStatementExt2 extends "Customer Card"
// {
//     actions
//     {
//         addbefore(Attachments)
//         {
//             action(ExportReport)
//             {
//                 Caption = 'Export Report';
//                 Image = Export;
//                 PromotedCategory = Report;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 ApplicationArea = All;
//                 trigger OnAction()
//                 var
//                     ReportParameters: text;
//                     TempBlob: Codeunit "Temp Blob";
//                     FileManagement: Codeunit "File Management";
//                     OStream: OutStream;
//                     SelectedExportType: Integer;
//                     ExportType: Label 'PDF,Excel,Word,HTML,XML';
//                     StrMenuMsg: Label 'Please choose one of the export types:';
//                 begin
//                     Clear(ReportParameters);
//                     Clear(OStream);
//                     Clear(SelectedExportType);
//                     SelectedExportType := StrMenu(ExportType, 2, StrMenuMsg); //Defualt format is Excel
//                     if SelectedExportType = 0 then
//                         exit;
//                     ReportParameters := Report.RunRequestPage(116);
//                     TempBlob.CreateOutStream(OStream);
//                     case SelectedExportType of
//                         1: //Pdf
//                             begin
//                                 Report.SaveAs(116, ReportParameters, ReportFormat::Pdf, OStream);
//                                 FileManagement.BLOBExport(TempBlob, Format(116) + '_' + 'Customer Statement' + '_' + Format(CURRENTDATETIME, 0, '<Day,2><Month,2><Year4><Hours24><Minutes,2><Seconds,2>') + '.pdf', true);
//                             end;
//                         2: //Excel
//                             begin
//                                 Report.SaveAs(116, ReportParameters, ReportFormat::Excel, OStream);
//                                 FileManagement.BLOBExport(TempBlob, Format(116) + '_' + 'Customer Statement' + '_' + Format(CURRENTDATETIME, 0, '<Day,2><Month,2><Year4><Hours24><Minutes,2><Seconds,2>') + '.xlsx', true);
//                             end;
//                         3: //Word
//                             begin
//                                 Report.SaveAs(116, ReportParameters, ReportFormat::Word, OStream);
//                                 FileManagement.BLOBExport(TempBlob, Format(116) + '_' + 'Customer Statement' + '_' + Format(CURRENTDATETIME, 0, '<Day,2><Month,2><Year4><Hours24><Minutes,2><Seconds,2>') + '.docx', true);
//                             end;
//                         4: //Html
//                             begin
//                                 Report.SaveAs(116, ReportParameters, ReportFormat::Html, OStream);
//                                 FileManagement.BLOBExport(TempBlob, Format(116) + '_' + 'Customer Statement' + '_' + Format(CURRENTDATETIME, 0, '<Day,2><Month,2><Year4><Hours24><Minutes,2><Seconds,2>') + '.html', true);
//                             end;
//                         5: //Xml
//                             begin
//                                 Report.SaveAs(116, ReportParameters, ReportFormat::Xml, OStream);
//                                 FileManagement.BLOBExport(TempBlob, Format(116) + '_' + 'Customer Statement' + '_' + Format(CURRENTDATETIME, 0, '<Day,2><Month,2><Year4><Hours24><Minutes,2><Seconds,2>') + '.xml', true);
//                             end;
//                     end;
//                 end;
//             }
//         }
//     }
// }