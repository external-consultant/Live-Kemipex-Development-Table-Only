table 50008 "GL & Dimension Reference"
{
    //T12539-N
    Caption = 'GL & Dimension Reference';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(30; "Old GL Account No."; Code[20])
        {
            Caption = 'Old GL Account No.';

            trigger OnValidate()
            begin
                CheckDuplicateData();
            end;
        }
        field(40; "Old GL Name"; Text[250])
        {
            Caption = 'Old GL Name';
            trigger OnValidate()
            begin
                CheckDuplicateData();
            end;
        }
        field(50; "Old Dimension Code"; Code[20])
        {
            Caption = 'Old Dimension Code';
            // TableRelation = Dimension;

            trigger OnValidate()
            begin
                CheckDuplicateData();
            end;
        }
        field(60; "Old Dimension Value"; Code[20])
        {
            Caption = 'Old Dimension Value';
            //TableRelation = "Dimension Value" where("Dimension Code" = field("Old Dimension Code"));

            trigger OnValidate()
            begin
                CheckDuplicateData();
            end;
        }
        field(70; "New GL Account No."; Code[20])
        {
            Caption = 'New GL Account No.';
            TableRelation = "G/L Account";

            trigger OnValidate()
            var
                GLAcc_lRec: Record "G/L Account";
            begin
                GLAcc_lRec.Reset();
                If GLAcc_lRec.GET(REc."New GL Account No.") then
                    REc."New GL Name" := GLAcc_lRec.Name;
            end;
        }
        field(80; "New GL Name"; Text[250])
        {
            Caption = 'New GL Name';
            Editable = false;
        }
        field(90; "New Dimension Code"; Code[20])
        {
            Caption = 'New Dimension Code';
            TableRelation = Dimension;
        }
        field(100; "New Dimension Value"; Code[20])
        {
            Caption = 'New Dimension Value';
            TableRelation = "Dimension Value" where("Dimension Code" = field("New Dimension Code"));
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        GLDimRef_lRec: Record "GL & Dimension Reference";
    begin
        GLDimRef_lRec.Reset();
        IF GLDimRef_lRec.FindLast() then
            Rec."Entry No." := GLDimRef_lRec."Entry No." + 1
        else
            Rec."Entry No." := 1;
    end;

    procedure CheckDuplicateData()
    var
        GLDimRef_lRec: Record "GL & Dimension Reference";
    begin
        IF (REc."Old GL Account No." = '') and (REc."Old Dimension Code" = '') and (Rec."Old Dimension Value" = '') then
            exit;

        GLDimRef_lRec.Reset();
        GLDimRef_lRec.SetRange("Old GL Account No.", Rec."Old GL Account No.");
        GLDimRef_lRec.SetRange("Old Dimension Code", REc."Old Dimension Code");
        GLDimRef_lRec.SetRange("Old Dimension Value", REc."Old Dimension Value");
        IF GLDimRef_lRec.FindFirst() then
            Error('Records already exist for the old GL account with old dimensions');

    end;
}
