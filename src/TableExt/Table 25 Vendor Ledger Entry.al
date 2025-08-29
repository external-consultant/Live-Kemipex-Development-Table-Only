tableextension 50029 VendorLedEntry_T50027 extends "Vendor Ledger Entry"
{
    fields
    {
        //T12141-NS
        field(50000; "MSME Tag"; Boolean)
        {
            Caption = 'MSME Tag';
            DataClassification = ToBeClassified;
        }

        field(50001; "Copy Line Description"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        //T12141-NE

    }
}
