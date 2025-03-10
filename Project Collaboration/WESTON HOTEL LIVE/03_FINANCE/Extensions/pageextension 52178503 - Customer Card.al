pageextension 52178503 "Customer Card" extends "Customer Card"
{
    layout
    {
        addafter("Balance (LCY)")
        {

            field("Bank code"; Rec."Bank code")
            {
                ShowMandatory = true;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bank code field.';
            }
            field("Bank Name"; Rec."Bank Name")
            {
                ShowMandatory = true;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bank Name field.';
            }
            field("Branch Code"; Rec."Branch Code")
            {
                ShowMandatory = true;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Branch Code field.';
            }
            field("Branch Name"; Rec."Branch Name")
            {
                ShowMandatory = true;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Branch Name field.';
            }
            field("Account No"; Rec."Account No")
            {
                ShowMandatory = true;
                Caption = 'Imprest Account';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Account No field.';
            }
        }
        addafter("VAT Registration No.")
        {

            field("KRA pin"; Rec."KRA pin")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the KRA pin field.';
            }
            field("HS Code"; Rec."HS Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HS Code field.';
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        addbefore(Attachments)
        {
            action(ExportReport)
            {
                Caption = 'Customer Statement Report';
                Image = Export;
                PromotedCategory = Report;
                Promoted = true;
                PromotedIsBig = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    ReportParameters: text;
                    TempBlob: Codeunit "Temp Blob";
                    FileManagement: Codeunit "File Management";
                    OStream: OutStream;
                    SelectedExportType: Integer;
                    ExportType: Label 'PDF,Excel,Word,HTML,XML';
                    StrMenuMsg: Label 'Please choose one of the export types:';
                begin
                    Clear(ReportParameters);
                    Clear(OStream);
                    Clear(SelectedExportType);
                    SelectedExportType := StrMenu(ExportType, 2, StrMenuMsg); //Defualt format is Excel
                    if SelectedExportType = 0 then
                        exit;
                    ReportParameters := Report.RunRequestPage(116);
                    TempBlob.CreateOutStream(OStream);
                    case SelectedExportType of
                        1: //Pdf
                            begin
                                Report.SaveAs(116, ReportParameters, ReportFormat::Pdf, OStream);
                                FileManagement.BLOBExport(TempBlob, Format(116) + '_' + 'Customer Statement' + '_' + Format(CURRENTDATETIME, 0, '<Day,2><Month,2><Year4><Hours24><Minutes,2><Seconds,2>') + '.pdf', true);
                            end;
                        2: //Excel
                            begin
                                Report.SaveAs(116, ReportParameters, ReportFormat::Excel, OStream);
                                FileManagement.BLOBExport(TempBlob, Format(116) + '_' + 'Customer Statement' + '_' + Format(CURRENTDATETIME, 0, '<Day,2><Month,2><Year4><Hours24><Minutes,2><Seconds,2>') + '.xlsx', true);
                            end;
                        3: //Word
                            begin
                                Report.SaveAs(116, ReportParameters, ReportFormat::Word, OStream);
                                FileManagement.BLOBExport(TempBlob, Format(116) + '_' + 'Customer Statement' + '_' + Format(CURRENTDATETIME, 0, '<Day,2><Month,2><Year4><Hours24><Minutes,2><Seconds,2>') + '.docx', true);
                            end;
                        4: //Html
                            begin
                                Report.SaveAs(116, ReportParameters, ReportFormat::Html, OStream);
                                FileManagement.BLOBExport(TempBlob, Format(116) + '_' + 'Customer Statement' + '_' + Format(CURRENTDATETIME, 0, '<Day,2><Month,2><Year4><Hours24><Minutes,2><Seconds,2>') + '.html', true);
                            end;
                        5: //Xml
                            begin
                                Report.SaveAs(116, ReportParameters, ReportFormat::Xml, OStream);
                                FileManagement.BLOBExport(TempBlob, Format(116) + '_' + 'Customer Statement' + '_' + Format(CURRENTDATETIME, 0, '<Day,2><Month,2><Year4><Hours24><Minutes,2><Seconds,2>') + '.xml', true);
                            end;
                    end;
                end;
            }
        }   // Add changes to page actions here
    }
    trigger OnClosePage()
    begin
        rec.TestField("Bank code");
        rec.TestField("Branch Code");
        rec.TestField("KRA pin");
        rec.TestField("Account No");
    end;

    var
        myInt: Integer;
}