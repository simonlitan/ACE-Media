table 52178889 "Sales Quote Lines"
{
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Document No."; Code[30])
        {
        }
        field(3; "Details"; Text[250])
        {

        }
        field(4; Pax; Integer)
        {
            trigger OnValidate()
            begin
                calculateTotal();
            end;

        }
        field(5; "days"; Integer)
        {
            trigger OnValidate()
            begin
                calculateTotal();
            end;

        }
        field(6; "Unit Price"; Decimal)
        {
            trigger OnValidate()
            begin
                calculateTotal();
            end;
        }
        field(7; "Total Price"; Decimal)
        {
        }
        field(8; "Document Type"; Option)
        {
            OptionMembers = Quote,Invoice;
        }
        field(9; "Confrence Type"; Code[100])
        {
            TableRelation = "Confrence Type Setup"."Confrence Type" where("Confrence Type" = field("Confrence Type"));
            trigger OnValidate()
            var
                Cts: Record "Confrence Type Setup";
            begin
                Cts.Reset();
                Cts.SetRange("Confrence Type", "Confrence Type");
                if Cts.Find('-') then begin

                    "Confrence Description" := Cts.Description;
                    //Validate("Confrence Description");
                end;
                // if Cts.Get("Confrence Type") then Cts.Validate(Cts."Confrence Type");
                // "Confrence Description" := Cts.Description;


            end;
        }
        field(10; "Confrence Description"; Text[2048])
        {
            // TableRelation = "Confrence Type Setup".Description;
        }
    }

    keys
    {
        key(pk; "Line No.", "Document No.", "Document Type")
        {

        }
    }

    procedure calculateTotal()
    begin
        if ((Rec.Pax > 0) and (Rec.days > 0) and (Rec."Unit Price" > 0)) then begin
            Rec."Total Price" := Rec.Pax * Rec.days * Rec."Unit Price";
        end;
    end;
}