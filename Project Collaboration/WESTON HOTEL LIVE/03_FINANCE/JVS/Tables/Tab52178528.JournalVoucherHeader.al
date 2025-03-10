table 52178528 "Journal Voucher Header"
{
    LookupPageId = "Journal Voucher list";
    DrillDownPageId = "Journal Voucher list";
    fields
    {
        field(1; "No."; code[30])
        {
            Editable = false;
        }
        field(2; "Document Date"; date)
        {
            // Editable = false;
        }
        field(4; "Posting Date"; date)
        {
            trigger OnValidate()
            begin

            end;
        }
        field(5; "Description"; Text[100])
        {
            // Editable = false;

        }
        field(10; "User Name"; Code[30])
        {
            Editable = false;

        }
        field(12; "Total Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Journals Voucher Lines".Amount where("No." = field("No.")));
        }
        field(13; "Posted"; Boolean)
        {
            Editable = false;
        }
        field(14; "Status"; Option)
        {
            OptionMembers = pending,"Pending Approval",Approved,Posted;
        }

    }

    var

        NoSeriesManagement: Codeunit NoSeriesManagement;
        gensetup: Record "Cash Office Setup";

    trigger OnInsert()
    begin
        if "No." = '' then begin
            gensetup.Get();
            "No." := NoSeriesManagement.GetNextNo(gensetup.JVs, 0D, True);
            "Document Date" := Today;
            "User Name" := UserId;
            Validate("User Name");
        end;


    end;

}