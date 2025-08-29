tableextension 50041 "TableExt 374 GLBudgetBuffer" extends "G/L Acc. Budget Buffer"
{
    fields
    {
        field(50000; "Budgeted Amount FCY"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("G/L Budget Entry"."Amount in FCY" where("Budget Name" = field("Budget Filter"),
                                                               "G/L Account No." = field("G/L Account Filter"),
                                                               "Business Unit Code" = field("Business Unit Filter"),
                                                               "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                               "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                               "Budget Dimension 1 Code" = field("Budget Dimension 1 Filter"),
                                                               "Budget Dimension 2 Code" = field("Budget Dimension 2 Filter"),
                                                               "Budget Dimension 3 Code" = field("Budget Dimension 3 Filter"),
                                                               "Budget Dimension 4 Code" = field("Budget Dimension 4 Filter"),
                                                               Date = field("Date Filter")));
            Caption = 'Budgeted Amount FCY';
            FieldClass = FlowField;
            Description = 'T12141';
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
}   