/// <summary>
/// Page HRM-Leav letter generate (ID 50003).
/// </summary>
page 52179129 "HRM-Leave letter generate"
{
    PageType = list;
    Editable = true;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "HRM-Leave Requisition";
    SourceTableView = order(ascending) where(status = const(posted));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field("Reliever No."; Rec."Reliever No.")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }

                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field("Shortcut Dimension  3"; Rec."Shortcut Dimension  3")
                {
                    Caption = 'Division';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension  3 field.';
                    Editable = fieldEditable;
                }
                field("Shortcut dimension 4"; Rec."Shortcut dimension 4")
                {
                    Caption = 'Region';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut dimension 4 field.';
                    Editable = fieldEditable;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field("Applied Days"; Rec."Applied Days")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field("Availlable Days"; Rec."Availlable Days")
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Editable = fieldEditable;
                }
                field("Current Financial Year"; Rec."Current Financial Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Financial Year field.';
                    TableRelation = "Cash Office Setup"."Current Budget";
                }
                field("Previous Financial Year"; Rec."Previous Financial Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Previous Financial Year field.';
                }
                field("Days Carried forward"; Rec."Days Carried forward")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Days Carried forward field.';
                }
                field("Annual Leave days"; Rec."Annual Leave days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Annual Leave days field.';
                }
                field("Job title"; Rec."Job title")
                {
                    Caption = 'Through';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job title field.';
                }
                field(Salutation; Rec.Salutation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salutation field.';
                }
            }
        }

    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {

                action("Leave Letter")
                {
                    Caption = 'Print Leave Letter';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //rec.TestField(Status, rec.status::posted);

                        //rec.TestField(Salutation);
                        //rec.TestField("Job title");
                        //rec.TestField("Previous Financial Year");
                        // rec.TestField("Current Financial Year");
                        Rec.Reset;
                        Rec.SetFilter("No.", Rec."No.");
                        REPORT.Run(report::"HR Leave Statement", true, true, Rec);
                        Rec.Reset;
                    end;
                }


            }
        }

    }
    trigger OnOpenPage()
    begin


        rec."Current Financial Year" := '2022/2023';
        rec."Previous Financial Year" := '2021/2022';
        rec."Days Carried forward" := 15;
        rec."Annual Leave days" := 30;


    end;


    /// <summary>
    /// UpdateControls.
    /// </summary>
    procedure UpdateControls()
    begin
        IF Rec.Status <> Rec.Status::Released THEN BEGIN
            fieldEditable := false;
        END;

    end;




    var
        cashoffice: Record "Cash Office Setup";
        budget: Record "G/L Budget Name";
        [InDataSet]
        fieldvisible: boolean;
        [InDataSet]
        fieldEditable: Boolean;
        UserMgt: Codeunit "User Setup Management";
        //todo  ApprovalMgt: Codeunit "Approvals Management";
        ReqLine: Record "HMS-Setup Blood Group";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        //   JournlPosted: Codeunit "Journal Post Successful";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        FixedAsset: Record "Fixed Asset";
        //MinorAssetsIssue: Record "HMS-Patient";
        LeaveEntry: Record "HRM-Leave Ledger";
        [InDataSet]
        NoEditable: Boolean;
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        EmployeeNoEditable: Boolean;
        [InDataSet]
        CampusCodeEditable: Boolean;
        [InDataSet]
        DepartmentCodeEditable: Boolean;
        [InDataSet]
        AppliedDaysEditable: Boolean;
        [InDataSet]
        StartingDateEditable: Boolean;
        [InDataSet]
        PurposeEditable: Boolean;
        ApprovalEntries: Page "Fin-Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application";
        HREmp: Record "HRM-Employee C";
        RelNoEditable: Boolean;
        RelNameEditable: Boolean;
        EmpNameEditable: Boolean;
        LeaveTypeEditable: Boolean;



}