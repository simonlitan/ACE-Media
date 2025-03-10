tableextension 52178534 "ExtUser Setup1" extends "User Setup"
{
    fields
    {
        field(52178524; "Unlimited Imprest Requests"; Boolean)
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
        field(52178525; ApprovalUserId; code[20])
        {
           // TableRelation = "User Setup"."User ID";
           FieldClass = FlowField;
           CalcFormula = lookup("User Setup"."User ID");
        }
    }
}
