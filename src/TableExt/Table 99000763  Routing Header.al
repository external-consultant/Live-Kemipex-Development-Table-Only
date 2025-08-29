//T12114-NS
tableextension 50024 "Table Ext 99000763" extends "Routing Header"
{
    fields
    {
        field(50000; "R&D"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'R&D';
            Description = 'T12113';
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
//T12114-NE