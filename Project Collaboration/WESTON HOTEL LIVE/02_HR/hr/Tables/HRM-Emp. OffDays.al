table 50056 "HRM-Emp. OffDays"
{
    LookupPageID = "HRM-Emp. OffDays Look Up";

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = false;
            TableRelation = "HRM-Employee C"."No.";
        }
        field(2; "Off-Day Code"; Code[20])
        {
            NotBlank = true;
            // TableRelation = "HRM-OffDays Type".Code;

            //calculate balance of off-days remaining
            trigger OnValidate()
            begin

                // if "Leave Types".Find('-') then begin
                //     ;
                //     if "Leave Types".Gender <> "Leave Types".Gender::Both then begin
                //         EmployeeRec.Reset;
                //         EmployeeRec.SetRange(EmployeeRec."No.", "Employee No");
                //         if "Leave Types".Gender = "Leave Types".Gender::Female then begin
                //             if EmployeeRec.Gender <> EmployeeRec.Gender::Female then begin
                //                 "Leave Code" := '';
                //                 Balance := 0;
                //                 Error('%1', 'You cannot assign this employee this leave.');
                //             end;
                //         end
                //         else
                //             Balance := "Leave Types".Days;
                //     end
                //     else
                //         Balance := "Leave Types".Days;
                // end;

                // Balance := "Leave Types".Days;
            end;
        }
        field(3; "Maturity Date"; Date)
        {
        }
        field(4; Balance; Decimal)
        {
        }
        field(5; "Acrued Days"; Decimal)
        {
        }
        field(6; Posted; Boolean)
        {
        }
        field(7; "Posting Date"; Date)
        {
        }
        field(8; UserID; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", "Off-Day Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        EmployeeRec: Record "HRM-Employee C";
}

