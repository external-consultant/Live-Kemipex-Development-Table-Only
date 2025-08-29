tableextension 50047 TblExtLocation extends Location
{
    fields
    {
        field(50000; "Location Category"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Location Category';
            Description = '12436';
            TableRelation = "Location Category";
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