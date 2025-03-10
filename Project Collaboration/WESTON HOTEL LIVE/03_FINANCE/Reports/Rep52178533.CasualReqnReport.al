report 52178533 "Casual Reqn Report"

{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/CasualRequsitionReport.rdlc';

    dataset
    {
        dataitem("Casual Requisition Lines"; "Casual Requisition Lines")
        {
            DataItemTableView = WHERE (Status = CONST (Approved));
            RequestFilterFields = "Date Filter";
            column(No; "Casual Requisition Lines".No)
            {
            }
            column(Name; UPPERCASE(Name))
            {
            }
            column(Rate; "Casual Requisition Lines".Rate)
            {
            }
            column(Days; "Casual Requisition Lines"."No of Days")
            {
            }
            column(Total; "Casual Requisition Lines".Total)
            {
            }
            column(Dept; "Casual Requisition Lines".Department)
            {
            }
            column(Costcenter; "Casual Requisition Lines"."Cost Center")
            {
            }
            column(Date; "Casual Requisition Lines"."Requisition Date")
            {
            }
            column(CostCenterName; CostCenterName)
            {
            }
            column(Num; Num)
            {
            }
            column(Pic; companyinfo.Picture)
            {
            }
            column(CompName; CompName)
            {
            }
            column(Addr1; Addr1)
            {
            }
            column(Addr2; Addr2)
            {
            }
            column(Email; Email)
            {
            }
            column(DateFilter; GETFILTER("Casual Requisition Lines"."Date Filter"))
            {
            }
            column(userid; USERID)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Name := "Casual Requisition Lines"."First Name" + ' ' + "Casual Requisition Lines"."Middle Name" + ' ' + "Casual Requisition Lines"."Last Name";
                "Casual Requisition Lines".CALCFIELDS("Casual Requisition Lines"."Cost Center");
                DimValue.RESET;
                DimValue.SETRANGE(DimValue.Code, "Casual Requisition Lines"."Cost Center");
                IF DimValue.FIND('-') THEN
                    CostCenterName := DimValue.Name;
                Num := Num + 1;
                "Casual Requisition Lines".CALCFIELDS("Casual Requisition Lines"."Cost Center");
                Num := 0;
                "Casual Requisition Lines".CALCFIELDS("Casual Requisition Lines".Status);
            end;

            trigger OnPreDataItem()
            begin
                IF companyinfo.GET() THEN
                    companyinfo.CALCFIELDS(companyinfo.Picture);
                CompName := companyinfo.Name;
                Addr1 := companyinfo.Address;
                Addr2 := companyinfo.City;
                Email := companyinfo."E-Mail";
                "Casual Requisition Lines".CALCFIELDS("Casual Requisition Lines"."Cost Center");

                IF "Casual Requisition Lines".GETFILTER("Casual Requisition Lines"."Date Filter") <> '' THEN
                    "Casual Requisition Lines".SETFILTER("Casual Requisition Lines"."Requisition Date", GETFILTER("Casual Requisition Lines"."Date Filter"));
                Num := 0;
                "Casual Requisition Lines".CALCFIELDS("Casual Requisition Lines".Status);
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

    var
        Name: Text[100];
        DimValue: Record 349;
        CostCenterName: Text[100];
        Num: Integer;
        companyinfo: Record 79;
        CompName: Text[100];
        Addr1: Text[100];
        Addr2: Text[100];
        Email: Text[100];
}


