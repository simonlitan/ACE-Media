page 52179309 "HRM-Leave Periods"
{
    Caption = 'HRM-Leave Periods';
    PageType = List;
    SourceTable = "HRM-Leave Periods";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field(Current; Rec.Current)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current field.';
                }
                field(Closed; Rec.Closed)
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
            action("Close Period")
            {
                ApplicationArea = all;
                Image = CloseYear;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    fnGetOpenPeriod();
                    Question := 'Once a period has been closed it can not be opened.' + 'Do you still want to close the year [' + strPeriodName + ']';
                    Answer := DIALOG.Confirm(Question, false);
                    if Answer = true then begin
                        rec.CloseLeavePeriod();
                        rec.Reset();
                    end else
                        Message('You have selected NOT to Close the period');
                    rec.Reset();
                end;

            }
            action("Leave Period Update")
            {
                ApplicationArea = all;
                RunObject = page "Leave Setup List";
            }
        }
    }
    procedure fnGetOpenPeriod()
    begin
        //Get the open/current period
        rec.SetRange(rec.Closed, false);
        if rec.Find('-') then begin
            Rec.Validate(Closed);
            strPeriodName := rec.Year;
        end;
    end;

    var
        Answer: Boolean;
        Question: Text[250];
        strPeriodName: Text[100];


}
