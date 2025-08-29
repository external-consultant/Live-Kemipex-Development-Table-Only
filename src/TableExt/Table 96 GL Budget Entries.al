tableextension 50039 "TableExt 96 GLBudget Ent" extends "G/L Budget Entry"
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
        field(50002; "Amount in FCY"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount in FCY';
            DecimalPlaces = 0 : 5;
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