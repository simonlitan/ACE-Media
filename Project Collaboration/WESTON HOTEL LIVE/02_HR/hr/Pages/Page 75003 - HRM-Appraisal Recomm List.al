page 69784 "HRM-Appraisal Recomm List"
{
    CardPageID = "HRM-Appraisal Recomm. Labels";
    PageType = List;
    SourceTable = "HRM-Appraisal Res. Status";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Manual Status Processing"; Rec."Manual Status Processing")
                {
                    ApplicationArea = All;
                }
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = All;
                }
                field("Status Msg1"; Rec."Status Msg1")
                {
                    ApplicationArea = All;
                }
                field("IncludeVariable 1"; Rec."IncludeVariable 1")
                {
                    ApplicationArea = All;
                }
                field("Status Msg2"; Rec."Status Msg2")
                {
                    ApplicationArea = All;
                }
                field("IncludeVariable 2"; Rec."IncludeVariable 2")
                {
                    ApplicationArea = All;
                }
                field("Status Msg3"; Rec."Status Msg3")
                {
                    ApplicationArea = All;
                }
                field("IncludeVariable 3"; Rec."IncludeVariable 3")
                {
                    ApplicationArea = All;
                }
                field("Status Msg4"; Rec."Status Msg4")
                {
                    ApplicationArea = All;
                }
                field("IncludeVariable 4"; Rec."IncludeVariable 4")
                {
                    ApplicationArea = All;
                }
                field("Status Msg5"; Rec."Status Msg5")
                {
                    ApplicationArea = All;
                }
                field("IncludeVariable 5"; Rec."IncludeVariable 5")
                {
                    ApplicationArea = All;
                }
                field("Status Msg6"; Rec."Status Msg6")
                {
                    ApplicationArea = All;
                }
                field("IncludeVariable 6"; Rec."IncludeVariable 6")
                {
                    ApplicationArea = All;
                }
                field("Minimum Units Failed"; Rec."Minimum Units Failed")
                {
                    ApplicationArea = All;
                }
                field("Maximum Units Failed"; Rec."Maximum Units Failed")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Summary Page Caption"; Rec."Summary Page Caption")
                {
                    ApplicationArea = All;
                }
                field("Include Failed Targets Headers"; Rec."Include Failed Targets Headers")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

