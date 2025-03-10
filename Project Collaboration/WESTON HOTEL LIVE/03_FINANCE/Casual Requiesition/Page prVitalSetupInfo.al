page 52178545 "prVital Setup Info"
{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "prVital Setup Info";
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                    field("Setup Code"; Rec."Setup Code")
                    {
                        Description = '[Relief]';
                        ApplicationArea = All;
                    }
                    field("Tax Relief"; Rec."Tax Relief")
                    {
                        Description = '[Relief]';
                        ApplicationArea = All;
                    }
                    field("Insurance Relief"; Rec."Insurance Relief")
                    {
                        Description = '[Relief]';
                        ApplicationArea = All;
                    }
                    field("Max Relief"; Rec."Max Relief")
                    {
                        Description = '[Relief]';
                        ApplicationArea = All;
                    }
                    field("Mortgage Relief"; Rec."Mortgage Relief")
                    {
                        Description = '[Relief]';
                        ApplicationArea = All;
                    }
                    field("Max Pension Contribution"; Rec."Max Pension Contribution")
                    {
                        Description = '[Pension]';
                        ApplicationArea = All;
                    }
                    field("Tax On Excess Pension"; Rec."Tax On Excess Pension")
                    {
                        Description = '[Pension]';
                        ApplicationArea = All;
                    }
                    field("Loan Market Rate"; Rec."Loan Market Rate")
                    {
                        Description = '[Loans]';
                        ApplicationArea = All;
                    }
                    field("Loan Corporate Rate"; Rec."Loan Corporate Rate")
                    {
                        Description = '[Loans]';
                        ApplicationArea = All;
                    }
                    field("Taxable Pay (Normal)"; Rec."Taxable Pay (Normal)")
                    {
                        Description = '[Housing]';
                        ApplicationArea = All;
                    }
                    field("Taxable Pay (Agricultural)"; Rec."Taxable Pay (Agricultural)")
                    {
                        Description = '[Housing]';
                        ApplicationArea = All;
                    }
                    field("NHIF Based on"; Rec."NHIF Based on")
                    {
                        Description = '[NHIF] - Gross,Basic,Taxable Pay';
                        //OptionMembers = Gross,Basic,"Taxable Pay";
                        ApplicationArea = All;
                    }
                    field("NSSF Employee"; Rec."NSSF Employee")
                    {
                        Description = '[NSSF]';
                        ApplicationArea = All;
                    }
                    field("NSSF Employer Factor"; Rec."NSSF Employer Factor")
                    {
                        Description = '[NSSF]';
                        ApplicationArea = All;
                    }
                    field("OOI Deduction"; Rec."OOI Deduction")
                    {
                        Description = '[OOI]';
                        ApplicationArea = All;
                    }
                    field("OOI December"; Rec."OOI December")
                    {
                        Description = '[OOI]';
                        ApplicationArea = All;
                    }
                    field("Security Day (U)"; Rec."Security Day (U)")
                    {
                        Description = '[Servant]';
                        ApplicationArea = All;
                    }
                    field("Security Night (U)"; Rec."Security Night (U)")
                    {
                        Description = '[Servant]';
                        ApplicationArea = All;
                    }
                    field("Ayah (U)"; Rec."Ayah (U)")
                    {
                        Description = '[Servant]';
                        ApplicationArea = All;
                    }
                    field("Gardener (U)"; Rec."Gardener (U)")
                    {
                        Description = '[Servant]';    
                        ApplicationArea = All;
                    }
                    field("Security Day (R)"; Rec."Security Day (R)")
                    {
                        Description = '[Servant]';
                        ApplicationArea = All;
                    }
                    field("Security Night (R)"; Rec."Security Night (R)")
                    {
                        Description = '[Servant]';
                        ApplicationArea = All;
                    }
                    field("Ayah (R)"; Rec."Ayah (R)")
                    {
                        Description = '[Servant]';
                        ApplicationArea = All;
                    }
                    field("Gardener (R)"; Rec."Gardener (R)")
                    {
                        Description = '[Servant]';
                        ApplicationArea = All;
                    }
                    field("Benefit Threshold"; Rec."Benefit Threshold")
                    {
                        Description = '[Servant]';
                        ApplicationArea = All;
                    }
                    field("NSSF Based on"; Rec."NSSF Based on")
                    {
                        Description = '[NSSF] - Gross,Basic,Taxable Pay';
                        //OptionMembers = Gross,Basic,"Taxable Pay";
                        ApplicationArea = All;
                    }
                    field("Casual Rate"; Rec."Casual Rate")
                    {
                        ApplicationArea = All;
                    }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}