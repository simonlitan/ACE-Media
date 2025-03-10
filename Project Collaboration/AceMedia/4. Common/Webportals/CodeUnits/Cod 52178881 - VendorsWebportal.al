codeunit 52178881 "VendorsWebportal"
{
    trigger OnRun()
    begin
    end;

    var
        tblBidder: Record "Tender Applicants Registration";
        tblTenderBidFinReq: Record "Tender Bidder Fin Reqs";
        vendors: Record Vendor;
        preqcategories: Record "Proc-Prequalif. Categories";
        preqapp: Record "Prequalification Application";
        years: Record "Proc-Prequalification Years";
        preqappcat: Record "Preq Application categories";
        procheader: Record "PROC-Purchase Quote Header";
        proclines: Record "PROC-Purchase Quote Line";
        tenderheader: Record "Tender Submission Header";
        tenderlines: Record "Tender Submission Lines";
        purpay: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        nextapplicno: Code[20];

    procedure CreateBidderAccount(KRAPin: Code[20]; CompName: Text; PostalAddress: Text; CompPhone: Text; CompEmail: Text; ContactPerson: Text; ContactPersonPhone: Text; ContactPersonEmail: Text; activationCode: Code[20]) msg: boolean
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", KRAPin);

        IF NOT tblBidder.FIND('-') THEN BEGIN
            tblBidder."No." := KRAPin;
            tblBidder.Name := CompName;
            tblBidder."E-Mail" := CompEmail;
            tblBidder."Company Contact" := CompPhone;
            tblBidder.Address := PostalAddress;
            tblBidder."Contact Person" := ContactPerson;
            tblBidder."Phone No." := ContactPersonPhone;
            tblBidder."Contact Person Email" := ContactPersonEmail;
            tblBidder."VAT Registration No." := KRAPin;
            tblBidder.OTP := activationCode;
            tblBidder.INSERT;
            msg := True;
        END
        ELSE BEGIN
            Error('KRA Pin already registered!');
        END;
    end;

    procedure prequalificationapplied(krapin: Code[20]) msg: Boolean
    begin
        preqapp.Reset;
        preqapp.SetRange("VAT Registration No.", krapin);
        preqapp.SetRange(Period, GetCurrentPeriod());
        if preqapp.Find('-') then begin
            msg := true;
        end;
    end;

    procedure BidHeaderCreate(krapin: Code[20]; tenderno: Code[20]) msg: Text
    begin
        procheader.Reset;
        procheader.SetRange("No.", tenderno);
        if procheader.Find('-') then begin
            tenderheader.Reset;
            tenderheader.SetRange("Tender No.", tenderno);
            tenderheader.SetRange("Bidder No", krapin);
            if not tenderheader.Find('-') then begin
                nextapplicno := NoSeriesMgt.GetNextNo('BID', 0D, True);
                tenderheader.init;
                tenderheader."No." := nextapplicno;
                tenderheader."Bidder No" := krapin;
                tenderheader."Tender No." := tenderno;
                tenderheader."Request for Quote No." := procheader."No.";
                tenderheader."Document Type" := procheader."Document Type";
                tenderheader."Procurement methods" := procheader."Procurement methods";
                tenderheader."Posting Description" := procheader.Description;
                tenderheader."Bid Status" := tenderheader."Bid Status"::pending;
                tenderheader."RFQ No." := procheader."Requisition No.";
                tenderheader."Document Date" := Today;
                tenderheader."Expected Opening Date" := procheader."Expected Opening Date";
                tenderheader."Expected Closing Date" := procheader."Expected Closing Date";
                tenderheader.insert;
                msg := nextapplicno;
            end;
        end;
    end;

    procedure BidLineCreate(krapin: Code[20]; tenderno: Code[20]; bidno: code[20]; itemno: Code[20]; quoteamt: Decimal) msg: Boolean
    begin
        tenderheader.Reset;
        tenderheader.SetRange("No.", bidno);
        tenderheader.SetRange("Tender No.", tenderno);
        tenderheader.SetRange("Bidder No", krapin);
        if tenderheader.Find('-') then begin
            proclines.Reset;
            proclines.SetRange("Document Type", tenderheader."Document Type");
            proclines.SetRange("No.", itemno);
            proclines.SetRange("Document No.", tenderno);
            if proclines.Find('-') then begin
                tenderlines.Reset;
                tenderlines.SetRange("Document Type", tenderheader."Document Type");
                tenderlines.SetRange("Tender No.", tenderno);
                tenderlines.SetRange("Document No.", bidno);
                tenderlines.SetRange("No.", itemno);
                if not tenderlines.Find('-') then begin
                    tenderlines.init;
                    tenderlines.Type := proclines.Type;
                    tenderlines."No." := itemno;
                    tenderlines.Validate("No.");
                    tenderlines."Document Date" := Today;
                    tenderlines."Document No." := bidno;
                    tenderlines."Tender No." := tenderno;
                    tenderlines."RFQ No." := tenderheader."RFQ No.";
                    tenderlines."Buy-from Bidder No." := krapin;
                    tenderlines."Document Type" := tenderheader."Document Type";
                    tenderlines."Buy-from Bidder No." := krapin;
                    tenderlines."Direct Unit Cost" := quoteamt;
                    tenderlines."Unit of Measure" := proclines."Unit of Measure";
                    tenderlines.Quantity := proclines.Quantity;
                    tenderlines.Validate(Quantity);
                    tenderlines.insert;
                    msg := true;
                end else begin
                    Error('Tender line already added!');
                end;
            end else begin
                Error('Procurement header not found!')
            end;
        end else begin
            Error('Tender submission header not found!');
        end;
    end;

    procedure SubmitBid(krapin: Code[20]; bidno: code[20]) msg: Boolean
    begin
        tenderheader.Reset;
        tenderheader.SetRange("Bidder No", krapin);
        tenderheader.SetRange("No.", bidno);
        if tenderheader.Find('-') then begin
            tenderheader."Bid Status" := tenderheader."Bid Status"::Submitted;
            tenderheader.Modify;
            msg := true;
        end;
    end;

    procedure TenderApplied(krapin: Code[20]; tenderno: Code[20]) msg: Boolean
    begin
        tenderheader.Reset;
        tenderheader.SetRange("Bidder No", krapin);
        tenderheader.SetRange("Tender No.", tenderno);
        if tenderheader.find('-') then begin
            msg := true;
        end;
    end;

    procedure GetMyBids(krapin: Code[20]) msg: Text
    begin
        tenderheader.Reset;
        tenderheader.SetCurrentKey("No.");
        tenderheader.SetRange("Bidder No", krapin);
        if tenderheader.Find('-') then begin
            repeat
                Msg += tenderheader."No." + ' ::' + tenderheader."Tender No." + ' ::' + tenderheader."Posting Description" + ' ::' + Format(tenderheader."Document Date") + ' ::' + Format(tenderheader."Expected Opening Date") + ' ::' + Format(tenderheader."Expected Closing Date") + ' ::' + Format(tenderheader."Bid Status") + ' :::';
            until tenderheader.next = 0;
        end;
    end;

    procedure GetMyBidLines(krapin: Code[20]; docno: Code[20]) msg: Text
    begin
        tenderlines.Reset;
        tenderlines.SetRange("Buy-from Bidder No.", krapin);
        tenderlines.SetRange("Document No.", docno);
        if tenderlines.Find('-') then begin
            repeat
                Msg += tenderlines."No." + ' ::' + tenderlines.Description + ' ::' + tenderlines."Unit of Measure" + ' ::' + Format(tenderlines."Direct Unit Cost") + ' ::' + Format(tenderlines.Quantity) + ' ::' + Format(tenderlines.Amount) + ' :::';
            until tenderlines.next = 0;
        end;
    end;

    procedure PreqApplicHeaderCreate(krapin: Code[20]) msg: boolean
    begin
        tblBidder.Reset;
        tblBidder.SetRange("No.", krapin);
        IF tblBidder.Find('-') then begin
            years.Reset;
            years.SetRange("Active Period", true);
            if years.Find('-') then begin
                preqapp.Reset;
                preqapp.SetRange("VAT Registration No.", tblBidder."No.");
                preqapp.SetRange(Period, years."Preq. Year");
                if not preqapp.Find('-') then begin
                    preqapp.init;
                    preqapp."VAT Registration No." := tblBidder."No.";
                    preqapp.Period := years."Preq. Year";
                    preqapp.Name := tblBidder.Name;
                    preqapp.Phone := tblBidder."Company Contact";
                    preqapp.Address := tblBidder.Address;
                    preqapp."Contact Person" := tblBidder."Contact Person";
                    preqapp."Contact Telephone" := tblBidder."Phone No.";
                    preqapp.Email := tblBidder."E-Mail";
                    preqapp.Status := preqapp.Status::New;
                    preqapp."Document Date" := Today;
                    preqapp.Insert;
                    msg := true;
                end else begin
                    error('You have already made a prequalification application for the current period!')
                end;
            end;
        end;
    end;

    procedure SubmitPreqApp(KRAPin: Code[20]) msg: Boolean
    begin
        preqapp.Reset;
        preqapp.Setrange("VAT Registration No.", KRAPin);
        preqapp.SetRange(Status, preqapp.Status::New);
        preqapp.SetRange(Period, GetCurrentPeriod());
        if preqapp.Find('-') then begin
            preqapp.Status := preqapp.Status::Submitted;
            preqapp.Modify;
            msg := true;
        end;
    end;

    procedure GetPrequalificationApps(krapin: Code[20]) msg: Text
    begin
        preqapp.Reset;
        preqapp.SetRange("VAT Registration No.", krapin);
        if preqapp.Find('-') then begin
            repeat
                msg += preqapp.Period + '::' + Format(preqapp.Prequalified) + ':::';
            until preqapp.Next = 0;
        end;
    end;

    procedure GetOpenTenders() msg: Text
    begin
        procheader.Reset;
        procheader.SetRange("Procurement methods", procheader."Procurement methods"::"Open Tendering");
        procheader.SetRange(Status, procheader.Status::Open);
        if procheader.Find('-') then begin
            repeat
                msg += procheader."No." + ' ::' + procheader."Requisition No." + ' ::' + procheader.Description + ' ::' + Format(procheader."Expected Opening Date") + ' ::' + Format(procheader."Expected Closing Date") + ' :::';
            until procheader.Next = 0;
        end;
    end;

    procedure GetOpenTenderLines(no: Code[20]) msg: Text
    begin
        proclines.Reset;
        proclines.SetRange("Document No.", no);
        if proclines.Find('-') then begin
            repeat
                msg += proclines."No." + ' ::' + proclines.Description + ' ::' + proclines."Unit of Measure" + ' ::' + Format(proclines.Quantity) + ' :::';
            until proclines.Next = 0;
        end;
    end;

    procedure GetPreAppCategories(krapin: Code[20]; period: Code[20]) msg: Text
    begin
        preqappcat.Reset;
        preqappcat.SetRange("VAT Registration", krapin);
        preqappcat.SetRange(period, period);
        if preqappcat.Find('-') then begin
            repeat
                msg += preqappcat.Category + ' ::' + Format(preqappcat.Prequalified) + ' :::';
            until preqappcat.Next = 0;
        end;
    end;

    procedure GetCurrentPeriod() msg: Text
    begin
        years.Reset;
        years.SetRange("Active Period", true);
        if years.Find('-') then begin
            msg := years."Preq. Year";
        end;
    end;

    procedure PreqAppLinesCreate(krapin: Code[20]; category: Code[20]) msg: Boolean
    begin
        preqapp.Reset;
        preqapp.SetRange("VAT Registration No.", krapin);
        preqapp.SetRange(Period, GetCurrentPeriod());
        if preqapp.Find('-') then begin
            preqappcat.Reset;
            preqappcat.SetRange("VAT Registration", preqapp."VAT Registration No.");
            preqappcat.SetRange(Period, preqapp.Period);
            preqappcat.SetRange(Category, category);
            if not preqappcat.Find('-') then begin
                preqappcat.init;
                preqappcat."VAT Registration" := preqapp."VAT Registration No.";
                preqappcat.Period := preqapp.Period;
                preqappcat.Category := category;
                preqappcat.Insert;
                msg := true;
            end else begin
                Error('Prequalification application already submitted for this category!');
            end;
        end;
    end;

    procedure ValidateKRAPin(pin: Code[20]) msg: Boolean
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", pin);
        if tblBidder.Find('-') then begin
            msg := true;
        end;
    end;

    procedure AccountActivated(pin: Code[20]) msg: Boolean
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", pin);
        tblBidder.SETRANGE(tblBidder."Account Activated", true);
        if tblBidder.Find('-') then begin
            msg := true;
        end;
    end;

    procedure GetBidderEmail(pin: Code[20]) msg: Text
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", pin);
        if tblBidder.Find('-') then begin
            msg := tblBidder."E-Mail";
        end;
    end;

    procedure ActivateBidderOnlineAccount(pin: Code[20]; activationcode: Code[20]) msg: boolean
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", pin);
        tblBidder.SETRANGE(tblBidder.OTP, activationcode);
        if tblBidder.Find('-') then begin
            tblBidder."Account Activated" := true;
            tblBidder.Modify;
            msg := true;
        end;
    end;

    procedure ChangeBidderPassword(pin: Code[20]; password: Text) msg: boolean
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", pin);
        if tblBidder.Find('-') then begin
            tblBidder.Password := password;
            tblBidder.Modify;
            msg := true;
        end;
    end;

    procedure SaveBidderOTP(pin: Code[20]; otp: Code[20]) msg: boolean
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", pin);
        if tblBidder.Find('-') then begin
            tblBidder.OTP := otp;
            tblBidder.Modify;
            msg := true;
        end;
    end;

    procedure GetBidderDetails(pin: Code[20]) msg: Text
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", pin);
        if tblBidder.Find('-') then begin
            msg := tblBidder.Name + ' ::' + tblbidder."E-Mail" + ' ::' + tblbidder."Company Contact" + ' ::' + tblBidder.Address + ' ::' + tblBidder."Contact Person" + ' ::' + tblBidder."Contact Person Email" + ' ::' + tblBidder."Phone No.";
        end;
    end;

    procedure GetPreqCategories() msg: Text
    begin
        preqcategories.Reset;
        preqCategories.SetFilter("Category Code", '<>%1', '');
        if preqcategories.Find('-') then begin
            repeat
                msg += preqcategories."Category Code" + ' ::' + preqcategories.Description + ' :::';
            until preqcategories.Next = 0;
        end;
    end;

    procedure VerifyBidderOTP(pin: Code[20]; otp: Code[20]) msg: boolean
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", pin);
        tblBidder.SetRange(tblBidder.OTP, otp);
        if tblBidder.Find('-') then begin
            msg := true;
        end;
    end;

    procedure CheckBidderLogin(username: Text; userpassword: Text) msg: boolean
    var
        FullNames: Text;
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE("No.", username);
        IF tblBidder.FIND('-') THEN BEGIN
            IF (tblBidder.Password = userpassword) THEN BEGIN
                msg := true
            END ELSE BEGIN
                Error('Invalid Password');
            END
        END ELSE BEGIN
            Error('Invalid Username');
        END
    end;

    procedure GetBidderName(krapin: Code[20]) name: Text
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE("No.", krapin);
        if tblBidder.FIND('-') then begin
            name := tblBidder.Name;
        end;
    end;

    procedure CheckValidBidder(username: Text) Msg: Boolean
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", username);
        IF tblBidder.FIND('-') THEN BEGIN
            Msg := true;
        END ELSE BEGIN
            Msg := false;
        END
    end;

    procedure FnApplicationAttachement(retNo: Code[50]; fileName: Text; attachment: BigText; tableId: Integer) return_value: Boolean
    var
        DocAttachment: Record "Document Attachment";
        FromRecRef: RecordRef;
        FileManagement: Codeunit "File Management";
        // Bytes: dotnet Array;
        // Convert: dotnet Convert;
        // MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        tableFound: Boolean;
        ObjAppliRec: Record "Tender Applicants Registration";

    begin

        tableFound := false;
        return_value := false;
        if TableID = Database::"Tender Applicants Registration" then begin
            ObjAppliRec.RESET;
            ObjAppliRec.SETRANGE(ObjAppliRec."No.", retNo);
            if ObjAppliRec.FIND('-') then begin
                FromRecRef.GETTABLE(ObjAppliRec);
            end;
            tableFound := true;
        end;

        if tableFound = true then begin
            if FileName <> '' then begin
                Clear(DocAttachment);
                DocAttachment.Init();
                DocAttachment.Validate("File Extension", FileManagement.GetExtension(FileName));
                DocAttachment.Validate("File Name", CopyStr(FileManagement.GetFileNameWithoutExtension(FileName), 1, MaxStrLen(FileName)));
                DocAttachment.Validate("Table ID", FromRecRef.Number);
                DocAttachment.Validate("No.", retNo);
                // Bytes := Convert.FromBase64String(Attachment);
                // MemoryStream := MemoryStream.MemoryStream(Bytes);
                // DocAttachment."Document Reference ID".ImportStream(MemoryStream, '', FileName);
                DocAttachment.Insert(true);
                return_value := true;
            end else
                Error('No file to upload');
        end else
            Error('File not uploaded. No table filter found');

    end;

    procedure FnPreqApplicationAttachement(retNo: Code[50]; fileName: Text; attachment: BigText; tableId: Integer) return_value: Boolean
    var
        DocAttachment: Record "Document Attachment";
        FromRecRef: RecordRef;
        FileManagement: Codeunit "File Management";
        // Bytes: dotnet Array;
        // Convert: dotnet Convert;
        // MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        tableFound: Boolean;
        ObjAppliRec: Record "Prequalification Application";

    begin

        tableFound := false;
        return_value := false;
        if TableID = Database::"Prequalification Application" then begin
            ObjAppliRec.RESET;
            ObjAppliRec.SETRANGE(ObjAppliRec."VAT Registration No.", retNo);
            if ObjAppliRec.FIND('-') then begin
                FromRecRef.GETTABLE(ObjAppliRec);
            end;
            tableFound := true;
        end;

        if tableFound = true then begin
            if FileName <> '' then begin
                Clear(DocAttachment);
                DocAttachment.Init();
                DocAttachment.Validate("File Extension", FileManagement.GetExtension(fileName));
                DocAttachment.Validate("File Name", CopyStr(FileManagement.GetFileNameWithoutExtension(fileName), 1, MaxStrLen(fileName)));
                DocAttachment.Validate("Table ID", FromRecRef.Number);
                DocAttachment.Validate("No.", retNo);
                // Bytes := Convert.FromBase64String(Attachment);
                // MemoryStream := MemoryStream.MemoryStream(Bytes);
                // DocAttachment."Document Reference ID".ImportStream(MemoryStream, '', FileName);
                DocAttachment.Insert(true);
                return_value := true;
            end else
                Error('No file to upload');
        end else
            Error('File not uploaded. No table filter found');
    end;

    procedure FnTenderApplicationAttachement(retNo: Code[50]; fileName: Text; attachment: BigText; tableId: Integer) return_value: Boolean
    var
        DocAttachment: Record "Document Attachment";
        FromRecRef: RecordRef;
        FileManagement: Codeunit "File Management";
        // Bytes: dotnet Array;
        // Convert: dotnet Convert;
        // MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        tableFound: Boolean;
        ObjAppliRec: Record "Tender Submission Header";

    begin

        tableFound := false;
        return_value := false;
        if TableID = Database::"Tender Submission Header" then begin
            ObjAppliRec.RESET;
            ObjAppliRec.SETRANGE(ObjAppliRec."No.", retNo);
            if ObjAppliRec.FIND('-') then begin
                FromRecRef.GETTABLE(ObjAppliRec);
            end;
            tableFound := true;
        end;

        if tableFound = true then begin
            if FileName <> '' then begin
                Clear(DocAttachment);
                DocAttachment.Init();
                DocAttachment.Validate("File Extension", FileManagement.GetExtension(fileName));
                DocAttachment.Validate("File Name", CopyStr(FileManagement.GetFileNameWithoutExtension(fileName), 1, MaxStrLen(fileName)));
                DocAttachment.Validate("Table ID", FromRecRef.Number);
                DocAttachment.Validate("No.", retNo);
                // Bytes := Convert.FromBase64String(Attachment);
                // MemoryStream := MemoryStream.MemoryStream(Bytes);
                // DocAttachment."Document Reference ID".ImportStream(MemoryStream, '', FileName);
                DocAttachment.Insert(true);
                return_value := true;
            end else
                Error('No file to upload');
        end else
            Error('File not uploaded. No table filter found');
    end;

}
