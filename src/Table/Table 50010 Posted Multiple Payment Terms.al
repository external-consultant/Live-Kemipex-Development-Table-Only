table 50010 "Posted Multiple Payment Terms"
{
    //T12539-N
    Caption = 'Posted Multiple Payment Terms';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            Editable = false;
        }
        field(2; "Document Type"; Option)
        {
            Caption = 'Document Type';
            Editable = false;
            // OptionCaption = 'Posted Sales Invoice","Posted Sales Cr. Memo","Posted Sales Shipment","Posted Return Receipt","Posted Purchase Invoice","Posted Purchase Cr. Memo","Posted Return Shipment","Posted Purchase Receipt';
            OptionMembers = "Posted Sales Invoice","Posted Sales Cr. Memo","Posted Sales Shipment","Posted Return Receipt","Posted Purchase Invoice","Posted Purchase Cr. Memo","Posted Return Shipment","Posted Purchase Receipt";
        }
        field(3; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(4; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(20; Type; Option)
        {
            OptionMembers = " ",Sales,Purchase;
            Editable = false;

        }
        field(30; "Event Date"; Date)
        {
            Caption = 'Event Date';
            trigger OnValidate()
            begin
                if Format(Rec."Due Date Calculation") <> '' then begin
                    // TestField("Event Date");
                    "Due Date" := CalcDate("Due Date Calculation", "Event Date");
                end else
                    "Due Date" := 0D;
            end;
        }
        field(40; "Payment Description"; Text[250])
        {
            Caption = 'Payment Description';
        }
        field(50; "Due Date Calculation"; DateFormula)
        {
            Caption = 'Due Date Calculation';

            trigger OnValidate()
            begin
                if Format(Rec."Due Date Calculation") <> '' then begin
                    // TestField("Event Date");
                    "Due Date" := CalcDate("Due Date Calculation", "Event Date");
                end else
                    "Due Date" := 0D;
            end;
        }
        field(60; "Due Date"; Date)
        {
            Caption = 'Due Date';
            Editable = false;
        }
        field(70; "Percentage of Total"; Decimal)
        {
            Caption = 'Percentage of Total';

            MinValue = 0;

        }
        field(80; "Amount of Document"; Decimal)
        {
            Caption = 'Amount of Document';
        }
        field(90; "Remaining Amount"; Decimal)
        {
            Caption = 'Remaining Amount';
        }
        field(100; "Payment Forecast Date"; Date)
        {
            Caption = 'Payment Forecast Date';
        }
        field(110; Sequence; Integer)
        {
            Caption = 'Sequence';
        }
        field(120; Released; Boolean)
        {
            Caption = 'Released';
        }
        field(140; Posted; Boolean)
        {
            Caption = 'Posted';
        }
    }
    keys
    {
        key(PK; "Table ID", "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    var
        SalesHeader_gRec: Record "Sales Header";
        PurchaseHeader_gRec: Record "Purchase Header";
        PaymenTerms_gRec: Record "Payment Terms";
        SeqNo_gInt: Integer;




}
