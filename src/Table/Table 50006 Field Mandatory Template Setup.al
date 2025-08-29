table 50006 "Field Mand. Templ. Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Field Mandatory Template Setup';
    Description = 'T12141';
    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = EndUserIdentifiableInformation;
            AutoIncrement = true;
        }
        field(2; "Record Type"; Enum "Record Type")
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Record Type';
            trigger OnValidate()
            begin
                case "Record Type" of
                    "Record Type"::Customer:
                        "Table Id" := Database::Customer;
                    "Record Type"::Vendor:
                        "Table Id" := Database::Vendor;
                    "Record Type"::Item:
                        "Table Id" := Database::Item;
                    "Record Type"::"Sales Document":
                        "Table Id" := Database::"Sales Header";
                    "Record Type"::"Purchase Document":
                        "Table Id" := Database::"Purchase Header";
                    "Record Type"::"Transfer Document":
                        "Table Id" := Database::"Transfer Header";
                    "Record Type"::"Service Document":
                        "Table Id" := Database::"Service Header";

                end;
                OnBeforeValidateDocumentType(Rec);
            end;
        }
        field(3; "Table Id"; Integer)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Table Id';
        }
        field(4; Condition; Blob)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Condition';
        }
        field(5; "Config. Template"; Code[10])
        {
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "Config. Template Header" where("Table ID" = field("Table Id"));
            Caption = 'Config. Template';
        }
        field(6; Enabled; Boolean)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Enabled';
        }
    }
    keys
    {
        key(PK; ID, "Record Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

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

    [IntegrationEvent(false, false)]
    procedure OnBeforeValidateDocumentType(var Rec: Record "Field Mand. Templ. Setup");
    begin
    end;
}