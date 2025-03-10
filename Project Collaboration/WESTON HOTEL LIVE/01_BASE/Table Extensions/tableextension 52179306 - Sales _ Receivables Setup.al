tableextension 52179306 "Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(5000; "Cash Sale Nos."; code[20])
        {

        }
        field(52179300; "Gym Application Nos"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(52179301; "Gym Nos"; code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}