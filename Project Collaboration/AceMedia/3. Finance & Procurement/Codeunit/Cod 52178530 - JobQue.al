codeunit 52178530 "Job Que"
{
    TableNo = "Job Queue Entry";
    trigger OnRun()

    begin
        //Message('Started with %1', Rec."Parameter String");
        if Rec."Job Queue Category Code" = '' then begin

        end;
    end;

}
