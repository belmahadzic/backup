table 50052 TempGLE
{
    Caption = 'G/L Entry';
    DrillDownPageID = "General Ledger Entries";
    LookupPageID = "General Ledger Entries";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ClosingDates = true;
        }
        field(5; "Document Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Document Type';

        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';

            trigger OnLookup()
            var
                IncomingDocument: Record "Incoming Document";
            begin
                //Đk  IncomingDocument.HyperlinkToDocument("Document No.","Posting Date");
            end;
        }
        field(7; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(10; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Bal. Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Bal. Account Type" = CONST("IC Partner")) "IC Partner";
        }
        field(17; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(23; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(24; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(27; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //ĐK   UserMgt.LookupUserID("User ID");
            end;
        }
        field(28; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(29; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
        }
        field(30; "Prior-Year Entry"; Boolean)
        {
            Caption = 'Prior-Year Entry';
        }
        field(41; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(42; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(43; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount';
        }
        field(45; "Business Unit Code"; Code[10])
        {
            Caption = 'Business Unit Code';
            TableRelation = "Business Unit";
        }
        field(46; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(47; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(48; "Gen. Posting Type"; Enum "General Posting Type")
        {
            Caption = 'Gen. Posting Type';

        }
        field(49; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(50; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(51; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(52; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
        }
        field(53; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';
        }
        field(54; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';
        }
        field(55; "Document Date"; Date)
        {
            Caption = 'Document Date';
            ClosingDates = true;
        }
        field(56; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(57; "Source Type"; Enum "Gen. Journal Source Type")
        {
            Caption = 'Source Type';

        }
        field(58; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = CONST(Customer)) Customer
            ELSE
            IF ("Source Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Source Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Source Type" = CONST("Fixed Asset")) "Fixed Asset";
        }
        field(59; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(60; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(61; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(62; "Tax Group Code"; Code[10])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(63; "Use Tax"; Boolean)
        {
            Caption = 'Use Tax';
        }
        field(64; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(65; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(68; "Additional-Currency Amount"; Decimal)
        {
            //ĐK AutoFormatExpression = GetCurrencyCode;
            AutoFormatType = 1;
            Caption = 'Additional-Currency Amount';
        }
        field(69; "Add.-Currency Debit Amount"; Decimal)
        {
            //ĐK AutoFormatExpression = GetCurrencyCode;
            AutoFormatType = 1;
            Caption = 'Add.-Currency Debit Amount';
        }
        field(70; "Add.-Currency Credit Amount"; Decimal)
        {
            //ĐK AutoFormatExpression = GetCurrencyCode;
            AutoFormatType = 1;
            Caption = 'Add.-Currency Credit Amount';
        }
        field(71; "Close Income Statement Dim. ID"; Integer)
        {
            Caption = 'Close Income Statement Dim. ID';
        }
        field(72; "IC Partner Code"; Code[20])
        {
            Caption = 'IC Partner Code';
            TableRelation = "IC Partner";
        }
        field(73; Reversed; Boolean)
        {
            Caption = 'Reversed';
        }
        field(74; "Reversed by Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Reversed by Entry No.';
            TableRelation = "G/L Entry";
        }
        field(75; "Reversed Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Reversed Entry No.';
            TableRelation = "G/L Entry";
        }
        field(76; "G/L Account Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("G/L Account".Name WHERE("No." = FIELD("G/L Account No.")));
            Caption = 'G/L Account Name';
            Editable = false;

        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(5400; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
        }
        field(5600; "FA Entry Type"; Option)
        {
            Caption = 'FA Entry Type';
            OptionCaption = ' ,Fixed Asset,Maintenance';
            OptionMembers = " ","Fixed Asset",Maintenance;
        }
        field(5601; "FA Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'FA Entry No.';
            TableRelation = IF ("FA Entry Type" = CONST("Fixed Asset")) "FA Ledger Entry"
            ELSE
            IF ("FA Entry Type" = CONST(Maintenance)) "Maintenance Ledger Entry";
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
        }
        key(Key2; "G/L Account No.", "Posting Date")
        {
            SumIndexFields = Amount, "Debit Amount", "Credit Amount", "Additional-Currency Amount", "Add.-Currency Debit Amount", "Add.-Currency Credit Amount";
        }
        key(Key3; "G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date")
        {
            SumIndexFields = Amount, "Debit Amount", "Credit Amount", "Additional-Currency Amount", "Add.-Currency Debit Amount", "Add.-Currency Credit Amount";
        }
        key(Key4; "G/L Account No.", "Business Unit Code", "Posting Date")
        {
            SumIndexFields = Amount, "Debit Amount", "Credit Amount", "Additional-Currency Amount", "Add.-Currency Debit Amount", "Add.-Currency Credit Amount";
        }
        key(Key5; "G/L Account No.", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date")
        {
            SumIndexFields = Amount, "Debit Amount", "Credit Amount", "Additional-Currency Amount", "Add.-Currency Debit Amount", "Add.-Currency Credit Amount";
        }
        key(Key6; "Document No.", "Posting Date")
        {
        }
        key(Key7; "Transaction No.")
        {
        }
        key(Key8; "IC Partner Code")
        {
        }
        key(Key9; "G/L Account No.", "Job No.", "Posting Date")
        {
            SumIndexFields = Amount;
        }
        key(Key10; "Posting Date", "G/L Account No.", "Dimension Set ID")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", Description, "G/L Account No.", "Posting Date", "Document Type", "Document No.")
        {
        }
    }

    var
        GLSetup: Record "General Ledger Setup";
        GLSetupRead: Boolean;

    procedure GetCurrencyCode(): Code[10]
    begin
        IF NOT GLSetupRead THEN BEGIN
            GLSetup.GET;
            GLSetupRead := TRUE;
        END;
        EXIT(GLSetup."Additional Reporting Currency");
    end;

    procedure ShowValueEntries()
    var
        GLItemLedgRelation: Record "G/L - Item Ledger Relation";
        ValueEntry: Record "Value Entry";
        TempValueEntry: Record "Value Entry" temporary;
    begin
        GLItemLedgRelation.SETRANGE("G/L Entry No.", "Entry No.");
        IF GLItemLedgRelation.FINDSET THEN
            REPEAT
                ValueEntry.GET(GLItemLedgRelation."Value Entry No.");
                TempValueEntry.INIT;
                TempValueEntry := ValueEntry;
                TempValueEntry.INSERT;
            UNTIL GLItemLedgRelation.NEXT = 0;

        PAGE.RUNMODAL(0, TempValueEntry);
    end;

    procedure ShowDimensions()
    var
        DimMgt: Codeunit "DimensionManagement";
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID", STRSUBSTNO('%1 %2', TABLECAPTION, "Entry No."));
    end;

    procedure UpdateDebitCredit(Correction: Boolean)
    begin
        IF ((Amount > 0) AND (NOT Correction)) OR
           ((Amount < 0) AND Correction)
        THEN BEGIN
            "Debit Amount" := Amount;
            "Credit Amount" := 0
        END ELSE BEGIN
            "Debit Amount" := 0;
            "Credit Amount" := -Amount;
        END;

        IF (("Additional-Currency Amount" > 0) AND (NOT Correction)) OR
           (("Additional-Currency Amount" < 0) AND Correction)
        THEN BEGIN
            "Add.-Currency Debit Amount" := "Additional-Currency Amount";
            "Add.-Currency Credit Amount" := 0
        END ELSE BEGIN
            "Add.-Currency Debit Amount" := 0;
            "Add.-Currency Credit Amount" := -"Additional-Currency Amount";
        END;
    end;

    procedure CopyFromGenJnlLine(GenJnlLine: Record "Gen. Journal Line")
    begin
        "Posting Date" := GenJnlLine."Posting Date";
        "Document Date" := GenJnlLine."Document Date";
        "Document Type" := GenJnlLine."Document Type";
        "Document No." := GenJnlLine."Document No.";
        "External Document No." := GenJnlLine."External Document No.";
        Description := GenJnlLine.Description;
        "Business Unit Code" := GenJnlLine."Business Unit Code";
        "Global Dimension 1 Code" := GenJnlLine."Shortcut Dimension 1 Code";
        "Global Dimension 2 Code" := GenJnlLine."Shortcut Dimension 2 Code";
        "Dimension Set ID" := GenJnlLine."Dimension Set ID";
        "Source Code" := GenJnlLine."Source Code";
        IF GenJnlLine."Account Type" = GenJnlLine."Account Type"::"G/L Account" THEN BEGIN
            "Source Type" := GenJnlLine."Source Type";
            "Source No." := GenJnlLine."Source No.";
        END ELSE BEGIN
            "Source Type" := GenJnlLine."Account Type";
            "Source No." := GenJnlLine."Account No.";
        END;
        IF (GenJnlLine."Account Type" = GenJnlLine."Account Type"::"IC Partner") OR
           (GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::"IC Partner")
        THEN
            "Source Type" := "Source Type"::" ";
        "Job No." := GenJnlLine."Job No.";
        Quantity := GenJnlLine.Quantity;
        "Journal Batch Name" := GenJnlLine."Journal Batch Name";
        "Reason Code" := GenJnlLine."Reason Code";
        "User ID" := USERID;
        "No. Series" := GenJnlLine."Posting No. Series";
        "IC Partner Code" := GenJnlLine."IC Partner Code";
    end;

    procedure CopyPostingGroupsFromGLEntry(GLEntry: Record "G/L Entry")
    begin
        "Gen. Posting Type" := GLEntry."Gen. Posting Type";
        "Gen. Bus. Posting Group" := GLEntry."Gen. Bus. Posting Group";
        "Gen. Prod. Posting Group" := GLEntry."Gen. Prod. Posting Group";
        "VAT Bus. Posting Group" := GLEntry."VAT Bus. Posting Group";
        "VAT Prod. Posting Group" := GLEntry."VAT Prod. Posting Group";
        "Tax Area Code" := GLEntry."Tax Area Code";
        "Tax Liable" := GLEntry."Tax Liable";
        "Tax Group Code" := GLEntry."Tax Group Code";
        "Use Tax" := GLEntry."Use Tax";
    end;

    procedure CopyPostingGroupsFromVATEntry(VATEntry: Record "VAT Entry")
    begin
        "Gen. Posting Type" := VATEntry.Type;
        "Gen. Bus. Posting Group" := VATEntry."Gen. Bus. Posting Group";
        "Gen. Prod. Posting Group" := VATEntry."Gen. Prod. Posting Group";
        "VAT Bus. Posting Group" := VATEntry."VAT Bus. Posting Group";
        "VAT Prod. Posting Group" := VATEntry."VAT Prod. Posting Group";
        "Tax Area Code" := VATEntry."Tax Area Code";
        "Tax Liable" := VATEntry."Tax Liable";
        "Tax Group Code" := VATEntry."Tax Group Code";
        "Use Tax" := VATEntry."Use Tax";
    end;

    procedure CopyPostingGroupsFromGenJnlLine(GenJnlLine: Record "Gen. Journal Line")
    begin
        "Gen. Posting Type" := GenJnlLine."Gen. Posting Type";
        "Gen. Bus. Posting Group" := GenJnlLine."Gen. Bus. Posting Group";
        "Gen. Prod. Posting Group" := GenJnlLine."Gen. Prod. Posting Group";
        "VAT Bus. Posting Group" := GenJnlLine."VAT Bus. Posting Group";
        "VAT Prod. Posting Group" := GenJnlLine."VAT Prod. Posting Group";
        "Tax Area Code" := GenJnlLine."Tax Area Code";
        "Tax Liable" := GenJnlLine."Tax Liable";
        "Tax Group Code" := GenJnlLine."Tax Group Code";
        "Use Tax" := GenJnlLine."Use Tax";
    end;

    procedure CopyPostingGroupsFromDtldCVBuf(DtldCVLedgEntryBuf: Record "Detailed CV Ledg. Entry Buffer"; GenPostingType: enum "General Posting Type")
    begin
        "Gen. Posting Type" := GenPostingType;
        "Gen. Bus. Posting Group" := DtldCVLedgEntryBuf."Gen. Bus. Posting Group";
        "Gen. Prod. Posting Group" := DtldCVLedgEntryBuf."Gen. Prod. Posting Group";
        "VAT Bus. Posting Group" := DtldCVLedgEntryBuf."VAT Bus. Posting Group";
        "VAT Prod. Posting Group" := DtldCVLedgEntryBuf."VAT Prod. Posting Group";
        "Tax Area Code" := DtldCVLedgEntryBuf."Tax Area Code";
        "Tax Liable" := DtldCVLedgEntryBuf."Tax Liable";
        "Tax Group Code" := DtldCVLedgEntryBuf."Tax Group Code";
        "Use Tax" := DtldCVLedgEntryBuf."Use Tax";
    end;
}

