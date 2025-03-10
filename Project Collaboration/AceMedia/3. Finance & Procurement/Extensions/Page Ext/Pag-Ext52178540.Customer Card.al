pageextension 52178540 "ExtCustomer Card" extends "Customer Card"
{
    layout
    {

        addafter("Balance (LCY)")
        {

            field("Bank code"; Rec."Bank code")
            {
                ShowMandatory = true;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bank code field.';
                trigger OnValidate()
                var
                    bankstructure: Record "PRL-Bank Structure";
                begin
                    bankstructure.Reset();
                    bankstructure.SetRange("Bank Code", rec."Bank code");
                    if bankstructure.FindFirst() then
                        rec."Bank Name" := bankstructure."Bank Name";
                end;
            }
            field("Bank Name"; Rec."Bank Name")
            {
                ShowMandatory = true;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bank Name field.';
            }
            field("Branch Code"; Rec."Branch Code")
            {
                ShowMandatory = true;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Branch Code field.';

                trigger OnValidate()
                var
                    bankstructure: Record "PRL-Bank Structure";
                begin
                    bankstructure.Reset();
                    bankstructure.SetRange("Bank Code", rec."Branch Code");
                    bankstructure.SetRange("Branch Code", rec."Branch Code");

                    if bankstructure.FindFirst() then
                        rec."Branch Name" := bankstructure."Branch Name"
                end;
            }
            field("Branch Name"; Rec."Branch Name")
            {
                ShowMandatory = true;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Branch Name field.';
            }
            field("Account No"; Rec."Account No")
            {
                ShowMandatory = true;
                Caption = 'Imprest Account';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Account No field.';
            }
        }
        addafter("VAT Registration No.")
        {

            field("KRA pin"; Rec."KRA pin")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the KRA pin field.';
            }
            field("HS Code"; Rec."HS Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HS Code field.';
            }

        }
        addafter(Name)
        {
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = all;
            }
            field("Customer Grade"; Rec."Customer Grade")
            {
                ApplicationArea = all;
            }

        }
        // Add changes to page layout here
    }

    actions
    {


    }
    trigger OnDeleteRecord(): Boolean
    var
        myInt: Integer;
    begin
        Message('Sorry You Cannot Delete This Record');
    end;

    trigger OnClosePage()
    begin
        rec.TestField("Bank code");
        rec.TestField("Branch Code");
        rec.TestField("KRA pin");
        rec.TestField("Account No");
        rec.TestField("Customer Type");

        Rec.Delete(false)

    end;


    var
        myInt: Integer;
}
