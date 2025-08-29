// // T12141-NS
// table 50003 "Incoterms and Charges"  //T12937-as per UAT need to close
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Inco Term Code"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Shipment Method";
//             Caption = 'Inco Term Code';
//         }
//         field(2; "Starting Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Starting Date';
//         }
//         field(3; "Vendor No."; Code[20])
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
//         field(4; "Vendor Name"; Text[80])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Vendor Name';
//         }
//         field(5; "Location Code"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Location;
//             Caption = 'Location Code';
//         }
//         field(6; "Charge Item"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Item Charge";
//             Caption = 'Charge Item';
//         }
//         field(7; "Expected Charge Amount"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Expected Charge Amount';
//         }
//     }

//     keys
//     {
//         key(PK; "Inco Term Code", "Vendor No.", "Location Code", "Charge Item", "Starting Date")
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
