report 52178866 "ISO-Audit Checklist Report"
{
    RDLCLayout = './CEO/Reports/SSR/ISO-Audit Checklist Report.rdl';
    EnableExternalImages = true;
    Caption = 'ISO-Audit Checklist Form';
    dataset
    {

        dataitem(ISOAuditChecklistTable; "ISO-Audit Checklist Table")
        {
            DataItemTableView = SORTING("Form No");
            RequestFilterFields = "Form No";
            column(CompPic; info.Picture)
            {
            }
            column(companyName; info.Name)
            {
            }
            column(companyAddress; info."Address 2")
            {
            }
            column(FormNo; "Form No")
            {
            }
            column(Date; "Date")
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(AuditType; AuditType)
            {
            }
            column(Location; Location)
            {
            }
            column(Nameofauditor; "Name of auditor")
            {
            }
            dataitem(ISOAuditChecklistpart; "ISO-Audit Items Table")
            {
                DataItemLink = "No." = FIELD("Form No");
                DataItemLinkReference = "ISOAuditChecklistTable";



                column(System_aspect; "System Aspect")
                {
                }
                column(PRO_WI_REF; "PRO/WI REF")
                {
                }
                column(Results; "Results")
                {
                }
                column(Audit_Criteria; "Audit Criteria")
                {
                }


            }

        }


    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnInitReport()
    begin
        info.reset;
        if info.get() then
            info.CalcFields(Picture);

    end;

    var
        myInt: Integer;
        Info: Record "Company Information";


}
