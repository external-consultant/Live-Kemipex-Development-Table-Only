tableextension 50026 Vendor_T50025 extends Vendor
{
    fields
    {
        //T12141-NS
        field(50000; "MSME Tag"; Boolean)
        {
            Caption = 'MSME Tag';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                If Not "MSME Tag" then
                    Rec."MSME Type" := Rec."MSME Type"::" ";
            end;
        }
        field(50001; "MSME License No."; Code[30])
        {
            Caption = 'MSME License No.';
            DataClassification = ToBeClassified;
        }
        //T12141-NE

        field(50002; "Due Date Calculation Type"; Enum "Due Date Calculation Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Due Date Calculation Type';
            Description = 'T12141';
        }
        //T12141-NS

        //T12539-NS
        field(50003; "MSME Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Micro,Small,Medium;
        }
        //T12539-NE
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
    }
}
