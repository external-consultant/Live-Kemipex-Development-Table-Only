//T12436-NS
table 50007 "Location Category"
{
    Caption = 'Location Category';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; code; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';

        }
        // field(3; "Financial Impact"; Boolean)
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Financial Impact';

        // }
    }
    keys
    {
        key(PK; code)
        {
            Clustered = true;
        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "code", Description)
        {

        }
    }
}

//T12436-NE