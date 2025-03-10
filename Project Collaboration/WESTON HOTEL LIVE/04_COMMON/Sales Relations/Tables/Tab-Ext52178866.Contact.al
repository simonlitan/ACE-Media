tableextension 52178866 "Contacts Ext" extends Contact
{
    fields
    {
        field(52178861; "User Id"; Code[20])
        {

            DataClassification = ToBeClassified;
        }
    }
    trigger OnInsert()
    var
        myInt: Integer;
    begin
        if "No." = '' then begin
            "User Id" := UserId;
            Validate("User Id");
        end;
    end;
}
