//T12068-NS
tableextension 50011 "TableExt 18 Customer" extends Customer
{
    fields
    {
        field(50000; "Associated SalesPerson"; Code[500])
        {
            DataClassification = ToBeClassified;
            Caption = 'Associated SalesPerson';
        }

        //T12141-NS
        field(60100; "First Approval Completed"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'First Approval Completed';
        }
        field(60101; "Workflow Category Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Workflow Category Type';
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
    // myInt: Integer;
}
//T12068-NE