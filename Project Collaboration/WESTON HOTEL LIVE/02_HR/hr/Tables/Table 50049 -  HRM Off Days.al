table 50049 "HRM Off Days"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;EmplNo; Code[20])
        {
            DataClassification = ToBeClassified;
            
        }
        field(2; Department; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; OffDay; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; OffDayDate; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(Key1; EmplNo)
        {
            Clustered = true;
        }
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}