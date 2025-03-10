table 52178898 "ICT Issues Desc"
{
    Caption = 'ICT Issues Desc';
    DataClassification = ToBeClassified;
    
    fields
    {
       field(1; "No."; Code[20])
        {

        }
        field(2; "Area Description"; text[200])
        {

        }
         field(3; "Issue Priority"; Option)
        {
            OptionMembers = " ",Low, Medium, High, Critical;
        }
        field(4; "Issue Area"; Text[50])
        {
            TableRelation = "ICT Support Areas";
            trigger OnValidate()
            var
                SupportAreas: Record "ICT Support Areas";
            begin
                SupportAreas.Reset();
                if SupportAreas.Get("Issue Area") then begin
                    "Area Description" := SupportAreas."Area Description";
                end;
            end;
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement= true;
        }
   
    }
    keys
    {
        key(PK; "No.", "Line No.")
        {
            Clustered = true;
        }
    }
    // trigger OnInsert()
    // var
    //     myInt: Integer;
    // begin
    //     "Line No." +=1;
    // end;
}
