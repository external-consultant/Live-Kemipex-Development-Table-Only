//T12114-NS
table 50001 "Old Data Master"
{
    Caption = 'Old Data Master';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Old Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Old Item No.';
        }
        field(2; "Old Variant No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Old Variant No.';
        }
        field(3; "New Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'New Item No.';
            TableRelation = Item;
        }
        field(4; "New Variant No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'New Variant No.';
            TableRelation = "Item Variant".code where("Item No." = field("New Item No."));
        }
        field(5; "Old Item Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Old Item Description';
        }
        field(6; "New Item Description"; Text[100])
        {
            Caption = 'New Item Description';
            CalcFormula = lookup(Item.Description where("No." = field("New Item No.")));
            FieldClass = FlowField;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Old Item No.", "Old Variant No.", "New Item No.", "New Variant No.")
        {
            Clustered = true;
        }
    }
}
//T12114-NE