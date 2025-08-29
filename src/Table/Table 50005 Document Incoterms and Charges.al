// // T12141-NS
// table 50005 "Document Incoterms and Charges"  //T12937-as per UAT need to close
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Transaction Type"; Option)
//         {
//             Caption = 'Transaction Type';
//             OptionMembers = " ",Sale,Purchase;
//             OptionCaption = ' ,Sales,Purchase';
//         }
//         field(2; "Document Type"; Enum "Purchase Document Type")
//         {
//             Caption = 'Document Type';
//         }
//         field(3; "Document No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Document No.';

//         }
//         field(4; "Inco Term Code"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Shipment Method";
//             Caption = 'Inco Term Code';
//         }
//         // field(5; "Starting Date"; Date)
//         // {
//         //     DataClassification = ToBeClassified;
//         //     Caption = 'Starting Date';
//         // }
//         field(6; "Vendor No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Vendor;
//             Caption = 'Vendor No.';
//             trigger OnValidate()
//             var
//                 Vend_lRec: Record Vendor;
//             begin
//                 if Vend_lRec.Get(Rec."Vendor No.") then
//                     Rec."Vendor Name" := Vend_lRec.Name
//                 else
//                     Rec."Vendor Name" := '';
//             end;
//         }
//         field(7; "Vendor Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Vendor Name';
//         }
//         field(8; "Location Code"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Location;
//             Caption = 'Location Code';
//         }
//         field(9; "Charge Item"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Item Charge";
//             Caption = 'Charge Item';
//         }
//         field(10; "Expected Charge Amount"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Expected Charge Amount';
//         }
//     }

//     keys
//     {
//         // key(PK; "Inco Term Code", "Vendor No.", "Location Code", "Charge Item", "Starting Date")
//         // {
//         //     Clustered = true;
//         // }
//         key(PK; "Transaction Type", "Document Type", "Document No.", "Charge Item")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//         // Add changes to field groups here
//     }

//     var
//         myInt: Integer;

//     trigger OnInsert()
//     begin

//     end;

//     trigger OnModify()
//     begin

//     end;

//     trigger OnDelete()
//     begin

//     end;

//     trigger OnRename()
//     begin

//     end;

// }
// // T12141-NE
