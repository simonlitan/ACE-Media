report 52178872 "ISO-Internal QualiAudit Report"
{
    RDLCLayout = './CEO/Reports/SSR/ISO-Internal Quality Audit.rdl';
    EnableExternalImages = true;
    Caption = 'ISO-Internal QualiAudit Report';
    dataset
    {
        dataitem(Internalqualityaudit; "Internal quality audit")
        {
            DataItemTableView = SORTING("Audit No");
            RequestFilterFields = "Audit No";
            column(CompPic; info.Picture)
            {
            }
            column(companyName; info.Name)
            {
            }
            column(companyAddress; info."Address 2")
            {
            }
            column(AuditDate; "Audit Date")
            {
            }
            column(Scopeofaudit; "Scope of audit")
            {
            }
            column(Auditcriteria; "Audit criteria")
            {
            }
            column(Auditpurpose; "Audit purpose")
            {
            }
            column(Auditor; Auditor)
            {
            }
            column(Personscontracted; "Persons contracted")
            {
            }
            column(Introduction; Introduction)
            {
            }
            column(Observation; Observations)
            {
            }
            column(Summaryofauditfindings; "Summary of audit findings")
            {
            }
            column(Areasofimprovement; "Areas of improvement")
            {
            }
            column(Recommendations; Recommendations)
            {
            }
            column(Attachments; Attachments)
            {
            }
            dataitem(InternalQualityAuditReport; "ISO-AuditReportTable")
            {
                DataItemLink = "Contact No" = FIELD("Audit No");
                DataItemLinkReference = "Internalqualityaudit";
                column(Contact_No; "Contact No")
                {
                }
                column(Name; Name)
                {
                }
                column(Responsibility; Responsibility)
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
