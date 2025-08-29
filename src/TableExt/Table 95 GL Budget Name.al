tableextension 50033 "TableExt 95 GLBudget Name" extends "G/L Budget Name"
{
    fields
    {
        //T12141-NS
        field(50000; "Currency Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
            Caption = 'Currency Code';
        }
        field(50001; "Exchange Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Exchange Rate';
            DecimalPlaces = 0 : 5;
        }
        field(50002; "Show Amount in FCY"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Show Amount in FCY';
        }
        //T12141-NE

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
}