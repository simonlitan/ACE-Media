xmlport 50026 "Salary Card Import"
{
    Direction = Both;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = UTF16;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {
            tableelement(Scard; "HRM-Employee C")
            {
                fieldattribute(No; Scard."No.")
                {
                    Occurrence = Required;
                }
                fieldattribute(Fname; Scard."First Name")
                {
                    Occurrence = Optional;
                }
                fieldattribute(Mname; Scard."Middle Name")
                {
                    Occurrence = Optional;
                }
                fieldattribute(Lname; Scard."Last Name")
                {
                    Occurrence = Optional;
                }
                fieldattribute(Initials; Scard.Initials)
                {
                    Occurrence = Optional;
                }
                fieldattribute(Id; Scard."ID Number")
                {
                    Occurrence = Optional;
                }
                fieldattribute(Gender; Scard.Gender)
                {
                    Occurrence = Optional;
                }
                fieldattribute(Status; Scard.Status)
                {
                    Occurrence = Optional;
                }
                fieldattribute(Dept; Scard."Department Code")
                {
                    Occurrence = Optional;
                }
                fieldattribute(Title; Scard.Title)
                {
                    Occurrence = Optional;
                }
                fieldattribute(Disability; Scard.Disabled)
                {
                    Occurrence = Optional;
                }
                fieldattribute(DOB; Scard."Date Of Birth")
                {
                    Occurrence = Optional;
                }
                fieldattribute(DOJ; Scard."Date Of Join")
                {
                    Occurrence = Optional;
                }
                fieldattribute(Pin; Scard."PIN Number")
                {
                    Occurrence = Optional;
                }
                fieldattribute(NSSF; Scard."NSSF No.")
                {
                    Occurrence = Optional;
                }
                fieldattribute(NHIF; Scard."NHIF No.")
                {
                    Occurrence = Optional;
                }
                fieldattribute(tribe; Scard.Tribe)
                {
                    Occurrence = Optional;
                }
                fieldattribute(Job; Scard."Job Title")
                {
                    Occurrence = Optional;
                }
                fieldattribute(PGroup; Scard."Posting Group")
                {
                    Occurrence = Optional;
                }
                fieldattribute(Grade; Scard."Grade Level")
                {
                    Occurrence = Optional;
                }
                fieldattribute(Bank; Scard."Main Bank")
                {
                    Occurrence = Optional;
                }
                fieldattribute(Branch; Scard."Branch Bank")
                {
                    Occurrence = Optional;
                }
                fieldattribute(Account; Scard."Bank Account Number")
                {
                    Occurrence = Optional;
                }


            }
        }
    }
}