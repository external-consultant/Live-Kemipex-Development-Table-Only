tableextension 50025 Employee_T50025 extends Employee
{
    fields
    {
        field(50000; "Job Domain"; Text[50])
        {
            Caption = 'Job Domain';
            DataClassification = ToBeClassified;
        }
        field(50001; "Manager Code"; Code[20])
        {
            Caption = 'Manager Code';
            TableRelation = Employee."No.";
            DataClassification = ToBeClassified;
        }
        field(50002; Team; Code[10])
        {
            Caption = 'Team';
            TableRelation = Team.Code;
            DataClassification = ToBeClassified;
        }
    }
}
