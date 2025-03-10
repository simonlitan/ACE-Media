tableextension 52178532 "ExtVendor" extends Vendor
{
    fields
    {
        field(6000; "Email 2"; Text[50])
        {

        }
        field(6001; "Email 1"; Text[100])
        {

        }
        field(6002; "Telephone 1"; Text[100])
        {

        }
        field(6003; "Telephone 2"; Text[100])
        {

        }
        field(6004; "Main Bank Name"; text[100])
        {

        }
        field(6005; "Branch Bank Name"; text[100])
        {

        }
        field(6006; "Bank Account No"; code[50])
        {

        }
        field(6007; "Main Bank code"; Code[50])
        {
            TableRelation = "PRL-Bank Structure"."Bank Code";
            trigger OnValidate()
            begin
                bankstructure.Reset();
                bankstructure.SetRange("Bank Code", "Main Bank code");
                if bankstructure.FindFirst() then
                    "Main Bank Name" := bankstructure."Bank Name";
            end;

        }
        field(6008; "Branch Bank"; Code[50])
        {
            TableRelation = "PRL-Bank Structure"."Branch Code" where("Bank Code" = field("Main Bank Name"));
            trigger OnValidate()
            begin
                bankstructure.Reset();
                bankstructure.SetRange("Bank Code", "Main Bank Name");
                bankstructure.SetRange("branch Code", "Branch Bank");
                if bankstructure.FindFirst() then
                    "Branch Bank Name" := bankstructure."Branch Name";
            end;
        }
        field(6009; "Vendor Categorization"; Code[50])
        {
            TableRelation = "Proc-Target Groups"."Code";
        }
        field(6010; "Goods to supply"; code[50])
        {
            Caption = 'Goods/Services to Supply';
            TableRelation = "Proc-Goods Clasiffication".Code;
        }
        field(6011; "Contact Person"; Text[100])
        {

        }
        field(6012; "Contact Telephone"; Text[100])
        {

        }
        field(6013; "Agpo Certification No."; Text[30])
        {

        }
        field(6014; Password; code[50])
        {

        }
        field(6015; "Changed Password"; boolean)
        {

        }
        // Add changes to table fields here
    }

    trigger OnInsert()
    var

        USetup: record "User Setup";
    begin

        USetup.RESET;
        USetup.SETRANGE(USetup."User ID", USERID);
        USetup.SETRANGE(USetup."Create Supplier", false);
        IF USetup.FIND('-') THEN ERROR('You are not authorised');


    end;

    var
        bankstructure: Record "PRL-Bank Structure";
}