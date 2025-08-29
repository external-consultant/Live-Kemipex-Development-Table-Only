//T12068-NS
tableextension 50000 "TableExt User Setup 91" extends "User Setup"
{
    fields
    {
        field(50000; "Allow to Reserve"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Allow to Reserve';
        }
        field(60001; "Linked SalesPersons"; Code[500])
        {
            DataClassification = ToBeClassified;
            Caption = 'Linked SalesPersons';
        }
        field(50002; "Allow to view Item No.2"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Allow to view Item No.2';
            Description = '//T12114-N';
        }
        field(50003; "Allow to view Item Sub"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Allow to view Item Substitution';
            Description = '//T12114-N';
        }
        field(50004; "Allow to View R&D Also"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Allow to View R&D Also';
            Description = 'T12113';
        }
        field(50005; "Out of Office"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Out of Office';
            Description = 'T12141';
            trigger OnValidate()
            var
            begin
                if "Out of Office" then begin
                    Rec.TestField(Substitute);
                    CheckOutofOffice(Rec);
                end;
            end;
        }
        field(50006; "Allow view Hidden Product Code"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Allow view Hidden Product Code';
            Description = 'T13396';
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

    procedure CheckOutofOffice(CurreRecord: Record "User Setup")
    var
        UserSetup_lRec: Record "User Setup";
        SubstitureUserID: Code[50];
    begin
        if CurreRecord.Substitute = Rec."User ID" then Error('Out of Office validation running in loop. Please set atleast one user who is not out of office in the Substitute loop.');
        UserSetup_lRec.Reset();
        UserSetup_lRec.Get(CurreRecord.Substitute);
        if UserSetup_lRec."Out of Office" then
            CheckOutofOffice(UserSetup_lRec)
        else
            exit;

    end;

    var
}
//T12068-NE