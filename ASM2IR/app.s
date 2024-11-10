label_0
    ALLOCA X1

    ALLOCA X2

    LIFETIME_START X1

    GEP_STORE X1 52 1

    GEP_STORE X1 103 1

    GEP_STORE X1 104 1

    GEP_STORE X1 152 1

    GEP_STORE X1 153 1

    LIFETIME_START X2

    XOR X3 X3 X3
    SWAP X1 X2

    BR label_8

label_8

    SWAP X1 X2

    XOR X4 X4 X4

    BR label_13

label_12
    FREE X2
    FREE X1
    EXIT

label_13
    MUL X5 X4 50

    TRUNC X6 X4

    XOR X22 X22 X22
    BR label_53

label_17
    SIM_FLUSH

    XOR X7 X7 X7
    BR label_18

label_18
    MUL X8 X7 50

    TRUNC X9 X7

    XOR X10 X10 X10
    BR label_25

label_22
    ADD_IMM X7 X7 1

    EQ_BR_IMM X7 25 label_47 label_18

label_25
    TRUNC X11 X10

    NEIGHBORS X12 X1 X11 X9

    ADD X13 X10 X8

    GEP_LOAD X14 X1 X13

    EQ_BR_IMM X14 0 label_39 label_33

label_33
    AND X16 X12 -2

    ICMP_EQ X17 X16 2

    GEP X18 X2 X13

    BR_IF X17 label_37 label_38

label_37
    STORE X18 1

    BR label_44

label_38
    STORE X18 0

    BR label_44

label_39
    ICMP_EQ X19 X12 3

    GEP X20 X2 X13

    BR_IF X19 label_42 label_43

label_42
    STORE X20 1

    BR label_44

label_43

    STORE X20 0

    BR label_44

label_44
    ADD_IMM X10 X10 1

    EQ_BR_IMM X10 50 label_22 label_25

label_47
    ADD_IMM X3 X3 1

    EQ_BR_IMM X3 1000 label_12 label_8

label_50
    ADD_IMM X4 X4 1

    EQ_BR_IMM X4 25 label_17 label_13

label_53
    ADD X23 X22 X5

    GEP_LOAD X24 X1 X23

    ICMP_EQ X25 X24 0

    TRUNC X26 X22

    SELECT X27 X25 -1 -16777216

    SIM_PUT_DISPLAY_PIXEL X26 X6 X27 40

    ADD_IMM X22 X22 1

    EQ_BR_IMM X22 50 label_50 label_53
