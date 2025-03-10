xmlport 52178514 "Import Casual Attendance"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(Casual; "Casual Attendance")
            {
                fieldelement(PersonId; Casual."Person ID")
            {

            }
            fieldelement(Name; Casual.Name)
            {

            }
            fieldelement(Department; Casual.Department)
            {

            }
            fieldelement(Time; Casual.Time)
            {

            }
            fieldelement(Status; Casual."Attendance Status")
            {

            }
            fieldelement(Checkpoint; Casual."Check Point")
            {

            }
            fieldelement(CustomName; Casual."Custom Name")
            {

            }
            fieldelement(DataSource; Casual."Data Source")
            {

            }
                

        }
    }
    
}
}

//     trigger OnInitXmlPort()
//     begin
//         I := 0;
//     end;

//     var
//         I: Integer;
// }



    
