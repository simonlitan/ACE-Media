report 52178871 "ISO-Audit Findings Report"
{
    Caption = 'ISO-Audit Findings Report';
    RDLCLayout = './CEO/Reports/SSR/ISO-Audit Findings.rdl';
    EnableExternalImages = true;
    dataset
    {
        dataitem(AuditFindings; "Audit Findings")
        {
            DataItemTableView = SORTING("Timetable No.");
            RequestFilterFields = "Timetable No.";
            column(Audit_No; "Timetable No.")
            {

            }
            column(Department; Department)
            {
            }
            column(Nameofauditor; "Name of auditor")
            {
            }
            column(Dateaudited; "Date audited")
            {
            }
            dataitem(ISO_Findings_Listpart; "ISO-Findings Listpart Table")
            {
                DataItemLink = "No." = FIELD("Timetable No.");
                DataItemLinkReference = "AuditFindings";

                column(Audit_Findings; "Findings")
                {
                }
                column(Signature_of_auditee; "Name/signature of auditee")
                {
                }
                column(Relevant_clause; "Relevant clause")
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
}
