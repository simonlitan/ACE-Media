report 52178864 "Events Agreement Form"
{
    DefaultLayout = Word;
    WordLayout = './Sales Relations/Reports/SSR/EventsAgreementForm.docx';
    dataset
    {
        dataitem(EAF; Opportunity)
        {
            column(No_squote; "No.")
            {
            }
            column(ContactNo_squote; "Contact No.")
            {
            }
            column(ShortcutDimension1Code_squote; branch)
            {
            }
            column(SalespersonCode_squote; "Salesperson Code")
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
            dataitem(bsched; "Booking Schedule")
            {
                DataItemLink = Opportunity = field("No.");

                column(BlockCode_bsched; "Block Code")
                {
                }
                column(UnitCode_bsched; "Unit Code")
                {
                }
                column(Dimension1Code_bsched; "Dimension 1 Code")
                {
                }
                column(Startdate_bsched; "Start date")
                {
                }
                column(Noofdays_bsched; "No of days")
                {
                }
                column(Enddate_bsched; "End date")
                {
                }
                column(Opportunity_bsched; Opportunity)
                {
                }
                column(BookingStatus_bsched; "Booking Status")
                {
                }
                column(ViewOpportunity_bsched; "View Opportunity")
                {
                }
                column(BookingConfirmed_bsched; "Booking Confirmed")
                {
                }
                column(ConfirmedBy_bsched; "Confirmed By")
                {
                }
                column(DateConfirmed_bsched; "Date Confirmed")
                {
                }
            }
            dataitem(fof; "Food Order Form")
            {
                DataItemLink = "Opportunity No." = field("No.");
                column(No_fof; "No.")
                {
                }
                column(ContactNo_fof; "Contact No.")
                {
                }
                column(Name_fof; Name)
                {
                }
                column(OpportunityNo_fof; "Opportunity No.")
                {
                }
                column(EventName_fof; "Event Name")
                {
                }
                column(Venue_fof; Venue)
                {
                }
                column(Date_fof; "Date")
                {
                }
                column(Day_fof; Day)
                {
                }
                column(TypeofEvent_fof; "Type of Event")
                {
                }
                column(NumberofPaxExpected_fof; "Number of Pax: Expected")
                {
                }
                column(Guaranteed_fof; Guaranteed)
                {
                }
                column(ArrivalTime_fof; "Arrival Time")
                {
                }
                column(MealTime_fof; "Meal Time")
                {
                }
                column(MenuDetails_fof; "Menu Details")
                {
                }
                column(BeverageDetails_fof; "Beverage Details")
                {
                }
                column(SetupDetails_fof; "Setup Details")
                {
                }
                column(Decorationdetails_fof; "Decoration details")
                {
                }
                column(Entertainment_fof; Entertainment)
                {
                }
                column(OtherDetails_fof; "Other Details")
                {
                }
                column(Food_fof; Food)
                {
                }
                column(Beverage_fof; Beverage)
                {
                }
                column(Others_fof; Others)
                {
                }
                column(Paymentplan_fof; "Payment plan")
                {
                }
                column(EventAgreementDetails_fof; "Event Agreement Details")
                {
                }
                column(OrganizerName_fof; "Organizer Name")
                {
                }
                column(TelephoneContact_fof; "Telephone Contact")
                {
                }
                column(BookedBy_fof; "Booked By")
                {
                }
                column(BookedDate_fof; "Booked Date")
                {
                }
                column(ReceivedBy_fof; "Received By")
                {
                }
                column(ReceivedDate_fof; "Received Date")
                {
                }
                column(Username_fof; Username)
                {
                }
                column(DocumentDate_fof; "Document Date")
                {
                }
                column(amountpayable; fof.Food + fof.Beverage + fof.Others)
                {

                }
            }

            trigger OnPreDataItem()
            begin
                info.get;
                info.CalcFields(Picture);
            end;
        }
    }
    var
        info: Record "Company Information";
        dimvalue: Record "Dimension Value";
        Branch: Text;
        amountpayable: Decimal;

}