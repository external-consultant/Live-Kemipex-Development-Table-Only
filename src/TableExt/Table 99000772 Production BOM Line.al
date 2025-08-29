//T12114-NS
tableextension 50014 "Table Ext 99000772" extends "Production BOM Line"
{
    fields
    {
        field(50000; "Item No. 2"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No. 2';
        }
        field(50055; Inventory; Decimal) //T12607-N
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No.")));
            Caption = 'Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
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