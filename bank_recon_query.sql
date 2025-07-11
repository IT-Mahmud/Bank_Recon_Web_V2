-- DATABASE
CREATE DATABASE IF NOT EXISTS bank_reconciliation;
USE bank_reconciliation;

-- 1. BANK DATA
CREATE TABLE IF NOT EXISTS bank_data (
    bank_id INT AUTO_INCREMENT PRIMARY KEY,
    bank_uid VARCHAR(50) NOT NULL UNIQUE,
    acct_no VARCHAR(50),
    bank_code VARCHAR(10),
    B_Date DATE,
    B_Particulars VARCHAR(255),
    B_Ref_Cheque VARCHAR(50),
    B_Withdrawal DECIMAL(18,2),
    B_Deposit DECIMAL(18,2),
    B_Balance DECIMAL(18,2),
    bank_ven VARCHAR(255),
    statement_month VARCHAR(20),
    statement_year VARCHAR(10),
    bf_is_matched TINYINT DEFAULT 0,
    bf_date_matched DATETIME DEFAULT NULL,
    bft_is_matched TINYINT DEFAULT 0,
    bft_date_matched DATETIME DEFAULT NULL,
    input_date DATETIME
);

-- 2. FINANCE DATA
CREATE TABLE IF NOT EXISTS fin_data (
    fin_id INT AUTO_INCREMENT PRIMARY KEY,
    fin_uid VARCHAR(50) NOT NULL UNIQUE,
    F_Routing_No VARCHAR(50),
    F_Receiving_AC_No VARCHAR(50),
    F_Credit_Amount DECIMAL(18,2),
    F_Receiver_Name VARCHAR(255),
    F_Bank_Name VARCHAR(255),
    F_Branch_Name VARCHAR(255),
    F_Sender_Name VARCHAR(255),
    F_Sender_Account VARCHAR(50),
    F_Sender_Bank VARCHAR(255),
    F_Unit_Name VARCHAR(255),
    F_Team_Name VARCHAR(255),
    F_New_Project VARCHAR(255),
    F_Project VARCHAR(255),
    F_Sub_Project VARCHAR(255),
    F_PO VARCHAR(255),
    F_Status VARCHAR(255),
    F_Voucher_Date DATE,
    F_Voucher_No VARCHAR(255),
    F_Payment_Date DATE,
    F_Payment_Month VARCHAR(255),
    F_Remarks TEXT,
    F_Mark VARCHAR(255),
    F_Concern VARCHAR(255),
    fin_ven VARCHAR(255),
    bf_is_matched TINYINT DEFAULT 0,
    bf_date_matched DATETIME DEFAULT NULL,
    bft_is_matched TINYINT DEFAULT 0,
    bft_date_matched DATETIME DEFAULT NULL,
    input_date DATETIME
);

-- 3. TALLY DATA
CREATE TABLE IF NOT EXISTS tally_data (
    tally_id INT AUTO_INCREMENT PRIMARY KEY,
    tally_uid VARCHAR(50) NOT NULL UNIQUE,
    acct_no VARCHAR(50),
    bank_code VARCHAR(255),
    unit_name VARCHAR(255),
    T_Date DATE,
    dr_cr VARCHAR(255),
    T_Particulars TEXT,
    T_Vch_Type VARCHAR(255),
    T_Vch_No VARCHAR(255),
    T_Debit DECIMAL(18,2),
    T_Credit DECIMAL(18,2),
    tally_ven TEXT,
    statement_month VARCHAR(20),
    statement_year VARCHAR(10),
    bft_is_matched TINYINT DEFAULT 0,
    bft_date_matched DATETIME DEFAULT NULL,
    input_date DATETIME
);

-- 4. BANK-FIN MATCHED DATA
CREATE TABLE IF NOT EXISTS bf_matched (
    bf_id INT AUTO_INCREMENT PRIMARY KEY,
    bf_match_id VARCHAR(50) NOT NULL,
    bf_source VARCHAR(16) NOT NULL,
    bf_match_type VARCHAR(32),
    bf_is_matched TINYINT DEFAULT 0,
    bf_date_matched TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Bank columns
    bank_id INT,
    bank_uid VARCHAR(50),
    acct_no VARCHAR(50),
    bank_code VARCHAR(8),
    B_Date DATE,
    B_Particulars VARCHAR(255),
    B_Ref_Cheque VARCHAR(50),
    B_Withdrawal DECIMAL(18,2),
    B_Deposit DECIMAL(18,2),
    B_Balance DECIMAL(18,2),
    bank_ven VARCHAR(255),
    statement_month VARCHAR(20),
    statement_year VARCHAR(10),

    -- Finance columns
    fin_id INT,
    fin_uid VARCHAR(50),
    F_Routing_No VARCHAR(50),
    F_Receiving_AC_No VARCHAR(50),
    F_Credit_Amount DECIMAL(18,2),
    F_Receiver_Name VARCHAR(255),
    F_Bank_Name VARCHAR(255),
    F_Branch_Name VARCHAR(255),
    F_Sender_Name VARCHAR(255),
    F_Sender_Account VARCHAR(50),
    F_Sender_Bank VARCHAR(255),
    F_Unit_Name VARCHAR(255),
    F_Team_Name VARCHAR(255),
    F_New_Project VARCHAR(255),
    F_Project VARCHAR(255),
    F_Sub_Project VARCHAR(255),
    F_PO VARCHAR(255),
    F_Status VARCHAR(255),
    F_Voucher_Date DATE,
    F_Voucher_No VARCHAR(255),
    F_Payment_Date DATE,
    F_Payment_Month VARCHAR(255),
    F_Remarks TEXT,
    F_Mark VARCHAR(255),
    F_Concern VARCHAR(255),
    fin_ven VARCHAR(255),
    input_date DATETIME,

    bft_is_matched TINYINT DEFAULT 0,
    bft_date_matched DATETIME DEFAULT NULL
);

-- 5. BANK-FIN-TALLY MATCHED DATA
CREATE TABLE IF NOT EXISTS bft_matched (
    bft_id INT AUTO_INCREMENT PRIMARY KEY,

    -- BFT match metadata
    bft_match_id VARCHAR(50) NOT NULL,
    bft_source VARCHAR(16) NOT NULL,
    bft_match_type VARCHAR(32),

    -- BF match metadata
    bf_id INT,
    bf_match_id VARCHAR(50),
    bf_source VARCHAR(16),
    bf_match_type VARCHAR(32),
    bf_is_matched TINYINT DEFAULT 0,
    bf_date_matched TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Bank columns
    bank_id INT,
    bank_uid VARCHAR(50),
    acct_no VARCHAR(50),
    B_Date DATE,
    B_Particulars VARCHAR(255),
    B_Ref_Cheque VARCHAR(50),
    B_Withdrawal DECIMAL(18,2),
    B_Deposit DECIMAL(18,2),
    B_Balance DECIMAL(18,2),
    bank_ven VARCHAR(255),

    -- Finance columns
    fin_id INT,
    fin_uid VARCHAR(50),
    F_Routing_No VARCHAR(50),
    F_Receiving_AC_No VARCHAR(50),
    F_Credit_Amount DECIMAL(18,2),
    F_Receiver_Name VARCHAR(255),
    F_Bank_Name VARCHAR(255),
    F_Branch_Name VARCHAR(255),
    F_Sender_Name VARCHAR(255),
    F_Sender_Account VARCHAR(50),
    F_Sender_Bank VARCHAR(255),
    F_Unit_Name VARCHAR(255),
    F_Team_Name VARCHAR(255),
    F_New_Project VARCHAR(255),
    F_Project VARCHAR(255),
    F_Sub_Project VARCHAR(255),
    F_PO VARCHAR(255),
    F_Status VARCHAR(255),
    F_Voucher_Date DATE,
    F_Voucher_No VARCHAR(255),
    F_Payment_Date DATE,
    F_Payment_Month VARCHAR(255),
    F_Remarks TEXT,
    F_Mark VARCHAR(255),
    F_Concern VARCHAR(255),
    fin_ven VARCHAR(255),

    -- Tally columns
    tally_id INT,
    tally_uid VARCHAR(50),
    T_Date DATE,
    dr_cr VARCHAR(255),
    T_Particulars TEXT,
    T_Vch_Type VARCHAR(255),
    T_Vch_No VARCHAR(255),
    T_Debit DECIMAL(18,2),
    T_Credit DECIMAL(18,2),
    tally_ven TEXT,
    bank_code VARCHAR(255),
    unit_name VARCHAR(255),
    statement_month VARCHAR(20),
    statement_year VARCHAR(10),
    input_date DATETIME,

    bft_is_matched TINYINT DEFAULT 0,
    bft_date_matched DATETIME NULL,
    is_matched TINYINT DEFAULT 0
);

-- 6. BANK-TALLY MATCHED DATA
CREATE TABLE IF NOT EXISTS bt_matched (
    bt_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Match metadata
    bt_match_id VARCHAR(50),
    bt_source VARCHAR(50),
    cheque_ref VARCHAR(50),

    -- Bank columns
    bank_id INT,
    bank_uid VARCHAR(50),
    acct_no VARCHAR(50),
    bank_code VARCHAR(10),
    B_Date DATE,
    B_Particulars VARCHAR(255),
    B_Ref_Cheque VARCHAR(50),
    B_Withdrawal DECIMAL(18,2),
    B_Deposit DECIMAL(18,2),
    B_Balance DECIMAL(18,2),
    bank_ven VARCHAR(255),
    statement_month VARCHAR(20),
    statement_year VARCHAR(10),
    bf_is_matched TINYINT,
    bf_date_matched DATETIME,
    input_date DATETIME,

    -- Tally columns
    tally_id INT,
    tally_uid VARCHAR(50),
    T_Date DATE,
    dr_cr VARCHAR(255),
    T_Particulars TEXT,
    T_Vch_Type VARCHAR(255),
    T_Vch_No VARCHAR(255),
    T_Debit DECIMAL(18,2),
    T_Credit DECIMAL(18,2),
    tally_ven TEXT,
    unit_name VARCHAR(255),
    bft_is_matched TINYINT,
    bft_date_matched DATETIME
);
