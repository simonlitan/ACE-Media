page 52179092 "HRM-Disciplinary Cases List"
{
    Caption = 'Employee Disciplinary Cases ';
    CardPageID = "HRM-Disciplinary Case Card";
    Editable = true;
    ModifyAllowed = true;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions,Case Status,Show';
    SourceTable = "HRM-Disciplinary Cases (B)";
    // SourceTableView = where(Status = filter(New));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Accused Employee"; Rec."Accused Employee")
                {
                    ToolTip = 'Specifies the value of the Accused Employee field.';
                    ApplicationArea = All;

                    Editable = false;
                }
                field("Accused Employee Name"; Rec."Accused Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.';
                    ApplicationArea = All;
                }
                field("Department Code"; Rec."Department Code")
                {

                }
                field(Department; Rec.Department)
                {

                }

                field("Case Category"; Rec."Case Category")
                {
                    ToolTip = 'Specifies the value of the Case Category field.';
                    ApplicationArea = All;
                }
                field("Case Description"; Rec."Case Description")
                {
                    ToolTip = 'Specifies the value of the Case Description field.';
                    ApplicationArea = All;
                }
                field("Incident Date"; Rec."Incident Date")
                {
                    ToolTip = 'Specifies the value of the Incident Date field.';
                    ApplicationArea = All;
                }
                field("Disc. Committee Case Date"; Rec."Disc. Committee Case Date")
                {
                    ToolTip = 'Specifies the value of the Disciplinary Committee Case Date field.';
                    ApplicationArea = All;
                }
                field("Disciplinary Committee Verdict"; Rec."Disciplinary Committee Verdict")
                {
                    ToolTip = 'Specifies the value of the Disciplinary Committee Verdict field.';
                    ApplicationArea = All;
                }
                field("Appeal (Yes/No)"; Rec."Appeal (Yes/No)")
                {
                    ToolTip = 'Specifies the value of the Appeal (Yes/No) field.';
                    ApplicationArea = All;
                }
                field("Appeal Date"; Rec."Appeal Date")
                {
                    ToolTip = 'Specifies the value of the Appeal Date field.';
                    ApplicationArea = All;
                }
                field("Verdict on Appeal"; Rec."Verdict on Appeal")
                {
                    ToolTip = 'Specifies the value of the Verdict on Appeal field.';
                    ApplicationArea = All;
                }

                // field("Date of Complaint"; Rec."Date of Complaint")
                // {
                //     Caption = 'Incident Date';
                //     ApplicationArea = all;
                // }
                // field("Letter Date"; Rec."Letter Date")
                // {
                //     ToolTip = 'Specifies the value of the Letter Date field.';
                //     ApplicationArea = All;
                // }







            }
        }

    }

    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Send Case Approval Request")
                {
                    Caption = 'Send Case Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if Confirm('Send this Case for Approval ?', true) = false then exit;
                        //AppMgmt.SendDisciplinaryApprovalReq(Rec);
                    end;
                }
                action("Cancel Case Approval Request")
                {
                    Caption = 'Cancel Case Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if Confirm('Cancel Case Approval Request?', true) = false then exit;
                        //AppMgmt.CancelDiscipplinaryAppApprovalReq(Rec,TRUE,TRUE);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    RunObject = page "Fin-Approval Entries";
                    RunPageLink = "Document No." = field("Case Number");
                }
            }
            group("Case Status")
            {
                action("Under Investigation")
                {
                    ApplicationArea = all;
                    Caption = 'Under Investigation';
                    Image = OpenWorksheet;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);

                        /*
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Investigation" THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"In Progress" THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::Closed THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Review" THEN EXIT;
                        */

                        if Confirm('Are you sure you want to mark this case as "Under Investigation"?') then begin
                            Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::"Investigation ";
                            Rec.Modify;
                            Message('Case Number %1 has been marked as under "Investigation"', Rec."Case Number");
                        end;

                    end;
                }
                action("In Progress")
                {
                    ApplicationArea = all;
                    Caption = 'In Progress';
                    Image = CarryOutActionMessage;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);

                        /*
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Investigation" THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"In Progress" THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::Closed THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Review" THEN EXIT;
                        */

                        if Confirm('Are you sure you want to open Investigations for these Case?') then begin
                            Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::Inprogress;
                            Rec.Modify;
                            Message('Case Number %1 has been marked as "In Progress"', Rec."Case Number");
                        end;

                    end;
                }
                action(Close)
                {
                    ApplicationArea = all;
                    Caption = ' Close';
                    Image = Closed;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);

                        /*
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Investigation" THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"In Progress" THEN EXIT;
                      //  IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::Closed THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Review" THEN EXIT;
                        */

                        if Confirm('Are you sure you want to mark this case as "Closed"?') then begin
                            Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::Closed;
                            Rec.Modify;
                            Message('Case Number %1 has been marked as "Closed"', Rec."Case Number");
                        end;

                    end;
                }
                action(Appeal)
                {
                    ApplicationArea = all;
                    Caption = ' Appeal';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);


                        if Confirm('Are you sure you want to mark this case as "Under Review?"') then begin
                            Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::"Under review";
                            Rec.Modify;
                            Message('Case Number %1 has been marked as "Under Review"', Rec."Case Number");
                        end;
                    end;
                }
            }
        }
    }

    var
        //todo AppMgmt: Codeunit "Approvals Management";
        "Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Leave Journal","Medical Claims","Activity Approval","Disciplinary Approvals";
}

