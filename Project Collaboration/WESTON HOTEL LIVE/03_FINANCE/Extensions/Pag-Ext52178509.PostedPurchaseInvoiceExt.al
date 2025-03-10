pageextension 52178509 "Posted Purchase Invoice Ext" extends "Posted Purchase Invoice"
{
    layout
    {

    }
    actions
    {
        addafter(Vendor)
        {
            action("File Attachment")
            {
                ApplicationArea = All;

                Image = Attach;
                Promoted = true;
                PromotedCategory = Category7;
                trigger OnAction()
                begin
                    DMS.Reset;
                    DMS.SetRange("Document Type", DMS."Document Type"::LPO);
                    if DMS.Find('-') then begin
                        Hyperlink(DMS."url path" + Rec."Order No.");
                    end else
                        Message('No Link ' + format(DMS."Document Type"::LPO));
                end;

            }
        }
    }
    var
        DMS: record edms;
}
