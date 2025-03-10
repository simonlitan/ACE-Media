pageextension 52178541 "ExtPurchase Quote Subform" extends "Purchase Quote Subform"
{
    layout
    {
        // Add changes to page layout here
        modify("Location Code")
        {
            ShowMandatory = true;

        }
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                if rec."Document Type 2" = rec."Document Type 2"::Requisition then begin
                    Procplanheader.Reset();
                    // Procplanheader.SetRange(Closed, false);
                    if Procplanheader.Find('-') then begin
                        Procplanlines.Reset();
                        Procplanlines.SetRange("Budget Name", Procplanheader."Budget Name");
                        // Procplanlines.SetRange("Procurement Plan Period", Procplanheader."Procurement Plan Period");
                        Procplanlines.SetRange(Type, rec.Type);
                        Procplanlines.SetRange("No.", rec."No.");
                        if Procplanlines.Find('-') then begin
                        end else
                            Error('The selected' + ' ' + rec."No." + ' ' + 'is not available in the procurement plan');
                    end else
                        Error('No Procurement plan available to check against');
                end;
            end;
        }

    }

    actions
    {

    }


    var
        myInt: Integer;
        pheader: Record "Purchase Header";
        plines: record "Purchase Line";
        Procplanheader: record "PROC-Procurement Plan Header";
        Procplanlines: Record "PROC-Procurement Plan Lines";
}