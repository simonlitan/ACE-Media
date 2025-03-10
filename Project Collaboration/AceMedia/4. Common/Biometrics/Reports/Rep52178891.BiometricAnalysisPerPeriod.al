report 52178891 "Biometric Analysis Per Period"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Biometrics/Reports/SSR/BiBiometricAnalysisPerPeriod.rdl';

    dataset
    {
        dataitem(HRC; "HRM-Employee C")
        {
            DataItemTableView = WHERE(Status = FILTER(Active));
            RequestFilterFields = "Date Filter", "Global Dimension 1 Code";
            column(No_HRC; HRC."No.")
            {
            }
            column(FirstName_HRC; HRC."First Name" + '  ' + HRC."Middle Name" + '  ' + HRC."Last Name")
            {
            }
            column(MiddleName_HRC; HRC."Middle Name")
            {
            }
            column(LastName_HRC; HRC."Last Name")
            {
            }
            column(Status_HRC; HRC.Status)
            {
            }
            column(cname; info.Name)
            {
            }
            column(cname2; info."Name 2")
            {
            }
            column(caddress; info.Address)
            {
            }
            column(cphone; info."Phone No.")
            {
            }
            column(cpicture; info.Picture)
            {
            }
            column(cemail; info."E-Mail")
            {
            }
            column(curl; info."Home Page")
            {
            }
            column(HoursDone; HoursDone)
            {
            }
            column(sdate; FORMAT(sdate))
            {
            }
            column(edate; FORMAT(edate))
            {
            }
            column(DimName; DimName2)
            {
            }
            column(dptCode; HRC."Global Dimension 1 Code")
            {
            }
            column(DPTName; DimName2)
            {
            }

            trigger OnAfterGetRecord()
            begin
                HRC2.RESET;
                HRC2.SETRANGE("No.", HRC."No.");
                HRC2.SETFILTER("Date Filter", '%1..%2', sdate, edate);
                IF HRC2.FIND('-') THEN BEGIN
                    CLEAR(HoursDone);
                    /* HRC2.CALCFIELDS("Hours Done");
                    IF HRC2."Hours Done" > 0 THEN
                        HoursDone := (HRC2."Hours Done") / 2; */
                END;
                CLEAR(DimName2);
                DimValue.RESET;
                DimValue.SETRANGE(Code, "Global Dimension 1 Code");
                IF DimValue.FINDFIRST THEN BEGIN
                    //MESSAGE('%1%2%3%4', 'Department is ', DimValue.Code,' ', DimValue.Name);
                    DimName2 := DimValue.Name;
                END;
            end;

            trigger OnPreDataItem()
            begin
                info.GET;
                info.CALCFIELDS(Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        sdate := HRC.GETRANGEMIN("Date Filter");
        edate := HRC.GETRANGEMAX("Date Filter");
    end;

    var
        info: Record 79;
        HoursDone: Decimal;
        HRC2: Record "HRM-Employee C";
        sdate: Date;
        edate: Date;
        DiMCode: Code[10];
        DimName2: Text[50];
        DimValue: Record 349;
}

