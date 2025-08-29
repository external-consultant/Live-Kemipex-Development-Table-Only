tableextension 50037 "TableExt 271 BankAccLedEnt" extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50000; "Bank Transaction No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bank Transaction No.';
            Description = 'T12141';
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

}