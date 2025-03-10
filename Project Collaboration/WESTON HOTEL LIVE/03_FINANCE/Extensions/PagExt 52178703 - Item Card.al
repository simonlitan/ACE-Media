pageextension 52178703 "ExtItem Card" extends "Item Card"
{
    layout
    {
        addafter("Base Unit of Measure")
        {
            field("Purch Unit of Measure"; Rec."Purch. Unit of Measure")
            {
                ApplicationArea = All;
            }
            // field(StoreLocation; Rec.StoreLocation)
            // {
            //     ApplicationArea = all;
            //     Caption = 'Store Location';
            // }
            field("Location code"; Rec."Location code")
            {
                ApplicationArea = all;

            }
            field("Item Group"; Rec."Item Group")
            {
                ApplicationArea = all;
                TableRelation = "Item Group".Code;
                //TableRelation = "Item Groitemup".Code;
            }
            field("Item Sub-Group"; Rec."Item Sub-Group")
            {
                ApplicationArea = all;
                TableRelation = "Item Category" WHERE("Item Group" = field("Item Group"));


                // trigger OnValidate()
                //         begin                     
                //             IF "Location Code" <> xRec."Location Code" THEN 
                //                 BEGIN
                //                     IF ItemGroup.GET("Location Code") THEN 
                //                         BEGIN
                //                             IF "Gen. Prod. Posting Group" = '' 
                //                                 THEN
                //                                     VALIDATE("Gen. Prod. Posting Group",ItemGroup."Def. Gen. Prod. Posting Group");
                //                             IF ("VAT Prod. Posting Group" = '') 
                //                                 OR
                //                                     (GenProdPostingGrp.ValidateVatProdPostingGroup(GenProdPostingGrp,"Gen. Prod. Posting Group") 
                //                                     AND
                //                                         ("Gen. Prod. Posting Group" =ItemGroup."Def. Gen. Prod. Posting Group") 
                //                                         AND
                //                                             ("VAT Prod. Posting Group" = GenProdPostingGrp."Def. VAT Prod. Posting Group"))
                //                             THEN
                //                                 VALIDATE("VAT Prod. Posting Group",ItemGroup."Def. VAT Prod. Posting Group");
                //                             IF "Inventory Posting Group" = '' 
                //                                 THEN
                //                                     VALIDATE("Inventory Posting Group",ItemGroup."Def. Inventory Posting Group");
                //                             IF "Tax Group Code" = '' 
                //                                 THEN
                //                                     VALIDATE("Tax Group Code",ItemGroup."Def. Tax Group Code");
                //                                     VALIDATE("Costing Method",ItemGroup."Def. Costing Method");
                //                         END;

                //                     IF NOT ProductGrp.GET("Location Code","Item Category Code") 
                //                         THEN
                //                             VALIDATE("Item Category Code",'')
                //                     ELSE
                //                         VALIDATE("Item Category Code");
                //                 END;
                //         end;

                trigger OnValidate()
                var
                    ItemCategory: Record "Item Category";
                begin
                    if ItemCategory.Get(Rec."Item Sub-Group") then begin
                        Rec."Gen. Prod. Posting Group" := ItemCategory."Def. Gen. Prod. Posting Group";
                        Rec."VAT Prod. Posting Group" := ItemCategory."Def. VAT Prod. Posting Group";
                        Rec."Inventory Posting Group" := ItemCategory."Def. Inventory Posting Group";
                    end;
                end;
            }
            field("Item Category"; Rec."Item Category")
            {
                ApplicationArea = all;
                TableRelation = "Product Groups".Code where("Item Category Code" = field("Item Sub-Group"));
                // TableRelation = Item."Products Group Code" where("No." = field("No."));
            }

        }

        addafter("Item Sub-Group")
        {
            field("Product Group Code"; Rec."Products Group Code")
            {


                // TableRelation = "Product Groups".Code where("Item Category Code" = field("Item Category Code"));
                TableRelation = "Product Groups".Code where("Item Category Code" = field("Item Sub-Group"));
            }
        }

        modify("VAT Prod. Posting Group")
        {
            ShowMandatory = true;
        }

        modify("Tax Group Code")
        {
            Visible = false;
        }
        addafter("Item Category Code")
        {
            field("Is Controlled"; Rec."Is Controlled")
            {
                ApplicationArea = All;
            }
        }
        addafter("Item Category Code")
        {

            field("Item G/L Budget Account"; Rec."Item G/L Budget Account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item G/L Budget Account field.';
            }

        }
        modify("Item Category Code")
        {
            Visible = false;
        }
    }

    actions
    {
        addafter(AdjustInventory)
        {
            action("Import Unit of Measure")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Unit of Measure';
                Image = Journal;
                RunObject = xmlport "Item Unit of measure";
                ToolTip = 'Item Unit of Measure';
            }
        }

    }
    trigger OnModifyRecord(): Boolean
    var
        Usersetup: Record "User Setup";
    begin
        Usersetup.Reset();
        Usersetup.SetRange("User ID", UserId);
        Usersetup.SetRange("Create Items", false);
        if Usersetup.Find('-') then begin
            Error('You cannot Modify Item Record');
        end;
    end;


    var
        myInt: Integer;

}