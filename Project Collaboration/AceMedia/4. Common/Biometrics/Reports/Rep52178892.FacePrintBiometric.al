report 52178892 "FacePrint Biometric"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Biometrics/Reports/SSR/FacePrintBiometric.rdl';

    dataset
    {
        dataitem(biometric; "FacePrint Biometric")
        {
            RequestFilterFields = Date;
            column(no; biometric."No.")
            {
            }
            column(staff; biometric."Staff Number")
            {
            }
            column(fname; biometric."Full Name")
            {
            }
            column(date; FORMAT(biometric.Date))
            {
            }
            column(time; biometric.Time)
            {
            }
            column(timein; FORMAT(timein))
            {
            }
            column(timeout; FORMAT(timeout))
            {
            }
            column(staffname; staffname)
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
            column(dailyHours; dailyHours)
            {
            }

            trigger OnAfterGetRecord()
            begin

                dailyHours := 0;
                bio.RESET;
                bio.SETRANGE("Staff Number", biometric."Staff Number");
                bio.SETRANGE(Date, biometric.Date);
                IF bio.FINDFIRST THEN BEGIN
                    timein := bio.Time;
                END;
                bio.RESET;
                bio.SETRANGE("Staff Number", biometric."Staff Number");
                bio.SETRANGE(Date, biometric.Date);
                IF bio.FINDLAST THEN BEGIN
                    timeout := bio.Time;
                    IF timeout = timein THEN
                        timeout := 0T;

                    IF timeout <> 0T THEN BEGIN
                        CLEAR(dailyHours);
                        dailyHours := ROUND((timeout - timein) / 3600000, 0.2);
                        IF dailyHours < 0 THEN dailyHours := 0;
                        biometric."Daily Hours" := dailyHours;
                        biometric.MODIFY;
                    END;
                END;

                hrmc.RESET;
                hrmc.SETRANGE("No.", biometric."Staff Number");
                IF hrmc.FIND('-') THEN
                    staffname := hrmc."First Name" + ' ' + hrmc."Middle Name" + ' ' + hrmc."Last Name";

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

    var
        hrmc: Record "HRM-Employee C";
        bio: Record "FacePrint Biometric";
        timein: Time;
        timeout: Time;
        staffname: Text;
        info: Record 79;
        dailyHours: Decimal;
}

