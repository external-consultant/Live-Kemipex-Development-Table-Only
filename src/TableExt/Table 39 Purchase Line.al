//TAnoop-NS
tableextension 50050 "TableExt 39 Purchase Line" extends "Purchase Line"
{
    fields
    {
        field(71000; "Demand Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(71001; "Source Document No._Planning"; Code[20])
        {
            Caption = 'Source Document No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(71002; "Source Document Line No._Planning"; Integer)
        {
            Caption = 'Source Document Line No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(71003; "Days To Extend"; DateFormula)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(71004; "Reference Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        //12475-NS
        field(60110; "Last Location Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Location Category';
            TableRelation = "Location Category";
        }
        field(60111; "Location Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Location Category';
            TableRelation = "Location Category";
        }
        //12475-NE
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
    // myInt: Integer;
}
//TAnoop-NE