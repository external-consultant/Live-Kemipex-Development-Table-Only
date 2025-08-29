table 50004 "Transfer Price List"
{
    Caption = 'Transfer Price List';
    DataClassification = ToBeClassified;

    fields
    {
        field(110; "Entry No."; Integer)
        {

        }
        field(1; "Type Of Transaction"; Option)
        {
            Caption = 'Type Of Transaction';
            OptionMembers = " ",Sales,Purchase;
            OptionCaption = ' ,Sales,Purchase';

        }
        field(2; "IC Partner Code"; Code[20])
        {
            Caption = 'Inter Company Partner Code';

            trigger OnLookup()
            var
                Customer_lRec: Record Customer;
                Vendor_lRec: Record Vendor;
            begin
                IF Rec."Type Of Transaction" = Rec."Type Of Transaction"::Sales then begin
                    Customer_lRec.Reset();
                    Customer_lRec.SetRange("IC Partner Code", Rec."IC Partner Code");
                    Customer_lRec.SetFilter("IC Partner Code", '<>%1', '');
                    If Customer_lRec.FindFirst() then begin
                        If Page.RunModal(Page::"Customer List", Customer_lRec) = Action::LookupOK then begin
                            Rec."IC Partner Code" := Customer_lRec."IC Partner Code";
                            Rec."Currency Code" := Customer_lRec."Currency Code";
                        end;
                    end;
                end else if Rec."Type Of Transaction" = Rec."Type Of Transaction"::Purchase then begin
                    Vendor_lRec.Reset();
                    Vendor_lRec.SetRange("IC Partner Code", Rec."IC Partner Code");
                    Vendor_lRec.SetFilter("IC Partner Code", '<>%1', '');
                    If Vendor_lRec.FindFirst() then begin
                        If Page.RunModal(Page::"Vendor List", Vendor_lRec) = Action::LookupOK then begin
                            Rec."IC Partner Code" := Vendor_lRec."IC Partner Code";
                            Rec."Currency Code" := Vendor_lRec."Currency Code";
                        end;
                    end;
                end;
            end;
        }
        field(30; "Starting Date"; Date)
        {
            Caption = 'Starting Date';

            trigger OnValidate()
            var
                myInt: Integer;
                Text000: Label '%1 cannot be after %2';
            begin
                if "Starting Date" = xRec."Starting Date" then
                    exit;

                if ("Starting Date" > "Ending Date") and ("Ending Date" <> 0D) then
                    Error(Text000, FieldCaption("Starting Date"), FieldCaption("Ending Date"));
                //DateVerify();

            end;


        }
        field(40; "Ending Date"; Date)
        {
            Caption = 'Ending Date';


            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "Ending Date" = xRec."Ending Date" then
                    exit;
                Validate("Starting Date");


                // DateVerify();


            end;
        }
        field(50; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                // DateVerify();
            end;
        }
        field(60; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code where("Item No." = field("Item No."));

            // trigger OnValidate()
            // var
            //     myInt: Integer;
            // begin
            //     DateVerify();
            // end;
        }
        field(70; "Unit of Measure"; Code[10])
        {
            Caption = 'Unit of Measure';
            TableRelation = "Unit of Measure";

            // trigger OnValidate()
            // var
            //     myInt: Integer;
            // begin
            //     DateVerify();
            // end;
        }
        field(80; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
            Editable = false;
        }
        field(90; Price; Decimal)
        {
            Caption = 'Price';
            BlankZero = true;
            MinValue = 0;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                // If Rec.Price <> 0 then
                //     "Margin %" := 0;

                If Rec."Margin %" <> 0 then
                    Error('Margin % must be blank');
            end;
        }
        field(100; "Margin %"; Decimal)
        {
            Caption = 'Margin %';
            BlankZero = true;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                // If REc."Margin %" <> 0 then
                //     Rec.Price := 0;

                If Rec.Price <> 0 then
                    Error('Price must be blank');
            end;
        }


    }
    keys
    {
        key(PK; "Entry No.")//"Type Of Transaction", "IC Partner Code", "Starting Date", "Item No.", "Variant Code", "Unit of Measure", "Currency Code")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        TranferPriceLine_lrec: Record "Transfer Price List";
    begin
        DateVerify();
        TranferPriceLine_lrec.Reset();
        if TranferPriceLine_lrec.FindLast() then
            "Entry No." := TranferPriceLine_lrec."Entry No." + 1
        else
            "Entry No." := 1;
    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        DateVerify();
    end;

    procedure DateVerify()
    var
        TransferPriceList: Record "Transfer Price List";
    begin
        TransferPriceList.Reset();
        TransferPriceList.SetRange(TransferPriceList."Type Of Transaction", Rec."Type Of Transaction");
        TransferPriceList.SetRange("IC Partner Code", Rec."IC Partner Code");
        TransferPriceList.SetRange("Item No.", Rec."Item No.");
        TransferPriceList.SetRange("Variant Code", Rec."Variant Code");
        TransferPriceList.SetRange("Unit of Measure", Rec."Unit of Measure");
        TransferPriceList.SetRange("Currency Code", Rec."Currency Code");
        TransferPriceList.SetFilter("Entry No.", '<>%1', Rec."Entry No.");
        If TransferPriceList.FindSet() then
            repeat
                if ((Rec."Starting Date" < TransferPriceList."Starting Date") and (Rec."Ending Date" < TransferPriceList."Starting Date"))
                or ((Rec."Starting Date" > TransferPriceList."Ending Date") and (Rec."Ending Date" > TransferPriceList."Ending Date")) then begin
                end else
                    Error('Your selected time slot is already use for other line');
            until TransferPriceList.Next() = 0;
    end;
}