//T12114-NS
tableextension 50023 "Table Ext 99000771" extends "Production BOM Header"
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