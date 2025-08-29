tableextension 50036 "TableExt 17 GL Entry" extends "G/L Entry"
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