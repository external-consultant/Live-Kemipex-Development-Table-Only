tableextension 50031 "TableExt 6650 RetShiptHead" extends "Return Shipment Header"
{
    fields
    {
        //T12141-NS

        field(50000; "Due Date Calculation Type"; Enum "Due Date Calculation Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Due Date Calculation Type';
        }
        field(50001; "Bill of Lading Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill of Lading Date';
        }
        field(50002; "Delivery Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Delivery Date';
        }
        field(50003; "QC Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'QC Date';
        }
        field(50004; "Document Submission Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Document Submission Date';
        }
        //T12141-NE

        //T12141-NS
        field(50055; "Vehicle No_New"; Code[10])
        {
            Caption = 'Vehicle No';
            DataClassification = ToBeClassified;
        }
        field(50056; "Container Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50057; "Container Seal No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50058; "Container Plat No."; Code[20])
        {
            DataClassification = ToBeClassified;
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