page 52178920 "ISO-CarForm"
{
    Caption = 'ISO-CarForm';
    PageType = List;
    SourceTable = "ISO-CarFormTable";
    CardPageId = "ISO-CarCard";
    // SourceTable = "";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Form No"; Rec."Form No")
                {
                    ApplicationArea = All;

                }

                field("Organization"; Rec."Organization")
                {
                    ApplicationArea = All;

                }
                field("Car No"; Rec."Car No")
                {
                    ApplicationArea = All;

                }
                field("Area under review"; Rec."Area under review")
                {
                    ApplicationArea = All;

                }
                field("ISO 9001 CLAUSE"; Rec."ISO 9001 CLAUSE")
                {
                    ApplicationArea = All;

                }
                field("Category"; Rec."Category")
                {
                    ApplicationArea = All;

                }
                field("Requirement"; Rec."Requirement")
                {
                    ApplicationArea = All;

                }
                field("Non conformity evidence"; Rec."Non conformity evidence")
                {
                    ApplicationArea = All;

                }
                field("Auditor"; Rec."Auditor1")
                {
                    ApplicationArea = All;

                }
                field("Auditee"; Rec."Auditee1")
                {
                    ApplicationArea = All;

                }
            }

        }
    }
}
