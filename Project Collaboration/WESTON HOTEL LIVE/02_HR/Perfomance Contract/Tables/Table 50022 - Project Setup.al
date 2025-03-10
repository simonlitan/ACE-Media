table 50022 "Project Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Job Nos."; Code[10])
        {
            Caption = 'Job Nos.';
            TableRelation = "No. Series";
        }
        field(1001; "Automatic Update Job Item Cost"; Boolean)
        {
            Caption = 'Automatic Update Job Item Cost';
        }
        field(5003; "Weekly No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5004; "Matrix No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5005; "Research Mngnt No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5006; "Research No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5007; "Monthly No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5008; "Event Code"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5009; "Income/Expenditure"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5010; Cashflow; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5011; "Finance/StewardShip"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5012; "Service Delivery"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5013; "Non Financial"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5015; Operation; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5016; Dynamics; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5017; Cohesion; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5018; Corruption; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5019; "Performance Criteria Code"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50000; "Performance Code Cascade"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50001; "Contract Period"; Code[20])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}

