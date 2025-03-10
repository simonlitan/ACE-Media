/// <summary>
/// TableExtension Customer2 (ID 52178501) extends Record Customer.
/// </summary>
tableextension 52178501 Customer2 extends Customer
{
    fields
    {
        field(52178500; "Bank code"; code[10])
        {
            NotBlank = true;

            trigger OnValidate()
            var
                bankstructure: Record "PRL-Bank Structure";
            begin
                bankstructure.Reset();
                bankstructure.SetRange("Bank Code", "Bank code");
                if bankstructure.FindFirst() then
                    "Bank Name" := bankstructure."Bank Name";
            end;




        }
        field(52178501; "Bank Name"; text[100])
        {
            NotBlank = true;
            Editable = false;
        }
        field(52178502; "Branch Code"; code[10])
        {
            NotBlank = true;
            trigger OnValidate()
            var
                bankstructure: Record "PRL-Bank Structure";
            begin
                bankstructure.Reset();
                bankstructure.SetRange("Bank Code", "Branch Code");
                bankstructure.SetRange("Branch Code", "Branch Code");

                if bankstructure.FindFirst() then
                    "Branch Name" := bankstructure."Branch Name"
            end;

        }
        field(52178503; "Branch Name"; Text[100])
        {
            Editable = false;
            NotBlank = true;

        }
        field(52178504; "Account No"; code[50])
        {
            NotBlank = true;

        }


        // Add changes to table fields here
    }

    var

}