# MDB BANK MATCH LOGIC
For MDB bank side (Particular column):
    if narration starts with "on-line cashca":
        extract number (min 5 digits) immediately after prefix
    elif narration starts with "clg- inwardca":
        extract number (min 5 digits) immediately after prefix
    elif narration starts with "RTGS RTGS Outward":
        split narration by "/", pick part after 2nd slash
        extract number (min 5 digits) from that part
    elif narration starts with "RTGS RTGS INWARD":
        split narration by "/", pick part after 2nd slash
        extract number (min 5 digits) from that part
    elif narration starts with "CLG HV":
        split narration by "/", pick part after 3rd slash
        extract number (min 5 digits) from that part
    else:
        no cheque reference found

# MDB TALLY MATCH LOGIC
For MDB tally side (Particulars column):
    if narration starts with any of these prefixes: "cq-", "A/C-", "CD-", "STD-", "OD#", "CQ-", "(Hypo)-":
        extract number (min 5 digits) immediately after the prefix
    else:
        no cheque reference found


# MTB BANK MATCH LOGIC
For MTB bank side (Transaction Detail column):
    if narration matches "number to number" dynamic pattern:
        extract the 2nd number (min 5 digits) in the narration
    elif narration matches "USD" dynamic pattern:
        extract the 1st number (min 5 digits) in the narration
    else:
        no cheque reference found

# MTB TALLY MATCH LOGIC
For MTB tally side (Particulars column):
    if narration starts with any of these prefixes: "$", "cq-", "A/C-", "CD-", "STD-", "OD#", "CQ-", "(Hypo)-":
        extract number (min 5 digits) immediately after the prefix
    else:
        no cheque reference found
