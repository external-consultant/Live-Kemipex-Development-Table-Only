tableextension 50028 "TableExt 38 PurchHead" extends "Purchase Header"
{
    fields
    {
        //T12141-NS

        // field(50000; "Due Date Calculation Type"; Enum "Due Date Calculation Type")
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Due Date Calculation Type';
        //     trigger OnValidate()
        //     begin
        //         if Rec."Due Date Calculation Type" <> Rec."Due Date Calculation Type"::" " then begin
        //             if Rec."Due Date Calculation Type" = Rec."Due Date Calculation Type"::"BL Date" then
        //                 Rec.Validate(Rec."Bill of Lading Date");
        //             if Rec."Due Date Calculation Type" = Rec."Due Date Calculation Type"::"Delivery Date" then
        //                 Rec.Validate(Rec."Delivery Date");
        //             if Rec."Due Date Calculation Type" = Rec."Due Date Calculation Type"::"Document Submission Date" then
        //                 Rec.Validate(Rec."Document Submission Date");
        //             if Rec."Due Date Calculation Type" = Rec."Due Date Calculation Type"::"QC Date" then
        //                 Rec.Validate(Rec."QC Date");
        //         end else
        //             Rec.Validate("Document Date");
        //     end;
        // }
        // field(50001; "Bill of Lading Date"; Date)
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Bill of Lading Date';
        //     trigger OnValidate()
        //     begin
        //         if Rec."Due Date Calculation Type" = Rec."Due Date Calculation Type"::"BL Date" then
        //             if Rec."Bill of Lading Date" <> 0D then
        //                 if PaymentTerm_gRec.Get(Rec."Payment Terms Code") then
        //                     Rec.Validate("Due Date", CalcDate('<' + Format(PaymentTerm_gRec."Due Date Calculation") + '>', Rec."Bill of Lading Date"));
        //     end;
        // }
        // field(50002; "Delivery Date"; Date)
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Delivery Date';
        //     trigger OnValidate()
        //     begin
        //         if Rec."Due Date Calculation Type" = Rec."Due Date Calculation Type"::"Delivery Date" then
        //             if Rec."Delivery Date" <> 0D then
        //                 if PaymentTerm_gRec.Get(Rec."Payment Terms Code") then
        //                     Rec.Validate("Due Date", CalcDate('<' + Format(PaymentTerm_gRec."Due Date Calculation") + '>', Rec."Delivery Date"));
        //     end;
        // }
        // field(50003; "QC Date"; Date)
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'QC Date';
        //     trigger OnValidate()
        //     begin
        //         if Rec."Due Date Calculation Type" = Rec."Due Date Calculation Type"::"QC Date" then
        //             if Rec."QC Date" <> 0D then
        //                 if PaymentTerm_gRec.Get(Rec."Payment Terms Code") then
        //                     Rec.Validate("Due Date", CalcDate('<' + Format(PaymentTerm_gRec."Due Date Calculation") + '>', Rec."QC Date"));
        //     end;
        // }
        // field(50004; "Document Submission Date"; Date)
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Document Submission Date';
        //     trigger OnValidate()
        //     begin
        //         if Rec."Due Date Calculation Type" = Rec."Due Date Calculation Type"::"Document Submission Date" then
        //             if Rec."Document Submission Date" <> 0D then
        //                 if PaymentTerm_gRec.Get(Rec."Payment Terms Code") then
        //                     Rec.Validate("Due Date", CalcDate('<' + Format(PaymentTerm_gRec."Due Date Calculation") + '>', Rec."Document Submission Date"));
        //     end;
        // }
        // field(50005; "Incoterm Charges Amount"; Decimal) //T12937-as per UAT need to close
        // {
        //     Caption = 'Incoterm Charges Amount';
        //     FieldClass = FlowField;
        //     CalcFormula = sum("Document Incoterms and Charges"."Expected Charge Amount" where("Transaction Type" = const(Purchase), "Document Type" = field("Document type"), "Document No." = field("No.")));
        // }
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
        field(50059; "Location Change Remarks"; text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'T12436';
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

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }


    var
        PaymentTerm_gRec: Record "Payment Terms";
}