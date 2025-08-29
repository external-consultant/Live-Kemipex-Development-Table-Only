TableExtension 50051 tableextension50051 extends "Manufacturing Setup"
{
    fields
    {

        //T12395-NS
        field(50060; "Additional Prod. Planning"; Boolean)
        {
            Caption = 'Additional Production Planning';
            DataClassification = ToBeClassified;
        }
        field(50061; "Additional Purch. Planning"; Boolean)
        {
            Caption = 'Additional Purchase Planning';
            DataClassification = ToBeClassified;
        }
        //T12395-NE


    }

    // procedure UpdatePath_gFnc(var Path_vTxt: Text[250])
    // begin
    //     if Path_vTxt = '' then
    //         exit;

    //     if CopyStr(Path_vTxt, StrLen(Path_vTxt), 1) <> '\' then
    //         Path_vTxt := Path_vTxt + '\';
    // end;
}

