tableextension 50099 GLAccountExt50111 extends "G/L Account"
{
    fields
    {
        //T12539-NS
        field(50000; "Opening Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        //T12539-NE
    }
}