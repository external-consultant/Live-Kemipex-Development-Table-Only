//T12068-NS
tableextension 50007 "TableExt 115 SalesCrMemoLine" extends "Sales Cr.Memo Line"
{
    fields
    {
        //T13399-OS
        // field(50000; BDM; Code[10])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Salesperson/Purchaser";
        //     Caption = 'BDM';
        // }
        //T13399-OE
        field(50001; "SalesPerson Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
            Caption = 'SalesPerson Code';
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
    // myInt: Integer;
}
//T12068-NE