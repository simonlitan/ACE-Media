table 52179241 "Appraisal Approvals"
{
    Caption = 'Appraisal Approvals';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
        }
        field(2; "Code"; Code[30])
        {
            Caption = 'Code';
        }
        field(3; "Workplan No"; Code[30])
        {
            Caption = 'Workplan No';
        }
        field(4; "Employee"; Code[30])
        {
            Caption = 'Employee';
        }
        field(5; "Appraising Supervisor"; Code[30])
        {
            Caption = 'Appraising Supervisor';
        }
        field(6; "Sender Id"; Code[30])
        {
            Caption = 'Send To';
        }
        field(9; "Approver Id"; Code[30])
        {

        }
        Field(7; Approved; Boolean)
        {

        }
        field(8; Status; Option)
        {
            OptionMembers = Open,Submitted,Rejected,"Supervisor's Rating",Agreed,Disagreed,Closed;
        }
    }
    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }

    procedure Entryno(): Integer;
    var
        Entno: Record "Appraisal Approvals";
    begin
        Entno.Reset();
        if Entno.FindLast() then
            exit(Entno.Id)
        else
            exit(0);
    end;
}
