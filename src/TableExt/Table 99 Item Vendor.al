tableextension 50055 ItemVendorExt extends "Item Vendor"
{
    fields
    {
        field(50000; "Hidden Product Code"; Text[100])
        {
            Caption = 'Hidden Product Code';
            DataClassification = ToBeClassified;
            Description = 'T13396';
        }
    }
}
