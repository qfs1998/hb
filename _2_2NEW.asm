
DSEG    SEGMENT
A1      DB      1,18,25H,80H,-128,'ABC'
A2      DB      3*5,48/4,36-5,26 MOD 10
A3      DB      ?,?,36H,-1,36Q
A4      DB      5 DUP(26),3 DUP(?)
A5      DB      2 DUP(2 DUP(4),15),7FH
DSEG    ENDS
        END