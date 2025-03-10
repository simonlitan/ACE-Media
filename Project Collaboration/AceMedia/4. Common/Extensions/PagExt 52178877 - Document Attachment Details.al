pageextension 52178877 "ExtDocument Attachment Details" extends "Document Attachment Details"
{

    layout
    {
        addbefore("File Extension")
        {

            field(Description; Rec.Description)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description field.';
            }
        }

    }
    trigger OnDeleteRecord(): Boolean
    begin
     //   Permissions.CheckIfCanDelete();
    end;

    var
       // Permissions: Codeunit "Access Management";
}
