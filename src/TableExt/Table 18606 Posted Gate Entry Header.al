tableextension 50046 tblExtPostedGateEntryHdr extends "Posted Gate Entry Header"//T12436-N
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