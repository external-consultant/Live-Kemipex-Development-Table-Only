tableextension 50045 tblExtGateEntryHdr extends "Gate Entry Header"//T12436-N
{
    fields
    {
        field(50000; "Physical Verfication"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Physical Verification';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}