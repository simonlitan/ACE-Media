page 52178918 "ISO-Audit Items ListPart"
{
    Caption = ' CHECKLIST ITEMS';
    PageType = ListPart;

    // SourceTable = "ISO-Audit Checklist Table";
    SourceTable = "ISO-Audit Items Table";

    layout
    {
        area(content)
        {

            group(Genera)
            {

            }

            repeater(General)
            {

                // field("Item No"; "Item No")
                // {
                //     Caption = 'Item no.';
                // }
                field("No"; Rec."No.")
                {
                    // Caption = 'Form no.';
                    Caption = 'Code';
                    ApplicationArea = All;

                }

                field("System Aspect"; Rec."System Aspect")
                {
                    Caption = 'Aspect of the system to be checked';
                    ApplicationArea = All;

                }
                field("PRO/WI REF"; Rec."PRO/WI REF")
                {
                    MultiLine = true;
                    ApplicationArea = All;

                }
                field("Results"; Rec."Results")
                {
                    MultiLine = true;
                    ApplicationArea = All;

                }
                field("Audit Criteria"; Rec."Audit Criteria")
                {
                    ApplicationArea = All;

                }




            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Submit")
            {
                ApplicationArea = All;
                Caption = '&Print checklist form';
                Image = SendTo;
                RunObject = report "Car form";

                trigger OnAction()
                begin


                end;
            }


        }
    }





}
