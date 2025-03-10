/// <summary>
/// PageExtension ExtBank Account Ledger Entries (ID 52178515) extends Record Bank Account Ledger Entries.
/// </summary>
pageextension 52178526 "ExtBank Account Ledger Entries" extends "Bank Account Ledger Entries"
{
    layout
    {
        addafter(Amount)
        {

            field("Statement Difference"; Rec."Statement Difference")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the "Statement Difference" field.';
            }
        }
        addafter("Document No.")
        {
            field(Description2;Rec.Description2)
            {
                Caption = 'Purpose';
                ApplicationArea = all;
            }
            field(Remarks;Rec.Remarks)
            {

            }
        }

    }
    actions
    {

        addafter("&Navigate")
        {
            action("Update Amount")
            {
                ApplicationArea = all;
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    bankacledger: record "Bank Account Ledger Entry";
                begin
                    bankacledger.Reset();
                    // bankacledger.SetRange("Bank Account No.",rec."Bank Account No.");
                    bankacledger.SetRange("Entry No.", rec."Entry No.");
                    if bankacledger.Find('-') then begin
                        repeat

                            bankacledger."Statement Difference" := rec.Amount;
                            // bankacledger."Amount Applied" := rec.Amount;
                            bankacledger.Modify();

                        until bankacledger.Next() = 0;
                        Message('Updated');
                    end;


                end;
            }
        }
    }
}
