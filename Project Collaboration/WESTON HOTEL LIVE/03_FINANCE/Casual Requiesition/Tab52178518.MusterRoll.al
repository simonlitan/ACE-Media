table 52178518 "Muster Roll"
{

    fields
    {
        field(1; "Staff No"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No." WHERE("Contract Type" = CONST(Casual));

            trigger OnValidate()
            begin
                HREmp.RESET;
                HREmp.SETRANGE(HREmp."No.", "Staff No");
                IF HREmp.FIND('-') THEN
                    "Staff Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
            end;
        }
        field(2; "Staff Name"; Text[200])
        {
        }
        field(3; "Day 1"; Boolean)
        {

            trigger OnValidate()
            begin
                // Total:="1"+"2"+"3"+"4"+"5"+"6"+"7";
                IF "Day 1" = TRUE THEN
                    Total := Total + 1;
                IF "Day 1" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(4; "Day 2"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 2" = TRUE THEN
                    Total := Total + 1;
                IF "Day 2" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(5; "Day 3"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 3" = TRUE THEN
                    Total := Total + 1;
                IF "Day 3" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(6; "Day 4"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 4" = TRUE THEN
                    Total := Total + 1;
                IF "Day 4" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(7; "Day 5"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 5" = TRUE THEN
                    Total := Total + 1;
                IF "Day 5" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(8; "Day 6"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 6" = TRUE THEN
                    Total := Total + 1;
                IF "Day 6" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(9; "Day 7"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 7" = TRUE THEN
                    Total := Total + 1;
                IF "Day 7" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(10; "Day 8"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 8" = TRUE THEN
                    Total := Total + 1;
                IF "Day 8" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(11; "Day 9"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 9" = TRUE THEN
                    Total := Total + 1;
                IF "Day 9" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(12; "Day 10"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 10" = TRUE THEN
                    Total := Total + 1;
                IF "Day 10" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(13; "Day 11"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 11" = TRUE THEN
                    Total := Total + 1;
                IF "Day 11" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(14; "Day 12"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 12" = TRUE THEN
                    Total := Total + 1;
                IF "Day 12" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(15; "Day 13"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 13" = TRUE THEN
                    Total := Total + 1;
                IF "Day 13" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(16; "Day 14"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 14" = TRUE THEN
                    Total := Total + 1;
                IF "Day 14" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(17; Total; Decimal)
        {
        }
        field(18; "Days Absent"; Decimal)
        {
        }
        field(19; Suspend; Boolean)
        {
        }
        field(20; "Branch Code"; Code[30])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(21; "Cost Centre"; Code[30])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(22; "Casual Req No."; Code[30])
        {
        }
        field(23; Approved; Boolean)
        {
        }
        field(24; "Day 15"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 15" = TRUE THEN
                    Total := Total + 1;
                IF "Day 15" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(25; "Day 16"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 16" = TRUE THEN
                    Total := Total + 1;
                IF "Day 16" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(26; "Day 17"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 17" = TRUE THEN
                    Total := Total + 1;
                IF "Day 17" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(27; "Day 18"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 18" = TRUE THEN
                    Total := Total + 1;
                IF "Day 18" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(28; "Day 19"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 19" = TRUE THEN
                    Total := Total + 1;
                IF "Day 19" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(29; "Day 20"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 20" = TRUE THEN
                    Total := Total + 1;
                IF "Day 20" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(30; "Day 21"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 21" = TRUE THEN
                    Total := Total + 1;
                IF "Day 21" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(31; "Day 22"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 22" = TRUE THEN
                    Total := Total + 1;
                IF "Day 22" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(32; "Day 23"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 23" = TRUE THEN
                    Total := Total + 1;
                IF "Day 23" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(33; "Day 24"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 24" = TRUE THEN
                    Total := Total + 1;
                IF "Day 24" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(34; "Day 25"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 25" = TRUE THEN
                    Total := Total + 1;
                IF "Day 25" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(35; "Day 26"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 26" = TRUE THEN
                    Total := Total + 1;
                IF "Day 26" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(36; "Day 27"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 27" = TRUE THEN
                    Total := Total + 1;
                IF "Day 27" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(37; "Day 28"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 28" = TRUE THEN
                    Total := Total + 1;
                IF "Day 28" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(38; "Day 29"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 29" = TRUE THEN
                    Total := Total + 1;
                IF "Day 29" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(39; "Day 30"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 30" = TRUE THEN
                    Total := Total + 1;
                IF "Day 30" = FALSE THEN
                    Total := Total - 1;
            end;
        }
        field(40; "Day 31"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Day 31" = TRUE THEN
                    Total := Total + 1;
                IF "Day 31" = FALSE THEN
                    Total := Total - 1;
            end;
        }
    }

    keys
    {
        key(Key1; "Staff No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HREmp: Record "HRM-Employee C";
}

