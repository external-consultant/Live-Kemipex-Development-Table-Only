//T12114-NS
table 50002 "Location Routing"
{
    Caption = 'Location Routing';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No.';
            TableRelation = Item;
            Editable = false;
        }
        field(2; Routing; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Routing';
            TableRelation = "Routing Header";
        }
        field(3; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Location Code';
            TableRelation = Location;
        }
    }
    keys
    {
        key(PK; "Location Code", "Item No.")
        {
            Clustered = true;
        }
    }
}
//T12114-NE