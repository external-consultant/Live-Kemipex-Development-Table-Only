//T12114-NS
tableextension 50015 "Prod. Order 5406" extends "Prod. Order Line"
{
    fields
    {
        field(50000; "Item No. 2"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No. 2';
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
    //T12114-NE
}