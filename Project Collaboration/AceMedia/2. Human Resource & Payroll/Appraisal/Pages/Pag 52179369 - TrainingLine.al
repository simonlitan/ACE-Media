page 52179369 "Training Line"
{
    Caption = 'Training Line';
    PageType = ListPart;
    SourceTable = "Training Lines";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Training Identification"; Rec."Training Identification")
                {
                    // Editable = SupEditability;
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Training Identification field.';
                }

            }
        }
    }
    trigger OnAfterGetCurrRecord()

    begin
        //     SelfAppraisal.SetRange("No.", Rec."Document No.");
        //     if SelfAppraisal.FindFirst() then begin
        //         case SelfAppraisal.Status of
        //             SelfAppraisal.Status::Open:
        //                 begin
        //                     SelflineEditablity := false;
        //                     SupEditability := true
        //                 end;
        //             SelfAppraisal.Status::"Pending Approval":
        //                 begin
        //                     SelflineEditablity := false;
        //                     SupEditability := false
        //                 end;
        //             else begin
        //                 SelflineEditablity := true;
        //                 SupEditability := true
        //             end;
        //         end;
        //     end;
    end;

    var
        SelfAppraisal: Record "Self Appraisal";
        SelflineEditablity: Boolean;
        SupEditability: Boolean;
}
