report 52178537 "Casual Requisition Report"
{
     DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/CasualReqnReport.rdl';
    PreviewMode = PrintLayout;
    dataset
    {
        dataitem("Casual Requisition";"Casual Requisition")
        {
            RequestFilterFields = "Cost Center","Request Date";
            column(Cost_Center;"Cost Center")
            {

            }
            column(Cost_Center_Name;"Cost Center Name")
            {

            }
            column(Position;Position)
            {

            }
            column(Responsibilities;Responsibilities)
            {

            }
            column(Status;Status)
            {

            }
            column(User_ID;"User ID")
            {

            }
            column(Total_Amount;"Total Amount")
            {

            }
            column(Request_Date;"Request Date")
            {

            }


        
        dataitem(CasualRequisitionLines; "Casual Requisition Lines")
        {
             DataItemLink = No = FIELD("No.");
            
    
            column(ID_NO;"ID NO")
            {

            }
            column(First_Name;"First Name")
            {

            }
            column(Logo;CompanyInfo.Picture)
            {

            }
            column(Address; companyInfo.Address)
            {
                
            }
            column(Middle_Name;"Middle Name")
            {

            }
            column(Last_Name;"Last Name")
            {

            }
            column(Rate;Rate)
            {

            }
            column(No_of_Days;"No of Days")
            {

            }
            column(Total;Total)
            {

            }
            column(Casuals;Casuals)
            {

            }
        }
    }
    }
 
    trigger OnPreReport()
    begin
        companyinfo.GET;
        companyinfo.CALCFIELDS(companyinfo.Picture);
    end;
    var
    CompanyInfo: record "Company Information";


}
