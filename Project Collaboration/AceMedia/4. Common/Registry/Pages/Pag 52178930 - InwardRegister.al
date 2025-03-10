page 52178930 "Inward Register"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Departmental File";
    UsageCategory = Lists;
    CardPageId = "Deparmental File Card";
    SourceTableView = order(descending) where(Confidential = filter(false));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Folio No."; Rec."Folio No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Folio No. field.';
                }
                field("Subject"; Rec."Subject")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Subject field.';
                }

                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                    TableRelation = "Dimension Value";
                }
                field("Has External Documents"; Rec."Has External Documents")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Has External Documents field.';
                    trigger OnValidate()
                    begin
                        RegistryMgnt.AttachExternalDocs(Rec);
                    end;
                }
                field(Confidential; Rec.Confidential)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Confidential field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        RegistryMgnt.ForwardToSecretRegistry(Rec);
                    end;
                }
                field("Received at"; Rec."Received at")
                {
                    ApplicationArea = All;
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = All;
                }
                field("Ref No."; Rec."Ref No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        RegistryMgnt: Codeunit "Common App Management";
}
