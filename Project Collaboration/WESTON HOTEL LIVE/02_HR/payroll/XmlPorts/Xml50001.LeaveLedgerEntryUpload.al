/// <summary>
/// XmlPort Leave Ledger Entry Upload (ID 50001).
/// </summary>
xmlport 50001 "Leave Ledger Entry Upload"

{
    Caption = 'Import Leave Ledger Entry';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {
            tableelement(Lv; "HRM-Leave Ledger")
            {
                fieldattribute(EntryNo; Lv."Entry No.")
                {

                }
                fieldattribute(LeavePeriod; Lv."Leave Period")
                {

                }
                fieldattribute(EmpNo; Lv."Employee No")
                {
                }
                fieldattribute(PostingDate; Lv."Transaction Date")
                {

                }
                fieldattribute(LeaveEntryType; Lv."Entry Type")
                {

                }
                fieldattribute(DocumentNo; Lv."Document No")
                {

                }
                fieldattribute(AppliedDays; Lv."No. of Days")
                {

                }
                fieldattribute(PostingDescription; Lv."Transaction Description")
                {

                }
                fieldattribute(LeaveType; lv."Leave Type")
                {

                }




            }
        }
    }






    trigger OnInitXmlPort()
    begin
        I := 0;
    end;

    var
        I: Integer;
}







