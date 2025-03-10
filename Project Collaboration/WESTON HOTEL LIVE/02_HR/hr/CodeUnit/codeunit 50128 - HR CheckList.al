codeunit 50128 "HR CheckList"
{

    trigger OnRun()
    begin
    end;

    var
        CheckListItems: Record "HRM-Staff  Induction";
        CheckList: Record "HRM-Induction Schedule";
        Found: Boolean;
        Found1: Boolean;
        ItemText: Text[100];
        Number: Integer;
        Employee: Record "HRM-Employee C";
        OKEmp: Boolean;
        ExitInterviewCheckList: Record "HRM-Jobs1";
        "ExitInterviewCheckList Items": Record "HRM-Medical Claims";

    [Scope('OnPrem')]
    procedure GetItems(EmployeeNo: Code[20]; type: Integer)
    var
        FoundEmployee: Boolean;
    begin
        OKEmp := Employee.GET(EmployeeNo);
        Found := CheckListItems.FIND('-');
        CASE type OF
            1:
                BEGIN
                    // FoundEmployee := FindEmp(EmployeeNo);
                    IF ((Found) AND (FoundEmployee = FALSE)) THEN BEGIN
                        REPEAT
                            ItemText := CheckListItems."Induction Code";
                            CheckList.INIT;
                            CheckList."Induction Code" := EmployeeNo;
                            CheckList."Staff Names" := ItemText;
                            IF OKEmp THEN BEGIN
                                CheckList."Department Code" := Employee."First Name";
                                CheckList."Department Name" := Employee."Last Name";
                            END;
                            CheckList.INSERT;

                        UNTIL CheckListItems.NEXT = 0;
                    END;
                END;
            2:
                BEGIN
                    REPEAT
                        ItemText := CheckListItems."Induction Code";
                        CheckList.INIT;
                        CheckList."Induction Code" := EmployeeNo;
                        CheckList."Staff Names" := ItemText;
                        IF OKEmp THEN BEGIN
                            CheckList."Department Code" := Employee."First Name";
                            CheckList."Department Name" := Employee."Last Name";
                        END;
                        CheckList.INSERT;

                    UNTIL CheckListItems.NEXT = 0;
                END;
        END;
    end;

    [Scope('OnPrem')]
    procedure FindEmp(EmpNo: Code[20]) FoundEmp: Boolean
    var
        EmployeeNumber: Code[20];
    begin
        Found := CheckList.FIND('-');

        IF (Found) THEN BEGIN
            WHILE ((FoundEmp = FALSE) AND (CheckList.NEXT <> 0)) DO BEGIN
                EmployeeNumber := CheckList."Induction Code";
                IF (EmployeeNumber = EmpNo) THEN BEGIN
                    FoundEmp := TRUE
                END ELSE
                    FoundEmp := FALSE;
                CheckList.NEXT;
            END;
        END;
    end;

    [Scope('OnPrem')]
    procedure DeleteEmpList(EmpNo: Code[20])
    begin
        CheckList.SETRANGE("Induction Code", EmpNo);
        CheckList.DELETEALL;
    end;

    [Scope('OnPrem')]
    procedure GetExitInterviewItems(EmployeeNo: Code[20]; type: Integer)
    var
        FoundEmployee: Boolean;
    begin
        OKEmp := Employee.GET(EmployeeNo);
        Found := "ExitInterviewCheckList Items".FIND('-');
        CASE type OF
            1:
                BEGIN
                    //FoundEmployee := FindExitInterviewEmp(EmployeeNo);
                    IF ((Found) AND (FoundEmployee = FALSE)) THEN BEGIN
                        REPEAT
                            //ItemText:= "ExitInterviewCheckList Items"."Claim Type";
                            ExitInterviewCheckList.INIT;
                            ExitInterviewCheckList."Job ID" := EmployeeNo;
                            //ExitInterviewCheckList."No of Posts":= ItemText;
                            IF OKEmp THEN BEGIN
                                CheckList."Department Code" := Employee."First Name";
                                CheckList."Department Name" := Employee."Last Name";
                            END;
                            ExitInterviewCheckList.INSERT;

                        UNTIL CheckListItems.NEXT = 0;
                    END;
                END;
            2:
                BEGIN
                    REPEAT

                        // ItemText:= "ExitInterviewCheckList Items"."Claim Type";
                        ExitInterviewCheckList.INIT;
                        ExitInterviewCheckList."Job ID" := EmployeeNo;
                        // ExitInterviewCheckList."No of Posts":= ItemText;
                        IF OKEmp THEN BEGIN
                            CheckList."Department Code" := Employee."First Name";
                            CheckList."Department Name" := Employee."Last Name";
                        END;
                        ExitInterviewCheckList.INSERT;

                    UNTIL "ExitInterviewCheckList Items".NEXT = 0;
                END;
        END;
    end;

    [Scope('OnPrem')]
    procedure FindExitInterviewEmp(EmpNo: Code[20]) FoundEmp: Boolean
    var
        EmployeeNumber: Code[20];
    begin
        Found := ExitInterviewCheckList.FIND('-');

        IF (Found) THEN BEGIN
            WHILE ((FoundEmp = FALSE) AND (ExitInterviewCheckList.NEXT <> 0)) DO BEGIN
                EmployeeNumber := ExitInterviewCheckList."Job ID";
                IF (EmployeeNumber = EmpNo) THEN BEGIN
                    FoundEmp := TRUE
                END ELSE
                    FoundEmp := FALSE;
                ExitInterviewCheckList.NEXT;
            END;
        END;
    end;

    [Scope('OnPrem')]
    procedure DeleteExitInterviewEmp(EmpNo: Code[20])
    begin
        ExitInterviewCheckList.SETRANGE("Job ID", EmpNo);
        ExitInterviewCheckList.DELETEALL;
    end;
}

