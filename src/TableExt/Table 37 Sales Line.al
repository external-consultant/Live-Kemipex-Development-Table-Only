//T12068-NS
tableextension 50003 "TableExt 37 Sales Line" extends "Sales Line"
{
    fields
    {
        //T13399-OS
        // field(50000; BDM; Code[10])
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'BDM';
        //     TableRelation = "Salesperson/Purchaser";
        // }
        //T13399-OE
        field(50001; "SalesPerson Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
            Caption = 'SalesPerson Code';
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
//T12068-NE