//T12068-NS
tableextension 50042 "TableExt 311 Sales&Receivable" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "Reservation Expiry Days"; DateFormula)
        {
            DataClassification = ToBeClassified;
            Caption = 'Reservation Expiry Days';
        }

        //T12115-NS 21-06-2024
        field(50001; "Prepostd CrMemo on Sal Ret Ord"; Boolean)
        {
            Caption = 'Pre-posted Cr. Memo on Sales Ret. Ord.';
            DataClassification = ToBeClassified;
        }
        //T12115-NE 21-06-2024
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
//T12068-NE