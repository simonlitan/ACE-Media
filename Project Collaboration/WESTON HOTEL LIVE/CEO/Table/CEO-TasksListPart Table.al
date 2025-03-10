table 52178890 CEOTasksListPartTable
{
    Caption = 'CEOTasksListPartTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(11; "No."; Code[20])
        {

        }
        // field(10; "Appointment Number"; Code[20])
        // {
        // }
        field(1; "Task Code"; Code[20])
        {
            TableRelation = "User Tasks"."Code";
            trigger OnValidate()
            var
                objTask: Record "User Tasks";
            begin
                "Task Name" := '';
                objTask.Reset;
                objTask.SetRange(objTask."Code", Rec."Task Code");

                if objTask.Find('-') then
                    "Task Name" := objTask."Task Name";
                "Task Details" := objTask."Task Details";
                "Assign To" := objTask."Assign To";
                "Full Name" := objTask."Full Name";
                "Due Date" := objTask."Due Date";
                "Due Time" := objTask."Due Time";
                "Feedback" := objTask."Feedback";
                "Status" := objTask."Status";



            end;
        }
        field(2; "Task Name"; Text[100])
        {


        }
        field(3; "Task Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Assign To"; Code[20])
        {
        }
        field(5; "Full Name"; Text[250])
        {
        }
        field(6; "Due Date"; Date)
        {
        }
        field(7; "Due Time"; Time)
        {
        }
        field(8; "Feedback"; Text[250])
        {
        }
        field(9; "Status"; Option)
        {
            OptionCaption = 'Open,Closed,Pending,Cancelled,Unresolved,Resolved';
            OptionMembers = Open,Closed,Pending,Cancelled,Unresolved,Resolved;
        }

    }
    keys
    {
        key(key1; "No.", "Task Code")
        {
            Clustered = true;
        }

        key(key2; "Task Name")
        {

        }

    }
}
