report 52178546 CostCenterUpdate
{
    Caption = 'CostCenterUpdate';
    ProcessingOnly = true;
    dataset
    {
        dataitem(Header; "PROC-Store Requistion Header")
        {

            trigger OnAfterGetRecord()
            var
                Ledgers: Record "G/L Entry";
                StoreReq: Record "PROC-Store Requistion Header";
            begin

                StoreReq.Reset();
                StoreReq.SetRange("No.", Header."No.");
                if StoreReq.Find('-') then begin

                    // repeat

                    Ledgers.Reset();
                    Ledgers.SetRange("Document No.", StoreReq."No.");
                    if Ledgers.Find('-') then begin
                        repeat
                            Ledgers."Global Dimension 1 Code" := StoreReq."Global Dimension 1 Code";
                            Ledgers."Global Dimension 2 Code" := StoreReq."Shortcut Dimension 2 Code";
                            Ledgers.Modify();
                        until Ledgers.Next() = 0;

                    end;

                    // until StoreReq.Next() = 0;
                    Message('Complete');
                end;

            end;
        }


    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
