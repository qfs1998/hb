DSEG    SEGMENT
RAL     DB      ?
HTAB	DB	'0123456789ABCDEF'
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        MOV     AH,01H		�������һ����
        INT     21H
        SUB     AL,30H
        MOV     BL,AL
        MOV     DL,'+'		����ʾ�Ӻ�
        MOV     AH,02H
        INT     21H
        MOV     AH,01H		������ڶ�����
        INT     21H
        SUB     AL,30H
        ADD     BL,AL		
        MOV     RAL,BL		����������RAL��Ԫ	
        MOV     DL,'='		����ʾ��=����
        MOV     AH,02H
        INT     21H
	MOV	AL,BL
	MOV	CH,BL
	MOV	CL,4		
	SHR	AL,CL
	LEA	BX,HTAB
	XLAT
	MOV	DL,AL		����ʾ���ʮλ�ϵ���
	MOV	AH,02H
	INT	21H
	AND	CH,0FH
	MOV	AL,CH
	XLAT
	MOV	DL,AL
	MOV	AH,02H
	INT	21H
        MOV     DL,'H'		����ʾ�ַ���H��
        MOV     AH,02H
        INT     21H
        MOV     AH,4CH
        INT     21H
CSEG    ENDS
        END     START

        
