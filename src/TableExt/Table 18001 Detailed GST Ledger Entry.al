tableextension 50098 MyExtension extends "Detailed GST Ledger Entry"
{
    fields
    {
        //T12539-NS
        field(50000; "GST Credit Period Month"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "GST Credit Period Year"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        //T12539-NE
    }
}