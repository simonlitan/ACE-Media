codeunit 52178423 "Posting Check FP"
{
    SingleInstance = true;

    trigger OnRun()
    begin
    end;

    var
        Post: Boolean;
        blnState: Boolean;
        blnJrnlState: Boolean;
        FromNo: Code[20];
        ToNo: Code[20];

    procedure SetCheck(var blnPost: Boolean)
    begin
        Post := blnPost;
    end;


    procedure GetCheck() blnPost: Boolean
    begin
        blnPost := Post;
    end;


    procedure ResetState()
    begin
        blnState := FALSE;
        FromNo := '';
        ToNo := '';
    end;


    procedure SetState(Post: Boolean)
    begin
        blnState := Post;
    end;


    procedure GetState() ActState: Boolean
    begin
        ActState := blnState;
        EXIT(ActState);
    end;


    procedure FromEntryNo(var FromNoReg: Code[20])
    begin
        FromNo := FromNoReg;
    end;


    procedure ToEntryNo(var ToNoReg: Code[20])
    begin
        ToNo := ToNoReg;
    end;


    procedure GetFromRegNo() FromRegisterNo: Code[20]
    begin
        FromRegisterNo := FromNo;
    end;


    procedure GetToRegNo() ToRegisterNo: Code[20]
    begin
        ToRegisterNo := ToNo;
    end;

    procedure ValidatePostingDate(var pdate: date)
    var
        Genledger: Record "General Ledger Setup";
    begin
        Genledger.get;
        if ((pdate < Genledger."Allow Posting From") or (pdate > Genledger."Allow Posting To"))
        then begin
            Error('%1%2%3%4', 'Allowed Posting Period is from ', Genledger."Allow Posting From", ' to ',
                  Genledger."Allow Posting To");
        end;


    end;
}

