page 52179250 "prMassPCA Card"
{
    PageType = Card;
    SourceTable = prMassPCAHD;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Change Advice Serial No."; Rec."Change Advice Serial No.")
                {
                    ApplicationArea = All;
                }

                field("Transaction Code"; Rec."Transaction Code")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Period Month"; Rec."Period Month")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Period Year"; Rec."Period Year")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                }
                field(Effected; Rec.Effected)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }


            }
            part(MassPCALines; prPCAMassLines)
            {
                ApplicationArea = All;
                SubPageLink = "Change Advice Serial No." = FIELD("Change Advice Serial No.");
            }

        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Load Lines")
                {
                    Caption = 'Load Lines';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        rec.LoadLines();
                    end;




                }
                action(sendApproval)
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit IntCodeunit2;

                    begin


                        VarVariant := Rec;
                        IF ApprovalMgt.IsPCAEnabled(VarVariant) = true THEN
                            ApprovalMgt.OnSendPCAforApproval(VarVariant);

                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    RunObject = Page "Fin-Approval Entries";
                    RunPageLink = "Document No." = field("Change Advice Serial No.");


                }
                action(cancellsApproval)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit IntCodeunit2;

                    begin
                        VarVariant := Rec;
                        IF ApprovalMgt.IsPCAEnabled(VarVariant) = true THEN
                            ApprovalMgt.OnCancelPCAforApproval(VarVariant);
                    end;
                }
                separator(Posting)
                {
                }
            }
            group(Posts)
            {
                Caption = 'Post';

                action(Post)
                {
                    Caption = 'Post The Changes';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        IF Rec.Status <> Rec.Status::Approved THEN ERROR('PCA must be approved to continue');

                        mPayrollCode := '';

                        UserSetup.RESET;
                        UserSetup.SETRANGE(UserSetup."User ID", USERID);
                        IF UserSetup.FIND('-') THEN BEGIN
                            mPayrollCode := UserSetup."Payroll Code";
                        END;

                        objPeriod.RESET;
                        objPeriod.SETRANGE(objPeriod.Closed, FALSE);
                        IF objPeriod.FIND('-') THEN BEGIN
                            intMonth := objPeriod."Period Month";
                            intYear := objPeriod."Period Year";
                            dtPAyrollPeriod := objPeriod."Date Opened";
                        END;


                        // IF intMonth <> 1 THEN ERROR('The month should be January');

                        IF CONFIRM('Are you Sure you want to post these changes') THEN BEGIN


                            objLines.RESET;
                            objLines.SETRANGE(objLines."Change Advice Serial No.", Rec."Change Advice Serial No.");
                            IF objLines.FIND('-') THEN BEGIN
                                REPEAT
                                BEGIN

                                    IF dim1 = '' THEN dim1 := objemp."Global Dimension 1 Code";

                                    // IF dim3 = '' THEN dim3 := objemp.Schools;
                                    // IF dim4 = '' THEN dim4 := objemp.Section;

                                    objEmpTrans.RESET;
                                    objEmpTrans.SETRANGE(objEmpTrans."Employee Code", objLines."Employee Code");
                                    objEmpTrans.SETRANGE(objEmpTrans."Payroll Period", objLines."Payroll Period");
                                    objEmpTrans.SETRANGE(objEmpTrans."Transaction Code", objLines."Transaction Code");
                                    objEmpTrans.SETRANGE(objEmpTrans."Payroll Code", 'PAYROLL');
                                    IF objEmpTrans.FIND('-') THEN BEGIN
                                        objEmpTrans."Employee Code" := objLines."Employee Code";
                                        objEmpTrans."Transaction Code" := objLines."Transaction Code";
                                        objEmpTrans."Period Month" := intMonth;
                                        objEmpTrans."Period Year" := intYear;
                                        objEmpTrans."Payroll Period" := dtPAyrollPeriod;
                                        objEmpTrans."Transaction Name" := objLines."Transaction Name";
                                        objEmpTrans.Amount := objLines.Amount;
                                        objEmpTrans."Payroll Period" := objLines."Payroll Period";
                                        objEmpTrans."Recurance Index" := objLines."Recurance Index";
                                        objEmpTrans.Balance := objLines.Balance;
                                        objEmpTrans."Payroll Code" := 'PAYROLL';
                                        objEmpTrans.MODIFY;
                                    END ELSE BEGIN
                                        objEmpTrans.INIT;
                                        objEmpTrans."Employee Code" := objLines."Employee Code";
                                        objEmpTrans."Transaction Code" := objLines."Transaction Code";
                                        objEmpTrans."Period Month" := intMonth;
                                        objEmpTrans."Period Year" := intYear;
                                        objEmpTrans."Payroll Period" := dtPAyrollPeriod;
                                        objEmpTrans."Transaction Name" := objLines."Transaction Name";
                                        objEmpTrans.Amount := objLines.Amount;
                                        objEmpTrans."Payroll Period" := objLines."Payroll Period";
                                        objEmpTrans."Recurance Index" := objLines."Recurance Index";
                                        objEmpTrans.Balance := objLines.Balance;
                                        objEmpTrans."Payroll Code" := 'PAYROLL';
                                        objEmpTrans.INSERT;
                                    END;
                                END;
                                UNTIL objLines.NEXT = 0;
                            END;

                            Rec.Effected := TRUE;
                            Rec.Status := Rec.Status::Posted;
                            Rec.MODIFY;

                            MESSAGE('These changes has been uploaded to the current payroll');
                        END;
                    end;
                }
            }
        }
    }

    var
        objemp: Record "HRM-Employee C";
        objLines: Record prMassPCALines;
        slagrade: Record "HRM-Salary Grades";
        objPeriod: Record "PRL-Payroll Periods";
        uSetup: Record "User Setup";
        mPayrollCode: Code[50];
        objEmpTrans: Record "PRL-Employee Transactions";
        objEmpTransPCA: Record prMassPCAHD;
        intMonth: Integer;
        intYear: Integer;
        Ints: Integer;
        dtPAyrollPeriod: Date;
        dim1: Code[50];
        dim2: Code[50];
        dim3: Code[50];
        dim4: Code[50];
        UserSetup: Record "User Setup";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Work Flow Code";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

