tableextension 50021 "Activities Cue Ext" extends "Activities Cue"
{
    fields
    {
        field(50000; "Warehouse Shipments"; Integer)
        {
            Caption = 'Warehouse Shipments';
            // FieldClass = FlowField;
            // CalcFormula = count("Warehouse Shipment Header" where("Assigned User ID" = filter('USERID')));
        }
    }
}
