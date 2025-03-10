tableextension 52178425 "ExtApprovals Activities Cue" extends "Approvals Activities Cue"
{
    fields
    {
        field(6000; "Sender ID"; code[50])
        {
            FieldClass = FlowFilter;
        }
        field(6001; "Specific User Requests"; Integer)
        {
            CalcFormula = Count("Approval Entry" WHERE("Approver ID" = FIELD("User ID Filter"), "Sender ID" = field("Sender ID"),
                                                        Status = FILTER(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
        }
        field(6002; "Approver ID"; code[50])
        {
            FieldClass = FlowFilter;
        }

        field(6003; "Specific Approved Requests"; Integer)
        {
            CalcFormula = Count("Approval Entry" WHERE("Approver ID" = FIELD("User ID Filter"), "Approver ID" = field("Approver ID"),
                                                        Status = FILTER(Approved)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
        }

        field(6004; "Document Type"; Enum "Approval Document Type")
        {
            FieldClass = FlowFilter;
        }

        field(6005; "Approval Document"; Integer)
        {
            CalcFormula = Count("Approval Entry" WHERE("Approver ID" = FIELD("User ID Filter"), "Document Type" = field("Document Type"),
                                                        Status = FILTER(Open)));
            Caption = 'Approval Document';
            FieldClass = FlowField;
        }

    }
}