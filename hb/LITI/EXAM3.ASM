DSEG    SEGMENT
RAL     DB      ?
HTAB	DB	'0123456789ABCDEF'
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        MOV     AH,01H		；输入第一个数
        INT     21H
        SUB     AL,30H
        MOV     BL,AL
        MOV     DL,'+'		；显示加号
        MOV     AH,02H
        INT     21H
        MOV     AH,01H		；输入第二个数
        INT     21H
        SUB     AL,30H
        ADD     BL,AL		
        MOV     RAL,BL		；保存结果到RAL单元	
        MOV     DL,'='		；显示“=”号
        MOV     AH,02H
        INT     21H
	MOV	AL,BL
	MOV	CH,BL
	MOV	CL,4		
	SHR	AL,CL
	LEA	BX,HTAB
	XLAT
	MOV	DL,AL		；显示结果十位上的数
	MOV	AH,02H
	INT	21H
	AND	CH,0FH
	MOV	AL,CH
	XLAT
	MOV	DL,AL
	MOV	AH,02H
	INT	21H
        MOV     DL,'H'		；显示字符“H”
        MOV     AH,02H
        INT     21H
        MOV     AH,4CH
        INT     21H
CSEG    ENDS
        END     START

        

