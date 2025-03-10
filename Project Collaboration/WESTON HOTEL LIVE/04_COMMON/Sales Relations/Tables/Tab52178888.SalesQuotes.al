table 52178888 "Sales Quotes"
{
    DrillDownPageId = "Sales Quote List";
    LookupPageId = "Sales Quote List";
    fields
    {

        field(1; "No."; Code[20])
        {
            Caption = 'No.';

        }
        field(2; "Contact No."; Code[20])
        {

            TableRelation = Customer;
        }
        field(4; "Name"; Text[200])
        {

        }
        field(5; "Opportunity No."; Code[30])
        {

        }
        field(7; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));

        }
        field(8; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(9; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";

        }
        field(10; "To"; Text[50])
        {

        }
        field(11; "Salutation"; Text[50])
        {

        }
        field(12; "REF"; Text[1000])
        {

        }
        field(13; "Document date"; date)
        {

        }
        field(14; "Username"; Code[30])
        {

        }
        field(15; "Quote Type"; Option)
        {
            OptionMembers = " ",Accomodation,Conference;
        }
        field(16; "Total Cost"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Sales Quote Lines"."Total Price" where("Document No." = field("No.")));
        }
        field(17; "Reservation Officer"; Text[100])
        {

        }
        field(18; "Document Type"; Option)
        {
            OptionMembers = Quote,Invoice;
        }
    }

    keys
    {
        key(Key1; "No.", "Opportunity No.")
        {

        }

    }

    trigger OnInsert()
    var
        noseries: Codeunit NoSeriesManagement;
        setup: Record "Sales & Receivables Setup";
    begin
        if "No." = '' then begin
            setup.get;
            "No." := noseries.GetNextNo(setup."Quote Nos.", 0D, True);
            Username := UserId;
            "Document date" := Today;
        end;
    end;

}