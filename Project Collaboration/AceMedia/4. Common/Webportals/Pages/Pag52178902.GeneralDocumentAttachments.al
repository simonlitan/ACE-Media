page 52178902 "General Document Attachments"
{
    ApplicationArea = All;
    Caption = 'General Document Attachments';
    PageType = List;
    SourceTable = GeneralDocumentAttachment;
    UsageCategory = Lists;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                /* field("Serial No"; Rec."Serial No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Serial No field.';
                } */
                field(Attachment; Rec.Attachment)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Attachment field.';
                    trigger OnAssistEdit()
                    var
                        ToFile: Text;
                    begin
                        if Confirm('Are you sure you want to download this file?') then begin
                            ToFile := Rec."Document No" + '.pdf';
                            Download(ReplaceString(Rec.Attachment, '/', ''), 'Download Attachment', 'C:\', 'Text file(*.pdf)|*.txt', ToFile);
                        end
                    end;
                }
                /* field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                } */
                field(UserID; Rec.UserID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the UserID field.';
                }
            }
        }
    }
    local procedure ReplaceString(String: Text; FindWhat: Text; ReplaceWith: Text) NewString: Text
    begin
        WHILE STRPOS(String, FindWhat) > 0 DO
            String := DELSTR(String, STRPOS(String, FindWhat)) + ReplaceWith + COPYSTR(String, STRPOS(String, FindWhat) + STRLEN(FindWhat));
        NewString := String;
    end;
}
