report 52178540 "FA Register"
{
    Caption = 'FA Register';
    RDLCLayout = './Reports/SSR/FA Register.rdl';
    DefaultLayout = rdlc;

    dataset
    {
        dataitem(FixedAsset; "Fixed Asset")
        {
            RequestFilterFields = "FA Subclass Code", "No.";
            column(No_FixedAsset; "No.")
            {
            }
            column(Description_FixedAsset; Description)
            {
            }
            column(FASubclassCode_FixedAsset; "FA Subclass Code")
            {
            }
            column(Condition_FixedAsset; Condition)
            {
            }
            column(TagNo_FixedAsset; "Tag No.")
            {
            }
            column(FALocationCode_FixedAsset; "FA Location Code")
            {
            }
            dataitem("FA Depreciation Book"; "FA Depreciation Book")
            {
                DataItemLink = "FA No." = field("No.");
                column(BookValue_FADepreciationBook; "Book Value")
                {
                }
                column(AcquisitionCost_FADepreciationBook; "Acquisition Cost")
                {
                }
                column(Depreciation_FADepreciationBook; Depreciation)
                {
                }
                column(DepreciationEndingDate_FADepreciationBook; "Depreciation Ending Date")
                {
                }
                column(DisposalDate_FADepreciationBook; "Disposal Date")
                {
                }
                column(EndingBookValue_FADepreciationBook; "Ending Book Value")
                {
                }
                column(DepreciationStartingDate_FADepreciationBook; "Depreciation Starting Date")
                {
                }
                column(FixedDeprAmount_FADepreciationBook; "Fixed Depr. Amount")
                {
                }
                column(BookValueonDisposal_FADepreciationBook; "Book Value on Disposal")
                {
                }
                column(AccumDeprCustom1_FADepreciationBook; "Accum. Depr. % (Custom 1)")
                {
                }
                column(NoofDepreciationYears_FADepreciationBook; "No. of Depreciation Years")
                {
                }
                column(NoofDepreciationMonths_FADepreciationBook; "No. of Depreciation Months")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    CalcFields("Book Value");
                    CalcFields(Depreciation);

                end;

                trigger OnPreDataItem()
                begin
                    CalcFields("Book Value");
                    CalcFields(Depreciation);

                end;
            }
            column(Compinfopicture; Compinfo.Picture)
            {

            }
            column(Compinfoname; Compinfo.Name)
            {

            }
            column(Compinfophone; Compinfo."Phone No.")
            {

            }
            column(Compinfoaddress; Compinfo.Address)
            {

            }
            column(Compinfoemail; Compinfo."E-Mail")
            {

            }
            column(Compinfowebpage; Compinfo."Home Page")
            {

            }
            trigger OnPreDataItem()
            begin
                "FA Depreciation Book".Reset();
                "FA Depreciation Book".SetRange("FA No.", FixedAsset."No.");
                if "FA Depreciation Book".Find('-') then
                    "FA Depreciation Book".CalcFields("Book Value");
                "FA Depreciation Book".CalcFields(Depreciation);

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

    trigger OnPreReport()
    begin
        compinfo.get();
        compinfo.CalcFields(Picture);
        FADepbook.CalcFields(Depreciation);
        FADepbook.CalcFields("Book Value");
    end;

    trigger OnInitReport()
    begin
        compinfo.get();
        compinfo.CalcFields(Picture);
        FADepbook.CalcFields(Depreciation);
        FADepbook.CalcFields("Book Value");
    END;

    var
        Compinfo: Record "Company Information";
        FADepbook: record "FA Depreciation Book";
}
