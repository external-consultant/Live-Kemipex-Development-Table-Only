tableextension 50010 LotNoInformation_50010 extends "Lot No. Information"
{
    fields
    {
        //T12141-NS
        field(50000; "Vendor Lot No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor Lot No.';
        }
        field(50001; "BOE"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'BOE';
        }
        field(50002; "Customs BOE"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customs BOE';
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
        field(50059; "Bill Of Exit"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        //T12141-NE
    }
}
