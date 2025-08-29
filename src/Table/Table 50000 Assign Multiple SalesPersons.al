//T12068-NS
table 50000 "Assign Multiple SalesPersons"
{
    DataClassification = ToBeClassified;
    Caption = 'Assign Multiple SalesPerson';

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
            Caption = 'Customer No.';
        }
        field(2; "SalesPerson Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
            Caption = 'SalesPerson Code';
            NotBlank = true;
        }
        field(3; "SalesPerson Name"; Text[50])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Salesperson/Purchaser".Name where(Code = field("SalesPerson Code")));
            Caption = 'SalesPerson Name';
        }
    }

    keys
    {
        key(PK; "Customer No.", "Salesperson Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
    // myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
//T12068-NE