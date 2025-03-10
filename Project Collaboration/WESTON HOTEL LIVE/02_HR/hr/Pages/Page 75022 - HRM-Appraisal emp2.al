page 75022 "HRM-Appraisal emp2"
{
    Editable = true;
    PageType = Card;
    SaveValues = true;
    SourceTable = "HRM-Employee C";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = true;
                field("No."; Rec."No.")
                {
                    Caption = 'No.(*)';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    Caption = 'Name(*)';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Middle Name"; Rec."Middle Name")
                {

                    Editable = false;
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {

                    Editable = false;
                    ApplicationArea = All;
                }
                field(Initials; Rec.Initials)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Search Name"; Rec."Search Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Postal Address"; Rec."Postal Address")
                {

                    Editable = false;
                    ApplicationArea = All;
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(County; Rec.County)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {

                    Editable = false;
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Student)
            {
                Caption = 'Employee';
                action(Comments)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    ApplicationArea = All;
                    //RunPageLink =  =CONST(Customer),
                    //"No."=FIELD("No.");
                }
                action("Appraisal Registrations")
                {
                    Caption = 'Appraisal Registrations';
                    RunObject = Page "HRM-Appraisal Registration 2";
                    ApplicationArea = All;
                    // RunPageLink = "No."=FIELD("No.");
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //OnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //IF Name = '' THEN
        //ERROR('You must finish entry of the record.');;
        //OnAfterGetCurrRecord;
    end;

    var
        CourseRegistration: Record "HRM-Appraisal Registration";
        PictureExists: Boolean;
        CourseReg: Record "HRM-Appraisal Registration";
        districtname: Text[50];
        Cust: Record Customer;
        GenJnl: Record "Gen. Journal Line";
        PDate: Date;
        CReg: Record "HRM-Appraisal Registration";
        Prog: Record "HRM-Appraisal Jobs";
        TransInv: Boolean;
        TransRec: Boolean;
        CustL: Record "Cust. Ledger Entry";
        Stud: Record Customer;


}

