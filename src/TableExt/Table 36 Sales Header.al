//T12068-NS
tableextension 50002 "TableExt 36 Sales Header" extends "Sales Header"
{
    fields
    {
        //T13399-OS
        // field(50000; BDM; Code[10])
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'BDM';
        //     TableRelation = "Salesperson/Purchaser";
        //     trigger OnValidate()
        //     var
        //         SalesLine_lRec: Record "Sales Line";
        //     begin
        //         SalesLine_lRec.Reset();
        //         SalesLine_lRec.SetRange("Document Type", Rec."Document Type");
        //         SalesLine_lRec.SetRange("Document No.", Rec."No.");
        //         if SalesLine_lRec.FindSet() then
        //             repeat
        //                 SalesLine_lRec.BDM := Rec.BDM;
        //                 SalesLine_lRec.Modify();
        //             until SalesLine_lRec.Next() = 0;
        //     end;
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
        //12475-NS
        field(60110; "Last Location Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Location Category';
            TableRelation = "Location Category";
        }
        field(60111; "Location Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Location Category';
            TableRelation = "Location Category";
        }
        //12475-NE
    }


}
//T12068-NE