tableextension 52178500 Vendor extends Vendor
{
    fields
    {

        field(52178500; "PIN No."; code[30])
        {
            NotBlank = true;



        }
        field(52178501; "Main Bank Name"; text[100])
        {

        }
        field(52178502; "Branch Bank Name"; text[100])
        {

        }
        field(52178503; "Bank Account No"; code[100])
        {

        }
        field(52178504; "Main Bank code"; Code[100])
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
        field(52178505; "Branch Bank"; Code[100])
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