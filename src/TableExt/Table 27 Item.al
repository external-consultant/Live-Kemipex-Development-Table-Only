tableextension 50022 "TableExt 27 Item" extends Item
{
    fields
    {
        field(50000; "R&D"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'R&D';
            Description = 'T12113';
        }
        //T12141-NS
        field(50200; "First Approval Completed"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'First Approval Completed';
        }
        field(50201; "Workflow Category Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Workflow Category Type';
        }
        //T12141-NE
    }
}