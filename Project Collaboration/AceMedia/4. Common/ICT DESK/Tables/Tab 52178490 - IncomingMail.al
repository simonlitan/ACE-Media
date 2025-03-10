table 52178904 "Incoming Mail"
{
    //LookupPageId = SharePoint;
    //DrillDownPageId = SharePoint;

    fields
    {
        field(1; "Ref No"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "Date Received" := Today;
                "Received By" := UserId;
            end;
        }
        field(5; "Date Received"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(6; Media; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Mail Content"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "1st Comment"; text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "2nd Comment"; Text[500])
        {
            DataClassification = ToBeClassified;
        }

        field(10; status; Option)
        {
            OptionMembers = Open,Pending,Approved,Cancelled;
            // Editable = false;
        }
        field(11; "Incoming Mail"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Department; Code[50])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(13; "Received By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Mail Subject"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Document type"; Option)
        {
            OptionMembers = ,PV,"Imprest Surrender","Incoming Mail","Imprest Requisition",Memo,Receipt,Claim,"Petty Cash","Purchase Invoice","Purchase Credit Memo","Procurement Plan","Purchase Memo","Purchase Requisition","Purchase Quotes","Purchase Order","Indirect Process LPO NO","Tendering","Staff File","Training Card",Welfare,Disciplinary,Drivers,"Transport Requisition","Fuel Requisition","Students Attachments","Institution Attachments","Reccurrent Application","Disbursment ";
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(pk; "Ref No")
        {
            Clustered = true;
        }
    }

}
