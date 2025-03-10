codeunit 52178882 "Common App Management"
{
    trigger OnRun()
    begin


    end;

    Var
        NoSeriesMgnt: Codeunit NoSeriesManagement;
       // ResearchSchoolSetup: Record "Research School Setup";
        AdminSetup: Record "Admin No Series";

    // procedure CalcTotal(ProposalBudget: Record "Proposal Budget")
    // var
    //     BudgetAmounts: Record "Budget Items Amount";
    // begin
    //     BudgetAmounts.Validate("Q1 Amount");
    //     ProposalBudget.CalcFields("Q1 Amount", "Q2 Amount", "Q3 Amount", "Q4 Amount");
    //     BudgetAmounts.Reset();
    //     BudgetAmounts.SetRange("Proposal ID", ProposalBudget."Proposal ID");
    //     BudgetAmounts.SetRange("Item ID", ProposalBudget."Item S No");
    //     if BudgetAmounts.FindSet() then
    //         ProposalBudget.Total := BudgetAmounts."Q1 Amount" + BudgetAmounts."Q2 Amount" + BudgetAmounts."Q3 Amount" + BudgetAmounts."Q4 Amount";
    // end;

    // procedure CreateGrantee(ResearchProposal: Record "Research Proposal Application")
    // var
    //     Grantee: Record Customer;
    //     Supervisor: Record "Proposal Supervisor";
    //     GranteeSupervisor: Record "Grantee Supervisor";
    //     NewNo: Code[20];
    //     Text000: Label 'Grantee %1 created!';
    //     Text001: Label '%1 has already been created and attached to %2';
    // begin
    //     ResearchProposal.Reset();
    //     ResearchProposal.SetRange("Proposal ID", ResearchProposal."Proposal ID");
    //     if ResearchProposal.Find('-') then begin
    //         if Grantee."Proposal ID" <> ResearchProposal."Proposal ID" then begin
    //             ResearchSchoolSetup.Get();
    //             Grantee.Init();
    //             Grantee."Grantee Status" := Grantee."Grantee Status"::Active;
    //             NewNo := NoSeriesMgnt.GetNextNo(ResearchSchoolSetup."Gratee ID", 0D, true);
    //             Grantee."No." := NewNo;
    //             Grantee.Name := ResearchProposal.Surname + ' ' + ResearchProposal."Given Name(S)";
    //             Grantee."Phone No." := ResearchProposal."Mobile Phone No";
    //             Grantee."E-Mail" := ResearchProposal."E-Mail";
    //             Grantee.Country := ResearchProposal.Country;
    //             Grantee."Research Title" := ResearchProposal."Research Title";
    //             Grantee."Highest Qualification" := ResearchProposal."Highest Qualification";
    //             Grantee."National ID/Passport Number" := ResearchProposal."National ID/Passport Number";
    //             Grantee.University := ResearchProposal.University;
    //             Grantee."University RegNo" := ResearchProposal."University RegNo";
    //             Grantee."Field ID" := ResearchProposal."Field ID";
    //             Grantee."Research Area" := ResearchProposal."Research Area";
    //             Grantee."Funding Status" := ResearchProposal."Funding Status";
    //             Grantee."Total Amount Applied" := ResearchProposal."Total Amount Applied";
    //             Grantee."Awarded Amount" := ResearchProposal."Awarded Amount";
    //             Grantee."Date Awarded" := ResearchProposal."Date Awarded";
    //             Grantee."Proposal ID" := ResearchProposal."Proposal ID";
    //             Grantee.Insert();
    //             Supervisor.Reset();
    //             Supervisor.SetRange("Proposal ID", ResearchProposal."Proposal ID");
    //             if Supervisor.Find('-') then begin
    //                 repeat
    //                     GranteeSupervisor.Init();
    //                     GranteeSupervisor."Grantee ID" := Grantee."No.";
    //                     GranteeSupervisor."Supervisor ID" := Supervisor."Supervisor ID";
    //                     GranteeSupervisor."Supervisor Name" := Supervisor."Supervisor Name";
    //                     GranteeSupervisor."E-Mail" := Supervisor."E-Mail";
    //                     GranteeSupervisor."Phone No," := Supervisor.Phone;
    //                     GranteeSupervisor.Insert();
    //                 until Supervisor.Next() = 0;
    //             end;
    //             Message(Text000, Grantee."No.");
    //         end;
    //     end else
    //         Error(Text001, ResearchProposal."Proposal ID", ResearchProposal.Surname);

    // end;

    // procedure CalcBudgetItemTotal(ProposalBudget: Record "Proposal Budget")
    // var
    //     BudgetAmounts: Record "Budget Items Amount";
    //     QAmount: array[10] of Decimal;
    // begin
    //     ProposalBudget.Total := 0;
    //     BudgetAmounts.Reset();
    //     BudgetAmounts.SetRange("Proposal ID", ProposalBudget."Proposal ID");
    //     BudgetAmounts.SetRange("Item ID", ProposalBudget."Item S No");
    //     ProposalBudget.CalcFields("Q1 Amount", "Q2 Amount", "Q3 Amount", "Q4 Amount");
    //     if BudgetAmounts.FindSet() then begin
    //         repeat
    //             ProposalBudget.Total := ProposalBudget."Q1 Amount" + ProposalBudget."Q2 Amount" + ProposalBudget."Q3 Amount" + ProposalBudget."Q4 Amount";
    //             ProposalBudget.Modify();
    //         until BudgetAmounts.Next() = 0;
    //     end;
    // end;

    procedure AttachExternalDocs(DeptFile: Record "Departmental File")
    var
        DocAttachRec: Record "Document Attachment";
        PagDocAttachDetails: Page "Document Attachment Details";
        Text000: Label 'Do you wish to attach external documents related to %1 - %2 file?';
    begin
        if DeptFile."Has External Documents" then begin
            if Confirm(Text000, true, DeptFile."Folio No.", DeptFile."Subject") then begin
                DocAttachRec.Reset();
                DocAttachRec.SetFilter("No.", DeptFile."Folio No.");
                PagDocAttachDetails.SetTableView(DocAttachRec);
                PagDocAttachDetails.SetRecord(DocAttachRec);
                PagDocAttachDetails.Run();
            end;
        end;
    end;

    procedure ForwardToSecretRegistry(DeptFile: Record "Departmental File")
    var
        Text000: Label 'Do you wish to Forward %1-%2 to Secret Registry?';
        Text001: Label 'Please indicate the department for %1';
        DeptFilesPage: page "Departmental Files";
        SecretFile: page "Confidential Departmental File";

    begin
        if DeptFile.Department <> '' then
            if DeptFile.Confidential then begin
                if Confirm(Text000, true, DeptFile."Folio No.", DeptFile."Subject") then begin
                    DeptFile.Modify();
                    DeptFilesPage.close();
                    Page.Run(Page::"Confidential Departmental File");
                end;
            end
            else
                Error(Text001, DeptFile."Folio No.");
    end;

    procedure MoveMailData(ReceivedMail: Record "Received Mail")
    var
        Departmental: Page "Departmental Files";
        DeptRec: Record "Departmental File";
        FolioNo: Code[20];
        PersonalMailID: Code[20];
        Text000: Label '%1 record was created in Departmental Files successfully';
        Text001: Label '%1 record was created in %2 pigeon hole';
        PersonalMail: Record "Personal Mail";
        PagPersonalMail: page "Personal Mails";
    begin
        if ReceivedMail.Type = ReceivedMail.Type::Official then begin
            ReceivedMail.Reset();
            ReceivedMail.SetRange("Mail ID", ReceivedMail."Mail ID");
            DeptRec.Init();
            AdminSetup.Get();
            FolioNo := NoSeriesMgnt.GetNextNo(AdminSetup."Folio No.", 0D, true);
            DeptRec."Folio No." := FolioNo;
            DeptRec."Ref No." := ReceivedMail."Mail ID";
            DeptRec."Subject" := ReceivedMail."Subject";
            DeptRec."Receieved by" := ReceivedMail."Receieved by";
            DeptRec."Received at" := ReceivedMail."Received at";
            DeptRec."Received From" := ReceivedMail."Received From";
            DeptRec.Type := ReceivedMail.Type::Official;
            DeptRec.Insert();
            ReceivedMail.Delete();
            Message(Text000, DeptRec."Folio No.");
            Page.Run(Page::"Departmental Files");
        end
        else
            if ReceivedMail."Pigeon Hole ID" <> '' then
                if ReceivedMail.Type = ReceivedMail.Type::Personal then begin
                    ReceivedMail.Reset();
                    ReceivedMail.SetRange("Mail ID", ReceivedMail."Mail ID");
                    PersonalMail.Init();
                    AdminSetup.Get();
                    PersonalMailID := NoSeriesMgnt.GetNextNo(AdminSetup."Personal Mail", 0D, true);
                    PersonalMail."Mail ID" := PersonalMailID;
                    PersonalMail."Hole ID" := ReceivedMail."Pigeon Hole ID";
                    PersonalMail."Subject" := ReceivedMail."Subject";
                    PersonalMail."Received by" := ReceivedMail."Receieved by";
                    PersonalMail."Date Posted" := ReceivedMail."Received at";
                    PersonalMail."Received From" := ReceivedMail."Received From";
                    PersonalMail.Sender := ReceivedMail.Sender;
                    PersonalMail.Type := ReceivedMail.Type::Personal;
                    PersonalMail."Ref No." := ReceivedMail."Mail ID";
                    PersonalMail.Insert();
                    ReceivedMail.Delete();
                    // PersonalMail.Modify();
                    Message(Text001, PersonalMail."Mail ID", PersonalMail."Hole ID");
                    Page.Run(Page::"Personal Mails List");
                end;
    end;

    procedure DeptFileMovement(DeptFile: Record "Departmental File")
    var
        FileMovReg: Record "File Movement Register";
        Text001: Label 'Please input the Subject for %1 mail';
        Text002: Label 'File Movement Register was updated successfully';
    begin
        if DeptFile."Subject" <> '' then begin
            DeptFile.Reset();
            DeptFile.SetRange("Folio No.", DeptFile."Folio No.");
            FileMovReg.Init();
            FileMovReg."File ID" := DeptFile."Folio No.";
            FileMovReg."Movement Date" := CurrentDateTime;
            FileMovReg."File Description" := DeptFile."Subject";
            FileMovReg."Movement Type" := DeptFile.Status;
            FileMovReg.Department := DeptFile.Department;
            FileMovReg.Officer := UserId;
            FileMovReg."File Type" := DeptFile.Type;
            FileMovReg.Insert();
            Message(Text002);
        end
        else
            Message(Text001, DeptFile."Folio No.");
    end;

    procedure PersonalFileMovement(PersonalMail: Record "Personal Mail")
    var
        FileMovReg: Record "File Movement Register";
        Text001: Label 'Please input the Subject for %1 mail';
        Text002: Label 'File Movement Register was updated successfully';
    begin
        if PersonalMail."Subject" <> '' then begin
            PersonalMail.Reset();
            PersonalMail.SetRange("Mail ID", PersonalMail."Mail ID");
            FileMovReg.Init();
            FileMovReg."File ID" := PersonalMail."Mail ID";
            FileMovReg."Movement Date" := CurrentDateTime;
            FileMovReg."File Description" := PersonalMail."Subject";
            FileMovReg."Movement Type" := PersonalMail.Status;
            FileMovReg.Department := PersonalMail."Hole ID";
            FileMovReg.Officer := UserId;
            FileMovReg."File Type" := PersonalMail.Type;
            FileMovReg.Insert();
            Message(Text002);
        end
        else
            Message(Text001, PersonalMail."Mail ID");
    end;
}

