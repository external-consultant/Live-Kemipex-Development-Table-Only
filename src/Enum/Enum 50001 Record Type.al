//T12141-NS
enum 50001 "Record Type"
{
    Extensible = true;

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Customer)
    {
        Caption = 'Customer';
    }
    value(2; Vendor)
    {
        Caption = 'Vendor';
    }
    value(3; Item)
    {
        Caption = 'Item';
    }
    value(4; "Sales Document")
    {
        Caption = 'Sales Document';
    }
    value(5; "Purchase Document")
    {
        Caption = 'Purchase Document';
    }
    value(6; "Transfer Document")
    {
        Caption = 'Transfer Document';
    }
    value(7; "Service Document")
    {
        Caption = 'Service Document';
    }
}
//T12141-NE
