// codeunit 52178532 "Procurement Process"
// {
//     SingleInstance = true;

//     trigger OnRun()
//     begin
//     end;

//     var
//         prelQ1: Record "Proc-Preliminary Qualif";
//         techQ1: Record "Proc-Technical Qualif";
//         DemoQ1: Record "Proc-Demo Qualif";
//         FinQ1: record "Proc-Financial Qualif";

//         prelQ2: Record "Proc-Preliminary Qualif.Quote";
//         techQ2: Record "Proc-Technical Qualif.Quote";
//         DemoQ2: Record "Proc-Demo Qualif.Quote";
//         FinQ2: record "Proc-Financial Qualif.Quote";

//         purHead: Record "Purchase Header";
//         Tsubmission: record "Tender Submission Header";


//     procedure EvaluationSetups(var phead: Record "Purchase Header")
//     var
//         rfq: Record "PROC-Purchase Quote Header";
//         mem: Record "Proc-Committee Membership";


//     begin
//         rfq.Reset();
//         rfq.SetRange("No.", phead."Request for Quote No.");
//         if rfq.Find('-') then begin

//             mem.Reset();
//             mem.SetRange("No.", rfq."No.");
//             mem.SetRange("Committee Type", mem."Committee Type"::"Evaluation Committee");
//             mem.SetFilter("Entry No.", '<>%1', 0);
//             if mem.Find('-') then begin
//                 repeat
//                     // Message('%1%2%3', mem."Committee Type", ' ', mem.Name);

//                     //Preliminary
//                     prelQ1.Reset();
//                     prelQ1.SetRange("No.", rfq."No.");
//                     if prelQ1.Find('-') then begin
//                         repeat
//                             prelQ2.Reset();
//                             prelQ2.SetRange("Entry No.", prelQ1."Entry No.");
//                             prelQ2.SetRange("No.", prelQ1."No.");
//                             prelQ2.SetRange("Quote No.", phead."No.");
//                             prelQ2.SetRange("Staff No", mem."Staff No.");
//                             if not prelQ2.Find('-') then begin
//                                 prelQ2.Init();
//                                 prelQ2."Entry No." := prelQ1."Entry No.";
//                                 prelQ2."No." := prelQ1."No.";
//                                 prelQ2."Quote No." := phead."No.";
//                                 prelQ2.Description := prelQ1.Description;
//                                 prelQ2."Staff No" := mem."Staff No.";
//                                 prelQ2."Staff Name" := mem.Name;
//                                 prelQ2.Insert();

//                             end;
//                         until prelQ1.Next() = 0;
//                     end;
//                     //Technical
//                     techQ1.Reset();
//                     techQ1.SetRange("No.", rfq."No.");
//                     if techQ1.Find('-') then begin
//                         repeat
//                             techQ2.Reset();
//                             techQ2.SetRange("Entry No.", techQ1."Entry No.");
//                             techQ2.SetRange("No.", techQ1."No.");
//                             techQ2.SetRange("Quote No.", phead."No.");
//                             techQ2.SetRange("Staff No", mem."Staff No.");
//                             if not techQ2.Find('-') then begin
//                                 techQ2.Init();
//                                 techQ2."Entry No." := techQ1."Entry No.";
//                                 techQ2."No." := techQ1."No.";
//                                 techQ2."Quote No." := phead."No.";
//                                 techQ2.Description := techQ1.Description;
//                                 techQ2."Staff No" := mem."Staff No.";
//                                 techQ2."Staff Name" := mem.Name;
//                                 techQ2."Maximum Score" := techQ1."Maximum Score";
//                                 techQ2."Satisfactory Score" := techQ1."Satisfactory Score";
//                                 techQ2.Insert();
//                             end;
//                         until techQ1.Next() = 0;
//                     end;

//                     //Demo
//                     DemoQ1.Reset();
//                     DemoQ1.SetRange("No.", rfq."No.");
//                     if DemoQ1.Find('-') then begin
//                         repeat
//                             DemoQ2.Reset();
//                             DemoQ2.SetRange("Entry No.", DemoQ1."Entry No.");
//                             DemoQ2.SetRange("No.", DemoQ1."No.");
//                             DemoQ2.SetRange("Quote No.", phead."No.");
//                             DemoQ2.SetRange("Staff No", mem."Staff No.");
//                             if not DemoQ2.Find('-') then begin
//                                 DemoQ2.Init();
//                                 DemoQ2."Entry No." := DemoQ1."Entry No.";
//                                 DemoQ2."No." := DemoQ1."No.";
//                                 DemoQ2."Quote No." := phead."No.";
//                                 DemoQ2.Description := DemoQ1.Description;
//                                 DemoQ2."Staff No" := mem."Staff No.";
//                                 DemoQ2."Staff Name" := mem.Name;
//                                 DemoQ2."Maximum Score" := DemoQ1."Maximum Score";
//                                 DemoQ2."Satisfactory Score" := DemoQ1."Satisfactory Score";
//                                 DemoQ2.Insert();
//                             end;
//                         until DemoQ1.Next() = 0;
//                     end;

//                 until mem.Next() = 0;
//             end;

//             FinQ1.Reset();
//             FinQ1.SetRange("No.", rfq."No.");
//             if FinQ1.Find('-') then begin
//                 repeat
//                     FinQ2.Reset();
//                     FinQ2.SetRange("Entry No.", FinQ1."Entry No.");
//                     FinQ2.SetRange("No.", FinQ1."No.");
//                     FinQ2.SetRange("Quote No.", phead."No.");
//                     if not FinQ2.Find('-') then begin

//                         FinQ2.Init();
//                         FinQ2."Entry No." := FinQ1."Entry No.";
//                         FinQ2."No." := FinQ1."No.";
//                         FinQ2."Quote No." := phead."No.";
//                         FinQ2."Budgeted Amount" := FinQ1."Budgeted Amount";
//                         FinQ2.Description := FinQ1.Description;
//                         if FinQ2."Budgeted Amount" <> 0 then
//                             FinQ2.Insert();
//                     end;

//                 until FinQ1.Next() = 0;
//             end;

//         end;
//     end;

//     procedure PreliminaryEvaluation(var rfq: Record "PROC-Purchase Quote Header")
//     begin
//         purHead.Reset();
//         purHead.SetRange("Request for Quote No.", rfq."No.");
//         purHead.SetRange("Quote Status", purHead."Quote Status"::Submitted);
//         if purHead.find('-') then begin
//             repeat

//                 prelQ2.Reset();
//                 prelQ2.SetRange("No.", rfq."No.");
//                 prelQ2.SetFilter(Scored, '%1', prelQ2.Scored::" ");
//                 if prelQ2.Find('-') then begin
//                     Error('%1%2', 'Some Committee members have not fully evaluated preliminary Qualification, e.g ', prelQ2."Staff Name");
//                 end;

//                 prelQ2.Reset();
//                 prelQ2.SetRange("No.", rfq."No.");
//                 prelQ2.SetFilter(Scored, '%1|%2', prelQ2.Scored::"Requirement Not Met", prelQ2.Scored::" ");
//                 if not prelQ2.Find('-') then begin
//                     purHead."Quote Status" := purHead."Quote Status"::"Prelim Qualif";
//                     purHead.Modify();

//                 end else begin
//                     purHead."Quote Status" := purHead."Quote Status"::"Prelim Disqualif";
//                     purHead.Modify();
//                 end;


//             until purHead.Next() = 0;

//         end;
//         Message('Matrix Run Successfully');
//     end;


//     procedure TechnicalEvaluation(var rfq: Record "PROC-Purchase Quote Header")
//     var
//         AvgScore: Decimal;
//         nos: Decimal;
//         reqs: Record "Proc-Technical Qualif";
//     begin
//         if rfq."Technical Evaluation" = rfq."Technical Evaluation"::No then begin
//             if Confirm('Skip the technical evaluation ?', true) = false then Error('Cancelled');
//             purHead.Reset();
//             purHead.SetRange("Request for Quote No.", rfq."No.");
//             purHead.SetRange("Quote Status", purHead."Quote Status"::"Prelim Qualif");
//             if purHead.find('-') then begin
//                 repeat
//                     purHead."Quote Status" := purHead."Quote Status"::"Tech Qualf";
//                     purHead.Modify();

//                 until purHead.Next() = 0;
//             end;

//         end;
//         purHead.Reset();
//         purHead.SetRange("Request for Quote No.", rfq."No.");
//         purHead.SetRange("Quote Status", purHead."Quote Status"::"Prelim Qualif");
//         if purHead.find('-') then begin
//             repeat
//                 techQ2.Reset();
//                 techQ2.SetRange("No.", rfq."No.");
//                 techQ2.SetRange(Evaluated, false);
//                 if techQ2.Find('-') then begin
//                     Error('%1%2', 'Some Committee members have not scored Technical Qualification, e.g ', techQ2."Staff Name");
//                 end;

//                 reqs.Reset();
//                 reqs.SetRange("No.", rfq."No.");
//                 if reqs.Find('-') then begin
//                     repeat

//                         //get the  techQ2.Reset();
//                         techQ2.SetRange("No.", rfq."No.");
//                         techQ2.SetRange(Evaluated, true);
//                         techQ2.SetRange("Entry No.", reqs."Entry No.");
//                         if techQ2.Find('-') then begin
//                             repeat

//                                 techQ2.CalcFields("Evaluation Commitee Count", "Tech Evaluation Max", "Tech Evaluation Min.Qual",
//                                  "Tech Evaluation Scored");

//                                 AvgScore := (techQ2."Tech Evaluation Scored") / techQ2."Evaluation Commitee Count";
//                                 techQ2."Average Score" := AvgScore;
//                                 techQ2.Modify();
//                                 purHead."Technical Evaluation" := techQ2."Tech Evaluation Scored" / techQ2."Evaluation Commitee Count";
//                                 purHead.Modify();

//                                 if purHead."Technical Evaluation" >= rfq."Technical Passmark Score" then begin
//                                     purHead."Quote Status" := purHead."Quote Status"::"Tech Qualf";
//                                     purHead.Modify();
//                                 end else begin
//                                     purHead."Quote Status" := purHead."Quote Status"::"Tech Disqualif";
//                                     purHead.Modify();
//                                 end;

//                             until techQ2.Next() = 0;

//                         end;
//                     until reqs.Next() = 0;
//                 end;

//             until purHead.Next() = 0;

//         end;
//         Message('Matrix Run Successfully');
//     end;

//     procedure DemoEvaluation(var rfq: Record "PROC-Purchase Quote Header")
//     var
//         AvgScore: Decimal;
//         nos: Decimal;
//         reqs: Record "Proc-demo Qualif";
//     begin

//         if rfq."Technical Evaluation" = rfq."Demonistration Evaluation"::No then begin
//             if Confirm('Skip the Demonistration Evaluation ?', true) = false then Error('Cancelled');
//             purHead.Reset();
//             purHead.SetRange("Request for Quote No.", rfq."No.");
//             purHead.SetRange("Quote Status", purHead."Quote Status"::"Tech Qualf");
//             if purHead.find('-') then begin
//                 repeat
//                     purHead."Quote Status" := purHead."Quote Status"::"Demo Qualif";
//                     purHead.Modify();
//                 until purHead.Next() = 0;
//             end;

//         end;
//         purHead.Reset();
//         purHead.SetRange("Request for Quote No.", rfq."No.");
//         purHead.SetRange("Quote Status", purHead."Quote Status"::"Tech Qualf");
//         if purHead.find('-') then begin
//             repeat

//                 DemoQ2.Reset();
//                 DemoQ2.SetRange("No.", rfq."No.");
//                 DemoQ2.SetRange(Evaluated, false);
//                 if DemoQ2.Find('-') then begin
//                     //Error('%1%2', 'Some Committee members have not scored Demo Qualification, e.g ', DemoQ2."Staff Name");
//                 end;

//                 reqs.Reset();
//                 reqs.SetRange("No.", rfq."No.");
//                 if reqs.Find('-') then begin
//                     repeat

//                         DemoQ2.Reset();
//                         DemoQ2.SetRange("No.", rfq."No.");
//                         DemoQ2.SetRange(Evaluated, true);
//                         DemoQ2.SetRange("Entry No.", reqs."Entry No.");
//                         if DemoQ2.Find('-') then begin
//                             repeat

//                                 DemoQ2.CalcFields("Evaluation Commitee Count", "Tech Evaluation Max",
//                                  "Tech Evaluation Min.Qual", "Tech Evaluation Scored");

//                                 AvgScore := (DemoQ2."Tech Evaluation Scored") / DemoQ2."Evaluation Commitee Count";
//                                 DemoQ2."Average Score" := AvgScore;
//                                 DemoQ2.Modify();

//                                 purHead."Demo Evaluation" := DemoQ2."Tech Evaluation Scored" / DemoQ2."Evaluation Commitee Count";
//                                 purHead.Modify();


//                                 if purHead."Demo Evaluation" >= rfq."Demo Passmark Score" then begin
//                                     purHead."Quote Status" := purHead."Quote Status"::"Demo Qualif";
//                                     purHead.Modify();

//                                 end else begin
//                                     purHead."Quote Status" := purHead."Quote Status"::"Demo Disqualif";
//                                     purHead.Modify();
//                                 end;
//                             /* if ((DemoQ2."Tech Evaluation Scored") >= (DemoQ2."Tech Evaluation Min.Qual")) then begin
//                                 purHead."Quote Status" := purHead."Quote Status"::"Demo Qualif";
//                                 purHead.Modify();
//                             end else begin
//                                 purHead."Quote Status" := purHead."Quote Status"::"Demo Disqualif";
//                                 purHead.Modify();
//                             end; */

//                             until DemoQ2.Next() = 0;
//                         end;

//                     until reqs.Next() = 0;
//                 end;

//             until purHead.Next() = 0;

//         end;

//         Message('Matrix Run Successfully');
//     end;


//     procedure FinancialEvaluation(var rfq: Record "PROC-Purchase Quote Header")
//     var
//         QAmount: Decimal;
//         LstQuoted: Decimal;
//     begin
//         LstQuoted := 0;
//         purHead.Reset();
//         purHead.SetRange("Request for Quote No.", rfq."No.");
//         purHead.SetRange("Quote Status", purHead."Quote Status"::"Demo Qualif");
//         if purHead.find('-') then begin
//             repeat
//                 FinQ2.Reset();
//                 FinQ2.SetRange("No.", rfq."No.");
//                 FinQ2.SetRange("Quote No.", purHead."No.");
//                 if FinQ2.Find('-') then begin
//                     repeat
//                         FinQ2.CalcFields("Quoted Amount", "Tender Quoted Amount");
//                         if (LstQuoted = 0) then begin
//                             LstQuoted := FinQ2."Quoted Amount";
//                         end;
//                         if ((LstQuoted > FinQ2."Quoted Amount")) then begin
//                             LstQuoted := FinQ2."Quoted Amount";
//                         end;
//                     //  Message('%1%2%3', LstQuoted, ' least Quoted and Quoted Amount ', FinQ2."Quoted Amount");
//                     until FinQ2.Next() = 0;
//                 end;
//             until purHead.Next() = 0;

//         end;

//         purHead.Reset();
//         purHead.SetRange("Request for Quote No.", rfq."No.");
//         purHead.SetRange("Quote Status", purHead."Quote Status"::"Demo Qualif");
//         if purHead.find('-') then begin
//             repeat
//                 FinQ2.Reset();
//                 FinQ2.SetRange("No.", rfq."No.");
//                 FinQ2.SetRange("Quote No.", purHead."No.");
//                 if FinQ2.Find('-') then begin
//                     FinQ2.CalcFields("Quoted Amount", "Tender Quoted Amount");

//                     FinQ2."Lowest Quoted Price" := LstQuoted;
//                     FinQ2."Maximum Marks" := rfq."Financial Evaluation Score";

//                     FinQ2.Score := (FinQ2."Lowest Quoted Price" / FinQ2."Quoted Amount") * FinQ2."Maximum Marks";
//                     FinQ2.Modify();

//                     purHead."Quote Status" := purHead."Quote Status"::"Fin Qualif";
//                     purHead.Modify();

//                 end;
//             until purHead.Next() = 0;

//         end;

//         Message('Matrix Run Successfully');
//     end;

//     //Tender
//     procedure TenderEvalSetups(var phead: Record "Tender Submission Header")
//     var
//         rfq: Record "PROC-Purchase Quote Header";
//         mem: Record "Proc-Committee Membership";


//     begin
//         rfq.Reset();
//         rfq.SetRange("No.", phead."Request for Quote No.");
//         if rfq.Find('-') then begin

//             mem.Reset();
//             mem.SetRange("No.", rfq."No.");
//             mem.SetRange("Committee Type", mem."Committee Type"::"Evaluation Committee");
//             mem.SetFilter("Entry No.", '<>%1', 0);
//             if mem.Find('-') then begin
//                 repeat
//                     // Message('%1%2%3', mem."Committee Type", ' ', mem.Name);

//                     //Preliminary
//                     prelQ1.Reset();
//                     prelQ1.SetRange("No.", rfq."No.");
//                     if prelQ1.Find('-') then begin
//                         repeat
//                             prelQ2.Reset();
//                             //prelQ2.SetRange("Entry No.", prelQ1."Entry No.");
//                             prelQ2.SetRange("No.", prelQ1."No.");
//                             prelQ2.SetRange("Quote No.", phead."No.");
//                             prelQ2.SetRange("Staff No", mem."Staff No.");
//                             if not prelQ2.Find('-') then begin
//                                 prelQ2.Init();
//                                 prelQ2."Entry No." := prelQ1."Entry No.";
//                                 prelQ2."No." := prelQ1."No.";
//                                 prelQ2."Quote No." := phead."No.";
//                                 prelQ2.Description := prelQ1.Description;
//                                 prelQ2."Staff No" := mem."Staff No.";
//                                 prelQ2."Staff Name" := mem.Name;
//                                 prelQ2.Insert();

//                             end;
//                         until prelQ1.Next() = 0;
//                     end;
//                     //Technical
//                     techQ1.Reset();
//                     techQ1.SetRange("No.", rfq."No.");
//                     if techQ1.Find('-') then begin
//                         repeat
//                             techQ2.Reset();
//                             //techQ2.SetRange("Entry No.", techQ1."Entry No.");
//                             techQ2.SetRange("No.", techQ1."No.");
//                             techQ2.SetRange("Quote No.", phead."No.");
//                             techQ2.SetRange("Staff No", mem."Staff No.");
//                             if not techQ2.Find('-') then begin
//                                 techQ2.Init();
//                                 techQ2."Entry No." := techQ1."Entry No.";
//                                 techQ2."No." := techQ1."No.";
//                                 techQ2."Quote No." := phead."No.";
//                                 techQ2.Description := techQ1.Description;
//                                 techQ2."Staff No" := mem."Staff No.";
//                                 techQ2."Staff Name" := mem.Name;
//                                 techQ2."Maximum Score" := techQ1."Maximum Score";
//                                 techQ2."Satisfactory Score" := techQ1."Satisfactory Score";
//                                 techQ2.Insert();
//                             end;
//                         until techQ1.Next() = 0;
//                     end;

//                     //Demo
//                     DemoQ1.Reset();
//                     DemoQ1.SetRange("No.", rfq."No.");
//                     if DemoQ1.Find('-') then begin
//                         repeat
//                             DemoQ2.Reset();
//                             //DemoQ2.SetRange("Entry No.", DemoQ1."Entry No.");
//                             DemoQ2.SetRange("No.", DemoQ1."No.");
//                             DemoQ2.SetRange("Quote No.", phead."No.");
//                             DemoQ2.SetRange("Staff No", mem."Staff No.");
//                             if not DemoQ2.Find('-') then begin

//                                 DemoQ2.Init();
//                                 DemoQ2."Entry No." := DemoQ1."Entry No.";
//                                 DemoQ2."No." := DemoQ1."No.";
//                                 DemoQ2."Quote No." := phead."No.";
//                                 DemoQ2.Description := DemoQ1.Description;
//                                 DemoQ2."Staff No" := mem."Staff No.";
//                                 DemoQ2."Staff Name" := mem.Name;
//                                 DemoQ2."Maximum Score" := DemoQ1."Maximum Score";
//                                 DemoQ2."Satisfactory Score" := DemoQ1."Satisfactory Score";
//                                 DemoQ2.Insert();


//                             end;
//                         until DemoQ1.Next() = 0;
//                     end;

//                 until mem.Next() = 0;
//             end;

//             FinQ1.Reset();
//             FinQ1.SetRange("No.", rfq."No.");
//             if FinQ1.Find('-') then begin
//                 repeat
//                     FinQ2.Reset();
//                     FinQ2.SetRange("Entry No.", FinQ1."Entry No.");
//                     FinQ2.SetRange("No.", FinQ1."No.");
//                     FinQ2.SetRange("Quote No.", phead."No.");
//                     if not FinQ2.Find('-') then begin

//                         FinQ2.Init();
//                         FinQ2."Entry No." := FinQ1."Entry No.";
//                         FinQ2."No." := FinQ1."No.";
//                         FinQ2."Quote No." := phead."No.";
//                         FinQ2."Budgeted Amount" := FinQ1."Budgeted Amount";
//                         FinQ2.Description := FinQ1.Description;
//                         if FinQ2."Budgeted Amount" <> 0 then
//                             FinQ2.Insert();
//                     end;

//                 until FinQ1.Next() = 0;
//             end;

//         end;




//     end;

//     procedure TenderPreliminaryEvaluation(var rfq: Record "PROC-Purchase Quote Header")
//     begin
//         Tsubmission.Reset();
//         Tsubmission.SetRange("Request for Quote No.", rfq."No.");
//         Tsubmission.SetRange("Bid Status", Tsubmission."Bid Status"::Submitted);
//         if Tsubmission.find('-') then begin
//             repeat

//                 prelQ2.Reset();
//                 prelQ2.SetRange("No.", rfq."No.");
//                 prelQ2.SetFilter(Scored, '%1', prelQ2.Scored::" ");
//                 if prelQ2.Find('-') then begin
//                     Error('%1%2', 'Some Committee members have not fully evaluated preliminary Qualification, e.g ', prelQ2."Staff Name");
//                 end;

//                 prelQ2.Reset();
//                 prelQ2.SetRange("No.", rfq."No.");
//                 prelQ2.SetFilter(Scored, '%1|%2', prelQ2.Scored::"Requirement Not Met", prelQ2.Scored::" ");
//                 if not prelQ2.Find('-') then begin
//                     Tsubmission."Bid Status" := Tsubmission."Bid Status"::"Prelim Qualif";
//                     Tsubmission.Modify();

//                 end else begin
//                     Tsubmission."Bid Status" := Tsubmission."Bid Status"::"Prelim Disqualif";
//                     Tsubmission.Modify();
//                 end;


//             until Tsubmission.Next() = 0;

//         end;
//         Message('Matrix Run Successfully');
//     end;

//     procedure TenderTechnicalEvaluation(var rfq: Record "PROC-Purchase Quote Header")
//     begin
//         Tsubmission.Reset();
//         Tsubmission.SetRange("Request for Quote No.", rfq."No.");
//         Tsubmission.SetRange("Bid Status", Tsubmission."Bid Status"::"Prelim Qualif");
//         if Tsubmission.find('-') then begin
//             repeat

//                 techQ2.Reset();
//                 techQ2.SetRange("No.", rfq."No.");
//                 techQ2.SetRange(Evaluated, false);
//                 if techQ2.Find('-') then begin
//                     Error('%1%2', 'Some Committee members have not scored Technical Qualification, e.g ', techQ2."Staff Name");
//                 end;

//                 techQ2.Reset();
//                 techQ2.SetRange("No.", rfq."No.");
//                 techQ2.SetRange(Evaluated, true);
//                 if techQ2.Find('-') then begin
//                     techQ2.CalcFields("Evaluation Commitee Count", "Tech Evaluation Max", "Tech Evaluation Min.Qual", "Tech Evaluation Scored");
//                     if ((techQ2."Tech Evaluation Scored") >= (techQ2."Tech Evaluation Min.Qual")) then begin
//                         Tsubmission."Bid Status" := Tsubmission."Bid Status"::"Tech Qualf";
//                         Tsubmission.Modify();
//                     end else begin
//                         Tsubmission."Bid Status" := Tsubmission."Bid Status"::"Tech Disqualif";
//                         Tsubmission.Modify();
//                     end;
//                 end;

//             until Tsubmission.Next() = 0;

//         end;
//         Message('Matrix Run Successfully');
//     end;

//     procedure TenderDemoEvaluation(var rfq: Record "PROC-Purchase Quote Header")
//     begin
//         Tsubmission.Reset();
//         Tsubmission.SetRange("Request for Quote No.", rfq."No.");
//         Tsubmission.SetRange("Bid Status", Tsubmission."Bid Status"::"Tech Qualf");
//         if Tsubmission.find('-') then begin
//             repeat

//                 DemoQ2.Reset();
//                 DemoQ2.SetRange("No.", rfq."No.");
//                 DemoQ2.SetRange(Evaluated, false);
//                 if DemoQ2.Find('-') then begin
//                     Error('%1%2', 'Some Committee members have not scored Demo Qualification, e.g ', DemoQ2."Staff Name");
//                 end;

//                 DemoQ2.Reset();
//                 DemoQ2.SetRange("No.", rfq."No.");
//                 DemoQ2.SetRange(Evaluated, true);
//                 if DemoQ2.Find('-') then begin
//                     DemoQ2.CalcFields("Evaluation Commitee Count", "Tech Evaluation Max", "Tech Evaluation Min.Qual", "Tech Evaluation Scored");
//                     if ((DemoQ2."Tech Evaluation Scored") >= (DemoQ2."Tech Evaluation Min.Qual")) then begin
//                         Tsubmission."Bid Status" := Tsubmission."Bid Status"::"Demo Qualif";
//                         Tsubmission.Modify();
//                     end else begin
//                         Tsubmission."Bid Status" := Tsubmission."Bid Status"::"Demo Disqualif";
//                         Tsubmission.Modify();
//                     end;
//                 end;

//             until Tsubmission.Next() = 0;

//         end;

//         Message('Matrix Run Successfully');
//     end;

//     procedure TenderFinancialEvaluation(var rfq: Record "PROC-Purchase Quote Header")
//     var
//         QAmount: Decimal;
//     begin
//         Tsubmission.Reset();
//         Tsubmission.SetRange("Request for Quote No.", rfq."No.");
//         Tsubmission.SetRange("Bid Status", Tsubmission."Bid Status"::"Demo Qualif");
//         if Tsubmission.find('-') then begin
//             repeat

//                 FinQ2.Reset();
//                 FinQ2.SetRange("No.", rfq."No.");
//                 FinQ2.SetRange("Quote No.", Tsubmission."No.");
//                 if FinQ2.Find('-') then begin
//                     FinQ2.CalcFields("Quoted Amount", "Tender Quoted Amount");

//                     if ((FinQ2."Tender Quoted Amount" <= 0) or (FinQ2."Tender Quoted Amount" > FinQ2."Budgeted Amount")) then begin
//                         Tsubmission."Bid Status" := Tsubmission."Bid Status"::"Fin Disqualif";
//                         Tsubmission.Modify();
//                     end;
//                     if ((FinQ2."Tender Quoted Amount" <= FinQ2."Budgeted Amount") and (FinQ2."Tender Quoted Amount" > 0)) then begin
//                         Tsubmission."Bid Status" := Tsubmission."Bid Status"::"Fin Qualif";
//                         Tsubmission.Modify();
//                     end


//                 end;
//             until purHead.Next() = 0;

//         end;

//         Message('Matrix Run Successfully');
//     end;

//     //Awarding of tender
//     procedure AwardTender(var Thead: Record "PROC-Purchase Quote Header")
//     var
//         purheader: Record "Purchase Header";
//         prlines: Record "Purchase Line";
//         ven: Record Vendor;
//         Bidders: Record "Tender Applicants Registration";
//         purpay: Record "Purchases & Payables Setup";
//         noseries: Codeunit NoSeriesManagement;
//         tsline: Record "Tender Submission Lines";
//         sno: Integer;
//         purBids: Record "Tender Submission Header";

//     begin
//         Thead.TestField("Professional Opinion");
//         Thead.TestField("Awarded BId");
//         Thead.TestField("Bidder/Supplier");
//         if Thead."Issue Order" = false then begin
//             if Confirm('Award this Tender ?', true) = false then Error('Cancelled');
//             ;
//             ven.Reset();
//             ven.SetRange("No.", Thead."Bidder/Supplier");
//             if ven.Find('-') then begin
//                 purpay.get;
//                 purheader."No." := noseries.GetNextNo(purpay."Order Nos.", 0D, True);
//                 purheader."Buy-from Vendor No." := ven."No.";
//                 purheader.Validate("Buy-from Vendor No.");
//                 purheader."Shortcut Dimension 1" := Thead."Shortcut Dimension 1 Code";
//                 purheader."Document Date" := Today;
//                 purheader."Posting Date" := Today;
//                 purheader."Due Date" := Today;
//                 purheader."Order Date" := Today;
//                 purheader."Procurement Request No." := Thead."Requisition No.";
//                 purheader."Request for Quote No." := Thead."No.";
//                 purheader."Quote No." := Thead."Quote No.";
//                 purheader."Responsibility Center" := 'ARA';
//                 purheader."Assigned User ID 2" := UserId;
//                 purheader."Winning Bid" := Thead."Awarded BId";
//                 purheader."Document Type" := purheader."Document Type"::Order;
//                 purheader.Insert();

//                 sno := 0;
//                 tsline.Reset();
//                 tsline.SetRange("Document No.", Thead."Awarded BId");
//                 if tsline.Find('-') then begin
//                     repeat
//                         sno := sno + 1;
//                         prlines.init;
//                         prlines."Document Type" := prlines."Document Type"::Order;
//                         prlines."Document No." := purheader."No.";
//                         prlines."Line No." := prlines."Line No." + sno;
//                         prlines.Type := tsline.Type;
//                         prlines."No." := tsline."No.";
//                         prlines.Validate("No.");
//                         prlines."Location Code" := 'GENERAL';
//                         prlines.Validate("Location Code");
//                         prlines.Description := CopyStr(tsline.Description, 1, 100);
//                         prlines.Quantity := tsline.Quantity;
//                         prlines.Validate(Quantity);
//                         prlines."Direct Unit Cost" := tsline."Direct Unit Cost";
//                         prlines.Validate("Direct Unit Cost");
//                         prlines.Insert();
//                     until tsline.Next() = 0;
//                 end;

//                 Thead."Order No." := purheader."No.";
//                 Thead."Issue Order" := true;
//                 Thead.Modify();

//                 purBids.Reset();
//                 purBids.SetRange("No.", Thead."Awarded BId");
//                 if purBids.Find('-') then begin
//                     purBids."Bid Status" := purBids."Bid Status"::"Recommeded Award";
//                     purBids.Modify();
//                 end;

//                 Page.Run(Page::"Purchase Order", purheader);
//             end else begin
//                 //Vendor No does not exist
//                 Bidders.Reset();
//                 Bidders.SetRange("No.", Thead."Bidder/Supplier");
//                 Bidders.SetFilter("Vendor No.", '%1', '');
//                 if Bidders.Find('-') then begin
//                     purpay.get;
//                     ven.Init();
//                     ven."No." := noseries.GetNextNo(purpay."Vendor Nos.", 0D, True);
//                     ven.Validate("No.");
//                     ven.Name := Bidders.Name;
//                     ven."Gen. Bus. Posting Group" := 'DOMESTIC';
//                     ven."VAT Bus. Posting Group" := 'ZERO VAT';
//                     ven."Vendor Posting Group" := 'TRADE';
//                     ven."Invoice Disc. Code" := ven."No.";
//                     ven.Insert();
//                     Bidders."Vendor No." := ven."No.";
//                     Bidders.Modify();

//                     purheader.Init();
//                     purheader."No." := noseries.GetNextNo(purpay."Order Nos.", 0D, True);
//                     purheader."Buy-from Vendor No." := ven."No.";
//                     purheader.Validate("Buy-from Vendor No.");
//                     purheader."Shortcut Dimension 1" := Thead."Shortcut Dimension 1 Code";
//                     purheader."Document Date" := Today;
//                     purheader."Posting Date" := Today;
//                     purheader."Due Date" := Today;
//                     purheader."Order Date" := Today;
//                     purheader."Procurement Request No." := Thead."Requisition No.";
//                     purheader."Request for Quote No." := Thead."No.";
//                     purheader."Quote No." := Thead."Quote No.";
//                     purheader."Responsibility Center" := 'ARA';
//                     purheader."Assigned User ID 2" := UserId;
//                     purheader."Winning Bid" := Thead."Awarded BId";
//                     purheader."Document Type" := purheader."Document Type"::Order;
//                     purheader.Insert();

//                     sno := 0;
//                     tsline.Reset();
//                     tsline.SetRange("Document No.", Thead."Awarded BId");
//                     if tsline.Find('-') then begin
//                         repeat
//                             sno := sno + 1;
//                             prlines.init;
//                             prlines."Document Type" := prlines."Document Type"::Order;
//                             prlines."Document No." := purheader."No.";
//                             prlines."Line No." := prlines."Line No." + sno;
//                             prlines.Type := tsline.Type;
//                             prlines."No." := tsline."No.";
//                             prlines.Validate("No.");
//                             prlines.Description := CopyStr(tsline.Description, 1, 100);
//                             prlines.Quantity := tsline.Quantity;
//                             prlines.Validate(Quantity);
//                             prlines."Direct Unit Cost" := tsline."Direct Unit Cost";
//                             prlines.Validate("Direct Unit Cost");
//                             prlines.Insert();
//                         until tsline.Next() = 0;
//                     end;

//                     Thead."Order No." := purheader."No.";
//                     Thead."Issue Order" := true;
//                     Thead.Modify();

//                     purBids.Reset();
//                     purBids.SetRange("No.", Thead."Awarded BId");
//                     if purBids.Find('-') then begin
//                         purBids."Bid Status" := purBids."Bid Status"::"Recommeded Award";
//                         purBids.Modify();
//                     end;

//                     Page.Run(Page::"Purchase Order", purheader);
//                 end;
//                 //Vendor number already exist
//                 Bidders.Reset();
//                 Bidders.SetRange("No.", Thead."Bidder/Supplier");
//                 Bidders.SetFilter("Vendor No.", '%1', '');
//                 if Bidders.Find('-') then begin

//                     ven.Init();
//                     ven."No." := Bidders."Vendor No.";
//                     ven.Validate("No.");
//                     ven.Name := Bidders.Name;
//                     ven."Gen. Bus. Posting Group" := 'DOMESTIC';
//                     ven."VAT Bus. Posting Group" := 'ZERO VAT';
//                     ven."Vendor Posting Group" := 'TRADE';
//                     ven."Invoice Disc. Code" := ven."No.";
//                     ven.Insert();

//                     purpay.get;
//                     purheader.Init();
//                     purheader."No." := noseries.GetNextNo(purpay."Order Nos.", 0D, True);
//                     purheader."Buy-from Vendor No." := ven."No.";
//                     purheader.Validate("Buy-from Vendor No.");
//                     purheader."Shortcut Dimension 1" := Thead."Shortcut Dimension 1 Code";
//                     purheader."Document Date" := Today;
//                     purheader."Posting Date" := Today;
//                     purheader."Due Date" := Today;
//                     purheader."Order Date" := Today;
//                     purheader."Procurement Request No." := Thead."Requisition No.";
//                     purheader."Request for Quote No." := Thead."No.";
//                     purheader."Quote No." := Thead."Quote No.";
//                     purheader."Responsibility Center" := 'ARA';
//                     purheader."Assigned User ID 2" := UserId;
//                     purheader."Winning Bid" := Thead."Awarded BId";
//                     purheader."Document Type" := purheader."Document Type"::Order;
//                     purheader.Insert();

//                     sno := 0;
//                     tsline.Reset();
//                     tsline.SetRange("Document No.", Thead."Awarded BId");
//                     if tsline.Find('-') then begin
//                         repeat
//                             sno := sno + 1;
//                             prlines.init;
//                             prlines."Document Type" := prlines."Document Type"::Order;
//                             prlines."Document No." := purheader."No.";
//                             prlines."Line No." := prlines."Line No." + sno;
//                             prlines.Type := tsline.Type;
//                             prlines."No." := tsline."No.";
//                             prlines.Validate("No.");
//                             prlines.Description := CopyStr(tsline.Description, 1, 100);
//                             prlines.Quantity := tsline.Quantity;
//                             prlines.Validate(Quantity);
//                             prlines."Direct Unit Cost" := tsline."Direct Unit Cost";
//                             prlines.Validate("Direct Unit Cost");
//                             prlines.Insert();
//                         until tsline.Next() = 0;
//                     end;

//                     Thead."Order No." := purheader."No.";
//                     Thead."Issue Order" := true;
//                     Thead.Modify();

//                     purBids.Reset();
//                     purBids.SetRange("No.", Thead."Awarded BId");
//                     if purBids.Find('-') then begin
//                         purBids."Bid Status" := purBids."Bid Status"::"Recommeded Award";
//                         purBids.Modify();
//                     end;

//                     Page.Run(Page::"Purchase Order", purheader);
//                 end

//             end;
//             Thead."Issue Order" := true;
//             Thead.Modify();
//         end else begin
//             purheader.Reset();
//             purheader.SetRange("No.", Thead."Order No.");
//             Page.Run(Page::"Purchase Order", purheader);
//         end;
//     end;


//     procedure GenerateTotierBid(var header: Record "PROC-Purchase Quote Header")
//     var
//         qlines: Record "PROC-Purchase Quote Line";
//         tsheader: Record "Tender Submission Header";
//         tsline: Record "Tender Submission Lines";
//         noseries: Codeunit NoSeriesManagement;
//         prpay: Record "Purchases & Payables Setup";
//         sno: Integer;
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//     begin
//         sno := 0;
//         tsheader.Init();
//         prpay.get;
//         tsheader."No." := NoSeriesMgt.GetNextNo(prpay."Tender Submission", 0D, True);
//         tsheader."Tender No." := header."No.";
//         tsheader."Request for Quote No." := header."No.";
//         tsheader."Posting Description" := header.Description;
//         tsheader."Procurement methods" := header."Procurement methods";
//         tsheader."RFQ No." := header."Requisition No.";
//         tsheader."Bid Status" := tsheader."Bid Status"::Submitted;
//         tsheader."Expected Closing Date" := header."Expected Closing Date";
//         tsheader."Expected Opening Date" := header."Expected Opening Date";
//         tsheader."Bidder No" := 'TENDER001';
//         tsheader.Insert();

//         qlines.Reset();
//         qlines.SetRange("Document No.", header."No.");
//         if qlines.Find('-') then begin
//             repeat
//                 sno := sno + 1;
//                 tsline.Init();
//                 tsline."Document Type" := tsline."Document Type"::Quote;
//                 tsline."Tender No." := header."No.";
//                 tsline."RFQ No." := header."Requisition No.";
//                 tsline.Description := qlines.Description;
//                 tsline."Document No." := tsheader."No.";
//                 tsline."Line No." := tsline."Line No." + sno;
//                 tsline.Validate("Line No.");
//                 tsline."No." := qlines."No.";
//                 tsline."Buy-from Bidder No." := 'TENDER001';
//                 tsline."Unit of Measure" := qlines."Unit of Measure Code";
//                 tsline.Quantity := qlines.Quantity;
//                 tsline."Type" := qlines."Type";
//                 tsline."Document Date" := Today;
//                 tsline.Insert();

//             until qlines.Next() = 0;

//         end;
//         Page.Run(Page::"Tender Tier Submission Header", tsheader);

//     end;


//     procedure GenerateQuote(var header: Record "PROC-Purchase Quote Header")
//     var
//         qlines: Record "PROC-Purchase Quote Line";
//         pheader: Record "Purchase Header";
//         prLine: Record "Purchase Line";
//         noseries: Codeunit NoSeriesManagement;
//         prpay: Record "Purchases & Payables Setup";
//         sno: Integer;
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//     begin
//         sno := 0;
//         pheader.Init();
//         prpay.get;
//         pheader."No." := NoSeriesMgt.GetNextNo(prpay."Tender Submission", 0D, True);
//         pheader."Quote No." := header."No.";
//         pheader."Request for Quote No." := header."No.";
//         pheader."Posting Description" := header.Description;
//         // tsheader."Procurement methods" := header."Procurement methods";
//         pheader."RFQ No." := header."Requisition No.";
//         pheader."Quote Status" := pheader."Quote Status"::Submitted;
//         pheader."Document Type 2" := pheader."Document Type 2"::Quote;
//         pheader.DocApprovalType := pheader.DocApprovalType::Quote;
//         pheader."Document Date" := Today;
//         pheader."Due Date" := Today;
//         pheader."Order Date" := Today;
//         pheader."Expected Closing Date" := header."Expected Closing Date";
//         pheader."Expected Opening Date" := header."Expected Opening Date";
//         pheader."Document Type" := pheader."Document Type"::Quote;
//         //tsheader."Buy-from Vendor No." := 'TENDER001';
//         pheader.Insert();

//         qlines.Reset();
//         qlines.SetRange("Document No.", header."No.");
//         if qlines.Find('-') then begin
//             repeat
//                 sno := sno + 1;
//                 prLine.Init();
//                 prLine."Document Type" := prLine."Document Type"::Quote;
//                 prLine."Document No." := header."No.";
//                 prLine."RFQ No." := header."Requisition No.";
//                 prLine.Description := qlines.Description;
//                 prLine."Document No." := pheader."No.";
//                 prLine."Line No." := prLine."Line No." + sno;
//                 prLine.Validate("Line No.");
//                 prLine."No." := qlines."No.";
//                 // prLine."Buy-from Vendor No." := 'TENDER001';
//                 prLine."Unit of Measure" := qlines."Unit of Measure Code";
//                 prLine.Quantity := qlines.Quantity;
//                 prLine.Validate(Quantity);
//                 prLine."Type" := qlines."Type";
//                 prLine."Order Date" := Today;
//                 prLine.Insert();

//             until qlines.Next() = 0;

//         end;
//         Page.Run(Page::"Proc-Purchase Quote.Card", pheader);

//     end;


//     //award Quotation
//     procedure AwardQuotation(var Thead: Record "Proc Proffessional Opinion")
//     var
//         purheader: Record "Purchase Header";
//         prlines: Record "Purchase Line";
//         ven: Record Vendor;
//         purpay: Record "Purchases & Payables Setup";
//         noseries: Codeunit NoSeriesManagement;
//         qlines: Record "Purchase Line";
//         sno: Integer;
//         purQuotes: Record "Purchase Header";
//         Thead1: Record "Purchase Header";

//     begin
//         Thead1.Reset();
//         Thead1.SetRange("No.", Thead."Recommended for Award");
//         if Thead1.find('-') then begin


//             Thead.TestField("Proffessional Opinion");
//             Thead.TestField("Recommended for Award");
//             Thead.TestField("Bidder/Supplier");
//             Thead.TestField("Accounting Officer");

//             if Thead."Issue Order" = false then begin
//                 if Confirm('Award this Tender/Quote ?', true) = false then Error('Cancelled');
//                 if UserId <> Thead."Accounting Officer" then Error('Your are not authorized');
//                 ven.Reset();
//                 ven.SetRange("No.", Thead."Bidder/Supplier");
//                 if ven.Find('-') then begin
//                     purpay.get;
//                     purheader."No." := noseries.GetNextNo(purpay."Order Nos.", 0D, True);
//                     purheader."Buy-from Vendor No." := ven."No.";
//                     purheader.Validate("Buy-from Vendor No.");
//                     purheader."Shortcut Dimension 1" := Thead1."Shortcut Dimension 1 Code";
//                     purheader."Document Date" := Today;
//                     purheader."Posting Date" := Today;
//                     purheader."Due Date" := Today;
//                     purheader."Order Date" := Today;
//                     purheader."Procurement Request No." := Thead."Requisition No.";
//                     purheader."Request for Quote No." := Thead."No.";
//                     purheader."Quote No." := Thead1."Quote No.";
//                     purheader."Responsibility Center" := 'ARA';
//                     purheader."Assigned User ID 2" := UserId;
//                     purheader."Winning Bid" := Thead."Recommended for Award";
//                     purheader."Document Type" := purheader."Document Type"::Order;
//                     purheader.Insert();

//                     sno := 0;
//                     qlines.Reset();
//                     qlines.SetRange("Document No.", Thead."Recommended for Award");
//                     if qlines.Find('-') then begin
//                         repeat
//                             sno := sno + 1;
//                             prlines.init;
//                             prlines."Document Type" := prlines."Document Type"::Order;
//                             prlines."Document No." := purheader."No.";
//                             prlines."Line No." := prlines."Line No." + sno;
//                             prlines.Type := qlines.Type;
//                             prlines."No." := qlines."No.";
//                             prlines.Validate("No.");
//                             prlines."Location Code" := 'GENERAL';
//                             prlines.Validate("Location Code");
//                             prlines.Description := CopyStr(qlines.Description, 1, 100);
//                             prlines.Quantity := qlines.Quantity;
//                             prlines.Validate(Quantity);
//                             prlines."Direct Unit Cost" := qlines."Direct Unit Cost";
//                             prlines.Validate("Direct Unit Cost");
//                             prlines.Insert();
//                         until qlines.Next() = 0;
//                     end;

//                     Thead."Order No." := purheader."No.";

//                     Thead."Issue Order" := true;
//                     Thead.Modify();

//                     purQuotes.Reset();
//                     purQuotes.SetRange("No.", Thead."Recommended for Award");
//                     if purQuotes.find('-') then begin
//                         purQuotes."Quote Status" := purQuotes."Quote Status"::"Recommended Award";
//                         purQuotes.Modify();
//                     end;
//                     Page.Run(Page::"Purchase Order", purheader);
//                 end;
//             end else begin
//                 purheader.Reset();
//                 purheader.SetRange("No.", Thead."Order No.");
//                 Page.Run(Page::"Purchase Order", purheader);
//             end;
//         end;
//     end;

//     procedure validateProfOpinion()
//     var
//         setup: Record "User Setup";
//     begin

//         setup.Reset();
//         setup.SetRange("User ID", UserId);
//         setup.SetRange("Proffessional OP", false);
//         if setup.Find('-') then begin
//             Error('Not Authorized to perform this task');
//         end;

//     end;

//     procedure validateAccOff()
//     var
//         setup: Record "User Setup";
//     begin

//         setup.Reset();
//         setup.SetRange("User ID", UserId);
//         // setup.SetRange("Accounting Officer", false);
//         if setup.Find('-') then begin
//             Error('Not Authorized to perform this task');
//         end;

//     end;

//     procedure AccountingOfficer(var pop: Record "Proc Proffessional Opinion")
//     var
//         setup: Record "User Setup";
//     begin

//         setup.Reset();
//         // setup.SetRange("Accounting Officer", true);
//         if setup.Find('-') then begin
//             pop."Accounting Officer" := setup."User ID";
//             pop.Modify();
//         end else
//             Error('Ensure an accounting officer is setup on user setup');

//     end;

// }

