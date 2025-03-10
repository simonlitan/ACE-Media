report 52178861 "Accomodation Quotation"
{
    DefaultLayout = Word;
    WordLayout = './Sales Relations/Reports/SSR/AccomodationQuotation.docx';

    dataset
    {
        dataitem(squote; "Sales Quotes")
        {
            CalcFields = "Total Cost";
            column(No_squote; "No.")
            {
            }
            column(ContactNo_squote; "Contact No.")
            {
            }
            column(Name_squote; Name)
            {
            }
            column(ShortcutDimension1Code_squote; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_squote; "Shortcut Dimension 2 Code")
            {
            }
            column(SalespersonCode_squote; "Salesperson Code")
            {
            }
            column(To_squote; "To")
            {
            }
            column(Salutation_squote; Salutation)
            {
            }
            column(REF_squote; REF)
            {
            }
            column(Documentdate_squote; format("Document date"))
            {
            }
            column(TotalCost_squote; "Total Cost")
            {
            }
            column(compName; info.Name)
            {

            }
            column(CompAddress; info.Address)
            {

            }
            column(Compmail; info."E-Mail")
            {

            }
            column(compUrl; info."Home Page")
            {

            }
            column(CompLogo; info.Picture)
            {

            }
            column(CompBox; info."Post Code")
            {

            }
            column(CompPhone; info."Phone No.")
            {

            }
            column(ReservationOfficer_squote; "Reservation Officer")
            {
            }

            dataitem(lines; "Sales Quote Lines")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where("Document Type" = filter(Quote));
                column(Details_lines; Details)
                {
                }
                column(Pax_lines; Pax)
                {
                }
                column(days_lines; days)
                {
                }
                column(UnitPrice_lines; "Unit Price")
                {
                }
                column(TotalPrice_lines; "Total Price")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                info.get;
                info.CalcFields(Picture);
            end;

            trigger OnAfterGetRecord()
            begin
                squote.CalcFields("Total Cost");
                net := (100 / 128) * squote."Total Cost";
                vAmount := (16 / 128) * squote."Total Cost";
                clvy := (2 / 128) * squote."Total Cost";
                sLevy := (10 / 128) * squote."Total Cost";

            end;
        }
    }

    var
        info: Record "Company Information";
        vAmount: Decimal;
        sLevy: Decimal;
        clvy: Decimal;
        net: Decimal;


}