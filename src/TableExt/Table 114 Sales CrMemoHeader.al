//T12068-NS
tableextension 50006 "TableExt 114 SalesCrMemoHeader" extends "Sales Cr.Memo Header"
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
    // myInt: Integer;
}
//T12068-NE