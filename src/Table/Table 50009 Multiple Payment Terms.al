table 50009 "Multiple Payment Terms"
{
    //T12539-N
    Caption = 'Multiple Payment Terms';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            Editable = false;
        }
        field(2; "Document Type"; enum "Sales Document Type")
        {
            Caption = 'Document Type';
            Editable = false;
            //  OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Posted Sales Invoice,Posted Sales Cr. Memo,Posted Purchase Invoice,Posted Purchase Cr. Memo';
            // OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Posted Sales Invoice","Posted Sales Cr. Memo","Posted Purchase Invoice","Posted Purchase Cr. Memo";
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

                if (Format(Rec."Due Date Calculation") <> '') AND ("Event Date" <> 0D) then begin
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

            trigger OnValidate()
            var
                MultiplePaymentTerms_lRec: Record "Multiple Payment Terms";
                Percentage_lDec: Decimal;
            begin
                if "Table ID" = 36 then begin
                    SalesHeader_gRec.Get("Document Type", "Document No.");
                    SalesHeader_gRec.CalcFields("Amount Including VAT");
                    //CheckPercentange_gFnc("Percentage of Total");
                    CheckPercentange_gFnc("Percentage of Total");

                    "Amount of Document" := (GetNetAmount() * "Percentage of Total") / 100;
                end else
                    if "Table ID" = 38 then begin
                        PurchaseHeader_gRec.Get("Document Type", "Document No.");
                        PurchaseHeader_gRec.CalcFields("Amount Including VAT");
                        CheckPercentange_gFnc("Percentage of Total");
                        "Amount of Document" := (GetPurNetAmount() * "Percentage of Total") / 100;
                    end;
            end;
        }
        field(80; "Amount of Document"; Decimal)
        {
            Caption = 'Amount of Document';
            Editable = false;

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
            Editable = false;
        }
        field(140; Posted; Boolean)
        {
            Caption = 'Posted';
            Editable = false;

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

    trigger OnInsert()
    var
        MultiplePmtTerms_lRec: Record "Multiple Payment Terms";
    begin
        MultiplePmtTerms_lRec.Reset();
        MultiplePmtTerms_lRec.SetRange("Document No.", Rec."Document No.");
        MultiplePmtTerms_lRec.SetRange(Type, Rec.Type);
        MultiplePmtTerms_lRec.SetRange("Document Type", Rec."Document Type");
        IF MultiplePmtTerms_lRec.FindLast() then begin
            Rec."Line No." := MultiplePmtTerms_lRec."Line No." + 10000;
            Rec.Sequence := MultiplePmtTerms_lRec.Sequence + 1
        end else begin
            Rec."Line No." := 10000;
            Rec.Sequence := 1;
        end;
    end;



    procedure CheckAmount_lFnc(Text_iTxt: Text[10]; Amount_iDec: Decimal)
    var
        MultiplePaymentTerms_lRec: Record "Multiple Payment Terms";
        Amount_lDec: Decimal;
        Diff_lDec: Decimal;
    begin

        Amount_lDec := Amount_iDec;

        if Text_iTxt = 'Sales' then begin
            MultiplePaymentTerms_lRec.Reset;
            MultiplePaymentTerms_lRec.SetRange("Table ID", Rec."Table ID");
            MultiplePaymentTerms_lRec.SetRange("Document No.", Rec."Document No.");
            MultiplePaymentTerms_lRec.SetRange("Document Type", Rec."Document Type");
            MultiplePaymentTerms_lRec.SetRange(Type, Rec.Type);
            if MultiplePaymentTerms_lRec.FindSet then begin
                repeat
                    if MultiplePaymentTerms_lRec."Line No." <> "Line No." then
                        Amount_lDec += MultiplePaymentTerms_lRec."Amount of Document";
                until MultiplePaymentTerms_lRec.Next = 0;
                SalesHeader_gRec.Get("Document Type", "Document No.");
                SalesHeader_gRec.CalcFields("Amount Including VAT");
                Diff_lDec := Abs(Amount_lDec) - Abs(GetNetAmount());
                if Abs(Diff_lDec) > 1 then
                    Error('Multiple Payment term Amount %1 is GreaterThan Amount to Customer %2 in Sales Document No %3', Abs(Amount_lDec), Abs(GetNetAmount()), SalesHeader_gRec."No.");
            end;
        end else
            if Text_iTxt = 'Purchase' then begin
                MultiplePaymentTerms_lRec.Reset;
                MultiplePaymentTerms_lRec.SetRange("Table ID", Rec."Table ID");
                MultiplePaymentTerms_lRec.SetRange("Document No.", Rec."Document No.");
                MultiplePaymentTerms_lRec.SetRange("Document Type", Rec."Document Type");
                if MultiplePaymentTerms_lRec.FindSet then begin
                    repeat
                        if MultiplePaymentTerms_lRec."Line No." <> "Line No." then
                            Amount_lDec += MultiplePaymentTerms_lRec."Amount of Document";
                    until MultiplePaymentTerms_lRec.Next = 0;
                    PurchaseHeader_gRec.Get("Document Type", "Document No.");
                    PurchaseHeader_gRec.CalcFields("Amount Including VAT");
                    Diff_lDec := Abs(Amount_lDec) - Abs(GetPurNetAmount());
                    if Abs(Diff_lDec) > 1 then
                        Error('Multiple Payment term Amount %1 is GreaterThan Amount to Vendor %2 in Purchase Document No %3', Abs(Amount_lDec), Abs(GetPurNetAmount()), PurchaseHeader_gRec."No.");

                end;
            end;
    end;

    procedure CheckPercentange_gFnc()
    var
        MultiplePaymentTerms_lRec: Record "Multiple Payment Terms";
        Percentage_lDec: Decimal;
    begin
        Percentage_lDec := 0;

        MultiplePaymentTerms_lRec.Reset;
        MultiplePaymentTerms_lRec.SetRange("Table ID", Rec."Table ID");
        MultiplePaymentTerms_lRec.SetRange("Document No.", Rec."Document No.");
        MultiplePaymentTerms_lRec.SetRange("Document Type", Rec."Document Type");
        MultiplePaymentTerms_lRec.SetRange(Type, Rec.Type);
        if MultiplePaymentTerms_lRec.FindSet then begin
            repeat
                Percentage_lDec += MultiplePaymentTerms_lRec."Percentage of Total";
            until MultiplePaymentTerms_lRec.Next = 0;
        end;

        if Percentage_lDec > 100 then
            Error('Percentage of Document Amount is Greaterthan 100 No is %1', MultiplePaymentTerms_lRec."Document No.");
    end;

    procedure CheckPercentange_gFnc(CheckAmount: Decimal)
    var
        MultiplePaymentTerms_lRec: Record "Multiple Payment Terms";
        Percentage_lDec: Decimal;
    begin
        Percentage_lDec := 0;
        Percentage_lDec := CheckAmount;

        MultiplePaymentTerms_lRec.Reset;
        MultiplePaymentTerms_lRec.SetRange("Table ID", Rec."Table ID");
        MultiplePaymentTerms_lRec.SetRange("Document No.", Rec."Document No.");
        MultiplePaymentTerms_lRec.SetRange("Document Type", Rec."Document Type");
        MultiplePaymentTerms_lRec.SetRange(Type, Rec.Type);
        if MultiplePaymentTerms_lRec.FindSet then begin
            repeat
                If MultiplePaymentTerms_lRec."Line No." <> Rec."Line No." then
                    Percentage_lDec += MultiplePaymentTerms_lRec."Percentage of Total";
            until MultiplePaymentTerms_lRec.Next = 0;
        end;

        if Percentage_lDec > 100 then
            Error('Percentage of Document Amount is Greaterthan 100 No is %1', MultiplePaymentTerms_lRec."Document No.");
    end;

    procedure GetNetAmount(): Decimal
    var
        myInt: Integer;
        CalcStatistics: Codeunit "Calculate Statistics";
        TotalInclTaxAmount: Decimal;
        salesHeader_lRec: Record "Sales Header";
        SalesandReceivableSetup_lRec: Record "Sales & Receivables Setup";
        Currency_lRec: Record Currency;
    begin
        //15102024 Old-NS
        // salesHeader_lRec.Reset();
        // if salesHeader_lRec.GET(Rec."Document Type", Rec."Document No.") then
        //     CalcStatistics.GetSalesStatisticsAmount(salesHeader_lRec, TotalInclTaxAmount);
        // SalesandReceivableSetup_lRec.Get();
        // Currency_lRec.Reset();
        // Currency_lRec.Initialize(salesHeader_lRec."Currency Code");
        // if SalesandReceivableSetup_lRec."Invoice Rounding" then
        //     TotalInclTaxAmount := Round(TotalInclTaxAmount, Currency_lRec."Invoice Rounding Precision", Currency_lRec.InvoiceRoundingDirection());
        //15102024 Old-NE
        //15102024 NS
        salesHeader_lRec.Reset();
        if salesHeader_lRec.GET(Rec."Document Type", Rec."Document No.") then
            if salesHeader_lRec."VAT Bus. Posting Group" <> '' then
                TotalInclTaxAmount := GetSalesVatAmount_gFnc(salesHeader_lRec)
            else
                CalcStatistics.GetSalesStatisticsAmount(salesHeader_lRec, TotalInclTaxAmount);
        SalesandReceivableSetup_lRec.Get();
        Currency_lRec.Reset();
        Currency_lRec.Initialize(salesHeader_lRec."Currency Code");
        if SalesandReceivableSetup_lRec."Invoice Rounding" then
            TotalInclTaxAmount := Round(TotalInclTaxAmount, Currency_lRec."Invoice Rounding Precision", Currency_lRec.InvoiceRoundingDirection());
        exit(TotalInclTaxAmount);
        //15102024 NE
    end;


    procedure GetPurNetAmount(): Decimal
    var
        myInt: Integer;
        CalcStatistics: Codeunit "Calculate Statistics";
        TotalInclTaxAmount: Decimal;
        PurchaseHeader_lRec: Record "Purchase Header";
        PurchaseandPayableSetup_lRec: Record "Purchases & Payables Setup";
        Currency_lRec: Record Currency;
    begin
        //15102024 Old-NS
        // PurchaseHeader_lRec.Reset();
        // if PurchaseHeader_lRec.GET(Rec."Document Type", Rec."Document No.") then
        //     CalcStatistics.GetPurchaseStatisticsAmount(PurchaseHeader_lRec, TotalInclTaxAmount);
        // Currency_lRec.Reset();
        // Currency_lRec.Initialize(PurchaseHeader_lRec."Currency Code");
        // PurchaseandPayableSetup_lRec.Get();
        // If PurchaseandPayableSetup_lRec."Invoice Rounding" then
        //     TotalInclTaxAmount := Round(TotalInclTaxAmount, Currency_lRec."Invoice Rounding Precision", Currency_lRec.InvoiceRoundingDirection());
        // exit(TotalInclTaxAmount);
        //15102024 Old-NE

        //15102024-NS
        PurchaseHeader_lRec.Reset();
        if PurchaseHeader_lRec.GET(Rec."Document Type", Rec."Document No.") then
            if PurchaseHeader_lRec."VAT Bus. Posting Group" <> '' then
                TotalInclTaxAmount := GetPurchaseVatAmount_gFnc(PurchaseHeader_lRec)
            else
                CalcStatistics.GetPurchaseStatisticsAmount(PurchaseHeader_lRec, TotalInclTaxAmount);
        Currency_lRec.Reset();
        Currency_lRec.Initialize(PurchaseHeader_lRec."Currency Code");
        PurchaseandPayableSetup_lRec.Get();
        If PurchaseandPayableSetup_lRec."Invoice Rounding" then
            TotalInclTaxAmount := Round(TotalInclTaxAmount, Currency_lRec."Invoice Rounding Precision", Currency_lRec.InvoiceRoundingDirection());
        exit(TotalInclTaxAmount);
        //15102024-NE
    end;

    //15102024-NS
    procedure GetSalesVatAmount_gFnc(
        SalesHeader: Record "Sales Header"
    ): Decimal
    var
        SalesLine: Record "Sales Line";
        RecordIDList: List of [RecordID];
        TotalInclVatAmount_lDec: Decimal;
    begin
        Clear(TotalInclVatAmount_lDec);
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document no.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                RecordIDList.Add(SalesLine.RecordId());
                TotalInclVatAmount_lDec += SalesLine."Amount Including VAT";
            until SalesLine.Next() = 0;
        exit(TotalInclVatAmount_lDec);
    end;

    procedure GetPurchaseVatAmount_gFnc(
        PurchHeader: Record "Purchase Header"
    ): Decimal
    var
        PurchLine: Record "Purchase Line";
        RecordIDList: List of [RecordID];
        TotalInclVatAmount_lDec: Decimal;
    begin
        Clear(TotalInclVatAmount_lDec);
        PurchLine.SetRange("Document Type", PurchHeader."Document Type");
        PurchLine.SetRange("Document no.", PurchHeader."No.");
        if PurchLine.FindSet() then
            repeat
                RecordIDList.Add(PurchLine.RecordId());
                TotalInclVatAmount_lDec += PurchLine."Amount Including VAT";
            until PurchLine.Next() = 0;
        exit(TotalInclVatAmount_lDec);
    end;
    //15102024-NE


}
