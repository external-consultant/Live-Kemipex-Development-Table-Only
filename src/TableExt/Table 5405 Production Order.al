//T12114-NS
tableextension 50012 "Prod. Order 5405" extends "Production Order"
{
    fields
    {
        field(50000; "Item No. 2"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No. 2';
        }
        field(50001; "Production BOM Version"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Production BOM Version';
            trigger OnLookup()
            var
                ProdVer_lRec: Record "Production BOM Version";
                ProdVer_lPge: Page "Prod. BOM Version List";
                Item_lRec: Record Item;
            begin
                if Rec."Source Type" = Rec."Source Type"::Item then begin
                    Item_lRec.Get(Rec."Source No.");
                    Item_lRec.TestField("Production BOM No.");
                    ProdVer_lRec.Reset();
                    ProdVer_lRec.SetRange("Production BOM No.", Item_lRec."Production BOM No.");
                    ProdVer_lPge.SetTableView(ProdVer_lRec);
                    ProdVer_lPge.Editable(false);
                    ProdVer_lPge.LookupMode(true);
                    IF ProdVer_lPge.RunModal() = Action::LookupOK then begin
                        ProdVer_lPge.GetRecord(ProdVer_lRec);
                        Rec."Production BOM Version" := ProdVer_lRec."Version Code";
                        IF not REC.Insert() then
                            REC.Modify();
                    end;

                end;
            end;
        }
        field(50002; "Batch Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Caption = 'Batch Quantity';
        }
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
    //T12114-NE
}