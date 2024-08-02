* = $8000 "DEFENDER8000"

	.word COLD_START		
	.word WARM_START
	.byte $C3,$C2,$CD,$38,$30	// - crt_signature .text "CBM80"

COLD_START:	
WARM_START:
	lda #$00
	sta $D016			// Control Register 2
	jsr $FF84			// Init I/O Devices, Ports & Timers
	jsr $FF87			// Init Ram & Buffers
	jsr $FF8A			// Restore Vectors
	jsr $FF81
	cli
	sei
	ldx #$E0
	lda #$00

L_BRS_8020_8023:

	sta $00,X
	inx
	bne L_BRS_8020_8023
	lda #$00
	sta $D020                          // Border Color
	sta $D011                          // Control Register 1
	sta $DC0E                          // Control Register A
	sta $D021                          // Background Color 0
	lda #$1B
	sta $0318
	lda #$80
	sta $0319
	lda #$E2
	sta $D018                          // Memory Control Register
	lda #$18
	sta $D016                          // Control Register 2
	lda #$00
	sta $22
	lda #$10
	sta $23
	ldx #$10
	lda #$00
	jsr L_JSR_8D14_8053
	lda #$00
	sta $22
	lda #$0E
	sta $23
	ldx #$02
	lda #$00
	jsr L_JSR_8D14_8062
	lda #$00
	sta $22
	lda #$38
	sta $23
	ldx #$02
	lda #$00
	jsr L_JSR_8D14_8071
	lda #$00
	sta $22
	lda #$28
	sta $23
	lda #$8E
	sta $27
	lda #$BB
	sta $28
	ldx #$09
	jsr L_JSR_8D6D_8086
	lda #$00
	sta $22
	lda #$30
	sta $23
	lda #$1A
	sta $27
	lda #$BD
	sta $28
	ldx #$C9
	jsr L_JSR_8D6D_809B
	lda #$00
	sta $22
	lda #$31
	sta $23
	lda #$51
	sta $27
	lda #$BD
	sta $28
	ldx #$BC
	jsr L_JSR_8D6D_80B0
	lda #$00
	sta $22
	lda #$32
	sta $23
	lda #$95
	sta $27
	lda #$BD
	sta $28
	ldx #$99
	jsr L_JSR_8D6D_80C5
	lda #$00
	sta $22
	lda #$33
	sta $23
	lda #$FC
	sta $27
	lda #$BD
	sta $28
	ldx #$78
	jsr L_JSR_8D6D_80DA
	lda #$00
	sta $22
	lda #$34
	sta $23
	lda #$84
	sta $27
	lda #$BE
	sta $28
	ldx #$58
	jsr L_JSR_8D6D_80EF
	lda #$00
	sta $22
	lda #$35
	sta $23
	lda #$2C
	sta $27
	lda #$BF
	sta $28
	ldx #$44
	jsr L_JSR_8D6D_8104
	lda #$00
	sta $22
	lda #$0B
	sta $23
	lda #$05
	sta $27
	lda #$B6
	sta $28
	ldx #$01
	jsr L_JSR_8D21_8119
	lda #$DE
	sta $27
	lda #$B9
	sta $28
	lda #$00
	sta $22
	lda #$08
	sta $23
	ldx #$01
	jsr L_JSR_8D21_812E
	lda #$E0
	sta $22
	lda #$08
	sta $23
	ldx #$02
	lda #$00
	jsr L_JSR_8D14_813D
	lda #$00
	sta $22
	lda #$04
	sta $23
	ldx #$04
	lda #$00
	jsr L_JSR_8D14_814C
	lda #$BE
	sta $27
	lda #$BA
	sta $28
	lda #$F0
	sta $22
	lda #$09
	sta $23
	ldx #$01
	jsr L_JSR_8D21_8161
	lda #$9A
	sta $27
	lda #$B8
	sta $28
	lda #$80
	sta $22
	lda #$04
	sta $23
	ldx #$2A
	jsr L_JSR_8D6D_8176
	lda #$6A
	sta $27
	lda #$B9
	sta $28
	lda #$80
	sta $22
	lda #$06
	sta $23
	ldx #$8C
	jsr L_JSR_8D6D_818B
	lda #$00
	sta $68
	lda #$C1
	sta $69
	jsr L_JSR_89B9_8196
	jsr L_JSR_89A1_8199
	jsr L_JSR_89A1_819C
	jsr L_JSR_89B9_819F
	jsr L_JSR_89A1_81A2
	jsr L_JSR_89A1_81A5
	jsr L_JSR_89B9_81A8
	jsr L_JSR_89A1_81AB
	jsr L_JSR_89A1_81AE
	jsr L_JSR_89B9_81B1
	jsr L_JSR_89A1_81B4
	jsr L_JSR_89A1_81B7
	lda #$1B
	sta $D011                          // Control Register 1
	jsr L_JSR_8FA9_81BF
	ldx #$00
	lda #$00
	sta $64
	lda #$52
	sta $65
	lda #$E0
	sta $68
	lda #$08
	sta $69

L_BRS_81D4_8247:

	lda #$8D
	ldy #$00
	sta ($64),Y
	inc $65
	lda $64
	clc
	adc #$98
	bcc L_BRS_81E5_81E1
	inc $65

L_BRS_81E5_81E1:

	sta $64
	lda #$8D
	sta ($64),Y
	dec $65
	lda $64
	sec
	sbc #$97
	bcs L_BRS_81F6_81F2
	dec $65

L_BRS_81F6_81F2:

	sta $64
	lda $68
	sta ($64),Y
	inc $64
	bne L_BRS_8202_81FE
	inc $65

L_BRS_8202_81FE:

	lda $69
	sta ($64),Y
	inc $65
	lda $64
	clc
	adc #$97
	bcc L_BRS_8211_820D
	inc $65

L_BRS_8211_820D:

	sta $64
	lda $68
	clc
	adc #$88
	bcc L_BRS_821C_8218
	inc $69

L_BRS_821C_8218:

	sta $68
	lda $68
	sta ($64),Y
	inc $64
	bne L_BRS_8228_8224
	inc $65

L_BRS_8228_8224:

	lda $69
	sta ($64),Y
	lda $68
	sec
	sbc #$87
	bcs L_BRS_8235_8231
	dec $69

L_BRS_8235_8231:

	sta $68
	dec $65
	lda $64
	sec
	sbc #$97
	bcs L_BRS_8242_823E
	dec $65

L_BRS_8242_823E:

	sta $64
	inx
	cpx #$88
	bne L_BRS_81D4_8247
	inc $65
	lda $64
	clc
	adc #$98
	bcc L_BRS_8254_8250
	inc $65

L_BRS_8254_8250:

	sta $64
	lda #$60
	sta ($64),Y
	jsr L_JSR_8E5C_825A

L_JMP_825D_8C71:
L_JMP_825D_A231:

	sei
	lda #$02
	sta $27
	lda #$B8
	sta $28
	lda #$00
	sta $22
	lda #$D8
	sta $23
	ldx #$DE
	jsr L_JSR_8D6D_8270
	lda #$24
	sta $27
	lda #$B8
	sta $28
	lda #$00
	sta $22
	lda #$38
	sta $23
	ldx #$8A
	jsr L_JSR_8D6D_8285
	sta $25
	sta $26
	lda #$00
	sta $22
	lda #$50
	sta $23
	ldx #$02
	lda #$00
	jsr L_JSR_8D14_8298
	lda #$00
	sta $22
	lda #$C0
	sta $23
	ldx #$01
	lda #$00
	jsr L_JSR_8D14_82A7
	lda #$00
	sta $C9
	sta $CA
	sta $CB
	lda #$1B
	sta $D011                          // Control Register 1
	lda #$EF
	sta $51
	sta $3A
	lda #$03
	sta $D0
	sta $35
	lda #$00
	sta $57
	sta $C6
	sta $CD
	sta $CF
	sta $75
	sta $C4
	sta $B1
	sta $BA
	sta $D1
	sta $36
	lda #$01
	sta $BB
	lda #$0A
	sta $B7
	lda #$4F
	sta $3805
	lda #$50
	sta $3806
	jsr L_JSR_929F_82EB
	ldx #$06
	lda #$00

L_BRS_82F2_82F6:

	sta $381C,X
	dex
	bne L_BRS_82F2_82F6
	ldx #$05

L_BRS_82FA_82FE:

	sta $3871,X
	dex
	bne L_BRS_82FA_82FE
	sta $389D
	lda #$78
	sta $27
	lda #$B5
	sta $28
	lda #$F0
	sta $22
	lda #$D8
	sta $23
	ldx #$F4
	jsr L_JSR_8D6D_8315
	lda #$84
	sta $27
	lda #$B5
	sta $28
	lda #$C9
	sta $22
	lda #$38
	sta $23
	ldx #$B4
	jsr L_JSR_8D6D_832A
	lda #$01
	sta $DAE2
	lda #$FE
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	jmp L_JMP_836A_8337

L_BRS_833A_833F:
L_JMP_833A_834F:
L_JMP_833A_8394:
L_JMP_833A_83FA:

	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	cmp $51
	beq L_BRS_833A_833F
	sta $51
	cmp #$EF
	beq L_BRS_8352_8345
	cmp #$DF
	beq L_BRS_836A_8349
	cmp #$BF
	beq L_BRS_8397_834D
	jmp L_JMP_833A_834F

L_BRS_8352_8345:

	lda $CF
	sta $31
	lda #$06
	sta $9A
	sta $C030
	lda #$00
	sta $C9
	sta $CA
	sta $CB
	sta $BC
	jmp L_JMP_83FD_8367

L_JMP_836A_8337:
L_BRS_836A_8349:

	ldx #$24
	lda #$07

L_BRS_836E_8372:

	sta $D9E2,X
	dex
	bne L_BRS_836E_8372
	lda $CF
	cmp #$03
	bcc L_BRS_837E_8378
	lda #$00
	sta $CF

L_BRS_837E_8378:

	tay
	ldx $B5D0,Y
	ldy #$09
	lda #$01

L_BRS_8386_838B:

	sta $D90A,X
	inx
	dey
	bne L_BRS_8386_838B
	inc $CF
	ldx #$FF

L_BRS_8391_8392:

	dex
	bne L_BRS_8391_8392
	jmp L_JMP_833A_8394

L_BRS_8397_834D:

	lda $CD
	beq L_BRS_83BC_8399
	lda #$09
	sta $3AE2
	lda #$00
	sta $CD
	sta $C6
	ldx #$06

L_BRS_83A8_83AC:

	sta $381C,X
	dex
	bne L_BRS_83A8_83AC
	ldx #$05

L_BRS_83B0_83B4:

	sta $3871,X
	dex
	bne L_BRS_83B0_83B4
	sta $389D
	jmp L_JMP_83F5_83B9

L_BRS_83BC_8399:

	lda #$0A
	sta $3AE2
	lda #$03
	sta $D1
	sta $36
	lda #$01
	sta $C6
	sta $CD
	lda #$08
	sta $3872
	sta $3873
	lda #$51
	sta $3875
	lda #$52
	sta $389D
	lda #$4F
	sta $381D
	sta $381F
	sta $3821
	lda #$50
	sta $381E
	sta $3820
	sta $3822

L_JMP_83F5_83B9:

	ldx #$FF

L_BRS_83F7_83F8:

	dex
	bne L_BRS_83F7_83F8
	jmp L_JMP_833A_83FA

L_JMP_83FD_8367:

	lda #$14
	jsr L_JSR_AC2E_83FF
	lda #$15
	jsr L_JSR_AC2E_8404
	lda #$16
	jsr L_JSR_AC2E_8409
	lda #$19
	sta $64
	lda #$19
	sta $65
	jsr L_JSR_8D35_8414
	lda #$00
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	sta $66
	sta $12
	sta $2E
	sta $C022
	jsr L_JSR_8A6E_8425
	lda #$00
	sta.a $00E8
	sta.a $00E9
	sta.a $00FA
	sta.a $00FB
	sta.a $00FC
	sta $D012                          // Raster Position
	ldy #$02

L_BRS_843E_8448:

	lda $0000,Y
	sta $4800,Y
	sta $4900,Y
	iny
	bne L_BRS_843E_8448
	lda #$E5
	sta $0314
	lda #$94
	sta $0315
	lda #$01
	sta $D01A                          // Interrupt Mask Register (IMR)
	sta $50
	jsr L_JSR_8C26_845B
	jsr L_JSR_9EBF_845E
	jsr L_JSR_8B64_8461
	jsr L_JSR_A364_8464
	lda #$80
	sta $C4
	jsr L_JSR_9725_846B
	lda #$00
	jsr L_JSR_AC2E_8470
	lda #$01
	jsr L_JSR_AC2E_8475
	lda #$02
	jsr L_JSR_AC2E_847A

L_BRS_847D_8480:

	lda.a $00E1
	bne L_BRS_847D_8480
	lda #$00
	sta $C4

L_BRS_8486_84F1:
L_JMP_8486_84F6:

	jsr L_JSR_A40E_8486
	jsr L_JSR_A4C9_8489
	jsr L_JSR_A788_848C
	jsr L_JSR_91A8_848F
	jsr L_JSR_AA75_8492
	jsr L_JSR_A9A6_8495
	jsr L_JSR_9D59_8498
	jsr L_JSR_8C5F_849B
	lda $C2
	beq L_BRS_84C1_84A0
	bmi L_BRS_84AE_84A2
	jsr L_JSR_8B2E_84A4
	lda #$80
	sta $C2
	jmp L_JMP_84CE_84AB

L_BRS_84AE_84A2:

	lda #$00
	sta $C2
	jsr L_JSR_A69C_84B2
	jsr L_JSR_9E81_84B5
	jsr L_JSR_9D8A_84B8
	jsr L_JSR_98A3_84BB
	jmp L_JMP_84CE_84BE

L_BRS_84C1_84A0:

	lda #$01
	sta $C2
	jsr L_JSR_8C26_84C5
	jsr L_JSR_9F82_84C8
	jsr L_JSR_8E5C_84CB

L_JMP_84CE_84AB:
L_JMP_84CE_84BE:

	lda $C4
	beq L_BRS_84ED_84D0
	cmp #$01
	bne L_BRS_84DC_84D4
	jsr L_JSR_A820_84D6
	jmp L_JMP_84ED_84D9

L_BRS_84DC_84D4:

	cmp #$02
	bne L_BRS_84E6_84DE
	jsr L_JSR_A8AB_84E0
	jmp L_JMP_84ED_84E3

L_BRS_84E6_84DE:

	cmp #$03
	bne L_BRS_84ED_84E8
	jsr L_JSR_A988_84EA

L_BRS_84ED_84D0:
L_JMP_84ED_84D9:
L_JMP_84ED_84E3:
L_BRS_84ED_84E8:

	lda $75
	cmp #$FF
	bne L_BRS_8486_84F1
	jsr L_JSR_958A_84F3
	jmp L_JMP_8486_84F6

L_JSR_84F9_9592:
L_JSR_84F9_9595:
L_JSR_84F9_A8BA:
L_JSR_84F9_A8BD:

	lda $11
	sta $12
	jsr L_JSR_8883_84FD
	cli
	lda $C022
	beq L_BRS_8572_8504
	ldx $66
	ldy #$27

L_BRS_850A_8558:

	lda $B7
	beq L_BRS_853B_850C
	lda $1907,X
	sta $3AA8,Y
	lda $198F,X
	sta $3AD0,Y
	lda $1A17,X
	sta $3AF8,Y
	lda $1A9F,X
	sta $3B20,Y
	lda $1B27,X
	sta $3B48,Y
	lda $1BAF,X
	sta $3B70,Y
	lda $1C37,X
	sta $3B98,Y
	jmp L_JMP_8552_8538

L_BRS_853B_850C:

	lda #$00
	sta $3AA8,Y
	sta $3AD0,Y
	sta $3AF8,Y
	sta $3B20,Y
	sta $3B48,Y
	sta $3B70,Y
	sta $3B98,Y

L_JMP_8552_8538:

	dex
	bne L_BRS_8557_8553
	ldx #$87

L_BRS_8557_8553:

	dey
	bpl L_BRS_850A_8558
	jsr L_JSR_9CFD_855A
	lda $B9
	sec
	sbc $B7
	beq L_BRS_856C_8562
	lda $C4
	bmi L_BRS_856F_8566
	lda $BF
	beq L_BRS_856F_856A

L_BRS_856C_8562:

	jsr L_JSR_A39A_856C

L_BRS_856F_8566:
L_BRS_856F_856A:

	jmp L_JMP_866D_856F

L_BRS_8572_8504:

	jsr L_JSR_A5E0_8572
	jsr L_JSR_857B_8575
	jmp L_JMP_866D_8578

L_JSR_857B_8575:

	lda $18
	beq L_BRS_8586_857D
	lda #$00
	sta $18
	jmp L_JMP_85F3_8583

L_BRS_8586_857D:

	lda #$01
	sta $18
	lda #$00
	jsr $5200
	lda $66
	and #$F8
	sta $73
	lda $66
	sec
	sbc $73
	lsr
	sta $63
	sta $C020
	lda $73
	sta $62
	sta $C021
	lda #$F0
	sta $68
	lda #$09
	sta $69
	lda #$00
	sta $64
	lda #$C1
	sta $65
	ldy $63
	beq L_BRS_85D4_85B9

L_BRS_85BB_85D2:

	lda $64
	clc
	adc #$88
	bcc L_BRS_85C4_85C0
	inc $65

L_BRS_85C4_85C0:

	sta $64
	lda $64
	clc
	adc #$88
	bcc L_BRS_85CF_85CB
	inc $65

L_BRS_85CF_85CB:

	sta $64
	dey
	bne L_BRS_85BB_85D2

L_BRS_85D4_85B9:

	lda $64
	clc
	adc $62
	bcc L_BRS_85DD_85D9
	inc $65

L_BRS_85DD_85D9:

	sta $64
	ldy #$00

L_BRS_85E1_85F0:

	lda $B7
	bne L_BRS_85E9_85E3
	lda #$00
	beq L_BRS_85EB_85E7

L_BRS_85E9_85E3:

	lda ($64),Y

L_BRS_85EB_85E7:

	sta ($68),Y
	iny
	cpy #$88
	bne L_BRS_85E1_85F0
	rts

L_JMP_85F3_8583:

	ldx #$64

L_BRS_85F5_866A:

	lda $5002,X
	beq L_BRS_8666_85F8
	lda $5080,X
	sta $64
	lda $5081,X
	beq L_BRS_8666_8602
	sta $65
	lda $5103,X
	sta $C029
	lda #$01
	sta $63
	ldy #$00
	lda $C029
	clc
	adc $C020
	pha
	cmp #$04
	bcc L_BRS_8629_861C
	lda $64
	sec
	sbc #$08
	bcs L_BRS_8627_8623
	dec $65

L_BRS_8627_8623:

	sta $64

L_BRS_8629_861C:

	lda ($64),Y
	sta $74
	pla
	and #$03
	tay
	bne L_BRS_863A_8631
	lda $74
	and #$FC
	jmp L_JMP_8660_8637

L_BRS_863A_8631:

	lda $63
	asl
	asl
	dey
	bne L_BRS_864A_863F
	sta $63
	lda $74
	and #$F3
	jmp L_JMP_8660_8647

L_BRS_864A_863F:

	asl
	asl
	dey
	bne L_BRS_8658_864D
	sta $63
	lda $74
	and #$CF
	jmp L_JMP_8660_8655

L_BRS_8658_864D:

	asl
	asl
	sta $63
	lda $74
	and #$3F

L_JMP_8660_8637:
L_JMP_8660_8647:
L_JMP_8660_8655:

	ldy #$00
	ora $63
	sta ($64),Y

L_BRS_8666_85F8:
L_BRS_8666_8602:

	dex
	dex
	dex
	dex
	bne L_BRS_85F5_866A
	rts

L_JMP_866D_856F:
L_JMP_866D_8578:

	lda $C022
	beq L_BRS_867A_8670
	lda #$00
	sta $C022
	jmp L_JMP_867F_8677

L_BRS_867A_8670:

	lda #$01
	sta $C022

L_JMP_867F_8677:

	jsr L_JSR_92B6_867F
	and #$FF
	bpl L_BRS_869B_8684
	lda #$7F
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	cmp $34
	beq L_BRS_869B_8690
	sta $34
	and #$10
	bne L_BRS_869B_8696
	jmp L_JMP_A897_8698

L_BRS_869B_8684:
L_BRS_869B_8690:
L_BRS_869B_8696:

	jsr L_JSR_92B6_869B
	and #$FF
	bpl L_BRS_86B7_86A0
	lda #$FE
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	cmp $82
	beq L_BRS_86B7_86AC
	sta $82
	and #$08
	bne L_BRS_86B7_86B2
	jmp L_JMP_A972_86B4

L_BRS_86B7_86A0:
L_BRS_86B7_86AC:
L_BRS_86B7_86B2:

	lda #$FE
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	cmp $33
	beq L_BRS_86CC_86C1
	sta $33
	and #$40
	bne L_BRS_86CC_86C7
	jmp L_JMP_A99F_86C9

L_BRS_86CC_86C1:
L_BRS_86CC_86C7:
L_JMP_86CC_A8A8:
L_JMP_86CC_A985:
L_JMP_86CC_A9A3:

	jsr L_JSR_8CD4_86CC
	lda #$1F
	sta $4204
	lda #$00
	sta $24
	lda #$FF
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	and #$08
	bne L_BRS_8712_86E2
	jsr L_JSR_ACCE_86E4
	lda #$11
	sta $4204
	lda $6D
	bne L_BRS_8715_86EE
	lda #$00
	sta $6D
	lda #$80
	sta $24
	lda $6F
	cmp #$30
	bcc L_BRS_8702_86FC
	cmp #$D0
	bcc L_BRS_870F_8700

L_BRS_8702_86FC:

	inc $6F
	lda $70
	beq L_BRS_870C_8706
	inc $6F
	inc $6F

L_BRS_870C_8706:

	jsr L_JSR_8A05_870C

L_BRS_870F_8700:

	jmp L_JMP_8794_870F

L_BRS_8712_86E2:

	jmp L_JMP_8764_8712

L_BRS_8715_86EE:

	lda #$00
	sta $6D
	lda #$AF
	sta $27
	lda #$B7
	sta $28
	lda $4083
	cmp #$FF
	bne L_BRS_8744_8726
	sta $4103
	jmp L_JMP_8744_872B

L_BRS_872E_8775:

	lda #$01
	sta $6D
	lda #$C3
	sta $27
	lda #$B7
	sta $28
	lda $4083
	bne L_BRS_8744_873D
	lda #$01
	sta $4103

L_BRS_8744_8726:
L_JMP_8744_872B:
L_BRS_8744_873D:

	jsr L_JSR_889A_8744
	lda $4083
	and #$FE
	beq L_BRS_8750_874C
	ora #$02

L_BRS_8750_874C:

	sta $4083
	lda $6F
	and #$FE
	beq L_BRS_875B_8757
	ora #$02

L_BRS_875B_8757:

	sta $6F
	lda #$01
	sta $70
	jmp L_JMP_87BC_8761

L_JMP_8764_8712:

	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	and #$04
	bne L_BRS_8794_8769
	jsr L_JSR_ACCE_876B
	lda #$11
	sta $4204
	lda $6D
	beq L_BRS_872E_8775
	lda #$01
	sta $6D
	sta $24
	lda $6F
	cmp #$D1
	bcs L_BRS_8787_8781
	cmp #$31
	bcs L_BRS_8794_8785

L_BRS_8787_8781:

	dec $6F
	lda $70
	beq L_BRS_8791_878B
	dec $6F
	dec $6F

L_BRS_8791_878B:

	jsr L_JSR_8A4B_8791

L_JMP_8794_870F:
L_BRS_8794_8769:
L_BRS_8794_8785:

	jsr L_JSR_888E_8794
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	and #$02
	bne L_BRS_87AB_879C
	lda $4003
	cmp #$F2
	beq L_BRS_87BC_87A3
	inc $4003
	jmp L_JMP_87BC_87A8

L_BRS_87AB_879C:

	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	and #$01
	bne L_BRS_87BC_87B0
	lda $4003
	cmp #$5B
	beq L_BRS_87BC_87B7
	dec $4003

L_JMP_87BC_8761:
L_BRS_87BC_87A3:
L_JMP_87BC_87A8:
L_BRS_87BC_87B0:
L_BRS_87BC_87B7:

	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	and #$10
	bne L_BRS_87D5_87C1
	lda $C4
	bmi L_BRS_87D5_87C5
	lda $5A
	bne L_BRS_87D9_87C9
	lda #$01
	sta $5A
	jsr L_JSR_8DA6_87CF
	jmp L_JMP_87D9_87D2

L_BRS_87D5_87C1:
L_BRS_87D5_87C5:

	lda #$00
	sta $5A

L_BRS_87D9_87C9:
L_JMP_87D9_87D2:

	lda $70
	beq L_BRS_87E3_87DB
	jsr L_JSR_8C7F_87DD
	jsr L_JSR_8825_87E0

L_BRS_87E3_87DB:

	jsr L_JSR_88CF_87E3
	jsr L_JSR_8825_87E6
	lda $24
	bne L_BRS_8824_87EB
	lda $70
	bne L_BRS_8824_87EF
	lda $6F
	beq L_BRS_8824_87F3
	bmi L_BRS_87FC_87F5
	dec $6F
	jmp L_JMP_87FE_87F9

L_BRS_87FC_87F5:

	inc $6F

L_JMP_87FE_87F9:

	lda $4083
	cmp $6E
	beq L_BRS_880F_8803

L_BRS_8805_8816:
L_BRS_8805_881D:

	lda $6D
	bne L_BRS_8821_8807
	jsr L_JSR_8A4B_8809
	jmp L_JMP_8824_880C

L_BRS_880F_8803:

	lda $6D
	beq L_BRS_881A_8811
	lda $4103
	bmi L_BRS_8805_8816
	bpl L_BRS_8824_8818

L_BRS_881A_8811:

	lda $4103
	bpl L_BRS_8805_881D
	bmi L_BRS_8824_881F

L_BRS_8821_8807:

	jsr L_JSR_8A05_8821

L_BRS_8824_87EB:
L_BRS_8824_87EF:
L_BRS_8824_87F3:
L_JMP_8824_880C:
L_BRS_8824_8818:
L_BRS_8824_881F:

	rts

L_JSR_8825_87E0:
L_JSR_8825_87E6:

	lda $4003
	sta $4004
	lda $4083
	sta $62
	lda $4103
	bpl L_BRS_8837_8833
	lda #$00

L_BRS_8837_8833:

	sta $63
	lda $6D
	bne L_BRS_8864_883B
	lda #$0F
	sta $73
	lda $62
	sec
	sbc $73
	bcs L_BRS_884A_8846
	dec $63

L_BRS_884A_8846:

	sta $62
	lda $62
	sta $4084
	lda $63
	beq L_BRS_885F_8853
	cmp #$02
	beq L_BRS_885F_8857

L_JMP_8859_8880:

	lda #$01

L_JMP_885B_8861:

	sta $4104
	rts

L_BRS_885F_8853:
L_BRS_885F_8857:
L_BRS_885F_887A:
L_BRS_885F_887E:

	lda #$FF
	jmp L_JMP_885B_8861

L_BRS_8864_883B:

	lda #$17
	sta $73
	lda $62
	clc
	adc $73
	bcc L_BRS_8871_886D
	inc $63

L_BRS_8871_886D:

	sta $62
	lda $62
	sta $4084
	lda $63
	beq L_BRS_885F_887A
	cmp #$02
	beq L_BRS_885F_887E
	jmp L_JMP_8859_8880

L_JSR_8883_84FD:
L_JSR_8883_9406:

	lda $D016                          // Control Register 2
	and #$F8
	ora $12
	sta $D016                          // Control Register 2
	rts

L_JSR_888E_8794:

	lda $6F
	bpl L_BRS_8892_8890

L_BRS_8892_8890:

	lda #$30
	clc
	adc $6F
	sta $6E
	rts

L_JSR_889A_8744:
L_JSR_889A_8B27:
L_JSR_889A_9762:

	lda #$00
	sta $17
	lda #$00
	sta $22
	lda #$04
	sta $23

L_JMP_88A6_88CB:

	ldy #$14

L_BRS_88A8_88AD:

	lda ($27),Y
	sta ($22),Y
	dey
	bpl L_BRS_88A8_88AD
	lda $17
	bne L_BRS_88CE_88B1
	lda $27
	clc
	adc #$2A
	bcc L_BRS_88BC_88B8
	inc $28

L_BRS_88BC_88B8:

	sta $27
	lda $22
	clc
	adc #$40
	bcc L_BRS_88C7_88C3
	inc $23

L_BRS_88C7_88C3:

	sta $22
	inc $17
	jmp L_JMP_88A6_88CB

L_BRS_88CE_88B1:

	rts

L_JSR_88CF_87E3:

	lda $70
	bne L_BRS_8942_88D1

L_JMP_88D3_8958:

	lda $6F
	bne L_BRS_88D8_88D5
	rts

L_BRS_88D8_88D5:
L_BRS_88D8_8944:

	jsr L_JSR_895B_88D8
	lda $6B
	beq L_BRS_88F3_88DD
	lda $12
	cmp $6B
	beq L_BRS_8904_88E3

L_JMP_88E5_88F7:

	lda $6F
	bmi L_BRS_88FA_88E7
	lda $12
	sec
	sbc $6C
	sta $12
	jmp L_JMP_892B_88F0

L_BRS_88F3_88DD:

	lda $12
	beq L_BRS_8904_88F5
	jmp L_JMP_88E5_88F7

L_BRS_88FA_88E7:

	lda $12
	clc
	adc $6C
	sta $12
	jmp L_JMP_892B_8901

L_BRS_8904_88E3:
L_BRS_8904_88F5:

	lda #$01
	sta $C022
	lda $6F
	bmi L_BRS_8934_890B
	lda $12
	sec
	sbc $6C
	and #$07
	sta $12
	inc $66

L_JMP_8918_893F:

	ldx $66
	cpx #$88
	bne L_BRS_8923_891C
	ldx #$01
	jmp L_JMP_8929_8920

L_BRS_8923_891C:

	ldx $66
	bne L_BRS_8929_8925
	ldx #$87

L_JMP_8929_8920:
L_BRS_8929_8925:

	stx $66

L_JMP_892B_88F0:
L_JMP_892B_8901:

	lda $A9
	bne L_BRS_8933_892D
	lda #$00
	sta $6F

L_BRS_8933_892D:

	rts

L_BRS_8934_890B:

	lda $12
	clc
	adc $6C
	and #$07
	sta $12
	dec $66
	jmp L_JMP_8918_893F

L_BRS_8942_88D1:

	lda $6F
	bne L_BRS_88D8_8944
	lda $6D
	bne L_BRS_894F_8948
	inc $6F
	jmp L_JMP_8951_894C

L_BRS_894F_8948:

	dec $6F

L_JMP_8951_894C:

	lda #$02
	sta $6C
	jsr L_JSR_8CF4_8955
	jmp L_JMP_88D3_8958

L_JSR_895B_88D8:

	ldx #$0B

L_BRS_895D_899E:

	lda $4687,X
	cmp #$80
	beq L_BRS_898F_8962
	lda $4087,X
	sta $27
	lda $4107,X
	bpl L_BRS_8970_896C
	lda #$00

L_BRS_8970_896C:

	sta $28
	lda $6F
	bpl L_BRS_8984_8974
	lda $27
	clc
	adc $6C
	bcc L_BRS_897F_897B
	inc $28

L_BRS_897F_897B:

	sta $27
	jmp L_JMP_898F_8981

L_BRS_8984_8974:

	lda $27
	sec
	sbc $6C
	bcs L_BRS_898D_8989
	dec $28

L_BRS_898D_8989:

	sta $27

L_BRS_898F_8962:
L_JMP_898F_8981:

	lda $27
	sta $4087,X
	lda $28
	bne L_BRS_899A_8996
	lda #$FF

L_BRS_899A_8996:

	sta $4107,X
	dex
	bne L_BRS_895D_899E
	rts

L_JSR_89A1_8199:
L_JSR_89A1_819C:
L_JSR_89A1_81A2:
L_JSR_89A1_81A5:
L_JSR_89A1_81AB:
L_JSR_89A1_81AE:
L_JSR_89A1_81B4:
L_JSR_89A1_81B7:

	ldy #$00

L_BRS_89A3_89AB:

	lda $09F0,Y
	sta ($68),Y
	iny
	cpy #$88
	bne L_BRS_89A3_89AB
	lda $68
	clc
	adc #$88
	bcc L_BRS_89B6_89B2
	inc $69

L_BRS_89B6_89B2:

	sta $68
	rts

L_JSR_89B9_8196:
L_JSR_89B9_819F:
L_JSR_89B9_81A8:
L_JSR_89B9_81B1:

	ldx #$08
	lda #$00
	sta $17

L_BRS_89BF_89F7:
L_JMP_89BF_8A01:

	lda $09EF,X
	rol
	rol $0A6F,X
	rol $0A67,X
	rol $0A5F,X
	rol $0A57,X
	rol $0A4F,X
	rol $0A47,X
	rol $0A3F,X
	rol $0A37,X
	rol $0A2F,X
	rol $0A27,X
	rol $0A1F,X
	rol $0A17,X
	rol $0A0F,X
	rol $0A07,X
	rol $09FF,X
	rol $09F7,X
	rol $09EF,X
	dex
	bne L_BRS_89BF_89F7
	lda $17
	bne L_BRS_8A04_89FB
	inc $17
	ldx #$08
	jmp L_JMP_89BF_8A01

L_BRS_8A04_89FB:

	rts

L_JSR_8A05_870C:
L_JSR_8A05_8821:
L_JSR_8A05_8CA5:

	jsr L_JSR_8A16_8A05
	lda $27
	clc
	adc #$01
	bcc L_BRS_8A11_8A0D
	inc $28

L_BRS_8A11_8A0D:

	sta $27
	jmp L_JMP_8A25_8A13

L_JSR_8A16_8A05:
L_JSR_8A16_8A4B:

	lda $4083
	sta $27
	lda $4103
	bpl L_BRS_8A22_8A1E
	lda #$00

L_BRS_8A22_8A1E:

	sta $28
	rts

L_JMP_8A25_8A13:
L_JMP_8A25_8A59:

	lda $27
	sta $4083
	lda $28
	beq L_BRS_8A3D_8A2C
	lda $27
	cmp #$31
	bcc L_BRS_8A37_8A32
	jsr L_JSR_8A5C_8A34

L_BRS_8A37_8A32:

	lda #$01

L_JMP_8A39_8A48:

	sta $4103
	rts

L_BRS_8A3D_8A2C:

	lda $27
	cmp #$30
	bcs L_BRS_8A46_8A41
	jsr L_JSR_8A5C_8A43

L_BRS_8A46_8A41:

	lda #$FF
	jmp L_JMP_8A39_8A48

L_JSR_8A4B_8791:
L_JSR_8A4B_8809:
L_JSR_8A4B_8CAB:

	jsr L_JSR_8A16_8A4B
	lda $27
	sec
	sbc #$01
	bcs L_BRS_8A57_8A53
	dec $28

L_BRS_8A57_8A53:

	sta $27
	jmp L_JMP_8A25_8A59

L_JSR_8A5C_8A34:
L_JSR_8A5C_8A43:

	lda #$01
	sta $A9
	lda #$00
	sta $6C
	sta $6F
	lda #$30
	sta $4083
	sta $6E
	rts

L_JSR_8A6E_8425:

	lda #$02
	sta $D025                          // Sprite Multi-Color Register 0
	lda #$07
	sta $D026                          // Sprite Multi-Color Register 1
	lda #$FF
	sta $D01C                          // Sprites Multi-Color Mode Select
	sta $D015                          // Sprite display Enable
	lda #$01
	sta $22
	lda #$40
	sta $23
	ldx #$08
	lda #$FF
	jsr L_JSR_8D14_8A8C
	lda #$81
	sta $22
	lda #$46
	sta $23
	ldx #$01
	lda #$80
	jsr L_JSR_8D14_8A9B
	lda #$01
	sta $22
	lda #$44
	sta $23
	ldx #$01
	lda #$00
	jsr L_JSR_8D14_8AAA
	lda #$F5
	sta $4081
	lda #$F9
	sta $4082
	lda #$92
	sta $4101
	lda #$84
	sta $4102
	lda #$85
	sta $27
	lda #$BC
	sta $28
	lda #$01
	sta $22
	lda #$40
	sta $23
	ldx #$F6
	jsr L_JSR_8D6D_8AD3
	lda #$8F
	sta $27
	lda #$BC
	sta $28
	lda #$83
	sta $22
	lda #$40
	sta $23
	ldx #$F8
	jsr L_JSR_8D6D_8AE8
	lda #$97
	sta $27
	lda #$BC
	sta $28
	lda #$83
	sta $22
	lda #$41
	sta $23
	ldx #$FA
	jsr L_JSR_8D6D_8AFD
	lda #$9D
	sta $27
	lda #$BC
	sta $28
	lda #$03
	sta $22
	lda #$42
	sta $23
	ldx #$FB
	jsr L_JSR_8D6D_8B12
	lda #$00
	sta $6D
	sta $70
	sta $75
	sta $C4
	lda #$AF
	sta $27
	lda #$B7
	sta $28
	jsr L_JSR_889A_8B27
	jsr L_JSR_92C5_8B2A
	rts

L_JSR_8B2E_84A4:
L_JSR_8B2E_9598:
L_JSR_8B2E_A8C0:

	ldx $66
	ldy #$27
	lda #$00

L_BRS_8B34_8B61:

	sta $3BC0,Y
	sta $3A80,Y
	sta $3A58,Y
	sta $3A30,Y
	sta $3A08,Y
	sta $39E0,Y
	sta $39B8,Y
	sta $3990,Y
	sta $3968,Y
	sta $3940,Y
	sta $3918,Y
	sta $38F0,Y
	sta $38C8,Y
	dex
	bne L_BRS_8B60_8B5C
	ldx #$87

L_BRS_8B60_8B5C:

	dey
	bpl L_BRS_8B34_8B61
	rts

L_JSR_8B64_8461:
L_JSR_8B64_9F00:

	lda #$C8
	sta $22
	lda #$D8
	sta $23
	lda #$7A
	sta $27
	lda #$8B
	sta $28
	ldx #$F2
	jsr L_JSR_8D6D_8B76
	rts

	.byte $FF,$0D,$FF,$0D,$FF,$0D,$FF,$0D
	.byte $FF,$0D,$FF,$0D,$A6,$0D

L_BRS_8B88_8B90:

	jmp L_JMP_8C1B_8B88

L_JSR_8B8B_98B3:

	ldy #$64

L_JMP_8B8D_8C23:

	lda $5002,Y
	beq L_BRS_8B88_8B90
	sei
	lda #$E0
	sta $16
	lda #$08
	sta $17
	lda $5000,Y
	sec
	sbc #$30
	sec
	sbc $66
	cmp #$88
	bcc L_BRS_8BAB_8BA6
	sec
	sbc #$78

L_BRS_8BAB_8BA6:

	lsr
	sta $51
	and #$FC
	sta $52
	lda $51
	sec
	sbc $52
	sta $C029
	lda $5001,Y
	sec
	sbc #$02
	and #$F8
	sta $54
	lsr
	lsr
	lsr
	sta $53
	tax
	beq L_BRS_8BDA_8BCA

L_BRS_8BCC_8BD8:

	lda $16
	clc
	adc #$88
	bcc L_BRS_8BD5_8BD1
	inc $17

L_BRS_8BD5_8BD1:

	sta $16
	dex
	bne L_BRS_8BCC_8BD8

L_BRS_8BDA_8BCA:

	asl $52
	lda $16
	clc
	adc $52
	bcc L_BRS_8BE5_8BE1
	inc $17

L_BRS_8BE5_8BE1:

	sta $16
	lda $5001,Y
	sec
	sbc #$02
	sec
	sbc $54
	sta $54
	lda $16
	clc
	adc $54
	bcc L_BRS_8BFB_8BF7
	inc $17

L_BRS_8BFB_8BF7:

	sta $16
	lda $17
	cmp #$0B
	bcc L_BRS_8C0D_8C01
	jmp L_JMP_8C1B_8C03

	cmp #$08
	bcs L_BRS_8C0D_8C08
	jmp L_JMP_8C1B_8C0A

L_BRS_8C0D_8C01:
L_BRS_8C0D_8C08:

	sta $5081,Y
	lda $16
	sta $5080,Y
	lda $C029
	sta $5103,Y

L_JMP_8C1B_8B88:
L_JMP_8C1B_8C03:
L_JMP_8C1B_8C0A:

	cli
	dey
	dey
	dey
	dey
	bne L_BRS_8C23_8C20
	rts

L_BRS_8C23_8C20:

	jmp L_JMP_8B8D_8C23

L_JSR_8C26_845B:
L_JSR_8C26_84C5:

	lda $4003
	sec
	sbc #$32
	lsr
	lsr
	lsr
	clc
	adc #$37
	sta $4005
	lda $4083
	sta $C0
	lda $4103
	bpl L_BRS_8C41_8C3D
	lda #$00

L_BRS_8C41_8C3D:

	sta $C1
	lda $C0
	sec
	sbc #$18
	bcs L_BRS_8C4C_8C48
	dec $C1

L_BRS_8C4C_8C48:

	sta $C0
	lsr $C1
	ror $C0
	lsr $C0
	lsr $C0
	lda $C0
	clc
	adc #$A0
	sta $4085
	rts

L_JSR_8C5F_849B:

	sei
	lda #$FE
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	and #$20
	bne L_BRS_8C74_8C6A
	lda #$00
	sta $D418                          // Select Filter Mode and Volume
	jmp L_JMP_825D_8C71

L_BRS_8C74_8C6A:

	cli
	rts

L_BRS_8C76_8C94:

	lda $6F
	and #$F0
	sta $6F
	jmp L_JMP_8CA1_8C7C

L_JSR_8C7F_87DD:

	lda #$00
	sta $17

L_BRS_8C83_8CB8:

	lda $4083
	cmp $6E
	beq L_BRS_8CC0_8C88

L_JMP_8C8A_8CC9:
L_BRS_8C8A_8CCF:

	lda $6F
	beq L_BRS_8CA1_8C8C
	cmp #$D1
	bcs L_BRS_8C96_8C90
	cmp #$30
	bcs L_BRS_8C76_8C94

L_BRS_8C96_8C90:

	cmp #$00
	bmi L_BRS_8C9F_8C98
	dec $6F
	jmp L_JMP_8CA1_8C9C

L_BRS_8C9F_8C98:

	inc $6F

L_JMP_8CA1_8C7C:
L_BRS_8CA1_8C8C:
L_JMP_8CA1_8C9C:

	lda $6D
	beq L_BRS_8CAB_8CA3
	jsr L_JSR_8A05_8CA5
	jmp L_JMP_8CAE_8CA8

L_BRS_8CAB_8CA3:

	jsr L_JSR_8A4B_8CAB

L_JMP_8CAE_8CA8:

	lda #$01
	sta $70
	inc $17
	lda $17
	cmp #$02
	bne L_BRS_8C83_8CB8
	rts

L_BRS_8CBB_8CC7:
L_JMP_8CBB_8CD1:

	lda #$00
	sta $70
	rts

L_BRS_8CC0_8C88:

	lda $6D
	bne L_BRS_8CCC_8CC2
	lda $4103
	bmi L_BRS_8CBB_8CC7
	jmp L_JMP_8C8A_8CC9

L_BRS_8CCC_8CC2:

	lda $4103
	bmi L_BRS_8C8A_8CCF
	jmp L_JMP_8CBB_8CD1

L_JSR_8CD4_86CC:

	lda #$00
	sta $6C
	lda $6F
	beq L_BRS_8D13_8CDA
	bpl L_BRS_8CE3_8CDC
	lda #$00
	sec
	sbc $6F

L_BRS_8CE3_8CDC:

	sta $A9
	lda #$02
	sta $6C
	lda $A9
	sec
	sbc #$30
	bcc L_BRS_8CF4_8CEE
	lda #$04
	sta $6C

L_JSR_8CF4_8955:
L_BRS_8CF4_8CEE:

	lda $6F
	bpl L_BRS_8D07_8CF6
	lda $12

L_BRS_8CFA_8CFF:

	clc
	adc $6C
	cmp #$08
	bcc L_BRS_8CFA_8CFF
	sec
	sbc $6C
	jmp L_JMP_8D11_8D04

L_BRS_8D07_8CF6:

	lda $12

L_BRS_8D09_8D0C:

	sec
	sbc $6C
	bcs L_BRS_8D09_8D0C
	clc
	adc $6C

L_JMP_8D11_8D04:

	sta $6B

L_BRS_8D13_8CDA:

	rts

L_JSR_8D14_8053:
L_JSR_8D14_8062:
L_JSR_8D14_8071:
L_JSR_8D14_813D:
L_JSR_8D14_814C:
L_JSR_8D14_8298:
L_JSR_8D14_82A7:
L_JSR_8D14_8A8C:
L_JSR_8D14_8A9B:
L_JSR_8D14_8AAA:

	ldy #$00

L_BRS_8D16_8D19:
L_BRS_8D16_8D1E:

	sta ($22),Y
	iny
	bne L_BRS_8D16_8D19
	inc $23
	dex
	bne L_BRS_8D16_8D1E
	rts

L_JSR_8D21_8119:
L_JSR_8D21_812E:
L_JSR_8D21_8161:

	ldy #$00

L_BRS_8D23_8D28:
L_JMP_8D23_8D31:

	lda ($27),Y
	sta ($22),Y
	iny
	bne L_BRS_8D23_8D28
	dex
	beq L_BRS_8D34_8D2B
	inc $28
	inc $23
	jmp L_JMP_8D23_8D31

L_BRS_8D34_8D2B:

	rts

L_JSR_8D35_8414:

	ldx #$00
	ldy #$00

L_BRS_8D39_8D4E:

	lda $B6F5,Y
	bmi L_BRS_8D51_8D3C
	sty $62
	ldy #$00
	sta ($64),Y
	ldy $62
	inc $64
	bne L_BRS_8D4C_8D48
	inc $65

L_BRS_8D4C_8D48:
L_JMP_8D4C_8D6A:

	iny
	inx
	bne L_BRS_8D39_8D4E
	rts

L_BRS_8D51_8D3C:

	sty $62
	stx $73
	and #$7F
	tax

L_BRS_8D58_8D64:

	lda #$00
	tay
	sta ($64),Y
	inc $64
	bne L_BRS_8D63_8D5F
	inc $65

L_BRS_8D63_8D5F:

	dex
	bne L_BRS_8D58_8D64
	ldx $73
	ldy $62
	jmp L_JMP_8D4C_8D6A

L_JSR_8D6D_8086:
L_JSR_8D6D_809B:
L_JSR_8D6D_80B0:
L_JSR_8D6D_80C5:
L_JSR_8D6D_80DA:
L_JSR_8D6D_80EF:
L_JSR_8D6D_8104:
L_JSR_8D6D_8176:
L_JSR_8D6D_818B:
L_JSR_8D6D_8270:
L_JSR_8D6D_8285:
L_JSR_8D6D_8315:
L_JSR_8D6D_832A:
L_JSR_8D6D_8AD3:
L_JSR_8D6D_8AE8:
L_JSR_8D6D_8AFD:
L_JSR_8D6D_8B12:
L_JSR_8D6D_8B76:
L_JSR_8D6D_8FBB:
L_JSR_8D6D_8FD0:
L_JSR_8D6D_8FE5:
L_JSR_8D6D_9792:
L_JSR_8D6D_9EF0:
L_JSR_8D6D_9FA6:
L_JSR_8D6D_A1D3:
L_JSR_8D6D_A1F4:

	ldy #$00
	sty $62

L_BRS_8D71_8D84:

	ldy $62
	lda ($27),Y
	bmi L_BRS_8D87_8D75
	ldy #$00
	sta ($22),Y
	inc $22
	bne L_BRS_8D81_8D7D
	inc $23

L_BRS_8D81_8D7D:
L_JMP_8D81_8DA3:

	inc $62
	inx
	bne L_BRS_8D71_8D84

L_BRS_8D86_8DA1:

	rts

L_BRS_8D87_8D75:

	stx $73
	and #$7F
	tax
	iny
	lda ($27),Y

L_BRS_8D8F_8D9A:

	ldy #$00
	sta ($22),Y
	inc $22
	bne L_BRS_8D99_8D95
	inc $23

L_BRS_8D99_8D95:

	dex
	bne L_BRS_8D8F_8D9A
	inc $62
	ldx $73
	inx
	beq L_BRS_8D86_8DA1
	jmp L_JMP_8D81_8DA3

L_JSR_8DA6_87CF:

	ldx #$01

L_BRS_8DA8_8DB8:

	stx $AA
	asl $AA
	asl $AA
	ldy $AA
	lda $C000,Y
	beq L_BRS_8DBB_8DB3
	dex
	cpx #$FF
	bne L_BRS_8DA8_8DB8

L_JMP_8DBA_8E4D:

	rts

L_BRS_8DBB_8DB3:

	stx $62
	sty $63
	lda $4083
	sta $27
	lda $4103
	bpl L_BRS_8DCB_8DC7
	lda #$00

L_BRS_8DCB_8DC7:

	sta $28
	lda $27
	sec
	sbc #$18
	bcs L_BRS_8DD6_8DD2
	dec $28

L_BRS_8DD6_8DD2:

	sta $27
	lsr $28
	ror $27
	lsr $27
	lsr $27
	lda $27
	ldx $6D
	bne L_BRS_8DE9_8DE4
	clc
	adc #$03

L_BRS_8DE9_8DE4:

	ldy $AA
	sta $C001,Y
	lda $4003
	sec
	sbc #$32
	sta $74
	lsr
	lsr
	lsr
	sta $C010,Y
	asl
	asl
	asl
	sta $73
	lda $74
	sec
	sbc $73
	clc
	adc #$05
	cmp #$08
	bcs L_BRS_8E50_8E0B

L_JMP_8E0D_8E59:

	and #$07
	sta $C002,Y
	lda $6D
	sta $C003,Y
	lda #$05
	sta $C000,Y
	ldx $C010,Y
	lda #$00
	sta $64
	lda #$38
	sta $65

L_BRS_8E27_8E33:

	lda $64
	clc
	adc #$28
	bcc L_BRS_8E30_8E2C
	inc $65

L_BRS_8E30_8E2C:

	sta $64
	dex
	bne L_BRS_8E27_8E33
	lda $64
	sta $C010,Y
	lda $65
	sta $C011,Y
	lda #$00
	sta $C012,Y
	ldx $62
	ldy $63
	lda #$04
	jsr L_JSR_AC2E_8E4A
	jmp L_JMP_8DBA_8E4D

L_BRS_8E50_8E0B:

	lda $C010,Y
	clc
	adc #$01
	sta $C010,Y
	jmp L_JMP_8E0D_8E59

L_JSR_8E5C_825A:
L_JSR_8E5C_84CB:

	lda #$00
	sta $4B
	lda #$0E
	sta $4C
	lda #$00
	sta $4D
	lda #$C0
	sta $4E

L_BRS_8E6C_8EC3:

	ldy #$02
	lda ($4D),Y
	tax
	beq L_BRS_8E76_8E71
	jsr L_JSR_8EC6_8E73

L_BRS_8E76_8E71:

	lda #$04
	sta $14
	lda #$AA
	ldy #$00
	sta ($4B),Y
	inc $4B
	bne L_BRS_8E86_8E82
	inc $4C

L_BRS_8E86_8E82:

	ldx #$07
	jsr L_JSR_8EC6_8E88
	ldy #$00

L_BRS_8E8D_8E9E:

	lda #$AA
	sta ($4B),Y
	inc $4B
	bne L_BRS_8E97_8E93
	inc $4C

L_BRS_8E97_8E93:

	ldx #$07
	jsr L_JSR_8EC6_8E99
	dec $14
	bne L_BRS_8E8D_8E9E
	lda #$0B
	sta $14

L_BRS_8EA4_8EB8:

	jsr L_JSR_A2E7_8EA4
	ldy #$00
	sta ($4B),Y
	inc $4B
	bne L_BRS_8EB1_8EAD
	inc $4C

L_BRS_8EB1_8EAD:

	ldx #$07
	jsr L_JSR_8EC6_8EB3
	dec $14
	bne L_BRS_8EA4_8EB8
	lda $4D
	clc
	adc #$04
	sta $4D
	cmp #$08
	bne L_BRS_8E6C_8EC3
	rts

L_JSR_8EC6_8E73:
L_JSR_8EC6_8E88:
L_JSR_8EC6_8E99:
L_JSR_8EC6_8EB3:
L_BRS_8EC6_8ED2:

	lda #$00
	tay
	sta ($4B),Y
	inc $4B
	bne L_BRS_8ED1_8ECD
	inc $4C

L_BRS_8ED1_8ECD:

	dex
	bne L_BRS_8EC6_8ED2
	rts

L_JSR_8ED5_94C5:

	ldx #$01

L_BRS_8ED7_8EE7:

	stx $AA
	asl $AA
	asl $AA
	ldy $AA
	lda $C000,Y
	bne L_BRS_8EEA_8EE2

L_JMP_8EE4_8FA6:

	dex
	cpx #$FF
	bne L_BRS_8ED7_8EE7
	rts

L_BRS_8EEA_8EE2:

	cmp #$10
	bcc L_BRS_8EF3_8EEC
	lda #$10
	sta $C000,Y

L_BRS_8EF3_8EEC:

	stx $74
	sty $63
	lda $C011,Y
	sta $65
	lda $C010,Y
	clc
	adc $C001,Y
	bcc L_BRS_8F07_8F03
	inc $65

L_BRS_8F07_8F03:

	sta $64
	ldx $63
	ldy $C000,X
	lda $C012,X
	clc
	adc #$C0
	asl $AA
	asl $AA
	clc
	adc $AA
	sta $17
	lda $C003,X
	bne L_BRS_8F4F_8F20
	lda $65
	cmp #$38
	bcc L_BRS_8F3C_8F26
	cmp #$3F
	bcc L_BRS_8F36_8F2A
	cmp #$40
	bcs L_BRS_8F3C_8F2E
	lda $64
	cmp #$E8
	bcs L_BRS_8F3C_8F34

L_BRS_8F36_8F2A:
L_BRS_8F36_8F3D:

	lda $17
	sta ($64),Y
	inc $17

L_BRS_8F3C_8F26:
L_BRS_8F3C_8F2E:
L_BRS_8F3C_8F34:

	dey
	bne L_BRS_8F36_8F3D
	lda $C001,X
	clc
	adc $C000,X
	cmp #$27
	bcs L_BRS_8F94_8F48
	inc $C001,X
	bne L_BRS_8F8D_8F4D

L_BRS_8F4F_8F20:

	sty $73
	lda $64
	sec
	sbc $73
	bcs L_BRS_8F5A_8F56
	dec $65

L_BRS_8F5A_8F56:

	sta $64
	ldy #$00
	lda $65
	cmp #$38
	bcc L_BRS_8F78_8F62
	cmp #$3F
	bcc L_BRS_8F72_8F66
	cmp #$40
	bcs L_BRS_8F78_8F6A
	lda $64
	cmp #$E8
	bcs L_BRS_8F78_8F70

L_BRS_8F72_8F66:
L_BRS_8F72_8F7B:

	lda $17
	sta ($64),Y
	inc $17

L_BRS_8F78_8F62:
L_BRS_8F78_8F6A:
L_BRS_8F78_8F70:

	iny
	cpy $73
	bne L_BRS_8F72_8F7B
	lda $C001,X
	sec
	sbc $C000,X
	cmp #$01
	bcc L_BRS_8F94_8F86
	bmi L_BRS_8F94_8F88
	dec $C001,X

L_BRS_8F8D_8F4D:

	ldx $63
	lda $C012,X
	beq L_BRS_8F9F_8F92

L_BRS_8F94_8F48:
L_BRS_8F94_8F86:
L_BRS_8F94_8F88:

	ldx $63
	inc $C012,X
	dec $C000,X
	jmp L_JMP_8FA2_8F9C

L_BRS_8F9F_8F92:

	inc $C000,X

L_JMP_8FA2_8F9C:

	ldy $63
	ldx $74
	jmp L_JMP_8EE4_8FA6

L_JSR_8FA9_81BF:

	lda #$CF
	sta $27
	lda #$90
	sta $28
	lda #$00
	sta $22
	lda #$0C
	sta $23
	ldx #$27
	jsr L_JSR_8D6D_8FBB
	lda #$30
	sta $27
	lda #$90
	sta $28
	lda #$00
	sta $22
	lda #$38
	sta $23
	ldx #$61
	jsr L_JSR_8D6D_8FD0
	lda #$1E
	sta $27
	lda #$90
	sta $28
	lda #$00
	sta $22
	lda #$D8
	sta $23
	ldx #$EE
	jsr L_JSR_8D6D_8FE5
	lda #$07
	sta $D022                          // Background Color 1, Multi-Color Register 0
	lda #$02
	sta $D023                          // Background Color 2, Multi-Color Register 1
	lda #$FE
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda #$0C
	sta $51
	ldx #$01

L_BRS_8FFD_9010:
L_BRS_8FFD_9016:

	txa
	sta $D022                          // Background Color 1, Multi-Color Register 0
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	cmp #$EF
	beq L_BRS_9018_9006
	lda #$CC
	jsr L_JSR_9F07_900A
	inx
	cpx #$08
	bcc L_BRS_8FFD_9010
	ldx #$01
	dec $51
	bne L_BRS_8FFD_9016

L_BRS_9018_9006:

	lda #$07
	sta $D022                          // Background Color 1, Multi-Color Register 0
	rts

	.byte $FF,$01,$FF,$01,$CE,$01,$FF,$0D
	.byte $FF,$01,$FF,$01,$FF,$01,$FF,$01
	.byte $A1,$01,$FF,$00,$FF,$00,$CF,$00
	.byte $81,$80,$81,$81,$81,$82,$81,$83
	.byte $81,$84,$81,$85,$81,$86,$81,$87
	.byte $81,$88,$81,$89,$81,$8A,$81,$8B
	.byte $81,$8C,$9B,$00,$81,$8D,$81,$8E
	.byte $81,$8F,$81,$90,$81,$91,$81,$92
	.byte $81,$93,$81,$94,$81,$95,$81,$96
	.byte $81,$97,$81,$98,$81,$99,$81,$9A
	.byte $99,$00,$81,$A2,$81,$9B,$81,$9C
	.byte $81,$9B,$81,$9D,$81,$9E,$81,$9B
	.byte $81,$9F,$81,$A0,$81,$9C,$81,$9B
	.byte $81,$9D,$81,$A1,$81,$A0,$81,$9F
	.byte $FF,$00,$FF,$00,$8C,$00,$7C,$00
	.byte $09,$11,$10,$08,$00,$78,$6A,$6D
	.byte $6D,$6A,$62,$6E,$74,$C0,$00,$7C
	.byte $00,$09,$11,$10,$0B,$00,$62,$75
	.byte $62,$73,$6A,$00,$6A,$6F,$64,$60
	.byte $BE,$00,$62,$6D,$6D,$00,$73,$6A
	.byte $68,$69,$75,$74,$00,$73,$66,$74
	.byte $66,$73,$77,$66,$65,$FF,$00,$83
	.byte $00,$00,$00,$84,$01,$05,$05,$84
	.byte $55,$69,$69,$65,$81,$A5,$83,$45
	.byte $81,$A5,$84,$95,$83,$54,$56,$81
	.byte $AA,$81,$A9,$59,$59,$84,$55,$5A
	.byte $5A,$55,$55,$83,$45,$65,$81,$A5
	.byte $83,$95,$84,$54,$82,$A8,$58,$58
	.byte $83,$50,$83,$54,$55,$55,$83,$45
	.byte $84,$65,$59,$83,$54,$56,$82,$A6
	.byte $82,$A5,$84,$55,$56,$81,$96,$82
	.byte $95,$83,$45,$65,$82,$A9,$59,$59
	.byte $83,$54,$55,$83,$A5,$81,$A9,$05
	.byte $15,$16,$16,$15,$55,$55,$55,$82
	.byte $A6,$82,$96,$5A,$83,$59,$81,$95
	.byte $55,$56,$56,$84,$55,$69,$69,$82
	.byte $A9,$69,$83,$65,$55,$55,$85,$6A
	.byte $81,$A0,$82,$95,$82,$96,$15,$83
	.byte $55,$50,$50,$82,$A0,$84,$54,$55
	.byte $55,$84,$59,$5A,$5A,$88,$59,$84
	.byte $69,$84,$55,$85,$95,$81,$A5,$65
	.byte $65,$59,$59,$81,$A9,$81,$AA,$84
	.byte $56,$83,$69,$55,$55,$59,$59,$5A
	.byte $40,$40,$00,$00,$40,$40,$50,$50
	.byte $55,$55,$86,$AA,$59,$59,$83,$AA
	.byte $83,$A2,$65,$65,$83,$AA,$83,$8A
	.byte $82,$A0,$83,$80,$83,$00,$54,$54
	.byte $86,$A8,$5A,$52,$83,$A2,$83,$A0
	.byte $56,$56,$83,$AA,$83,$A8,$82,$01
	.byte $86,$02

L_JSR_91A8_848F:

	lda $C000
	bne L_BRS_91B3_91AB
	lda $C004
	bne L_BRS_91B3_91B0
	rts

L_BRS_91B3_91AB:
L_BRS_91B3_91B0:

	ldy #$00

L_JMP_91B5_91F2:

	lda $C010,Y
	sta $C0
	lda $C011,Y
	sec
	sbc #$38
	sta $C1
	ldx #$01

L_JMP_91C4_91DA:

	lda $C1
	bne L_BRS_91CE_91C6
	lda $C0
	cmp #$28
	bcc L_BRS_91DD_91CC

L_BRS_91CE_91C6:

	lda $C0
	sec
	sbc #$28
	bcs L_BRS_91D7_91D3
	dec $C1

L_BRS_91D7_91D3:

	sta $C0
	inx
	jmp L_JMP_91C4_91DA

L_BRS_91DD_91CC:

	txa
	asl
	asl
	asl
	clc
	adc #$22
	adc $C002,Y
	sta $0038,Y
	cpy #$04
	beq L_BRS_91F5_91EC
	iny
	iny
	iny
	iny
	jmp L_JMP_91B5_91F2

L_BRS_91F5_91EC:

	ldy #$00

L_JMP_91F7_9216:

	lda $C001,Y
	ldx $C003,Y
	beq L_BRS_9206_91FD
	sec
	sbc $C000,Y
	clc
	adc #$03

L_BRS_9206_91FD:

	clc
	adc #$01
	asl
	asl
	sta $0039,Y
	cpy #$04
	beq L_BRS_9219_9210
	iny
	iny
	iny
	iny
	jmp L_JMP_91F7_9216

L_BRS_9219_9210:

	sei
	ldy #$0B

L_BRS_921C_928A:

	ldx #$00

L_JMP_921E_9286:

	lda $4007,Y
	beq L_BRS_9289_9221
	lda $4207,Y
	cmp #$1E
	bcs L_BRS_9289_9228
	cmp #$13
	bcc L_BRS_9289_922C
	lda $4107,Y
	bpl L_BRS_9235_9231
	lda #$00

L_BRS_9235_9231:

	sta $C1
	lda $4087,Y
	sta $C0
	ror $C1
	ror $C0
	lda $4007,Y
	sec
	sbc $38,X
	cmp #$09
	bcs L_BRS_927E_9248
	lda $C0
	sec
	sbc $39,X
	cmp #$1C
	bcs L_BRS_927E_9251
	lda $4207,Y
	cmp #$13
	beq L_BRS_928E_9258

L_JMP_925A_929C:

	lda $4207,Y
	bpl L_BRS_9261_925D
	lda #$14

L_BRS_9261_925D:

	sta $4387,Y
	lda #$A0
	sta $4207,Y
	lda #$01
	sta $4787,Y
	lda #$00
	sta $C000,X
	sta $C001,X
	sta $C002,X
	sta $C003,X
	cli
	rts

L_BRS_927E_9248:
L_BRS_927E_9251:
L_BRS_927E_929A:

	cpx #$04
	beq L_BRS_9289_9280
	inx
	inx
	inx
	inx
	jmp L_JMP_921E_9286

L_BRS_9289_9221:
L_BRS_9289_9228:
L_BRS_9289_922C:
L_BRS_9289_9280:

	dey
	bne L_BRS_921C_928A
	cli
	rts

L_BRS_928E_9258:

	stx $14
	ldx $4487,Y
	lda $5083,X
	ldx $14
	cmp #$04
	beq L_BRS_927E_929A
	jmp L_JMP_925A_929C

L_JSR_929F_82EB:
L_JSR_929F_94CD:
L_JSR_929F_958F:
L_JSR_929F_A072:
L_JSR_929F_A979:

	ldx #$04
	lda #$00

L_BRS_92A3_92B3:

	sta $C000,X
	sta $C001,X
	sta $C002,X
	sta $C003,X
	dex
	dex
	dex
	dex
	bpl L_BRS_92A3_92B3
	rts

L_JSR_92B6_867F:
L_JSR_92B6_869B:
L_JSR_92B6_A897:
L_JSR_92B6_A972:

	lda #$FF
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	cmp #$FF
	beq L_BRS_92C4_92C0
	lda #$01

L_BRS_92C4_92C0:

	rts

L_JSR_92C5_8B2A:

	lda #$12
	sta $87
	lda #$FF
	sta $4601
	lda #$00
	sta $86
	sta $95
	sta $88
	sta $4581
	tax

L_BRS_92DA_92E7:

	dex
	txa
	inx
	sta $4281,X
	inx
	txa
	sta $4300,X
	cmp $87
	bmi L_BRS_92DA_92E7
	lda #$FF
	sta $4300,X
	rts
	jmp L_JMP_9492_92EF
	jmp L_JMP_954B_92F2

L_JMP_92F5_94B1:
L_JSR_92F5_952A:

	sei
	lda #$00
	sta $88
	lda $95
	sta $86
	ldx #$0B

L_BRS_9300_9329:

	lda #$FF
	sta $4501,X
	sta $4514,X
	lda $4407,X
	cmp #$F0
	bne L_BRS_9328_930D
	lda #$1F
	sta $4387,X
	sta $4207,X
	lda #$00
	sta $4407,X
	sta $4487,X
	sta $4187,X
	sta $4007,X
	sta $4087,X

L_BRS_9328_930D:

	dex
	bne L_BRS_9300_9329
	ldx $86
	stx $91

L_JMP_932F_9343:
L_JMP_932F_93CC:

	ldy $4301,X
	cpy #$FF
	bne L_BRS_9339_9334
	jmp L_JMP_93CF_9336

L_BRS_9339_9334:

	lda $4001,Y
	cmp $4001,X
	bcc L_BRS_9346_933F
	tya
	tax
	jmp L_JMP_932F_9343

L_BRS_9346_933F:

	stx $91
	sty $92
	sty $93
	ldx $93

L_JMP_934E_935F:

	ldy $4301,X
	cpy #$FF
	beq L_BRS_9362_9353
	lda $4001,X
	cmp $4001,Y
	bne L_BRS_9362_935B
	tya
	tax
	jmp L_JMP_934E_935F

L_BRS_9362_9353:
L_BRS_9362_935B:

	stx $93
	ldx $91
	stx $94

L_JMP_9368_9378:

	ldx $94
	ldy $4281,X
	cpy #$FF
	beq L_BRS_937B_936F
	cmp $4001,X
	bcs L_BRS_937B_9374
	sty $94
	jmp L_JMP_9368_9378

L_BRS_937B_936F:
L_BRS_937B_9374:

	ldx $93
	lda $4301,X
	ldy $91
	sta $4301,Y
	tax
	cpx #$FF
	beq L_BRS_9391_9388
	tya
	sta $4281,X
	jmp L_JMP_9393_938E

L_BRS_9391_9388:

	sty $87

L_JMP_9393_938E:

	ldx $93
	lda $4001,X
	ldy $94
	cmp $4001,Y
	bcc L_BRS_93BB_939D
	lda $4301,Y
	sta $4301,X
	lda $92
	sta $4301,Y
	txa
	ldy $4301,X
	sta $4281,Y
	lda $94
	ldy $92
	sta $4281,Y
	jmp L_JMP_93CC_93B8

L_BRS_93BB_939D:

	tya
	sta $4301,X
	txa
	sta $4281,Y
	lda #$FF
	ldx $92
	sta $4281,X
	stx $86

L_JMP_93CC_93B8:

	jmp L_JMP_932F_93CC

L_JMP_93CF_9336:

	lda $86
	sta $95
	ldx $86

L_JMP_93D5_93DF:

	lda $4001,X
	bne L_BRS_93E2_93D8
	ldy $4301,X
	tya
	tax
	jmp L_JMP_93D5_93DF

L_BRS_93E2_93D8:

	stx $86
	inc.a $0032
	inc $BE
	bne L_BRS_93ED_93E9
	inc $BF

L_BRS_93ED_93E9:

	lda $BF
	cmp $2F
	bne L_BRS_93F7_93F1
	lda #$01
	sta $BF

L_BRS_93F7_93F1:

	lda $12
	sta $11
	lda #$00
	sta $12
	sta $85
	sta $73
	sta $84
	tax
	jsr L_JSR_8883_9406
	lda $86
	sta $80
	sta $81
	lda #$07
	sta $83

L_JMP_9413_948F:

	ldy $81
	lda $4181,Y
	bmi L_BRS_9484_9418
	bit $84
	bmi L_BRS_9441_941C
	tya
	sta $4581,X
	lda $83
	sta $4601,X
	lda #$00
	sta $4500,X
	inx
	sec
	ror $73
	dec $83
	bpl L_BRS_9484_9432
	lda #$07
	sta $83
	lda $84
	ora #$80
	sta $84
	jmp L_JMP_9484_943E

L_BRS_9441_941C:
L_JMP_9441_9461:
L_BRS_9441_9468:
L_BRS_9441_9486:
L_BRS_9441_948D:

	ldy $80
	cpy #$FF
	beq L_BRS_9492_9445
	lda $4301,Y
	sta $80
	lda $4181,Y
	bpl L_BRS_9464_944F
	lda #$FF
	sta $4601,X
	tya
	sta $4581,X
	lda $4001,Y
	sta $4500,X
	inx
	jmp L_JMP_9441_9461

L_BRS_9464_944F:

	lda $81
	cmp #$FF
	beq L_BRS_9441_9468
	sta $4581,X
	lda $83
	sta $4601,X
	dec $83
	bpl L_BRS_947A_9474
	lda #$07
	sta $83

L_BRS_947A_9474:

	lda $4001,Y
	clc
	adc #$15
	sta $4500,X
	inx

L_BRS_9484_9418:
L_BRS_9484_9432:
L_JMP_9484_943E:

	ldy $81
	bmi L_BRS_9441_9486
	lda $4301,Y
	sta $81
	bmi L_BRS_9441_948D
	jmp L_JMP_9413_948F

L_JMP_9492_92EF:
L_BRS_9492_9445:

	lda #$00
	sta $88
	lda $73
	sta $D015                          // Sprite display Enable

L_JMP_949B_94B9:

	ldx $88
	lda $4601,X
	bmi L_BRS_94BC_94A0
	lda $D012                          // Raster Position
	cmp $4500,X
	bcc L_BRS_94BC_94A8
	ldy $4581,X
	cpy #$FF
	bne L_BRS_94B4_94AF
	jmp L_JMP_92F5_94B1

L_BRS_94B4_94AF:

	jsr L_JSR_9554_94B4
	inc $88
	jmp L_JMP_949B_94B9

L_BRS_94BC_94A0:
L_BRS_94BC_94A8:

	lda $4500,X
	sta $D012                          // Raster Position
	jsr L_JSR_ACE6_94C2
	jsr L_JSR_8ED5_94C5
	rts

L_BRS_94C9_94F7:

	lda #$FF
	sta $75
	jsr L_JSR_929F_94CD

L_BRS_94D0_94FD:

	lda #$01
	sta $D019                          // Interrupt Request Register (IRR)
	jsr L_JSR_ACE6_94D5
	lda #$00
	sta $D012                          // Raster Position
	lda #$01
	sta $D019                          // Interrupt Request Register (IRR)
	jmp L_JMP_954B_94E2
	cld
	lda $DC0D                          // Interrupt (IRQ) Control Register
	lda $D019                          // Interrupt Request Register (IRR)
	and #$01
	bne L_BRS_94F3_94EE
	jmp L_JMP_954B_94F0

L_BRS_94F3_94EE:

	lda $75
	cmp #$03
	bcs L_BRS_94C9_94F7
	lda $C4
	bmi L_BRS_94FF_94FB
	bne L_BRS_94D0_94FD

L_BRS_94FF_94FB:
L_BRS_94FF_9544:

	ldx $88
	lda $4501,X
	inc $88
	sta $D012                          // Raster Position
	ldy $4581,X
	lda $4601,X
	bmi L_BRS_9517_950F
	jsr L_JSR_9554_9511
	jmp L_JMP_9539_9514

L_BRS_9517_950F:

	tya
	cmp #$02
	bcs L_BRS_952A_951A
	lda $4081,Y
	sta $71
	lda $4101,Y
	sta $72
	cmp #$FF
	bne L_BRS_9530_9528

L_BRS_952A_951A:

	jsr L_JSR_92F5_952A
	jmp L_JMP_954B_952D

L_BRS_9530_9528:

	lda #$01
	sta $D019                          // Interrupt Request Register (IRR)
	jsr L_JSR_9551_9535
	sei

L_JMP_9539_9514:

	ldx $88
	lda $4500,X
	sec
	sbc #$02
	cmp $D012                          // Raster Position
	bcc L_BRS_94FF_9544
	lda #$01
	sta $D019                          // Interrupt Request Register (IRR)

L_JMP_954B_92F2:
L_JMP_954B_94E2:
L_JMP_954B_94F0:
L_JMP_954B_952D:

	pla
	tay
	pla
	tax
	pla
	rti

L_JSR_9551_9535:

	jmp ($0071)

L_JSR_9554_94B4:
L_JSR_9554_9511:

	lda $4601,X
	sta $85
	tax
	lda $4181,Y
	sta $D027,X                          // Sprite 0 Color
	lda $4101,Y
	php
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and $9890,X
	plp
	bmi L_BRS_9570_956B
	ora $9898,X

L_BRS_9570_956B:

	sta $D010                          // Sprites 0-7 MSB of X coordinate
	lda $4201,Y
	sta $3BF8,X
	asl $85
	ldx $85
	lda $4001,Y
	sta $D001,X                          // Sprite 0 Y Pos
	lda $4081,Y
	sta $D000,X                          // Sprite 0 X Pos
	rts

L_JSR_958A_84F3:

	lda #$05
	jsr L_JSR_AC2E_958C
	jsr L_JSR_929F_958F
	jsr L_JSR_84F9_9592
	jsr L_JSR_84F9_9595
	jsr L_JSR_8B2E_9598
	lda #$00
	sta $D015                          // Sprite display Enable
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	sta $D01D                          // Sprites Expand 2x Horizontal (X)
	sta $D017                          // Sprites Expand 2x Vertical (Y)
	lda #$01
	sta $D027                          // Sprite 0 Color
	sta $D028                          // Sprite 1 Color
	sta $D029                          // Sprite 2 Color
	sta $D02A                          // Sprite 3 Color
	lda $4083
	sta $D000                          // Sprite 0 X Pos
	sta $D002                          // Sprite 1 X Pos
	sta $D004                          // Sprite 2 X Pos
	sta $D006                          // Sprite 3 X Pos
	lda $4003
	sta $D001                          // Sprite 0 Y Pos
	sta $D003                          // Sprite 1 Y Pos
	sta $D005                          // Sprite 2 Y Pos
	sta $D007                          // Sprite 3 Y Pos
	lda #$11
	sta $73
	ldx #$01
	jsr L_JSR_9831_95DB
	lda #$0C
	sta $73
	ldx #$00
	jsr L_JSR_982C_95E4
	lda #$04
	sta $73
	ldx #$05
	jsr L_JSR_9863_95ED
	lda #$0C
	sta $73
	ldx #$04
	jsr L_JSR_982C_95F6
	lda #$11
	sta $73
	ldx #$03
	jsr L_JSR_9831_95FF
	lda #$0C
	sta $73
	ldx #$02
	jsr L_JSR_985E_9608
	lda #$04
	sta $73
	ldx #$07
	jsr L_JSR_9863_9611
	lda #$0C
	sta $73
	ldx #$06
	jsr L_JSR_985E_961A
	jsr L_JSR_97F0_961D
	jsr L_JSR_97D4_9620
	lda #$00
	sta $D015                          // Sprite display Enable
	sta $D020                          // Border Color
	sta $D021                          // Background Color 0

L_BRS_962E_9638:

	inc $25
	bne L_BRS_9634_9630
	inc $26

L_BRS_9634_9630:

	lda $26
	cmp #$80
	bne L_BRS_962E_9638
	lda #$FF
	sta $D01D                          // Sprites Expand 2x Horizontal (X)
	sta $D017                          // Sprites Expand 2x Vertical (Y)
	lda #$00
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	lda #$01
	sta $D025                          // Sprite Multi-Color Register 0
	sta $D026                          // Sprite Multi-Color Register 1
	lda $4083
	sta $D000                          // Sprite 0 X Pos
	sta $D002                          // Sprite 1 X Pos
	sta $D004                          // Sprite 2 X Pos
	sta $D006                          // Sprite 3 X Pos
	lda #$07
	jsr L_JSR_AC2E_9660
	lda $4003
	sta $D001                          // Sprite 0 Y Pos
	sta $D003                          // Sprite 1 Y Pos
	sta $D005                          // Sprite 2 Y Pos
	sta $D007                          // Sprite 3 Y Pos
	lda #$26
	sta $73
	ldx #$01
	jsr L_JSR_9831_9678
	lda #$24
	sta $73
	ldx #$00
	jsr L_JSR_982C_9681
	lda #$04
	sta $73
	ldx #$05
	jsr L_JSR_9863_968A
	lda #$24
	sta $73
	ldx #$04
	jsr L_JSR_982C_9693
	lda #$26
	sta $73
	ldx #$03
	jsr L_JSR_9831_969C
	lda #$0C
	sta $73
	ldx #$02
	jsr L_JSR_985E_96A5
	lda #$04
	sta $73
	ldx #$07
	jsr L_JSR_9863_96AE
	lda #$0C
	sta $73
	ldx #$06
	jsr L_JSR_985E_96B7
	lda #$0F
	sta $D015                          // Sprite display Enable
	lda #$C0
	sta $3BF8
	lda #$C1
	sta $3BF9
	lda #$C2
	sta $3BFA
	lda #$C3
	sta $3BFB
	jsr L_JSR_97F0_96D3
	jsr L_JSR_97D4_96D6

L_BRS_96D9_96E3:

	inc $25
	bne L_BRS_96DF_96DB
	inc $26

L_BRS_96DF_96DB:

	lda $26
	cmp #$80
	bne L_BRS_96D9_96E3
	jsr L_JSR_9725_96E5
	lda #$00
	sta $D01D                          // Sprites Expand 2x Horizontal (X)
	sta $D017                          // Sprites Expand 2x Vertical (Y)
	sta $D012                          // Raster Position
	sta $D020                          // Border Color
	sta $C022
	sta $5C
	lda $D021                          // Background Color 0
	and #$F0
	sta $D021                          // Background Color 0
	jsr L_JSR_A108_9703
	jsr L_JSR_A46E_9706
	ldy #$64

L_BRS_970B_9713:

	tya
	jsr L_JSR_A86F_970C
	dey
	dey
	dey
	dey
	bpl L_BRS_970B_9713
	ldx $CD
	dec $D0,X
	jsr L_JSR_A1AE_9719
	jsr L_JSR_9EBF_971C
	cli
	lda #$00
	sta $75
	rts

L_JSR_9725_846B:
L_JSR_9725_96E5:
L_JSR_9725_A051:

	sei
	ldy #$0C

L_BRS_9728_9749:

	lda #$80
	sta $4687,Y
	sta $4707,Y
	lda #$00
	sta $4087,Y
	sta $4007,Y
	lda #$FF
	sta $4107,Y
	sta $4787,Y
	lda #$1F
	sta $4387,Y
	sta $4207,Y
	dey
	bne L_BRS_9728_9749
	lda #$00
	sta $6C
	sta $A9
	sta $12
	sta $C022
	sta $6D
	sta $5B
	lda #$AF
	sta $27
	lda #$B7
	sta $28
	jsr L_JSR_889A_9762
	lda #$02
	sta $66
	sta $D025                          // Sprite Multi-Color Register 0
	sta $6F
	lda #$07
	sta $D026                          // Sprite Multi-Color Register 1
	lda #$B0
	sta $4003
	sta $4004
	lda #$FF
	sta $4103
	lda #$8F
	sta $27
	lda #$BC
	sta $28
	lda #$83
	sta $22
	lda #$40
	sta $23
	ldx #$F8
	jsr L_JSR_8D6D_9792
	cli
	rts

L_JSR_9797_9814:

	ldy #$04

L_BRS_9799_97A3:

	lda $3BF7,Y
	clc
	adc #$04
	sta $3BF7,Y
	dey
	bne L_BRS_9799_97A3
	jmp L_JMP_97B6_97A5

L_JSR_97A8_97D7:

	ldy #$04

L_BRS_97AA_97B4:

	lda $3BF7,Y
	sec
	sbc #$04
	sta $3BF7,Y
	dey
	bne L_BRS_97AA_97B4

L_JMP_97B6_97A5:

	lda $D012                          // Raster Position
	cmp #$32
	bcs L_BRS_97CD_97BB
	lda $D020                          // Border Color
	eor #$01
	sta $D020                          // Border Color
	lda $D021                          // Background Color 0
	eor #$01
	sta $D021                          // Background Color 0

L_BRS_97CD_97BB:

	lda #$00
	sta $25
	sta $26
	rts

L_JSR_97D4_9620:
L_JSR_97D4_96D6:
L_BRS_97D4_97DF:

	jsr L_JSR_981F_97D4
	jsr L_JSR_97A8_97D7
	lda $3BF8
	cmp #$C0
	bne L_BRS_97D4_97DF
	lda #$1F
	sta $3BF8
	sta $3BF9
	sta $3BFA
	sta $3BFB
	rts

L_JSR_97F0_961D:
L_JSR_97F0_96D3:

	lda #$C0
	sta $3BF8
	lda #$C1
	sta $3BF9
	lda #$C2
	sta $3BFA
	lda #$C3
	sta $3BFB
	lda #$0F
	sta $D015                          // Sprite display Enable
	lda #$00
	sta $25
	lda #$00
	sta $26

L_BRS_9811_981C:

	jsr L_JSR_981F_9811
	jsr L_JSR_9797_9814
	lda $3BF8
	cmp #$D4
	bne L_BRS_9811_981C
	rts

L_JSR_981F_97D4:
L_JSR_981F_9811:
L_BRS_981F_9829:

	inc $25
	bne L_BRS_9825_9821
	inc $26

L_BRS_9825_9821:

	lda $26
	cmp #$09
	bne L_BRS_981F_9829
	rts

L_JSR_982C_95E4:
L_JSR_982C_95F6:
L_JSR_982C_9681:
L_JSR_982C_9693:

	lda $4103
	bpl L_BRS_9833_982F

L_JSR_9831_95DB:
L_JSR_9831_95FF:
L_JSR_9831_9678:
L_JSR_9831_969C:

	lda #$00

L_BRS_9833_982F:

	sta $C1
	lda $D000,X                          // Sprite 0 X Pos
	sta $C0
	lda $C0
	sec
	sbc $73
	bcs L_BRS_9843_983F
	dec $C1

L_BRS_9843_983F:

	sta $C0
	lda $C0
	sta $D000,X                          // Sprite 0 X Pos
	lda $C1
	beq L_BRS_985D_984C
	stx $73
	lsr $73
	ldx $73
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	ora $9898,X
	sta $D010                          // Sprites 0-7 MSB of X coordinate

L_BRS_985D_984C:

	rts

L_JSR_985E_9608:
L_JSR_985E_961A:
L_JSR_985E_96A5:
L_JSR_985E_96B7:

	lda $4103
	bpl L_BRS_9865_9861

L_JSR_9863_95ED:
L_JSR_9863_9611:
L_JSR_9863_968A:
L_JSR_9863_96AE:

	lda #$00

L_BRS_9865_9861:

	sta $C1
	lda $D000,X                          // Sprite 0 X Pos
	sta $C0
	lda $C0
	clc
	adc $73
	bcc L_BRS_9875_9871
	inc $C1

L_BRS_9875_9871:

	sta $C0
	lda $C0
	sta $D000,X                          // Sprite 0 X Pos
	lda $C1
	beq L_BRS_988F_987E
	stx $73
	lsr $73
	ldx $73
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	ora $9898,X
	sta $D010                          // Sprites 0-7 MSB of X coordinate

L_BRS_988F_987E:

	rts

	.byte $FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F
	.byte $01,$02,$04,$08,$10,$20,$40,$80

L_BRS_98A0_98A7:

	jmp L_JMP_990D_98A0

L_JSR_98A3_84BB:

	lda $32
	cmp #$17
	bcc L_BRS_98A0_98A7
	lda #$00
	sta $32
	jsr L_JSR_A236_98AD
	jsr L_JSR_9CA7_98B0
	jsr L_JSR_8B8B_98B3
	lda $4003
	sec
	sbc #$32
	lsr
	lsr
	lsr
	sta $21
	lda $4083
	sta $C0
	lda $4103
	bpl L_BRS_98CD_98C9
	lda #$00

L_BRS_98CD_98C9:

	sta $C1
	jsr L_JSR_9CDD_98CF
	sta $20
	ldx #$64

L_BRS_98D6_990B:

	ldy $5002,X
	beq L_BRS_9907_98D9
	dey
	beq L_BRS_98F0_98DC
	dey
	beq L_BRS_98F3_98DF
	dey
	beq L_BRS_98FA_98E2
	dey
	beq L_BRS_98FD_98E5
	dey
	beq L_BRS_98F3_98E8
	dey
	beq L_BRS_9900_98EB
	jmp L_JMP_998C_98ED

L_BRS_98F0_98DC:

	jmp L_JMP_9A02_98F0

L_BRS_98F3_98DF:
L_BRS_98F3_98E8:

	lda #$06
	sta $C0
	jmp L_JMP_9C09_98F7

L_BRS_98FA_98E2:

	jmp L_JMP_9C51_98FA

L_BRS_98FD_98E5:

	jmp L_JMP_9959_98FD

L_BRS_9900_98EB:

	lda #$08
	sta $C0
	jmp L_JMP_9C09_9904

L_BRS_9907_98D9:
L_JMP_9907_9956:
L_JMP_9907_9995:
L_JMP_9907_99A7:
L_JMP_9907_99C8:
L_JMP_9907_9BF6:
L_JMP_9907_9C06:
L_JMP_9907_9C4E:

	dex
	dex
	dex
	dex
	bne L_BRS_98D6_990B

L_JMP_990D_98A0:

	rts

L_JMP_990E_9C5C:

	and #$06
	sta $5083,X
	lda $20
	cmp $5000,X
	bcs L_BRS_9920_9918
	lda $5083,X
	jmp L_JMP_9926_991D

L_BRS_9920_9918:

	lda $5083,X
	clc
	adc #$08

L_JMP_9926_991D:
L_JMP_9926_9963:

	sta $5083,X

L_JMP_9929_9C62:

	tay
	sta $14
	lda $9C98,Y
	beq L_BRS_9940_992F
	bpl L_BRS_993D_9931
	lda #$01
	ora #$80
	jsr L_JSR_9A66_9937
	jmp L_JMP_9940_993A

L_BRS_993D_9931:

	jsr L_JSR_9A4A_993D

L_BRS_9940_992F:
L_JMP_9940_993A:

	ldy $14
	lda $9C97,Y
	beq L_BRS_9956_9945
	bpl L_BRS_9953_9947
	lda $51
	ora #$80
	jsr L_JSR_9A82_994D
	jmp L_JMP_9956_9950

L_BRS_9953_9947:

	jsr L_JSR_9A97_9953

L_BRS_9956_9945:
L_JMP_9956_9950:

	jmp L_JMP_9907_9956

L_JMP_9959_98FD:

	lda #$01
	sta $51
	jsr L_JSR_A2E7_995D
	and #$07
	asl
	jmp L_JMP_9926_9963

L_JSR_9966_99B1:
L_JSR_9966_99C5:

	ldy $5100,X
	beq L_BRS_997B_9969
	lda #$13
	sta $4381,Y
	lda #$A0
	sta $4201,Y
	lda #$01
	sta $4781,Y
	rts

L_BRS_997B_9969:

	lda #$09
	jsr L_JSR_AC2E_997D
	dec $B7
	txa
	tay
	jsr L_JSR_A86F_9984
	tya
	tax
	dec $B9
	rts

L_JMP_998C_98ED:

	lda $5083,X
	cmp #$03
	bcc L_BRS_99B7_9991
	beq L_BRS_9998_9993
	jmp L_JMP_9907_9995

L_BRS_9998_9993:

	lda $5001,X
	cmp #$15
	bcs L_BRS_99AA_999D
	inc $5082,X
	lda #$02
	jsr L_JSR_9A4A_99A4
	jmp L_JMP_9907_99A7

L_BRS_99AA_999D:

	lda $5082,X
	cmp #$03
	bcc L_BRS_99CB_99AF
	jsr L_JSR_9966_99B1
	jmp L_JMP_9BF9_99B4

L_BRS_99B7_9991:
L_JMP_99B7_99FF:

	cmp #$02
	beq L_BRS_99BE_99B9
	jmp L_JMP_9BF9_99BB

L_BRS_99BE_99B9:

	lda $5003,X
	cmp #$FF
	bne L_BRS_99C8_99C3
	jsr L_JSR_9966_99C5

L_BRS_99C8_99C3:

	jmp L_JMP_9907_99C8

L_BRS_99CB_99AF:

	ldy $5100,X
	beq L_BRS_99DD_99CE
	lda #$E2
	sta $4001,Y
	lda #$00
	sta $4701,Y
	sta $4681,Y

L_BRS_99DD_99CE:

	lda #$01
	sta $5083,X
	sei
	lda #$1C
	jsr L_JSR_AC2E_99E5
	lda #$1D
	jsr L_JSR_AC2E_99EA
	lda #$1E
	jsr L_JSR_AC2E_99EF
	cli
	lda #$00
	sta $5082,X
	lda #$07
	sta $5C
	jsr L_JSR_A108_99FC
	jmp L_JMP_99B7_99FF

L_JMP_9A02_98F0:

	lda $5083,X
	asl
	asl
	asl
	sta $14
	jsr L_JSR_A2E7_9A0A
	and #$06
	clc
	adc $14
	sta $14
	lda $5083,X
	cmp #$02
	bcs L_BRS_9A1E_9A19
	jmp L_JMP_9B0D_9A1B

L_BRS_9A1E_9A19:

	cmp #$04
	bcs L_BRS_9A25_9A20
	jmp L_JMP_9AB3_9A22

L_BRS_9A25_9A20:

	cmp #$05
	bcs L_BRS_9A2C_9A27
	jmp L_JMP_9B21_9A29

L_BRS_9A2C_9A27:

	jmp L_JMP_9B78_9A2C

L_JSR_9A2F_9BF3:

	ldy $14
	tya
	pha
	lda $9C5D,Y
	bpl L_BRS_9A3E_9A36
	jsr L_JSR_9A82_9A38
	jmp L_JMP_9A41_9A3B

L_BRS_9A3E_9A36:

	jsr L_JSR_9A97_9A3E

L_JMP_9A41_9A3B:

	pla
	tay
	lda $9C5E,Y
	bpl L_BRS_9A4A_9A46
	bmi L_BRS_9A66_9A48

L_JSR_9A4A_993D:
L_JSR_9A4A_99A4:
L_BRS_9A4A_9A46:
L_JSR_9A4A_9C41:

	cmp #$00
	beq L_BRS_9A65_9A4C
	ldy $5100,X
	beq L_BRS_9A56_9A51
	sta $4701,Y

L_BRS_9A56_9A51:

	lda $5001,X
	clc
	adc #$01
	cmp #$18
	bcc L_BRS_9A62_9A5E
	lda #$07

L_BRS_9A62_9A5E:
L_BRS_9A62_9A7A:

	sta $5001,X

L_BRS_9A65_9A4C:
L_BRS_9A65_9A68:
L_BRS_9A65_9A84:
L_BRS_9A65_9A99:

	rts

L_JSR_9A66_9937:
L_BRS_9A66_9A48:
L_JSR_9A66_9C4B:

	cmp #$00
	beq L_BRS_9A65_9A68
	ldy $5100,X
	beq L_BRS_9A72_9A6D
	sta $4701,Y

L_BRS_9A72_9A6D:

	lda $5001,X
	sec
	sbc #$01
	cmp #$04
	bcs L_BRS_9A62_9A7A
	lda #$15
	sta $5001,X
	rts

L_JSR_9A82_994D:
L_JSR_9A82_9A38:
L_JSR_9A82_9C18:
L_JSR_9A82_9C1F:

	cmp #$00
	beq L_BRS_9A65_9A84
	ldy $5100,X
	beq L_BRS_9A8E_9A89
	sta $4681,Y

L_BRS_9A8E_9A89:

	lda $5000,X
	sec
	sbc #$01
	jmp L_JMP_9AA9_9A94

L_JSR_9A97_9953:
L_JSR_9A97_9A3E:
L_JSR_9A97_9C27:
L_JSR_9A97_9C2C:

	cmp #$00
	beq L_BRS_9A65_9A99
	ldy $5100,X
	beq L_BRS_9AA3_9A9E
	sta $4681,Y

L_BRS_9AA3_9A9E:

	lda $5000,X
	clc
	adc #$01

L_JMP_9AA9_9A94:

	cmp #$88
	bcc L_BRS_9AAF_9AAB
	lda #$00

L_BRS_9AAF_9AAB:

	sta $5000,X
	rts

L_JMP_9AB3_9A22:

	lda $5001,X
	cmp #$10
	bcs L_BRS_9ACA_9AB8
	lda #$14
	ldy $5083,X
	cpy #$03
	bne L_BRS_9AC5_9AC1
	lda #$1C

L_BRS_9AC5_9AC1:

	sta $14
	jmp L_JMP_9ADB_9AC7

L_BRS_9ACA_9AB8:

	cmp #$14
	bcc L_BRS_9ADB_9ACC
	lda #$10
	ldy $5083,X
	cpy #$03
	bne L_BRS_9AD9_9AD5
	lda #$18

L_BRS_9AD9_9AD5:

	sta $14

L_JMP_9ADB_9AC7:
L_BRS_9ADB_9ACC:

	ldy #$64

L_BRS_9ADD_9AED:

	lda $5102,Y
	bne L_BRS_9AE9_9AE0
	lda $5002,Y
	cmp #$07
	beq L_BRS_9AF2_9AE7

L_BRS_9AE9_9AE0:
L_BRS_9AE9_9AF8:
L_BRS_9AE9_9AFF:

	dey
	dey
	dey
	dey
	bne L_BRS_9ADD_9AED
	jmp L_JMP_9BF3_9AEF

L_BRS_9AF2_9AE7:

	lda $5000,Y
	cmp $5000,X
	bne L_BRS_9AE9_9AF8
	jsr L_JSR_A2E7_9AFA
	cmp #$C8
	bcs L_BRS_9AE9_9AFF
	lda #$04
	sta $5083,X
	tya
	sta $5102,X
	jmp L_JMP_9BF9_9B0A

L_JMP_9B0D_9A1B:

	lda $5001,X
	cmp #$10
	bcc L_BRS_9B1E_9B12

L_JMP_9B14_9B75:

	jsr L_JSR_A2E7_9B14
	ora #$02
	and #$03
	sta $5083,X

L_BRS_9B1E_9B12:

	jmp L_JMP_9BF3_9B1E

L_JMP_9B21_9A29:

	ldy $5102,X
	lda $5102,Y
	beq L_BRS_9B2F_9B27
	stx $C0
	cmp $C0
	bne L_BRS_9B70_9B2D

L_BRS_9B2F_9B27:

	lda $5001,X
	clc
	adc #$01
	cmp $5001,Y
	bne L_BRS_9B6D_9B38
	sty $51
	ldy $5100,X
	beq L_BRS_9B46_9B3F
	lda #$00
	sta $4701,Y

L_BRS_9B46_9B3F:

	ldy $51
	lda $5083,Y
	cmp #$01
	bne L_BRS_9B70_9B4D
	lda $5000,X
	cmp $5000,Y
	bne L_BRS_9B70_9B55
	lda #$1B
	jsr L_JSR_AC2E_9B59
	lda #$05
	sta $5083,X
	lda #$02
	sta $5083,Y
	txa
	sta $5102,Y
	jmp L_JMP_9BF9_9B6A

L_BRS_9B6D_9B38:

	jmp L_JMP_9BF3_9B6D

L_BRS_9B70_9B2D:
L_BRS_9B70_9B4D:
L_BRS_9B70_9B55:
L_BRS_9B70_9B80:

	lda #$00
	sta $5102,X
	jmp L_JMP_9B14_9B75

L_JMP_9B78_9A2C:

	ldy $5102,X
	lda $5002,Y
	cmp #$07
	bne L_BRS_9B70_9B80
	lda $5001,X
	cmp #$07
	bcs L_BRS_9BA8_9B87
	ldy $5102,X
	lda #$FF
	sta $5003,Y
	lda #$00
	sta $5003,X
	lda #$02
	sta $5002,X
	ldy $5100,X
	cpy #$07
	bcc L_BRS_9BA5_9BA0
	jsr L_JSR_AAFC_9BA2

L_BRS_9BA5_9BA0:

	jmp L_JMP_9BF9_9BA5

L_BRS_9BA8_9B87:

	lda $5100,X
	bne L_BRS_9BBF_9BAB
	ldy $5102,X
	lda $5001,X
	sta $5001,Y
	lda $5000,X
	sta $5000,Y
	jmp L_JMP_9BF3_9BBC

L_BRS_9BBF_9BAB:

	tay
	lda $4081,Y
	sta $C1
	lda $4101,Y
	sta $16
	lda $4001,Y
	sta $17
	stx $C0
	lda $5102,X
	tax
	ldy $5100,X
	beq L_BRS_9BF1_9BD8
	lda #$81
	sta $4701,Y
	lda $C1
	sta $4081,Y
	lda $16
	sta $4101,Y
	lda $17
	clc
	adc #$0A
	sta $4001,Y

L_BRS_9BF1_9BD8:

	ldx $C0

L_JMP_9BF3_9AEF:
L_JMP_9BF3_9B1E:
L_JMP_9BF3_9B6D:
L_JMP_9BF3_9BBC:

	jsr L_JSR_9A2F_9BF3
	jmp L_JMP_9907_9BF6

L_JMP_9BF9_99B4:
L_JMP_9BF9_99BB:
L_JMP_9BF9_9B0A:
L_JMP_9BF9_9B6A:
L_JMP_9BF9_9BA5:

	ldy $5100,X
	beq L_BRS_9C06_9BFC
	lda #$00
	sta $4681,Y
	sta $4701,Y

L_BRS_9C06_9BFC:

	jmp L_JMP_9907_9C06

L_JMP_9C09_98F7:
L_JMP_9C09_9904:

	lda $C0
	sta $14
	lda $5000,X
	cmp $20
	bcc L_BRS_9C25_9C12
	lda $14
	ora #$80
	jsr L_JSR_9A82_9C18
	lda $14
	ora #$80
	jsr L_JSR_9A82_9C1F
	jmp L_JMP_9C2F_9C22

L_BRS_9C25_9C12:

	lda $14
	jsr L_JSR_9A97_9C27
	lda $14
	jsr L_JSR_9A97_9C2C

L_JMP_9C2F_9C22:

	lda $C0
	sec
	sbc #$04
	sta $14
	lda $5001,X
	cmp $21
	beq L_BRS_9C4E_9C3B
	bcs L_BRS_9C47_9C3D
	lda $14
	jsr L_JSR_9A4A_9C41
	jmp L_JMP_9C4E_9C44

L_BRS_9C47_9C3D:

	lda $14
	ora #$80
	jsr L_JSR_9A66_9C4B

L_BRS_9C4E_9C3B:
L_JMP_9C4E_9C44:

	jmp L_JMP_9907_9C4E

L_JMP_9C51_98FA:

	lda #$02
	sta $51
	jsr L_JSR_A2E7_9C55
	cmp #$C8
	bcc L_BRS_9C5F_9C5A
	jmp L_JMP_990E_9C5C

L_BRS_9C5F_9C5A:

	lda $5083,X
	jmp L_JMP_9929_9C62

	.byte $01,$01,$00,$01,$81,$01,$00,$01
	.byte $01,$81,$01,$00,$01,$01,$01,$00
	.byte $81,$81,$81,$00,$81,$01,$81,$00
	.byte $00,$01,$00,$01,$00,$01,$00,$01
	.byte $00,$81,$00,$81,$00,$81,$00,$81
	.byte $00,$00,$00,$01,$00,$02,$00,$03
	.byte $00,$04,$81,$01,$81,$00,$81,$81
	.byte $81,$81,$01,$01,$01,$00,$01,$81
	.byte $01,$01

L_JSR_9CA7_98B0:

	ldx #$0B

L_BRS_9CA9_9CDA:

	lda $4207,X
	cmp #$13
	bcc L_BRS_9CD9_9CAE
	cmp #$1D
	bcs L_BRS_9CD9_9CB2
	lda $4007,X
	beq L_BRS_9CD9_9CB7
	sec
	sbc #$32
	lsr
	lsr
	lsr
	ldy $4487,X
	sta $5001,Y
	lda $4087,X
	sta $C0
	lda $4107,X
	bpl L_BRS_9CD1_9CCD
	lda #$00

L_BRS_9CD1_9CCD:

	sta $C1
	jsr L_JSR_9CDD_9CD3
	sta $5000,Y

L_BRS_9CD9_9CAE:
L_BRS_9CD9_9CB2:
L_BRS_9CD9_9CB7:

	dex
	bne L_BRS_9CA9_9CDA
	rts

L_JSR_9CDD_98CF:
L_JSR_9CDD_9CD3:

	lda $C0
	sec
	sbc #$18
	bcs L_BRS_9CE6_9CE2
	dec $C1

L_BRS_9CE6_9CE2:

	sta $C0
	lda $C0
	lsr $C1
	ror
	lsr
	lsr
	clc
	adc $66
	sec
	sbc #$28
	cmp #$88
	bcc L_BRS_9CFC_9CF7
	sec
	sbc #$78

L_BRS_9CFC_9CF7:

	rts

L_JSR_9CFD_855A:

	ldx #$64

L_BRS_9CFF_9D56:

	lda $5002,X
	cmp #$07
	bne L_BRS_9D4F_9D04
	lda $5083,X
	cmp #$04
	bne L_BRS_9D4F_9D0B
	sei
	lda $5001,X
	cmp #$15
	bcc L_BRS_9D33_9D13
	ldy $5100,X
	beq L_BRS_9D4F_9D18
	lda #$E2
	sta $4001,Y
	lda #$00
	sta $4681,Y
	sta $4701,Y
	lda #$01
	sta $5083,X
	lda #$01
	sta $3A
	jmp L_JMP_9D4F_9D30

L_BRS_9D33_9D13:

	ldy $5100,X
	cpy #$07
	bcc L_BRS_9D4F_9D38
	lda $4083
	sta $4081,Y
	lda $4103
	sta $4101,Y
	lda $4003
	clc
	adc #$0B
	sta $4001,Y

L_BRS_9D4F_9D04:
L_BRS_9D4F_9D0B:
L_BRS_9D4F_9D18:
L_JMP_9D4F_9D30:
L_BRS_9D4F_9D38:

	cli
	dex
	dex
	dex
	dex
	cpx #$38
	bne L_BRS_9CFF_9D56
	rts

L_JSR_9D59_8498:

	lda $3A
	bmi L_BRS_9D88_9D5B
	lda $5B
	sta $14
	sei
	lda #$1C
	jsr L_JSR_AC2E_9D64
	lda #$1D
	jsr L_JSR_AC2E_9D69
	lda #$1E
	jsr L_JSR_AC2E_9D6E

L_BRS_9D71_9D7D:

	lda #$08
	sta $5C
	jsr L_JSR_A108_9D75
	sei
	dec $14
	bmi L_BRS_9D7F_9D7B
	bne L_BRS_9D71_9D7D

L_BRS_9D7F_9D7B:

	lda #$00
	sta $5B
	lda #$FF
	sta $3A
	cli

L_BRS_9D88_9D5B:

	rts

L_BRS_9D89_9D8C:
L_BRS_9D89_9D92:

	rts

L_JSR_9D8A_84B8:

	lda $B7
	bne L_BRS_9D89_9D8C
	lda $2E
	cmp #$FF
	beq L_BRS_9D89_9D92
	lda #$05
	sta $C4
	lda #$00
	sta $D015                          // Sprite display Enable
	lda #$FF
	sta $D015                          // Sprite display Enable
	lda #$80
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	lda #$FE
	sta $D017                          // Sprites Expand 2x Vertical (Y)
	sta $D01D                          // Sprites Expand 2x Horizontal (X)
	lda $4003
	sta $D001                          // Sprite 0 Y Pos
	lda $4083
	sta $D000                          // Sprite 0 X Pos
	lda $4103
	cmp #$01
	bne L_BRS_9DC7_9DC0
	lda #$81
	sta $D010                          // Sprites 0-7 MSB of X coordinate

L_BRS_9DC7_9DC0:

	lda #$10
	sta $3BF8
	lda #$EF
	sta $14
	ldx #$0E

L_BRS_9DD2_9DE3:

	lda #$C8
	sta $D001,X                          // Sprite 0 Y Pos
	lda $14
	clc
	adc #$2A
	sta $14
	sta $D000,X                          // Sprite 0 X Pos
	dex
	dex
	bne L_BRS_9DD2_9DE3
	lda #$BC
	sta $D005                          // Sprite 2 Y Pos
	sta $D009                          // Sprite 4 Y Pos
	sta $D00D                          // Sprite 6 Y Pos
	lda $2E
	bne L_BRS_9DF9_9DF2
	lda #$13
	jsr L_JSR_AC2E_9DF6

L_BRS_9DF9_9DF2:

	lda #$FF
	sta $D015                          // Sprite display Enable
	lda $2E
	cmp #$08
	bcs L_BRS_9E29_9E02
	ldx #$07

L_BRS_9E06_9E0F:

	lda #$A0
	clc
	adc $2E
	sta $3BF8,X
	dex
	bne L_BRS_9E06_9E0F
	lda $2E
	and #$01
	bne L_BRS_9E1C_9E15
	lda #$00
	sta $D021                          // Background Color 0

L_BRS_9E1C_9E15:

	lda $2E
	sta $D021                          // Background Color 0
	inc $2E
	lda #$F0
	jsr L_JSR_9F07_9E25

L_JMP_9E28_9E7E:

	rts

L_BRS_9E29_9E02:

	lda $B5
	clc
	adc $B4
	sta $B5
	lda #$00
	sta $B4
	ldy #$64

L_JMP_9E36_9E4F:

	lda #$00
	sta $5003,Y
	lda $5002,Y
	cmp #$01
	bne L_BRS_9E47_9E40
	lda #$02
	sta $5002,Y

L_BRS_9E47_9E40:

	cpy #$00
	beq L_BRS_9E52_9E49
	dey
	dey
	dey
	dey
	jmp L_JMP_9E36_9E4F

L_BRS_9E52_9E49:

	ldy #$0B

L_BRS_9E54_9E5F:

	lda #$00
	sta $4007,Y
	lda #$80
	sta $4687,Y
	dey
	bne L_BRS_9E54_9E5F
	ldx #$00

L_BRS_9E63_9E6B:

	lda #$1F
	sta $3BF8,X
	inx
	cpx #$07
	bne L_BRS_9E63_9E6B
	lda #$00
	sta $D017                          // Sprites Expand 2x Vertical (Y)
	sta $D01D                          // Sprites Expand 2x Horizontal (X)
	sta $C4
	sta $D021                          // Background Color 0
	lda #$FF
	sta $2E
	jmp L_JMP_9E28_9E7E

L_JSR_9E81_84B5:

	inc $C7
	lda $C7
	cmp #$08
	bcc L_BRS_9E8D_9E87
	lda #$01
	sta $C7

L_BRS_9E8D_9E87:

	ldx #$06

L_BRS_9E8F_9E96:

	sta $D851,X
	sta $D86D,X
	dex
	bne L_BRS_9E8F_9E96
	ldy #$0B

L_BRS_9E9A_9EBC:

	lda $4207,Y
	cmp #$16
	bcc L_BRS_9EBB_9E9F
	cmp #$1E
	bcs L_BRS_9EBB_9EA3
	pha
	and #$01
	bne L_BRS_9EB4_9EA8
	pla
	clc
	adc #$01
	sta $4207,Y
	jmp L_JMP_9EBB_9EB1

L_BRS_9EB4_9EA8:

	pla
	sec
	sbc #$01
	sta $4207,Y

L_BRS_9EBB_9E9F:
L_BRS_9EBB_9EA3:
L_JMP_9EBB_9EB1:

	dey
	bne L_BRS_9E9A_9EBC
	rts

L_JSR_9EBF_845E:
L_JSR_9EBF_971C:

	jsr L_JSR_9F14_9EBF
	jsr L_JSR_A156_9EC2
	lda $C6
	beq L_BRS_9EFD_9EC7
	jsr L_JSR_9F1F_9EC9
	ldx #$0C
	lda #$03

L_BRS_9ED0_9ED4:

	sta $DA66,X
	dex
	bne L_BRS_9ED0_9ED4
	ldx $CD
	lda $B5F2,X
	sta $3A6F
	lda #$EC
	sta $27
	lda #$B5
	sta $28
	lda #$67
	sta $22
	lda #$3A
	sta $23
	ldx #$FA
	jsr L_JSR_8D6D_9EF0
	ldx #$03

L_BRS_9EF5_9EFB:

	lda #$01
	jsr L_JSR_9F07_9EF7
	dex
	bne L_BRS_9EF5_9EFB

L_BRS_9EFD_9EC7:

	jsr L_JSR_A156_9EFD
	jsr L_JSR_8B64_9F00
	jsr L_JSR_A17A_9F03
	rts

L_JSR_9F07_900A:
L_JSR_9F07_9E25:
L_JSR_9F07_9EF7:
L_JSR_9F07_A048:
L_JSR_9F07_A209:
L_JSR_9F07_A37B:
L_JSR_9F07_A928:

	sta $26

L_BRS_9F09_9F11:

	inc $25
	bne L_BRS_9F0F_9F0B
	inc $26

L_BRS_9F0F_9F0B:

	lda $26
	bne L_BRS_9F09_9F11
	rts

L_JSR_9F14_9EBF:
L_JSR_9F14_A1BB:

	ldx #$08
	lda #$1F

L_BRS_9F18_9F1C:

	sta $3BF7,X
	dex
	bne L_BRS_9F18_9F1C
	rts

L_JSR_9F1F_9EC9:
L_BRS_9F1F_9F6F:

	lda #$00
	sta $D418                          // Select Filter Mode and Volume
	ldy #$02
	lda $CD
	bne L_BRS_9F4C_9F28

L_BRS_9F2A_9F43:

	cpy #$D0
	beq L_BRS_9F42_9F2C
	cpy #$D1
	beq L_BRS_9F42_9F30
	cpy #$95
	beq L_BRS_9F42_9F34
	lda $0000,Y
	sta $4800,Y
	lda $4900,Y
	sta $0000,Y

L_BRS_9F42_9F2C:
L_BRS_9F42_9F30:
L_BRS_9F42_9F34:

	iny
	bne L_BRS_9F2A_9F43
	lda #$01
	sta $CD
	jmp L_JMP_9F6B_9F49

L_BRS_9F4C_9F28:
L_BRS_9F4C_9F65:

	cpy #$D0
	beq L_BRS_9F64_9F4E
	cpy #$D1
	beq L_BRS_9F64_9F52
	cpy #$95
	beq L_BRS_9F64_9F56
	lda $0000,Y
	sta $4900,Y
	lda $4800,Y
	sta $0000,Y

L_BRS_9F64_9F4E:
L_BRS_9F64_9F52:
L_BRS_9F64_9F56:

	iny
	bne L_BRS_9F4C_9F65
	lda #$00
	sta $CD

L_JMP_9F6B_9F49:

	ldx $CD
	lda $D0,X
	beq L_BRS_9F1F_9F6F
	dec $9A
	lda $9A
	cmp #$01
	bne L_BRS_9F7D_9F77
	lda #$06
	sta $9A

L_BRS_9F7D_9F77:

	jsr L_JSR_A076_9F7D
	rts

L_BRS_9F81_9F84:

	rts

L_JSR_9F82_84C8:

	lda $B8
	bne L_BRS_9F81_9F84
	lda #$05
	sta $C4
	ldx #$FF

L_BRS_9F8C_9F92:

	lda #$07
	sta $D974,X
	dex
	bne L_BRS_9F8C_9F92
	lda #$35
	sta $27
	lda #$B5
	sta $28
	lda #$F0
	sta $22
	lda #$38
	sta $23
	ldx #$D1
	jsr L_JSR_8D6D_9FA6
	sei
	sed
	lda $BC
	clc
	adc #$01
	sta $BC
	cld
	cli
	ldx #$00
	lda $BC
	pha
	lsr
	lsr
	lsr
	lsr
	beq L_BRS_9FC8_9FBD
	ldy #$FF
	clc
	adc #$08
	sta $3981,X
	inx

L_BRS_9FC8_9FBD:

	pla
	and #$0F
	clc
	adc #$08
	sta $3981,X
	cpy #$FF
	beq L_BRS_9FD9_9FD3
	cmp #$0D
	bmi L_BRS_9FDB_9FD7

L_BRS_9FD9_9FD3:

	lda #$0D

L_BRS_9FDB_9FD7:

	sta $3A6E,X
	sec
	sbc #$08
	sta $C8
	inc $BB
	lda $BB
	cmp #$06
	bcc L_BRS_9FEF_9FE9
	lda #$05
	sta $BB

L_BRS_9FEF_9FE9:

	inx
	lda #$08
	sta $3A6E,X
	sta $3A6F,X
	ldx $B7

L_JMP_9FFA_A03B:

	beq L_BRS_A03E_9FFA
	lda #$0F
	sta $DAB5,X
	lda #$7D
	sta $3AB5,X
	sei
	sed
	lda $C8
	clc
	adc $CA
	sta $CA
	bcc L_BRS_A032_A00F
	php
	stx $51
	ldx $CD
	lda #$0F
	jsr L_JSR_AC2E_A018
	lda #$10
	jsr L_JSR_AC2E_A01D
	lda #$11
	jsr L_JSR_AC2E_A022
	inc $D0,X
	inc $35,X
	jsr L_JSR_A852_A029
	jsr L_JSR_A17A_A02C
	ldx $51
	plp

L_BRS_A032_A00F:

	lda #$00
	adc $C9
	sta $C9
	cld
	cli
	dex
	jmp L_JMP_9FFA_A03B

L_BRS_A03E_9FFA:

	jsr L_JSR_A09C_A03E
	jsr L_JSR_A076_A041
	ldx #$05

L_BRS_A046_A04C:

	lda #$01
	jsr L_JSR_9F07_A048
	dex
	bne L_BRS_A046_A04C
	jsr L_JSR_A156_A04E
	jsr L_JSR_9725_A051
	cli
	lda #$00
	sta $B1
	sta $C4
	sta $BA
	jsr L_JSR_A462_A05D
	inc $50
	lda $50
	cmp #$05
	bcc L_BRS_A072_A066
	lda #$0A
	sta $B7
	lda #$00
	sta $2E
	sta $50

L_BRS_A072_A066:

	jsr L_JSR_929F_A072
	rts

L_JSR_A076_9F7D:
L_JSR_A076_A041:

	lda $9A
	cmp #$06
	bcc L_BRS_A080_A07A
	lda #$01
	sta $9A

L_BRS_A080_A07A:

	inc $9A
	ldx #$C8

L_BRS_A084_A094:

	lda $D800,X
	and #$0F
	cmp $C030
	bne L_BRS_A093_A08C
	lda $9A
	sta $D800,X

L_BRS_A093_A08C:

	dex
	bne L_BRS_A084_A094
	lda $9A
	sta $C030
	rts

L_JSR_A09C_A03E:
L_JSR_A09C_A14D:

	lda #$00
	sta $CC
	ldx #$06
	lda #$01

L_BRS_A0A4_A0A8:

	sta $D851,X
	dex
	bne L_BRS_A0A4_A0A8
	ldx #$06

L_BRS_A0AC_A0B0:

	sta $D86D,X
	dex
	bne L_BRS_A0AC_A0B0
	ldx $CD
	ldy $B564,X
	lda $B564,X
	pha
	ldx #$06
	lda #$00

L_BRS_A0BF_A0C4:

	sta $3800,Y
	iny
	dex
	bne L_BRS_A0BF_A0C4
	pla
	tax
	ldy #$00

L_BRS_A0CA_A105:

	lda $CC
	bne L_BRS_A0D5_A0CC
	lda $00C9,Y
	and #$F0
	beq L_BRS_A0E6_A0D3

L_BRS_A0D5_A0CC:

	lda $00C9,Y
	lsr
	lsr
	lsr
	lsr
	clc
	adc #$08
	sta $3800,X
	lda #$FF
	sta $CC

L_BRS_A0E6_A0D3:

	inx
	lda $CC
	bne L_BRS_A0F2_A0E9
	lda $00C9,Y
	and #$0F
	beq L_BRS_A101_A0F0

L_BRS_A0F2_A0E9:

	lda $00C9,Y
	and #$0F
	clc
	adc #$08
	sta $3800,X
	lda #$FF
	sta $CC

L_BRS_A101_A0F0:

	inx
	iny
	cpy #$03
	bne L_BRS_A0CA_A105
	rts

L_JSR_A108_9703:
L_JSR_A108_99FC:
L_JSR_A108_9D75:
L_JSR_A108_AA23:
L_JSR_A108_AB41:

	sei
	tya
	pha
	txa
	pha
	sed
	lda $5C
	cmp #$09
	bcc L_BRS_A116_A112
	lda #$08

L_BRS_A116_A112:

	asl
	tay
	lda $B567,Y
	clc
	adc $CB
	sta $CB
	lda $B566,Y
	adc $CA
	sta $CA
	bcc L_BRS_A146_A127
	php
	ldx $CD
	inc $D0,X
	inc $35,X
	jsr L_JSR_A852_A130
	lda #$0F
	jsr L_JSR_AC2E_A135
	lda #$10
	jsr L_JSR_AC2E_A13A
	lda #$11
	jsr L_JSR_AC2E_A13F
	jsr L_JSR_A17A_A142
	plp

L_BRS_A146_A127:

	lda #$00
	adc $C9
	sta $C9
	cld
	jsr L_JSR_A09C_A14D
	pla
	tax
	pla
	tay
	cli
	rts

L_JSR_A156_9EC2:
L_JSR_A156_9EFD:
L_JSR_A156_A04E:
L_JSR_A156_A1BE:

	sei
	lda #$F0
	sta $C0
	lda #$38
	sta $C1
	ldy #$00

L_BRS_A161_A16F:
L_BRS_A161_A177:

	lda #$00
	sta ($C0),Y
	inc $C0
	bne L_BRS_A16B_A167
	inc $C1

L_BRS_A16B_A167:

	lda $C1
	cmp #$3B
	bne L_BRS_A161_A16F
	lda $C0
	cmp #$F7
	beq L_BRS_A179_A175
	bne L_BRS_A161_A177

L_BRS_A179_A175:

	rts

L_JSR_A17A_9F03:
L_JSR_A17A_A02C:
L_JSR_A17A_A142:

	ldy $CD
	ldx $B5D3,Y
	ldy #$08
	lda #$00

L_BRS_A183_A188:

	sta $3800,X
	inx
	dey
	bne L_BRS_A183_A188
	ldy $CD
	ldx $B5D3,Y
	lda $00D0,Y
	sec
	sbc #$01
	beq L_BRS_A1AD_A195
	cmp #$04
	bcc L_BRS_A19D_A199
	lda #$04

L_BRS_A19D_A199:

	tay

L_BRS_A19E_A1AB:

	lda #$4F
	sta $3800,X
	lda #$50
	inx
	sta $3800,X
	inx
	dey
	bne L_BRS_A19E_A1AB

L_BRS_A1AD_A195:

	rts

L_JSR_A1AE_9719:

	lda #$00
	sta $D418                          // Select Filter Mode and Volume
	ldy $CD
	lda $00D0,Y
	bne L_BRS_A234_A1B8
	sei
	jsr L_JSR_9F14_A1BB
	jsr L_JSR_A156_A1BE
	lda #$E3
	sta $27
	lda #$B5
	sta $28
	lda #$17
	sta $22
	lda #$3A
	sta $23
	ldx #$F7
	jsr L_JSR_8D6D_A1D3
	lda $C6
	beq L_BRS_A1F7_A1D8
	ldx $CD
	lda $B5F2,X
	sta $3A6F
	lda #$EC
	sta $27
	lda #$B5
	sta $28
	lda #$67
	sta $22
	lda #$3A
	sta $23
	ldx #$FA
	jsr L_JSR_8D6D_A1F4

L_BRS_A1F7_A1D8:

	lda #$FE
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	ldx #$01

L_BRS_A1FE_A21E:
L_BRS_A1FE_A228:
L_JMP_A1FE_A22E:

	ldy #$7F
	txa

L_BRS_A201_A205:

	sta $DA16,Y
	dey
	bne L_BRS_A201_A205
	lda #$CC
	jsr L_JSR_9F07_A209
	lda $D0
	bne L_BRS_A21B_A20E
	lda $D1
	bne L_BRS_A21B_A212
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	cmp #$EF
	beq L_BRS_A231_A219

L_BRS_A21B_A20E:
L_BRS_A21B_A212:

	inx
	cpx #$08
	bcc L_BRS_A1FE_A21E
	ldx #$01
	lda $D0
	bne L_BRS_A234_A224
	lda $C6
	beq L_BRS_A1FE_A228
	lda $D1
	bne L_BRS_A234_A22C
	jmp L_JMP_A1FE_A22E

L_BRS_A231_A219:

	jmp L_JMP_825D_A231

L_BRS_A234_A1B8:
L_BRS_A234_A224:
L_BRS_A234_A22C:

	cli
	rts

L_JSR_A236_98AD:

	ldx #$0B

L_BRS_A238_A23F:

	lda $4007,X
	bne L_BRS_A242_A23B

L_BRS_A23D_A248:
L_BRS_A23D_A24C:
L_BRS_A23D_A254:
L_JMP_A23D_A2E4:

	cli
	dex
	bne L_BRS_A238_A23F
	rts

L_BRS_A242_A23B:

	lda $4207,X
	tay
	cmp #$14
	bcc L_BRS_A23D_A248
	cmp #$1C
	bcs L_BRS_A23D_A24C
	jsr L_JSR_A2E7_A24E
	cmp $A36E,Y
	bcc L_BRS_A23D_A254
	ldy #$05

L_BRS_A258_A25E:

	lda $400D,Y
	beq L_BRS_A261_A25B
	dey
	bne L_BRS_A258_A25E
	rts

L_BRS_A261_A25B:

	sei
	lda $4007,X
	sta $400D,Y
	lda $4087,X
	sta $408D,Y
	lda $4107,X
	sta $410D,Y
	txa
	sta $440D,Y
	lda $4103
	bpl L_BRS_A285_A27B
	lda $408D,Y
	cmp $4083
	bcs L_BRS_A28E_A283

L_BRS_A285_A27B:

	jsr L_JSR_A2E7_A285
	jsr L_JSR_A301_A288
	jmp L_JMP_A296_A28B

L_BRS_A28E_A283:

	jsr L_JSR_A2E7_A28E
	jsr L_JSR_A301_A291
	ora #$80

L_JMP_A296_A28B:

	cmp #$80
	bne L_BRS_A29C_A298
	lda #$00

L_BRS_A29C_A298:

	sta $468D,Y
	lda $400D,Y
	cmp $4003
	bcc L_BRS_A2B2_A2A5
	jsr L_JSR_A2E7_A2A7
	jsr L_JSR_A301_A2AA
	ora #$80
	jmp L_JMP_A2B8_A2AF

L_BRS_A2B2_A2A5:

	jsr L_JSR_A2E7_A2B2
	jsr L_JSR_A301_A2B5

L_JMP_A2B8_A2AF:

	sta $470D,Y
	lda #$12
	sta $420D,Y
	lda #$01
	sta $418D,Y
	lda #$50
	sta $479D,Y
	sty $51
	stx $52
	lda $4207,X
	tay
	cmp #$14
	bcc L_BRS_A2E0_A2D4
	cmp #$1A
	bcs L_BRS_A2E0_A2D8
	lda $A308,Y
	jsr L_JSR_AC2E_A2DD

L_BRS_A2E0_A2D4:
L_BRS_A2E0_A2D8:

	ldx $52
	ldy $51
	jmp L_JMP_A23D_A2E4

L_JSR_A2E7_8EA4:
L_JSR_A2E7_995D:
L_JSR_A2E7_9A0A:
L_JSR_A2E7_9AFA:
L_JSR_A2E7_9B14:
L_JSR_A2E7_9C55:
L_JSR_A2E7_A24E:
L_JSR_A2E7_A285:
L_JSR_A2E7_A28E:
L_JSR_A2E7_A2A7:
L_JSR_A2E7_A2B2:
L_JSR_A2E7_A5CF:
L_JSR_A2E7_A966:
L_JSR_A2E7_ABF9:

	stx $AE
	ldx $37
	lda $5F00,X
	sta $AD
	ldx $AE
	inc $37
	rts

L_JSR_A2F5_A3D6:

	stx $73
	ldx $37
	lda $5F00,X
	ldx $73
	inc $37
	rts

L_JSR_A301_A288:
L_JSR_A301_A291:
L_JSR_A301_A2AA:
L_JSR_A301_A2B5:

	sty $AE
	and #$07
	sta $AD
	lda $4207,X
	asl
	asl
	asl
	sec
	sbc #$A0
	clc
	adc $AD
	tay
	lda $A324,Y
	sta $AD
	ldy $AE
	rts

	.byte $0D,$19,$08,$08,$0D,$0D,$14,$14
	.byte $04,$00,$04,$05,$05,$07,$06,$06
	.byte $04,$04,$04,$00,$04,$05,$05,$06
	.byte $84,$83,$03,$00,$00,$04,$04,$05
	.byte $84,$83,$00,$03,$03,$04,$05,$00
	.byte $04,$00,$04,$04,$05,$05,$06,$06
	.byte $00,$04,$04,$04,$05,$05,$06,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00

L_JSR_A364_8464:

	lda #$81
	sta $D418                          // Select Filter Mode and Volume
	sta $D412                          // Voice 3: Control Register
	lda #$22
	sta $D40F                          // Voice 3: Frequency Control - High-Byte
	ldy #$00

L_BRS_A373_A37F:

	lda $D41B                          // Oscillator 3 Output
	sta $5F00,Y
	lda #$FF
	jsr L_JSR_9F07_A37B
	iny
	bne L_BRS_A373_A37F
	rts

	.byte $80,$DC,$DC,$DC,$B4,$B4,$DC,$DC

L_BRS_A38A_A39C:

	lda $B9
	cmp #$0C
	bcc L_BRS_A391_A38E
	rts

L_BRS_A391_A38E:

	ldx #$01
	lda #$06
	sta $63
	jmp L_JMP_A3C9_A397

L_JSR_A39A_856C:

	lda $BD
	beq L_BRS_A38A_A39C
	cmp #$06
	bcc L_BRS_A3B0_A3A0
	lda $B9
	clc
	adc #$05
	cmp #$19
	bcs L_BRS_A40D_A3A9
	ldx #$05
	jmp L_JMP_A3BB_A3AD

L_BRS_A3B0_A3A0:

	lda $B9
	clc
	adc $BD
	cmp #$19
	bcs L_BRS_A40D_A3B7
	ldx $BD

L_JMP_A3BB_A3AD:

	lda $B7
	beq L_BRS_A3C5_A3BD
	lda #$01
	sta $63
	bne L_BRS_A3C9_A3C3

L_BRS_A3C5_A3BD:

	lda #$02
	sta $63

L_JMP_A3C9_A397:
L_BRS_A3C9_A3C3:

	ldy #$64
	lda #$00
	sta $BE
	sta $BF

L_BRS_A3D1_A40B:

	lda $5002,Y
	bne L_BRS_A407_A3D4

L_BRS_A3D6_A3DB:

	jsr L_JSR_A2F5_A3D6
	cmp #$88
	bcs L_BRS_A3D6_A3DB
	sta $5000,Y
	lda #$08
	sta $5001,Y
	lda $63
	sta $5002,Y
	lda #$F0
	sta $5083,Y
	lda $63
	cmp #$06
	beq L_BRS_A402_A3F3
	lda $B4
	bne L_BRS_A3FE_A3F7
	dec $B5
	jmp L_JMP_A400_A3FB

L_BRS_A3FE_A3F7:

	dec $B4

L_JMP_A400_A3FB:

	dec $BD

L_BRS_A402_A3F3:

	inc $B9
	dex
	beq L_BRS_A40D_A405

L_BRS_A407_A3D4:

	dey
	dey
	dey
	dey
	bne L_BRS_A3D1_A40B

L_BRS_A40D_A3A9:
L_BRS_A40D_A3B7:
L_BRS_A40D_A405:

	rts

L_JSR_A40E_8486:

	lda $B1
	bne L_BRS_A461_A410
	ldx $31
	lda #$00
	sta $B5

L_BRS_A418_A41E:

	dex
	beq L_BRS_A420_A419
	clc
	adc #$28
	bpl L_BRS_A418_A41E

L_BRS_A420_A419:

	sta $14
	lda $BB
	sec
	sbc #$01
	asl
	asl
	asl
	clc
	adc $14
	tay
	lda $BCA2,Y
	sta $B8
	lda $BCA3,Y
	sta $B2
	lda $BCA4,Y
	sta $B3
	lda $BCA5,Y
	ldx $B7
	bne L_BRS_A449_A442
	sta $B5
	jmp L_JMP_A44B_A446

L_BRS_A449_A442:

	sta $B4

L_JMP_A44B_A446:

	sta $BD
	lda $BCA6,Y
	asl
	sta $2F
	lda #$00
	sta $BE
	sta $BF
	sta $B6
	sta $BF
	lda #$01
	sta $B1

L_BRS_A461_A410:

	rts

L_JSR_A462_A05D:

	lda #$00
	sta $B3
	sta $B2
	sta $B4
	sta $B5
	sta $B6

L_JSR_A46E_9706:

	lda #$00
	sta $B7
	sta $BA
	ldy #$64

L_BRS_A476_A4B6:

	lda $5002,Y
	beq L_BRS_A4AE_A479
	cmp #$01
	bne L_BRS_A484_A47D
	inc $B4
	jmp L_JMP_A4AE_A481

L_BRS_A484_A47D:

	cmp #$02
	bne L_BRS_A48D_A486
	inc $B5
	jmp L_JMP_A4AE_A48A

L_BRS_A48D_A486:

	cmp #$03
	bne L_BRS_A496_A48F
	inc $B2
	jmp L_JMP_A4AE_A493

L_BRS_A496_A48F:

	cmp #$04
	bne L_BRS_A49F_A498
	inc $B3
	jmp L_JMP_A4AE_A49C

L_BRS_A49F_A498:

	cmp #$05
	bne L_BRS_A4A8_A4A1
	inc $B6
	jmp L_JMP_A4AE_A4A5

L_BRS_A4A8_A4A1:

	cmp #$07
	bne L_BRS_A4AE_A4AA
	inc $B7

L_BRS_A4AE_A479:
L_JMP_A4AE_A481:
L_JMP_A4AE_A48A:
L_JMP_A4AE_A493:
L_JMP_A4AE_A49C:
L_JMP_A4AE_A4A5:
L_BRS_A4AE_A4AA:

	tya
	jsr L_JSR_A86F_A4AF
	dey
	dey
	dey
	dey
	bne L_BRS_A476_A4B6
	lda $B7
	bne L_BRS_A4C4_A4BA
	lda $B5
	clc
	adc $BD
	jmp L_JMP_A4C6_A4C1

L_BRS_A4C4_A4BA:

	lda $B4

L_JMP_A4C6_A4C1:

	sta $BD
	rts

L_JSR_A4C9_8489:

	lda $BA
	beq L_BRS_A4CE_A4CB
	rts

L_BRS_A4CE_A4CB:

	ldy #$64
	lda #$00
	sta $C4
	sta $B9
	lda $B7
	sta $51
	beq L_BRS_A502_A4DA
	lda #$00
	sta $C0

L_BRS_A4E0_A500:

	lda $C0
	sta $5000,Y
	clc
	adc #$0D
	sta $C0
	lda #$16
	sta $5001,Y
	lda #$07
	sta $5002,Y
	lda #$01
	sta $5083,Y
	inc $B9
	jsr L_JSR_A5BC_A4FB
	dec $51
	bne L_BRS_A4E0_A500

L_BRS_A502_A4DA:

	lda #$00
	sta $57
	lda $B2
	beq L_BRS_A525_A508

L_BRS_A50A_A523:

	jsr L_JSR_A5CF_A50A
	lda #$0D
	sta $5001,Y
	lda #$03
	sta $5002,Y
	lda #$F0
	sta $5083,Y
	inc $B9
	jsr L_JSR_A5BC_A51E
	dec $B2
	bne L_BRS_A50A_A523

L_BRS_A525_A508:

	lda $B3
	beq L_BRS_A544_A527

L_BRS_A529_A542:

	jsr L_JSR_A5CF_A529
	lda #$0C
	sta $5001,Y
	lda #$04
	sta $5002,Y
	lda #$F0
	sta $5083,Y
	inc $B9
	jsr L_JSR_A5BC_A53D
	dec $B3
	bne L_BRS_A529_A542

L_BRS_A544_A527:

	lda $B6
	beq L_BRS_A563_A546

L_BRS_A548_A561:

	jsr L_JSR_A5CF_A548
	lda #$0D
	sta $5001,Y
	lda #$05
	sta $5002,Y
	lda #$F0
	sta $5083,Y
	inc $B9
	jsr L_JSR_A5BC_A55C
	dec $B6
	bne L_BRS_A548_A561

L_BRS_A563_A546:

	lda $B5
	beq L_BRS_A588_A565

L_BRS_A567_A586:

	jsr L_JSR_A5CF_A567
	lda #$08
	sta $5001,Y
	lda #$02
	sta $5002,Y
	lda #$F0
	sta $5083,Y
	inc $B9
	jsr L_JSR_A5BC_A57B
	lda $B7
	bne L_BRS_A584_A580
	dec $BD

L_BRS_A584_A580:

	dec $B5
	bne L_BRS_A567_A586

L_BRS_A588_A565:

	lda #$05
	sta $51
	lda $B4
	beq L_BRS_A5B1_A58E

L_BRS_A590_A5AF:

	jsr L_JSR_A5CF_A590
	lda #$08
	sta $5001,Y
	lda #$01
	sta $5002,Y
	lda #$F0
	sta $5083,Y
	inc $B9
	jsr L_JSR_A5BC_A5A4
	dec $B4
	dec $BD
	beq L_BRS_A5B1_A5AB
	dec $51
	bne L_BRS_A590_A5AF

L_BRS_A5B1_A58E:
L_BRS_A5B1_A5AB:
L_JMP_A5B1_A5C9:
L_JMP_A5B1_A5CC:

	lda #$01
	sta $BA
	lda $57
	bne L_BRS_A5BB_A5B7
	sta $B8

L_BRS_A5BB_A5B7:

	rts

L_JSR_A5BC_A4FB:
L_JSR_A5BC_A51E:
L_JSR_A5BC_A53D:
L_JSR_A5BC_A55C:
L_JSR_A5BC_A57B:
L_JSR_A5BC_A5A4:

	inc $57
	dey
	dey
	dey
	dey
	bmi L_BRS_A5C7_A5C2
	beq L_BRS_A5C7_A5C4
	rts

L_BRS_A5C7_A5C2:
L_BRS_A5C7_A5C4:

	pla
	pla
	jmp L_JMP_A5B1_A5C9
	jmp L_JMP_A5B1_A5CC

L_JSR_A5CF_A50A:
L_JSR_A5CF_A529:
L_JSR_A5CF_A548:
L_JSR_A5CF_A567:
L_JSR_A5CF_A590:
L_BRS_A5CF_A5D4:

	jsr L_JSR_A2E7_A5CF
	cmp #$88
	bcs L_BRS_A5CF_A5D4
	sta $5000,Y
	rts

L_BRS_A5DA_A5F4:
L_BRS_A5DA_A5FB:

	jmp L_JMP_A689_A5DA

L_BRS_A5DD_A607:

	jmp L_JMP_A694_A5DD

L_JSR_A5E0_8572:

	lda $C022
	beq L_BRS_A5E6_A5E3
	rts

L_BRS_A5E6_A5E3:

	lda $18
	beq L_BRS_A5EF_A5E8
	ldx #$06
	jmp L_JMP_A5F1_A5EC

L_BRS_A5EF_A5E8:

	ldx #$0B

L_JMP_A5F1_A5EC:
L_BRS_A5F1_A633:
L_JMP_A5F1_A691:

	lda $4007,X
	beq L_BRS_A5DA_A5F4
	lda $4687,X
	cmp #$80
	beq L_BRS_A5DA_A5FB
	lda $4207,X
	cmp #$12
	bne L_BRS_A609_A602
	inc $4797,X
	bmi L_BRS_A5DD_A607

L_BRS_A609_A602:

	lda $4107,X
	bpl L_BRS_A610_A60C
	lda #$00

L_BRS_A610_A60C:

	sta $28
	lda $4087,X
	sta $27
	lda $4687,X
	cmp #$80
	bcc L_BRS_A636_A61C
	and #$7F
	sta $73
	lda $27
	sec
	sbc $73
	bcs L_BRS_A62B_A627
	dec $28

L_BRS_A62B_A627:

	sta $27
	jmp L_JMP_A643_A62D

L_BRS_A630_A68B:

	dex
	cpx #$06
	bne L_BRS_A5F1_A633
	rts

L_BRS_A636_A61C:

	sta $73
	lda $27
	clc
	adc $73
	bcc L_BRS_A641_A63D
	inc $28

L_BRS_A641_A63D:

	sta $27

L_JMP_A643_A62D:

	lda $27
	sta $4087,X
	lda $28
	bne L_BRS_A64E_A64A
	lda #$FF

L_BRS_A64E_A64A:

	sta $4107,X
	lda $4707,X
	bpl L_BRS_A663_A654
	and #$7F
	sta $74
	lda $4007,X
	sec
	sbc $74
	jmp L_JMP_A66A_A660

L_BRS_A663_A654:

	lda $4007,X
	clc
	adc $4707,X

L_JMP_A66A_A660:

	cmp #$5A
	bcs L_BRS_A679_A66C
	lda $4207,X
	cmp #$12
	beq L_BRS_A694_A673
	lda #$F0
	bne L_BRS_A686_A677

L_BRS_A679_A66C:

	cmp #$F6
	bcc L_BRS_A686_A67B
	lda $4207,X
	cmp #$12
	beq L_BRS_A694_A682
	lda #$5B

L_BRS_A686_A677:
L_BRS_A686_A67B:

	sta $4007,X

L_JMP_A689_A5DA:
L_JMP_A689_A699:

	lda $18
	beq L_BRS_A630_A68B
	dex
	bne L_BRS_A691_A68E
	rts

L_BRS_A691_A68E:

	jmp L_JMP_A5F1_A691

L_JMP_A694_A5DD:
L_BRS_A694_A673:
L_BRS_A694_A682:

	txa
	tay
	jsr L_JSR_ABC6_A696
	jmp L_JMP_A689_A699

L_JSR_A69C_84B2:

	ldy #$64

L_BRS_A69E_A6FF:

	lda $5002,Y
	beq L_BRS_A6EF_A6A1
	lda $5003,Y
	bne L_BRS_A6EF_A6A6
	lda #$00
	sta $14
	sta $C1
	lda $5000,Y
	ldx $66
	dex
	stx $C0
	ldx #$26

L_BRS_A6B8_A6CD:

	cmp $C0
	beq L_BRS_A702_A6BA
	dec $C0
	sta $51
	lda $C0
	cmp #$88
	bcc L_BRS_A6CA_A6C4
	lda #$87
	sta $C0

L_BRS_A6CA_A6C4:

	lda $51
	dex
	bne L_BRS_A6B8_A6CD
	jmp L_JMP_A6EF_A6CF

L_JMP_A6D2_A774:
L_JMP_A6D2_A77C:

	lda $5083,Y
	bpl L_BRS_A6EF_A6D5
	lda #$00
	sta $4781,X
	lda $4201,X
	sta $14
	lda #$A7
	sta $4201,X
	lda $14
	bpl L_BRS_A6EC_A6E8
	lda #$14

L_BRS_A6EC_A6E8:

	sta $4381,X

L_BRS_A6EF_A6A1:
L_BRS_A6EF_A6A6:
L_JMP_A6EF_A6CF:
L_BRS_A6EF_A6D5:

	lda $5083,Y
	cmp #$F0
	bne L_BRS_A6FB_A6F4
	lda #$01
	sta $5083,Y

L_BRS_A6FB_A6F4:

	dey
	dey
	dey
	dey
	bne L_BRS_A69E_A6FF
	rts

L_BRS_A702_A6BA:

	stx $C0
	ldx #$07

L_BRS_A706_A77A:

	lda $4001,X
	php
	cmp #$12
	bne L_BRS_A712_A70C
	plp
	jmp L_JMP_A715_A70F

L_BRS_A712_A70C:

	plp
	bne L_BRS_A777_A713

L_JMP_A715_A70F:

	lda #$00
	sta $4681,X
	sta $4701,X
	tya
	sta $4481,X
	txa
	sta $5100,Y
	lda #$01
	sta $5003,Y
	asl $C0
	asl $C0
	asl $C0
	rol $C1
	lda $C0
	clc
	adc #$18
	bcc L_BRS_A73B_A737
	inc $C1

L_BRS_A73B_A737:

	sta $C0
	lda $C0
	sta $4081,X
	lda $C1
	beq L_BRS_A74B_A744
	lda #$01
	jmp L_JMP_A74D_A748

L_BRS_A74B_A744:

	lda #$FF

L_JMP_A74D_A748:

	sta $4101,X
	stx $14
	ldx $5002,Y
	lda $AA65,X
	ldx $14
	sta $4201,X
	ldx $5002,Y
	lda $AA6D,X
	ldx $14
	sta $4181,X
	lda $5001,Y
	asl
	asl
	asl
	clc
	adc #$32
	sta $4001,X
	jmp L_JMP_A6D2_A774

L_BRS_A777_A713:

	inx
	cpx #$11
	bne L_BRS_A706_A77A
	jmp L_JMP_A6D2_A77C

L_JSR_A77F_A81A:

	sty $14
	tay
	jsr L_JSR_ABC6_A782
	ldy $14
	rts

L_JSR_A788_848C:

	lda $66
	sec
	sbc #$28
	cmp #$88
	bcc L_BRS_A794_A78F
	sec
	sbc #$78

L_BRS_A794_A78F:

	sta $C3
	ldx #$0B

L_BRS_A798_A7BF:

	lda $4007,X
	beq L_BRS_A7BE_A79B
	lda $4207,X
	cmp #$1E
	bcs L_BRS_A7BE_A7A2
	cmp #$12
	bcc L_BRS_A7BE_A7A6
	lda $4107,X
	bmi L_BRS_A7B7_A7AB
	lda $4087,X
	cmp #$59
	bcs L_BRS_A7C2_A7B2
	jmp L_JMP_A7BE_A7B4

L_BRS_A7B7_A7AB:

	lda $4087,X
	cmp #$18
	bcc L_BRS_A7C2_A7BC

L_BRS_A7BE_A79B:
L_BRS_A7BE_A7A2:
L_BRS_A7BE_A7A6:
L_JMP_A7BE_A7B4:
L_JMP_A7BE_A816:
L_JMP_A7BE_A81D:

	dex
	bne L_BRS_A798_A7BF
	rts

L_BRS_A7C2_A7B2:
L_BRS_A7C2_A7BC:

	lda #$FF
	sta $4787,X
	lda #$80
	sta $4687,X
	sta $4707,X
	lda $4207,X
	cmp #$12
	beq L_BRS_A819_A7D4
	stx $14
	sta $C0
	lda $4107,X
	bpl L_BRS_A7E4_A7DD
	lda $C3
	jmp L_JMP_A7E6_A7E1

L_BRS_A7E4_A7DD:

	lda $66

L_JMP_A7E6_A7E1:

	ldy $4487,X
	sta $5000,Y
	lda $4007,X
	sec
	sbc #$32
	lsr
	lsr
	lsr
	cmp #$08
	bcs L_BRS_A7FE_A7F7
	lda #$17
	jmp L_JMP_A804_A7FB

L_BRS_A7FE_A7F7:

	cmp #$18
	bcc L_BRS_A804_A800
	lda #$06

L_JMP_A804_A7FB:
L_BRS_A804_A800:

	sta $5001,Y
	lda #$00
	sta $5003,Y
	sta $5100,Y
	txa
	tay
	jsr L_JSR_ABC6_A811
	ldx $14
	jmp L_JMP_A7BE_A816

L_BRS_A819_A7D4:

	txa
	jsr L_JSR_A77F_A81A
	jmp L_JMP_A7BE_A81D

L_JSR_A820_84D6:

	ldx $CD
	dec $35,X
	jsr L_JSR_A852_A824
	lda #$12
	jsr L_JSR_AC2E_A829
	lda #$00
	sta $73
	ldy #$0B

L_BRS_A832_A84B:

	lda $4207,Y
	cmp #$1E
	bcs L_BRS_A84A_A837
	cmp #$14
	bcc L_BRS_A84A_A83B
	sta $4387,Y
	lda #$A0
	sta $4207,Y
	lda #$01
	sta $4787,Y

L_BRS_A84A_A837:
L_BRS_A84A_A83B:

	dey
	bne L_BRS_A832_A84B
	lda #$00
	sta $C4
	rts

L_JSR_A852_A029:
L_JSR_A852_A130:
L_JSR_A852_A824:

	ldx $CD
	lda $35,X
	cmp #$03
	bcc L_BRS_A85C_A858
	lda #$03

L_BRS_A85C_A858:

	asl
	tay
	lda $B5F4,X
	tax
	lda $B5F6,Y
	sta $3800,X
	lda $B5F7,Y
	sta $3828,X
	rts

L_JSR_A86F_970C:
L_JSR_A86F_9984:
L_JSR_A86F_A4AF:
L_JSR_A86F_AB75:

	tax
	lda #$00
	sta $5000,X
	sta $5001,X
	sta $5002,X
	sta $5003,X
	sta $5080,X
	sta $5081,X
	sta $5082,X
	sta $5083,X
	sta $5100,X
	sta $5101,X
	sta $5102,X
	sta $5103,X
	rts

L_JMP_A897_8698:

	jsr L_JSR_92B6_A897
	and #$FF
	bpl L_BRS_A8A8_A89C
	ldx $CD
	lda $35,X
	beq L_BRS_A8A8_A8A2
	lda #$01
	sta $C4

L_BRS_A8A8_A89C:
L_BRS_A8A8_A8A2:

	jmp L_JMP_86CC_A8A8

L_JSR_A8AB_84E0:

	lda $66
	clc
	adc #$43
	sec
	cmp #$87
	bcc L_BRS_A8B8_A8B3
	sec
	sbc #$87

L_BRS_A8B8_A8B3:

	sta $66
	jsr L_JSR_84F9_A8BA
	jsr L_JSR_84F9_A8BD
	jsr L_JSR_8B2E_A8C0
	ldx #$0B

L_BRS_A8C5_A8E1:

	lda $4207,X
	cmp #$13
	bne L_BRS_A8D6_A8CA
	ldy $4487,X
	lda $5083,Y
	cmp #$04
	beq L_BRS_A8E0_A8D4

L_BRS_A8D6_A8CA:

	lda #$00
	sta $4007,X
	lda #$FF
	sta $4787,X

L_BRS_A8E0_A8D4:

	dex
	bne L_BRS_A8C5_A8E1
	lda #$01
	sta $D015                          // Sprite display Enable
	lda $4083
	sec
	sbc #$0C
	bcc L_BRS_A8FF_A8EE
	sta $51
	lda $4103
	bpl L_BRS_A8FF_A8F5
	lda #$00
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	jmp L_JMP_A906_A8FC

L_BRS_A8FF_A8EE:
L_BRS_A8FF_A8F5:

	sta $51
	lda #$01
	sta $D010                          // Sprites 0-7 MSB of X coordinate

L_JMP_A906_A8FC:

	lda $51
	sta $D000                          // Sprite 0 X Pos
	lda $4003
	sec
	sbc #$15
	sta $D001                          // Sprite 0 Y Pos
	lda #$01
	sta $D01D                          // Sprites Expand 2x Horizontal (X)
	sta $D017                          // Sprites Expand 2x Vertical (Y)
	sta $D027                          // Sprite 0 Color
	ldx #$08
	ldy #$A7

L_BRS_A923_A92D:

	sty $3BF8
	lda #$E0
	jsr L_JSR_9F07_A928
	dey
	dex
	bne L_BRS_A923_A92D
	lda #$00
	sta $C4
	sta $D017                          // Sprites Expand 2x Vertical (Y)
	sta $D01D                          // Sprites Expand 2x Horizontal (X)
	lda #$FF
	sta $D015                          // Sprite display Enable
	ldx #$08
	lda #$1F

L_BRS_A942_A946:

	sta $3BF7,X
	dex
	bne L_BRS_A942_A946
	ldx #$64

L_BRS_A94A_A964:

	lda $5002,X
	cmp #$07
	bne L_BRS_A958_A94F
	lda $5083,X
	cmp #$04
	beq L_BRS_A960_A956

L_BRS_A958_A94F:

	lda #$00
	sta $5003,X
	sta $5100,X

L_BRS_A960_A956:

	dex
	dex
	dex
	dex
	bne L_BRS_A94A_A964
	jsr L_JSR_A2E7_A966
	cmp #$AA
	bcc L_BRS_A971_A96B
	lda #$FF
	sta $75

L_BRS_A971_A96B:

	rts

L_JMP_A972_86B4:

	jsr L_JSR_92B6_A972
	and #$FF
	bpl L_BRS_A985_A977
	jsr L_JSR_929F_A979
	lda #$02
	sta $C4
	lda #$15
	jsr L_JSR_AC2E_A982

L_BRS_A985_A977:

	jmp L_JMP_86CC_A985

L_JSR_A988_84EA:
L_BRS_A988_A992:
L_BRS_A988_A998:

	lda #$FE
	sta $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	lda $DC01                          // Data Port B (Keyboard, Joystick, Paddles)
	cmp $33
	beq L_BRS_A988_A992
	sta $33
	and #$40
	bne L_BRS_A988_A998
	lda #$00
	sta $C4
	rts

L_JMP_A99F_86C9:

	lda #$03
	sta $C4
	jmp L_JMP_86CC_A9A3

L_JSR_A9A6_8495:

	ldx #$0B

L_BRS_A9A8_A9BA:

	lda $4007,X
	beq L_BRS_A9B8_A9AB
	ldy $4207,X
	cpy #$12
	bcc L_BRS_A9B8_A9B2
	cpy #$1E
	bcc L_BRS_A9BD_A9B6

L_BRS_A9B8_A9AB:
L_BRS_A9B8_A9B2:
L_BRS_A9B8_A9EF:
L_BRS_A9B8_A9FF:
L_JMP_A9B8_AA28:

	cli
	dex
	bne L_BRS_A9A8_A9BA
	rts

L_BRS_A9BD_A9B6:

	sei
	lda $4087,X
	sta $C0
	lda $4107,X
	bpl L_BRS_A9CA_A9C6
	lda #$00

L_BRS_A9CA_A9C6:

	sta $C1
	ror $C1
	ror $C0
	lda $4083
	sta $16
	lda $4103
	bpl L_BRS_A9DC_A9D8
	lda #$00

L_BRS_A9DC_A9D8:

	sta $17
	ror $17
	ror $16
	cli
	lda $C0
	clc
	adc $AA24,Y
	sec
	sbc $16
	and $AA3C,Y
	bne L_BRS_A9B8_A9EF
	lda $4007,X
	clc
	adc $AA30,Y
	sec
	sbc $4003
	and $AA3C,Y
	bne L_BRS_A9B8_A9FF
	cpy #$13
	bne $AA2B
	stx $51
	txa
	tay
	ldx $4487,Y
	lda $5083,X
	cmp #$03
	bne L_BRS_AA26_AA11
	lda #$1A
	jsr L_JSR_AC2E_AA15
	lda #$04
	sta $5083,X
	inc $5B
	lda #$08
	sta $5C
	jsr L_JSR_A108_AA23

L_BRS_AA26_AA11:

	ldx $51
	jmp L_JMP_A9B8_AA28

	.byte $A9,$EE,$9D,$87,$41,$A9,$FF,$85
	.byte $75,$D0,$F2,$03,$04,$04,$03,$04
	.byte $04,$04,$04,$04,$04,$04,$04,$06
	.byte $08,$08,$06,$08,$08,$08,$08,$08
	.byte $08,$08,$08,$F0,$F0,$F0,$F0,$F0
	.byte $F0,$F0,$F0,$F0,$F0,$F0,$F0,$00
	.byte $06,$05,$01,$01,$02,$02,$03,$03
	.byte $04,$04,$00,$16,$18,$1A,$1C,$15
	.byte $14,$13,$00,$05,$05,$04,$04,$02
	.byte $05,$02

L_JSR_AA75_8492:

	ldy #$0B

L_BRS_AA77_AAB6:

	lda $4007,Y
	beq L_BRS_AAB5_AA7A
	lda $4787,Y
	beq L_BRS_AA94_AA7F
	bmi L_BRS_AAB5_AA81
	lda $4207,Y
	clc
	adc #$01
	cmp #$A8
	bcs L_BRS_AAAD_AA8B
	cmp #$A1
	bne L_BRS_AAB2_AA8F
	jmp L_JMP_AB21_AA91

L_BRS_AA94_AA7F:

	lda $4207,Y
	sec
	sbc #$01
	cmp #$A0
	bcc L_BRS_AAB9_AA9C
	cmp #$A6
	bne L_BRS_AAB2_AAA0
	sta $4207,Y
	lda #$05
	jsr L_JSR_AC2E_AAA7
	jmp L_JMP_AB8E_AAAA

L_BRS_AAAD_AA8B:

	jsr L_JSR_ABC6_AAAD
	lda #$1F

L_BRS_AAB2_AA8F:
L_BRS_AAB2_AAA0:

	sta $4207,Y

L_BRS_AAB5_AA7A:
L_BRS_AAB5_AA81:
L_JMP_AAB5_AAF4:
L_JMP_AAB5_ABBE:

	dey
	bne L_BRS_AA77_AAB6
	rts

L_BRS_AAB9_AA9C:

	lda $4387,Y
	sta $4207,Y
	lda #$FF
	sta $4787,Y
	lda $4087,Y
	sta $C0
	lda $4107,Y
	bpl L_BRS_AAD0_AACC
	lda #$00

L_BRS_AAD0_AACC:

	sta $C1
	lda $C0
	clc
	adc #$0C
	bcc L_BRS_AADB_AAD7
	inc $C1

L_BRS_AADB_AAD7:

	sta $C0
	lda $C0
	sta $4087,Y
	lda $C1
	beq L_BRS_AAF7_AAE4
	lda #$01

L_JMP_AAE8_AAF9:

	sta $4107,Y
	lda $4007,Y
	clc
	adc #$0A
	sta $4007,Y
	jmp L_JMP_AAB5_AAF4

L_BRS_AAF7_AAE4:

	lda #$FF
	jmp L_JMP_AAE8_AAF9

L_JSR_AAFC_9BA2:

	lda #$80
	sta $4681,Y
	sta $4701,Y
	lda #$FF
	sta $4781,Y
	sta $4101,Y
	lda #$F0
	sta $4401,Y
	lda #$1F
	sta $4201,Y
	rts

L_BRS_AB17_AB4F:

	cmp #$04
	bne L_BRS_AB72_AB19
	jsr L_JSR_ABE1_AB1B
	jmp L_JMP_AB72_AB1E

L_JMP_AB21_AA91:

	sta $4207,Y
	dec $B9
	sty $14
	lda $4387,Y
	sec
	sbc #$13
	bne L_BRS_AB35_AB2E
	dec $B7
	jmp L_JMP_AB44_AB32

L_BRS_AB35_AB2E:

	tax
	lda $AA5A,X
	sta $5C
	cmp #$06
	beq L_BRS_AB41_AB3D
	dec $B8

L_BRS_AB41_AB3D:

	jsr L_JSR_A108_AB41

L_JMP_AB44_AB32:

	ldy $14
	lda $4487,Y
	tax
	lda $5002,X
	cmp #$01
	bne L_BRS_AB17_AB4F
	lda $5083,X
	cmp #$05
	bne L_BRS_AB72_AB56
	lda $5102,X
	beq L_BRS_AB72_AB5B
	tax
	lda #$03
	sta $5083,X
	lda #$00
	sta $5102,X
	lda #$0A
	jsr L_JSR_AC2E_AB6A
	lda #$0B
	jsr L_JSR_AC2E_AB6F

L_BRS_AB72_AB19:
L_JMP_AB72_AB1E:
L_BRS_AB72_AB56:
L_BRS_AB72_AB5B:

	lda $4487,Y
	jsr L_JSR_A86F_AB75
	sty $14
	lda $4387,Y
	cmp #$1E
	bcs L_BRS_AB8E_AB7F
	cmp #$13
	bcc L_BRS_AB8E_AB83
	tay
	lda $AC10,Y
	jsr L_JSR_AC2E_AB89
	ldy $14

L_JMP_AB8E_AAAA:
L_BRS_AB8E_AB7F:
L_BRS_AB8E_AB83:

	lda $4087,Y
	sta $C0
	lda $4107,Y
	bpl L_BRS_AB9A_AB96
	lda #$00

L_BRS_AB9A_AB96:

	sta $C1
	lda $C0
	sec
	sbc #$0C
	bcs L_BRS_ABA5_ABA1
	dec $C1

L_BRS_ABA5_ABA1:

	sta $C0
	lda $C0
	sta $4087,Y
	lda $C1
	bne L_BRS_ABC1_ABAE
	lda #$FF

L_JMP_ABB2_ABC3:

	sta $4107,Y
	lda $4007,Y
	sec
	sbc #$0A
	sta $4007,Y
	jmp L_JMP_AAB5_ABBE

L_BRS_ABC1_ABAE:

	lda #$01
	jmp L_JMP_ABB2_ABC3

L_JSR_ABC6_A696:
L_JSR_ABC6_A782:
L_JSR_ABC6_A811:
L_JSR_ABC6_AAAD:

	lda #$80
	sta $4687,Y
	sta $4707,Y
	lda #$FF
	sta $4787,Y
	sta $4107,Y
	lda #$F0
	sta $4407,Y
	lda #$1F
	sta $4207,Y
	rts

L_JSR_ABE1_AB1B:

	sty $51
	lda $B9
	cmp #$19
	bcs L_BRS_AC20_ABE7
	lda #$04
	sta $14
	ldy #$64

L_BRS_ABEF_AC1E:

	lda $5002,Y
	bne L_BRS_AC1A_ABF2
	lda #$05
	sta $5002,Y
	jsr L_JSR_A2E7_ABF9
	and #$02
	sec
	sbc #$01
	sta $14
	lda $5000,X
	sta $5000,Y
	lda $5001,X
	clc
	adc $14
	sta $5001,Y
	inc $B8
	inc $B9
	dec $14
	beq L_BRS_AC20_AC18

L_BRS_AC1A_ABF2:

	dey
	dey
	dey
	dey
	bne L_BRS_ABEF_AC1E

L_BRS_AC20_ABE7:
L_BRS_AC20_AC18:

	ldy $51
	rts

	.byte $0A,$18,$18,$06,$06,$0A,$0A,$17
	.byte $17,$0A,$0A

L_JSR_AC2E_83FF:
L_JSR_AC2E_8404:
L_JSR_AC2E_8409:
L_JSR_AC2E_8470:
L_JSR_AC2E_8475:
L_JSR_AC2E_847A:
L_JSR_AC2E_8E4A:
L_JSR_AC2E_958C:
L_JSR_AC2E_9660:
L_JSR_AC2E_997D:
L_JSR_AC2E_99E5:
L_JSR_AC2E_99EA:
L_JSR_AC2E_99EF:
L_JSR_AC2E_9B59:
L_JSR_AC2E_9D64:
L_JSR_AC2E_9D69:
L_JSR_AC2E_9D6E:
L_JSR_AC2E_9DF6:
L_JSR_AC2E_A018:
L_JSR_AC2E_A01D:
L_JSR_AC2E_A022:
L_JSR_AC2E_A135:
L_JSR_AC2E_A13A:
L_JSR_AC2E_A13F:
L_JSR_AC2E_A2DD:
L_JSR_AC2E_A829:
L_JSR_AC2E_A982:
L_JSR_AC2E_AA15:
L_JSR_AC2E_AAA7:
L_JSR_AC2E_AB6A:
L_JSR_AC2E_AB6F:
L_JSR_AC2E_AB89:
L_JSR_AC2E_ACE1:

	sta $EB
	asl
	sta $EA
	tya
	pha
	txa
	pha
	ldy $EB
	lda $AC71,Y
	sta $EB
	asl
	tax
	ldy $EA
	sta $EA
	lda $AC90,Y
	sta $E0,X
	sta $EC,X
	lda $AC91,Y
	sta $E1,X
	sta $ED,X
	ldx #$02

L_BRS_AC54_AC60:

	lda $F2,X
	cmp #$7F
	beq L_BRS_AC5F_AC58
	clc
	adc $F5
	sta $F2,X

L_BRS_AC5F_AC58:

	dex
	bpl L_BRS_AC54_AC60
	ldx $EB
	lda #$00
	sta $F2,X
	lda #$01
	sta $F5
	pla
	tax
	pla
	tay
	rts

	.byte $00,$01,$02,$00,$02,$02,$02,$02
	.byte $01,$02,$02,$00,$01,$01,$02,$00
	.byte $01,$02,$01,$00,$00,$01,$02,$02
	.byte $02,$01,$01,$01,$01,$00,$02,$4C
	.byte $AF,$78,$AF,$B8,$AF,$B9,$AF,$C9
	.byte $AF,$DC,$AF,$F3,$AF,$37,$B0,$88
	.byte $B0,$9F,$B0,$9F,$B0,$D3,$B0,$F6
	.byte $B0,$F8,$B0,$16,$B1,$16,$B1,$37
	.byte $B1,$4F,$B1,$74,$B1,$C2,$B1,$30
	.byte $B5,$30,$B5,$30,$B5,$48,$B2,$40
	.byte $B3,$D7,$B3,$F6,$B3,$19,$B4,$CD
	.byte $B4,$F4,$B4,$13,$B5

L_JSR_ACCE_86E4:
L_JSR_ACCE_876B:

	pha
	lda $E1
	bne L_BRS_ACE4_ACD1
	lda $EC
	cmp $B9
	beq L_BRS_ACE4_ACD7
	lda $ED
	cmp $AF
	beq L_BRS_ACE4_ACDD
	lda #$03
	jsr L_JSR_AC2E_ACE1

L_BRS_ACE4_ACD1:
L_BRS_ACE4_ACD7:
L_BRS_ACE4_ACDD:

	pla
	rts

L_JSR_ACE6_94C2:
L_JSR_ACE6_94D5:

	lda $E9
	beq L_BRS_ACF5_ACE8
	lda #$AD
	sta $E7
	lda #$85
	sta $E6
	jsr L_JSR_AD82_ACF2

L_BRS_ACF5_ACE8:

	dec $F5
	beq L_BRS_ACFA_ACF7
	rts

L_BRS_ACFA_ACF7:

	ldy #$02
	ldx #$04

L_BRS_ACFE_AD12:

	lda $E1,X
	beq L_BRS_AD0F_AD00
	lda $00F2,Y
	bne L_BRS_AD0F_AD05
	lda $AD17,Y
	sta $F6
	jsr L_JSR_AD1A_AD0C

L_BRS_AD0F_AD00:
L_BRS_AD0F_AD05:

	dex
	dex
	dey
	bpl L_BRS_ACFE_AD12
	jmp L_JMP_AD7F_AD14

	.byte $00,$07,$0E

L_JSR_AD1A_AD0C:

	txa
	pha
	tya
	pha
	asl
	stx $EA
	sty $EB

L_BRS_AD23_AD78:

	ldx $EA
	ldy $EB
	lda ($E0,X)
	sta $FE
	cmp #$A9
	bcs L_BRS_AD39_AD2D
	and #$07
	bne L_BRS_AD39_AD31
	lda $FE
	cmp #$A8
	bne L_BRS_AD45_AD37

L_BRS_AD39_AD2D:
L_BRS_AD39_AD31:

	lda #$00
	sta $E1,X
	lda #$7F
	sta $00F2,Y
	jmp L_JMP_AD7A_AD42

L_BRS_AD45_AD37:

	lda $E0,X
	clc
	adc #$01
	sta $E0,X
	lda $E1,X
	adc #$00
	sta $E1,X
	lda $FE
	and #$F8
	lsr
	lsr
	tay
	ldx #$00
	cpx $FE
	bne L_BRS_AD67_AD5D
	lda #$85
	sta $E8
	lda #$AD
	sta $E9

L_BRS_AD67_AD5D:

	lda $AF22,Y
	sta $E6
	lda $AF23,Y
	sta $E7
	jsr L_JSR_AD82_AD71
	lda $FE
	cmp #$40
	bne L_BRS_AD23_AD78

L_JMP_AD7A_AD42:

	pla
	tay
	pla
	tax
	rts

L_JMP_AD7F_AD14:

	jmp L_JMP_AEE5_AD7F

L_JSR_AD82_ACF2:
L_JSR_AD82_AD71:

	jmp ($00E6)
	lda $D41C                          // Envelope Generator 3 Output
	ldx #$02

L_JMP_AD8A_AD90:

	cpx #$00
	beq L_BRS_AD93_AD8C
	lsr
	dex
	jmp L_JMP_AD8A_AD90

L_BRS_AD93_AD8C:

	sta $D40F                          // Voice 3: Frequency Control - High-Byte
	rts
	jsr L_JSR_AED1_AD97
	ldy $F6
	sta $D400,Y                          // Voice 1: Frequency Control - Low-Byte
	jsr L_JSR_AED1_AD9F
	sta $D401,Y                          // Voice 1: Frequency Control - High-Byte
	ldx $EB
	sta $D5,X
	rts
	jsr L_JSR_AED1_ADAA
	ldy $F6
	sta $D404,Y                          // Voice 1: Control Register
	rts
	jsr L_JSR_AED1_ADB3
	ldy $F6
	sta $D402,Y                          // Voice 1: Pulse Waveform Width - Low-Byte
	jsr L_JSR_AED1_ADBB
	sta $D403,Y                          // Voice 1: Pulse Waveform Width - High-Nybble
	rts
	jsr L_JSR_AED1_ADC2
	ldy $F6
	sta $D405,Y                          // Voice 1: Attack / Decay Cycle Control
	jsr L_JSR_AED1_ADCA
	sta $D406,Y                          // Voice 1: Sustain / Release Cycle Control
	rts
	jsr L_JSR_AED1_ADD1
	sta $D415                          // Filter Cutoff Frequency: Low-Nybble
	jsr L_JSR_AED1_ADD7
	sta $FF
	sta $D416                          // Filter Cutoff Frequency: High-Byte
	rts
	jsr L_JSR_AED1_ADE0
	and #$F0
	sta $FC
	clc
	adc $FA
	sta $D417                          // Filter Resonance Control / Voice Input Control
	rts
	jsr L_JSR_AED1_ADEE
	and #$0F
	sta $FD
	clc
	adc $FB
	sta $D418                          // Select Filter Mode and Volume
	rts
	jsr L_JSR_AED1_ADFC
	ldy $EB
	sta $00F2,Y
	rts
	ldx $EA
	lda $EC,X
	sta $E0,X
	lda $ED,X
	sta $E1,X
	rts
	ldy $EB
	lda #$01

L_JMP_AE14_AE1A:

	cpy #$00
	beq L_BRS_AE1D_AE16
	asl
	dey
	jmp L_JMP_AE14_AE1A

L_BRS_AE1D_AE16:

	ora $FA
	sta $FA
	lda $FC
	clc
	adc $FA
	sta $D417                          // Filter Resonance Control / Voice Input Control
	rts
	jsr L_JSR_AED1_AE2A
	and #$F0
	sta $FB
	clc
	adc $FD
	sta $D418                          // Select Filter Mode and Volume
	rts
	ldy $EB
	lda #$FE

L_JMP_AE3C_AE43:

	cpy #$00
	sec
	beq L_BRS_AE46_AE3F
	rol
	dey
	jmp L_JMP_AE3C_AE43

L_BRS_AE46_AE3F:

	and $FA
	sta $FA
	clc
	adc $FC
	sta $D417                          // Filter Resonance Control / Voice Input Control
	rts
	lda #$00
	sta $E9
	rts
	jsr L_JSR_AED1_AE56
	ldy $EB
	clc
	adc #$01
	sta $00D2,Y
	rts
	jsr L_JSR_AED1_AE62
	tay
	jsr L_JSR_AED1_AE66
	ldx $EB
	dec $D2,X
	beq L_BRS_AE75_AE6D
	ldx $EA
	sta $E1,X
	sty $E0,X

L_BRS_AE75_AE6D:

	rts
	jsr L_JSR_AED1_AE76
	tay
	ldx $EB

L_BRS_AE7C_AE81:

	dec $D5,X
	beq L_BRS_AE8A_AE7E
	dey
	bne L_BRS_AE7C_AE81
	lda $D5,X
	ldy $F6
	sta $D401,Y                          // Voice 1: Frequency Control - High-Byte

L_BRS_AE8A_AE7E:

	rts
	jsr L_JSR_AED1_AE8B
	tay
	ldx $EB

L_BRS_AE91_AE96:

	inc $D5,X
	beq L_BRS_AE9F_AE93
	dey
	bne L_BRS_AE91_AE96
	lda $D5,X
	ldy $F6
	sta $D401,Y                          // Voice 1: Frequency Control - High-Byte

L_BRS_AE9F_AE93:

	rts
	jsr L_JSR_AED1_AEA0
	tay

L_BRS_AEA4_AEA9:

	inc $FF
	beq L_BRS_AEB0_AEA6
	dey
	bne L_BRS_AEA4_AEA9
	lda $FF
	sta $D416                          // Filter Cutoff Frequency: High-Byte

L_BRS_AEB0_AEA6:

	rts
	jsr L_JSR_AED1_AEB1
	ldy $EB
	clc
	adc #$01
	sta $00D8,Y
	rts
	jsr L_JSR_AED1_AEBD
	tay
	jsr L_JSR_AED1_AEC1
	ldx $EB
	dec $D8,X
	beq L_BRS_AED0_AEC8
	ldx $EA
	sta $E1,X
	sty $E0,X

L_BRS_AED0_AEC8:

	rts

L_JSR_AED1_AD97:
L_JSR_AED1_AD9F:
L_JSR_AED1_ADAA:
L_JSR_AED1_ADB3:
L_JSR_AED1_ADBB:
L_JSR_AED1_ADC2:
L_JSR_AED1_ADCA:
L_JSR_AED1_ADD1:
L_JSR_AED1_ADD7:
L_JSR_AED1_ADE0:
L_JSR_AED1_ADEE:
L_JSR_AED1_ADFC:
L_JSR_AED1_AE2A:
L_JSR_AED1_AE56:
L_JSR_AED1_AE62:
L_JSR_AED1_AE66:
L_JSR_AED1_AE76:
L_JSR_AED1_AE8B:
L_JSR_AED1_AEA0:
L_JSR_AED1_AEB1:
L_JSR_AED1_AEBD:
L_JSR_AED1_AEC1:

	ldx $EA
	lda ($E0,X)
	pha
	lda $E0,X
	clc
	adc #$01
	sta $E0,X
	lda $E1,X
	adc #$00
	sta $E1,X
	pla
	rts

L_JMP_AEE5_AD7F:

	lda $F2
	cmp $F3
	bcc L_BRS_AEF6_AEE9
	lda $F3
	cmp $F4
	bcc L_BRS_AEFE_AEEF
	lda $F4
	jmp L_JMP_AEFE_AEF3

L_BRS_AEF6_AEE9:

	lda $F2
	cmp $F4
	bcc L_BRS_AEFE_AEFA
	lda $F4

L_BRS_AEFE_AEEF:
L_JMP_AEFE_AEF3:
L_BRS_AEFE_AEFA:

	sta $F5
	lda $E1
	beq L_BRS_AF0B_AF02
	lda $F2
	sec
	sbc $F5
	sta $F2

L_BRS_AF0B_AF02:

	lda $E3
	beq L_BRS_AF16_AF0D
	lda $F3
	sec
	sbc $F5
	sta $F3

L_BRS_AF16_AF0D:

	lda $E5
	beq L_BRS_AF21_AF18
	lda $F4
	sec
	sbc $F5
	sta $F4

L_BRS_AF21_AF18:

	rts

	.byte $85,$AD,$97,$AD,$AA,$AD,$B3,$AD
	.byte $C2,$AD,$D1,$AD,$E0,$AD,$EE,$AD
	.byte $FC,$AD,$05,$AE,$10,$AE,$2A,$AE
	.byte $38,$AE,$51,$AE,$62,$AE,$56,$AE
	.byte $76,$AE,$8B,$AE,$A0,$AE,$B1,$AE
	.byte $BD,$AE,$60,$38,$0F,$20,$0F,$F8
	.byte $10,$41,$18,$00,$01,$08,$47,$05
	.byte $40,$08,$78,$04,$18,$00,$02,$40
	.byte $08,$18,$00,$04,$40,$08,$18,$00
	.byte $06,$40,$08,$18,$00,$08,$40,$08
	.byte $70,$5E,$AF,$10,$40,$A8,$60,$38
	.byte $0F,$20,$0F,$F8,$10,$41,$18,$00
	.byte $01,$08,$49,$05,$40,$08,$78,$01
	.byte $18,$00,$02,$40,$08,$18,$00,$03
	.byte $40,$08,$18,$00,$04,$40,$08,$18
	.byte $00,$05,$40,$08,$18,$00,$06,$40
	.byte $08,$18,$00,$07,$40,$08,$18,$00
	.byte $08,$40,$08,$18,$00,$09,$40,$08
	.byte $70,$8A,$AF,$10,$40,$A8,$A8,$60
	.byte $38,$0F,$20,$00,$4A,$08,$B7,$03
	.byte $10,$81,$40,$2A,$10,$80,$A8,$60
	.byte $20,$00,$00,$40,$02,$38,$0F,$00
	.byte $40,$01,$20,$0F,$FB,$10,$81,$10
	.byte $80,$A8,$30,$01,$58,$10,$28,$00
	.byte $74,$38,$0F,$20,$DF,$F1,$00,$40
	.byte $01,$50,$10,$81,$40,$47,$10,$80
	.byte $A8,$68,$38,$0F,$20,$07,$76,$50
	.byte $58,$10,$30,$01,$28,$00,$37,$08
	.byte $DD,$03,$10,$81,$40,$03,$10,$80
	.byte $40,$04,$10,$81,$40,$04,$10,$80
	.byte $40,$04,$28,$00,$30,$10,$81,$40
	.byte $04,$10,$80,$40,$04,$28,$00,$22
	.byte $10,$81,$40,$04,$10,$80,$40,$04
	.byte $28,$00,$18,$A8,$10,$81,$40,$04
	.byte $10,$80,$40,$04,$A8,$68,$38,$0F
	.byte $50,$58,$10,$30,$01,$28,$00,$F0
	.byte $20,$0F,$F0,$10,$81,$08,$64,$03
	.byte $40,$03,$28,$00,$C8,$40,$02,$28
	.byte $00,$96,$40,$01,$28,$00,$64,$40
	.byte $01,$10,$80,$40,$02,$20,$0F,$FA
	.byte $08,$32,$03,$10,$81,$28,$00,$B4
	.byte $40,$0C,$28,$00,$82,$40,$0C,$28
	.byte $00,$96,$40,$0C,$28,$00,$82,$40
	.byte $07,$10,$80,$28,$00,$64,$40,$07
	.byte $28,$00,$5A,$40,$46,$A8,$60,$38
	.byte $0F,$20,$0F,$F0,$10,$81,$08,$64
	.byte $34,$78,$0E,$80,$02,$40,$01,$70
	.byte $95,$B0,$10,$80,$A8,$68,$38,$0F
	.byte $50,$58,$10,$30,$01,$28,$00,$F0
	.byte $20,$0F,$FA,$08,$32,$03,$10,$81
	.byte $28,$00,$A0,$40,$0C,$28,$00,$82
	.byte $40,$0C,$28,$00,$8A,$40,$0C,$28
	.byte $00,$82,$40,$07,$10,$80,$28,$00
	.byte $64,$40,$07,$28,$00,$5A,$40,$46
	.byte $A8,$60,$38,$0F,$20,$0F,$F9,$18
	.byte $00,$03,$10,$41,$08,$64,$46,$78
	.byte $25,$80,$01,$40,$02,$70,$E3,$B0
	.byte $10,$40,$78,$13,$80,$01,$40,$02
	.byte $70,$EE,$B0,$A8,$60,$A8,$60,$38
	.byte $0F,$20,$0F,$F0,$10,$21,$08,$64
	.byte $22,$78,$0C,$18,$00,$05,$88,$01
	.byte $40,$01,$80,$02,$40,$01,$70,$05
	.byte $B1,$10,$20,$A8,$38,$0F,$20,$1F
	.byte $F0,$18,$00,$08,$50,$58,$40,$30
	.byte $C8,$28,$00,$00,$08,$77,$07,$78
	.byte $2A,$10,$11,$40,$08,$90,$04,$70
	.byte $2B,$B1,$10,$10,$A8,$20,$1F,$F0
	.byte $18,$00,$07,$50,$08,$EF,$0E,$78
	.byte $2A,$10,$41,$40,$06,$10,$40,$40
	.byte $02,$70,$43,$B1,$A8,$68,$20,$1F
	.byte $F0,$18,$00,$08,$50,$78,$2A,$08
	.byte $BE,$3B,$10,$41,$40,$02,$80,$01
	.byte $40,$01,$80,$01,$40,$02,$80,$01
	.byte $40,$01,$10,$40,$40,$02,$70,$59
	.byte $B1,$A8,$60,$38,$0F,$20,$0F,$F3
	.byte $78,$05,$10,$81,$08,$64,$06,$40
	.byte $01,$08,$64,$05,$40,$01,$08,$64
	.byte $04,$40,$01,$10,$81,$40,$02,$70
	.byte $7C,$B1,$50,$58,$10,$30,$01,$20
	.byte $0F,$FA,$08,$32,$03,$10,$81,$28
	.byte $00,$B4,$40,$0C,$28,$00,$82,$40
	.byte $0C,$28,$00,$96,$40,$0C,$28,$00
	.byte $82,$40,$07,$10,$80,$28,$00,$64
	.byte $40,$07,$28,$00,$5A,$40,$46,$A8
	.byte $60,$38,$0F,$20,$0F,$F3,$78,$05
	.byte $10,$81,$08,$64,$06,$40,$02,$08
	.byte $64,$05,$40,$02,$08,$64,$04,$40
	.byte $02,$10,$81,$40,$02,$70,$CA,$B1
	.byte $40,$04,$78,$02,$10,$81,$08,$64
	.byte $05,$40,$02,$08,$64,$04,$40,$02
	.byte $08,$64,$03,$40,$02,$10,$81,$40
	.byte $02,$70,$E6,$B1,$40,$01,$78,$03
	.byte $10,$81,$08,$64,$04,$40,$01,$08
	.byte $64,$03,$40,$02,$08,$64,$02,$40
	.byte $01,$10,$81,$40,$02,$70,$02,$B2
	.byte $50,$58,$10,$30,$01,$20,$0F,$FA
	.byte $08,$32,$03,$10,$81,$28,$00,$B4
	.byte $40,$0C,$28,$00,$82,$40,$0C,$28
	.byte $00,$96,$40,$0C,$28,$00,$82,$40
	.byte $07,$10,$80,$28,$00,$64,$40,$07
	.byte $28,$00,$5A,$40,$46,$A8,$68,$60
	.byte $38,$0D,$20,$0F,$F0,$18,$00,$08
	.byte $10,$41,$08,$E9,$07,$40,$01,$08
	.byte $B4,$07,$40,$01,$08,$64,$07,$40
	.byte $01,$08,$32,$07,$40,$01,$08,$E6
	.byte $06,$40,$01,$08,$BE,$06,$40,$01
	.byte $08,$78,$06,$40,$01,$08,$5A,$06
	.byte $40,$01,$08,$32,$06,$40,$01,$38
	.byte $09,$08,$E9,$07,$40,$01,$08,$B4
	.byte $07,$40,$01,$08,$64,$07,$40,$01
	.byte $08,$32,$07,$40,$01,$08,$E6,$06
	.byte $40,$01,$08,$BE,$06,$40,$01,$08
	.byte $78,$06,$40,$01,$08,$5A,$06,$40
	.byte $01,$08,$32,$06,$40,$01,$38,$07
	.byte $08,$E9,$07,$40,$01,$08,$B4,$07
	.byte $40,$01,$08,$64,$07,$40,$01,$08
	.byte $32,$07,$40,$01,$08,$E6,$06,$40
	.byte $01,$08,$BE,$06,$40,$01,$08,$78
	.byte $06,$40,$01,$08,$5A,$06,$40,$01
	.byte $08,$32,$06,$40,$01,$38,$05,$08
	.byte $E9,$07,$40,$01,$08,$B4,$07,$40
	.byte $01,$08,$64,$07,$40,$01,$08,$32
	.byte $07,$40,$01,$08,$E6,$06,$40,$01
	.byte $08,$BE,$06,$40,$01,$08,$78,$06
	.byte $40,$01,$08,$5A,$06,$40,$01,$08
	.byte $32,$06,$40,$01,$38,$04,$08,$E9
	.byte $07,$40,$01,$08,$B4,$07,$40,$01
	.byte $08,$64,$07,$40,$01,$08,$32,$07
	.byte $40,$01,$08,$E6,$06,$40,$01,$08
	.byte $BE,$06,$40,$01,$08,$78,$06,$40
	.byte $01,$08,$5A,$06,$40,$01,$08,$32
	.byte $06,$40,$01,$10,$40,$A8,$68,$38
	.byte $0F,$20,$0F,$F0,$50,$58,$50,$30
	.byte $01,$28,$00,$50,$10,$81,$08,$64
	.byte $21,$78,$05,$80,$04,$40,$01,$70
	.byte $55,$B3,$10,$80,$40,$03,$10,$81
	.byte $08,$64,$21,$78,$05,$80,$04,$40
	.byte $01,$70,$67,$B3,$40,$02,$10,$81
	.byte $08,$64,$21,$78,$05,$80,$04,$40
	.byte $01,$70,$77,$B3,$40,$01,$10,$81
	.byte $08,$64,$21,$78,$05,$80,$04,$40
	.byte $01,$70,$87,$B3,$10,$81,$08,$64
	.byte $21,$78,$04,$80,$05,$40,$01,$70
	.byte $95,$B3,$10,$81,$08,$64,$20,$78
	.byte $03,$80,$05,$40,$01,$70,$A3,$B3
	.byte $10,$81,$08,$64,$18,$78,$02,$80
	.byte $05,$40,$01,$70,$B1,$B3,$10,$81
	.byte $08,$64,$18,$78,$02,$80,$05,$40
	.byte $01,$70,$BF,$B3,$10,$81,$08,$64
	.byte $16,$78,$01,$80,$04,$40,$01,$70
	.byte $CD,$B3,$10,$80,$A8,$60,$38,$0F
	.byte $20,$0F,$F0,$98,$05,$10,$11,$08
	.byte $64,$32,$78,$05,$80,$03,$40,$01
	.byte $70,$E6,$B3,$A0,$DF,$B3,$08,$FF
	.byte $27,$10,$10,$A8,$38,$0F,$20,$0F
	.byte $F0,$50,$58,$40,$30,$01,$28,$00
	.byte $28,$98,$02,$10,$11,$08,$64,$09
	.byte $78,$08,$88,$02,$40,$01,$70,$0C
	.byte $B4,$A0,$05,$B4,$10,$10,$A8,$60
	.byte $38,$0F,$20,$0F,$F0,$18,$00,$08
	.byte $10,$41,$08,$1E,$19,$40,$01,$08
	.byte $31,$1C,$40,$01,$08,$A5,$1F,$40
	.byte $01,$08,$B5,$17,$40,$01,$08,$1E
	.byte $19,$40,$01,$10,$40,$40,$02,$10
	.byte $41,$08,$1E,$19,$40,$01,$08,$31
	.byte $1C,$40,$01,$08,$A5,$1F,$40,$01
	.byte $08,$1E,$19,$40,$01,$10,$40,$40
	.byte $02,$50,$58,$10,$30,$01,$28,$00
	.byte $FF,$10,$41,$78,$01,$08,$31,$1F
	.byte $40,$01,$80,$03,$40,$01,$80,$03
	.byte $40,$01,$80,$01,$40,$01,$70,$67
	.byte $B4,$78,$01,$08,$31,$1C,$40,$01
	.byte $80,$04,$40,$01,$80,$04,$40,$01
	.byte $80,$01,$40,$01,$70,$7D,$B4,$78
	.byte $01,$08,$31,$22,$40,$01,$80,$04
	.byte $40,$01,$80,$03,$40,$01,$80,$01
	.byte $40,$01,$70,$93,$B4,$28,$00,$C8
	.byte $40,$05,$28,$00,$FF,$78,$03,$08
	.byte $31,$23,$40,$01,$80,$04,$40,$01
	.byte $80,$04,$40,$01,$80,$03,$40,$01
	.byte $70,$B1,$B4,$28,$00,$C8,$40,$03
	.byte $10,$40,$A8,$38,$0F,$20,$1F,$F0
	.byte $18,$00,$08,$50,$58,$40,$30,$01
	.byte $28,$00,$10,$10,$41,$78,$09,$08
	.byte $E9,$07,$40,$0C,$10,$40,$40,$02
	.byte $10,$41,$90,$0B,$70,$E1,$B4,$10
	.byte $40,$A8,$20,$0F,$F0,$50,$10,$41
	.byte $18,$00,$08,$78,$09,$08,$D2,$0F
	.byte $40,$01,$98,$0C,$88,$01,$40,$01
	.byte $A0,$06,$B5,$70,$FF,$B4,$10,$40
	.byte $A8,$68,$20,$1F,$F0,$50,$18,$00
	.byte $08,$10,$11,$78,$09,$08,$F4,$03
	.byte $40,$0C,$10,$10,$40,$02,$10,$11
	.byte $70,$1F,$B5,$10,$10,$A8,$68,$60
	.byte $10,$00,$A8,$FF,$00,$86,$00,$62
	.byte $75,$75,$62,$64,$6C,$00,$78,$62
	.byte $77,$66,$C7,$00,$64,$70,$6E,$71
	.byte $6D,$66,$75,$66,$65,$FF,$00,$97
	.byte $00,$63,$70,$6F,$76,$74,$00,$79
	.byte $FF,$00,$FF,$00,$FF,$00,$8E,$00
	.byte $88,$1F,$52,$6E,$00,$25,$01,$50
	.byte $01,$50,$02,$50,$10,$00,$01,$50
	.byte $02,$00,$02,$50,$05,$00,$FF,$05
	.byte $FF,$05,$FF,$05,$FF,$05,$FF,$05
	.byte $FD,$05,$F8,$00,$8B,$00,$A7,$00
	.byte $65,$6A,$67,$67,$6A,$64,$76,$6D
	.byte $75,$7A,$00,$6D,$66,$77,$66,$6D
	.byte $8C,$00,$D4,$00,$6F,$70,$77,$6A
	.byte $64,$66,$86,$00,$62,$65,$77,$62
	.byte $6F,$64,$66,$65,$86,$00,$66,$79
	.byte $71,$66,$73,$75,$FC,$00,$90,$00
	.byte $71,$6D,$62,$7A,$66,$73,$74,$91
	.byte $00,$BB,$00,$09,$FF,$00,$C3,$00
	.byte $C3,$00,$90,$00,$88,$1F,$D9,$E5
	.byte $F3,$01,$1D,$FF,$00,$FF,$00,$FF
	.byte $00,$FF,$00,$FF,$00,$FD,$00,$FF
	.byte $04,$68,$62,$6E,$66,$00,$70,$77
	.byte $66,$73,$71,$6D,$62,$7A,$66,$73
	.byte $09,$0A,$59,$75,$00,$00,$52,$00
	.byte $51,$00,$51,$52,$03,$03,$01,$01
	.byte $02,$02,$02,$00,$00,$00,$00,$00
	.byte $38,$38,$38,$00,$00,$00,$00,$00
	.byte $30,$10,$20,$FE,$E6,$E6,$E6,$FE
	.byte $E6,$E6,$E6,$FC,$CC,$CC,$FC,$C6
	.byte $C6,$FE,$FC,$FE,$E2,$E0,$E0,$E0
	.byte $E2,$FE,$FE,$FC,$6E,$66,$66,$66
	.byte $6E,$7E,$FC,$FE,$E0,$E0,$F8,$E0
	.byte $E0,$FE,$FE,$FE,$E0,$E0,$F8,$E0
	.byte $E0,$E0,$E0,$FE,$E0,$E0,$EE,$E6
	.byte $E6,$FE,$FE,$E6,$E6,$E6,$FE,$E6
	.byte $E6,$E6,$E6,$FE,$38,$38,$38,$38
	.byte $38,$38,$FE,$3E,$1C,$1C,$1C,$1C
	.byte $9C,$9C,$78,$E3,$E6,$EC,$F8,$FC
	.byte $E6,$E6,$E3,$E0,$E0,$E0,$E0,$E0
	.byte $E0,$E0,$FE,$EE,$FE,$D6,$D6,$C6
	.byte $C6,$C6,$C6,$E6,$F6,$FE,$FE,$DE
	.byte $CE,$D6,$D6,$FE,$C6,$C6,$C6,$C6
	.byte $C6,$FE,$FE,$FE,$E6,$E6,$FE,$FE
	.byte $E0,$E0,$E0,$FE,$E2,$E2,$E2,$EA
	.byte $EE,$FE,$FE,$FC,$E6,$E6,$E6,$F8
	.byte $EC,$E6,$E3,$FE,$E6,$E0,$FE,$06
	.byte $06,$E6,$FE,$FE,$38,$38,$38,$38
	.byte $38,$38,$38,$E6,$E6,$E6,$E6,$E6
	.byte $E6,$FE,$FE,$E6,$E6,$E6,$E6,$E6
	.byte $E6,$6C,$38,$C6,$C6,$C6,$C6,$D6
	.byte $D6,$FE,$C6,$C6,$C6,$6C,$38,$38
	.byte $6C,$C6,$C6,$E6,$E6,$E6,$FE,$FE
	.byte $38,$38,$38,$FE,$0E,$0E,$FE,$F0
	.byte $F0,$FE,$FE,$7E,$81,$9D,$B1,$B1
	.byte $9D,$81,$7E,$14,$14,$28,$28,$28
	.byte $14,$14,$14,$01,$02,$03,$04,$FE
	.byte $84,$01,$02,$84,$03,$04,$06,$CF
	.byte $06,$92,$01,$02,$03,$04,$97,$01
	.byte $02,$89,$03,$04,$A9,$06,$06,$06
	.byte $85,$01,$04,$97,$06,$01,$02,$00
	.byte $03,$04,$8E,$01,$02,$84,$03,$04
	.byte $06,$06,$91,$01,$02,$8D,$03,$04
	.byte $A5,$01,$02,$83,$03,$04,$06,$01
	.byte $02,$82,$03,$04,$93,$01,$02,$86
	.byte $03,$04,$01,$04,$88,$01,$02,$8A
	.byte $03,$04,$8D,$01,$02,$91,$03,$04
	.byte $9A,$06,$06,$85,$01,$02,$8E,$03
	.byte $04,$84,$06,$06,$06,$88,$01,$02
	.byte $8C,$03,$04,$84,$01,$02,$8E,$03
	.byte $04,$82,$04,$84,$06,$06,$01,$02
	.byte $95,$03,$04,$84,$06,$06,$06,$06
	.byte $01,$02,$03,$04,$06,$06,$84,$06
	.byte $01,$05,$04,$01,$02,$82,$03,$04
	.byte $06,$01,$02,$92,$03,$04,$01,$02
	.byte $83,$03,$04,$84,$01,$02,$90,$03
	.byte $04,$01,$02,$92,$03,$04,$00,$03
	.byte $04,$01,$02,$9B,$03,$04,$01,$02
	.byte $8A,$03,$04,$01,$02,$A8,$03,$04
	.byte $01,$02,$FF,$FF,$FF,$08,$00,$00
	.byte $0A,$00,$00,$39,$80,$00,$09,$6A
	.byte $F0,$39,$5A,$AA,$09,$59,$A8,$0A
	.byte $AA,$00,$00,$20,$00,$00,$A0,$00
	.byte $02,$6C,$0F,$A9,$60,$AA,$A5,$6C
	.byte $2A,$95,$60,$00,$AA,$A0,$00,$00
	.byte $00,$00,$00,$5F,$00,$05,$FA,$00
	.byte $5F,$A5,$00,$05,$FA,$00,$00,$5F
	.byte $00,$00,$00,$00,$00,$00,$F5,$00
	.byte $00,$AF,$50,$00,$5A,$F5,$00,$AF
	.byte $50,$00,$F5,$00,$00,$00,$00,$00
	.byte $8A,$09,$87,$06,$85,$01,$87,$06
	.byte $95,$09,$06,$91,$0D,$06,$95,$01
	.byte $06,$91,$0D,$06,$95,$01,$06,$91
	.byte $0D,$06,$8B,$01,$91,$06,$85,$01
	.byte $92,$06,$00,$4F,$50,$4F,$50,$85
	.byte $00,$12,$86,$17,$1A,$17,$17,$17
	.byte $1B,$86,$17,$13,$4F,$50,$4F,$50
	.byte $4F,$50,$8F,$00,$14,$1C,$1D,$1E
	.byte $1F,$20,$21,$22,$23,$24,$25,$26
	.byte $27,$28,$29,$2A,$2B,$2C,$15,$91
	.byte $00,$08,$08,$00,$51,$14,$2D,$2E
	.byte $2F,$30,$31,$32,$33,$34,$35,$36
	.byte $37,$38,$39,$3A,$3B,$3C,$3D,$15
	.byte $85,$00,$08,$08,$00,$51,$8B,$00
	.byte $52,$14,$3E,$3F,$40,$41,$42,$43
	.byte $44,$45,$46,$47,$48,$49,$4A,$4B
	.byte $4C,$4D,$4E,$15,$88,$00,$52,$82
	.byte $00,$8A,$16,$19,$86,$16,$18,$16
	.byte $16,$16,$19,$86,$16,$18,$8B,$16
	.byte $20,$00,$00,$81,$A8,$00,$00,$20
	.byte $B9,$00,$00,$50,$00,$00,$81,$D0
	.byte $00,$00,$81,$D0,$00,$00,$54,$00
	.byte $00,$54,$00,$00,$54,$00,$00,$81
	.byte $F0,$00,$00,$81,$F0,$00,$00,$81
	.byte $F0,$00,$A5,$00,$0A,$81,$AA,$00
	.byte $2C,$81,$CC,$81,$80,$81,$B3,$33
	.byte $20,$2A,$81,$AA,$81,$80,$B4,$00
	.byte $04,$00,$00,$15,$00,$00,$55,$40
	.byte $00,$15,$00,$00,$B4,$00,$0F,$00
	.byte $00,$2F,$81,$80,$00,$81,$8A,$20
	.byte $00,$81,$8A,$20,$00,$2A,$81,$80
	.byte $00,$20,$81,$80,$00,$81,$80,$20
	.byte $00,$81,$80,$20,$00,$A8,$00,$0F
	.byte $00,$00,$2F,$81,$80,$00,$82,$A0
	.byte $00,$82,$A0,$00,$2A,$81,$80,$00
	.byte $2A,$81,$80,$00,$81,$80,$20,$00
	.byte $81,$80,$20,$00,$A8,$00,$0F,$00
	.byte $00,$2F,$81,$80,$00,$81,$85,$20
	.byte $00,$81,$85,$20,$00,$25,$81,$80
	.byte $00,$2F,$81,$80,$00,$81,$8F,$20
	.byte $00,$81,$8F,$20,$00,$A8,$00,$0F
	.byte $00,$00,$2F,$81,$80,$00,$81,$8A
	.byte $20,$00,$81,$8A,$20,$00,$2A,$81
	.byte $80,$00,$20,$81,$80,$00,$81,$80
	.byte $20,$00,$81,$80,$20,$00,$A8,$00
	.byte $05,$40,$00,$81,$FF,$40,$00,$81
	.byte $FF,$40,$00,$81,$EB,$40,$00,$81
	.byte $EB,$40,$00,$81,$FF,$40,$00,$81
	.byte $FF,$00,$00,$AB,$00,$05,$40,$00
	.byte $81,$AA,$40,$00,$81,$AA,$40,$00
	.byte $81,$BE,$40,$00,$81,$BE,$40,$00
	.byte $81,$AA,$40,$00,$81,$AA,$00,$00
	.byte $AB,$00,$04,$00,$00,$81,$84,$81
	.byte $80,$00,$15,$00,$00,$81,$DD,$81
	.byte $C0,$00,$15,$00,$00,$81,$84,$81
	.byte $80,$00,$04,$00,$00,$AB,$00,$08
	.byte $00,$00,$81,$C4,$81,$C0,$00,$37
	.byte $00,$00,$81,$88,$81,$80,$00,$37
	.byte $00,$00,$81,$C4,$81,$C0,$00,$08
	.byte $00,$00,$AB,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$04,$10,$40,$01,$04,$10,$40
	.byte $00,$00,$00,$00,$40,$10,$04,$01
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $40,$10,$04,$01,$00,$00,$00,$00
	.byte $55,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$55,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$FE,$C6,$C6,$C6
	.byte $C6,$C6,$FE,$FE,$78,$18,$18,$18
	.byte $18,$18,$FE,$FE,$FE,$06,$06,$FE
	.byte $C0,$C0,$FE,$FE,$FC,$0C,$0C,$3E
	.byte $0E,$0E,$FE,$FE,$06,$C6,$C6,$C6
	.byte $FE,$0E,$0E,$0E,$FE,$C0,$C0,$FE
	.byte $06,$06,$FE,$FE,$FC,$C0,$C0,$FE
	.byte $C6,$C6,$FE,$FE,$FE,$06,$06,$06
	.byte $3E,$38,$38,$38,$7C,$66,$66,$FE
	.byte $E6,$E6,$FE,$FE,$FE,$C6,$C6,$FE
	.byte $0E,$0E,$0E,$0E,$00,$00,$00,$00
	.byte $03,$03,$03,$03,$00,$00,$00,$00
	.byte $C0,$C0,$C0,$C0,$03,$03,$03,$03
	.byte $03,$03,$03,$03,$C0,$C0,$C0,$C0
	.byte $C0,$C0,$C0,$C0,$00,$00,$FF,$FF
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $FF,$FF,$00,$00,$C0,$C0,$FF,$FF
	.byte $00,$00,$00,$00,$03,$03,$FF,$FF
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $FF,$FF,$C0,$C0,$00,$00,$00,$00
	.byte $FF,$FF,$03,$03,$00,$00,$00,$00
	.byte $00,$04,$11,$40,$00,$00,$00,$00
	.byte $00,$41,$14,$00,$00,$00,$00,$14
	.byte $41,$00,$00,$00,$00,$00,$00,$04
	.byte $51,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$41,$14,$00,$00,$00,$00,$00
	.byte $00,$00,$41,$14,$00,$00,$01,$04
	.byte $10,$40,$00,$00,$00,$00,$00,$40
	.byte $14,$01,$00,$00,$00,$00,$00,$00
	.byte $01,$04,$50,$00,$00,$04,$11,$40
	.byte $00,$00,$00,$00,$00,$00,$00,$50
	.byte $04,$01,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$45,$10,$00,$00,$01,$04
	.byte $10,$40,$00,$00,$10,$44,$01,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$40
	.byte $10,$04,$01,$00,$00,$00,$00,$00
	.byte $00,$00,$05,$50,$00,$00,$00,$00
	.byte $00,$50,$04,$01,$00,$C0,$F0,$EF
	.byte $E7,$E5,$FF,$00,$00,$00,$00,$50
	.byte $FC,$F0,$00,$00,$DE,$3F,$DE,$00
	.byte $DE,$3F,$DE,$00,$DE,$3F,$DE,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $DE,$3F,$DE,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$01,$00,$00,$00,$00
	.byte $00,$01,$00,$00,$10,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$40,$00
	.byte $00,$00,$00,$00,$98,$00,$00,$30
	.byte $85,$00,$81,$EC,$85,$00,$30,$00
	.byte $99,$00,$93,$00,$30,$85,$00,$81
	.byte $88,$84,$00,$03,$33,$85,$00,$81
	.byte $88,$85,$00,$30,$94,$00,$8D,$00
	.byte $30,$84,$00,$02,$02,$85,$00,$81
	.byte $CC,$84,$00,$0C,$20,$81,$C0,$84
	.byte $00,$81,$CC,$84,$00,$02,$02,$85
	.byte $00,$30,$8E,$00,$87,$00,$30,$84
	.byte $00,$08,$00,$81,$80,$83,$00,$03
	.byte $03,$85,$00,$20,$84,$00,$30,$81
	.byte $B8,$30,$84,$00,$20,$84,$00,$03
	.byte $03,$84,$00,$08,$00,$81,$80,$84
	.byte $00,$30,$88,$00,$00,$30,$87,$00
	.byte $20,$00,$20,$83,$00,$0C,$00,$81
	.byte $C0,$00,$20,$85,$00,$81,$CC,$84
	.byte $00,$81,$C2,$02,$0C,$84,$00,$81
	.byte $CC,$84,$00,$0C,$20,$81,$C0,$84
	.byte $00,$00,$00,$02,$00,$20,$87,$00
	.byte $30,$82,$00,$86,$00,$81,$80,$00
	.byte $08,$83,$00,$30,$20,$30,$86,$00
	.byte $03,$03,$87,$00,$08,$00,$81,$80
	.byte $86,$00,$03,$03,$87,$00,$30,$20
	.byte $30,$83,$00,$81,$80,$00,$08,$87
	.byte $00,$87,$00,$20,$00,$81,$C0,$00
	.byte $0C,$86,$00,$0C,$00,$81,$C0,$89
	.byte $00,$20,$00,$20,$89,$00,$0C,$00
	.byte $81,$C0,$86,$00,$81,$C0,$00,$0C
	.byte $00,$20,$88,$00,$00,$20,$8D,$00
	.byte $30,$00,$30,$8C,$00,$81,$80,$00
	.byte $08,$8C,$00,$30,$00,$30,$8D,$00
	.byte $20,$82,$00,$81,$F8,$5A,$82,$B0
	.byte $43,$F4,$00,$00,$00,$38,$20,$81
	.byte $C0,$F4,$00,$00,$00,$83,$01,$F4
	.byte $00,$00,$00,$10,$11,$12,$82,$FF
	.byte $0A,$00,$00,$0A,$78,$00,$00,$00
	.byte $0C,$02,$00,$0A,$78,$00,$00,$00
	.byte $13,$03,$01,$0F,$78,$00,$00,$00
	.byte $14,$03,$02,$0F,$64,$00,$00,$00
	.byte $16,$04,$03,$0F,$64,$00,$00,$00
	.byte $0F,$00,$00,$0F,$78,$00,$00,$00
	.byte $12,$02,$01,$0F,$78,$00,$00,$00
	.byte $14,$03,$02,$0F,$64,$00,$00,$00
	.byte $16,$04,$03,$0F,$64,$00,$00,$00
	.byte $18,$05,$04,$0F,$50,$00,$00,$00
	.byte $0F,$00,$00,$0F,$78,$00,$00,$00
	.byte $13,$03,$01,$0F,$64,$00,$00,$00
	.byte $1B,$04,$03,$14,$64,$00,$00,$00
	.byte $1C,$04,$04,$14,$50,$00,$00,$00
	.byte $1D,$05,$04,$14,$50,$00,$00,$00
	.byte $B8,$00,$0F,$00,$00,$30,$00,$00
	.byte $81,$CA,$00,$B6,$00,$81,$C0,$00
	.byte $00,$30,$00,$00,$81,$8C,$83,$00
	.byte $00,$00,$81,$C9,$00,$00,$81,$CA
	.byte $00,$00,$30,$00,$00,$0F,$B4,$00
	.byte $81,$8C,$00,$00,$81,$8C,$00,$00
	.byte $30,$00,$00,$81,$C0,$B6,$00,$B2
	.byte $00,$03,$00,$00,$81,$80,$00,$00
	.byte $22,$00,$03,$83,$00,$05,$00,$B3
	.byte $00,$0C,$00,$00,$02,$00,$00,$03
	.byte $00,$00,$40,$83,$00,$00,$0C,$81
	.byte $87,$00,$00,$05,$00,$03,$83,$00
	.byte $42,$00,$00,$81,$C0,$00,$00,$03
	.byte $AE,$00,$48,$81,$C0,$00,$40,$00
	.byte $00,$03,$00,$00,$40,$00,$00,$0C
	.byte $B1,$00,$00,$AC,$00,$0C,$00,$03
	.byte $30,$00,$00,$02,$00,$0C,$81,$80
	.byte $00,$00,$05,$00,$0C,$10,$00,$00
	.byte $4F,$00,$AA,$00,$81,$C0,$00,$00
	.byte $33,$85,$00,$08,$81,$C0,$00,$40
	.byte $00,$00,$10,$81,$C0,$00,$81,$C4
	.byte $00,$00,$00,$00,$32,$4E,$00,$00
	.byte $4F,$00,$0C,$10,$00,$00,$05,$00
	.byte $0C,$81,$80,$00,$00,$02,$00,$03
	.byte $30,$00,$00,$0C,$A7,$00,$00,$81
	.byte $C6,$30,$00,$81,$C4,$00,$00,$10
	.byte $81,$C0,$00,$40,$00,$00,$08,$81
	.byte $C0,$84,$00,$33,$00,$00,$81,$C0
	.byte $AA,$00,$A6,$00,$0C,$00,$00,$81
	.byte $C0,$00,$0C,$08,$00,$00,$81,$80
	.byte $00,$30,$01,$00,$02,$40,$00,$81
	.byte $C0,$33,$00,$01,$00,$00,$20,$0A
	.byte $00,$A4,$00,$81,$C0,$00,$00,$0C
	.byte $00,$00,$81,$80,$81,$C0,$00,$08
	.byte $83,$00,$30,$00,$06,$00,$00,$30
	.byte $0C,$00,$01,$00,$00,$81,$80,$20
	.byte $00,$00,$03,$04,$81,$C9,$00,$20
	.byte $0A,$00,$01,$00,$00,$81,$C0,$33
	.byte $00,$02,$40,$00,$30,$01,$00,$00
	.byte $81,$80,$00,$0C,$08,$00,$00,$81
	.byte $C0,$00,$00,$0C,$A1,$00,$00,$81
	.byte $8C,$43,$00,$81,$80,$20,$00,$01
	.byte $00,$00,$30,$0C,$00,$06,$83,$00
	.byte $30,$00,$08,$00,$00,$81,$80,$81
	.byte $C0,$00,$0C,$00,$00,$81,$C0,$A3
	.byte $00,$00,$A0,$00,$33,$00,$00,$81
	.byte $C0,$00,$00,$08,$00,$0C,$81,$80
	.byte $00,$00,$04,$00,$81,$C1,$10,$00
	.byte $08,$03,$03,$04,$81,$C0,$00,$00
	.byte $0A,$00,$81,$84,$20,$00,$00,$81
	.byte $85,$00,$9E,$00,$30,$00,$00,$0C
	.byte $00,$00,$81,$80,$00,$00,$08,$81
	.byte $C0,$00,$40,$00,$00,$11,$0C,$00
	.byte $00,$81,$80,$00,$0C,$43,$00,$81
	.byte $80,$00,$00,$20,$48,$00,$48,$00
	.byte $00,$00,$0E,$13,$81,$87,$00,$00
	.byte $81,$85,$00,$81,$84,$20,$00,$00
	.byte $0A,$03,$04,$81,$C0,$00,$08,$03
	.byte $00,$81,$C1,$10,$00,$00,$04,$00
	.byte $0C,$81,$80,$00,$00,$08,$00,$00
	.byte $81,$C0,$00,$00,$33,$9B,$00,$00
	.byte $4B,$12,$81,$C0,$48,$00,$00,$20
	.byte $48,$00,$81,$80,$00,$00,$0C,$43
	.byte $00,$00,$81,$80,$00,$11,$0C,$00
	.byte $40,$00,$00,$08,$81,$C0,$00,$81
	.byte $80,$00,$00,$0C,$00,$00,$30,$9D
	.byte $00,$00,$94,$00,$33,$00,$03,$85
	.byte $00,$30,$22,$83,$00,$03,$02,$00
	.byte $00,$20,$04,$0C,$00,$40,$00,$81
	.byte $84,$0C,$00,$00,$81,$C0,$32,$10
	.byte $02,$00,$03,$81,$80,$08,$40,$11
	.byte $81,$C0,$02,$00,$00,$30,$0F,$00
	.byte $92,$00,$30,$00,$00,$03,$85,$00
	.byte $20,$30,$84,$00,$02,$03,$00,$40
	.byte $20,$00,$04,$00,$82,$C0,$48,$00
	.byte $0C,$83,$00,$12,$30,$0B,$00,$00
	.byte $10,$04,$81,$80,$02,$00,$0C,$81
	.byte $C0,$30,$00,$00,$81,$E1,$08,$4E
	.byte $00,$30,$0F,$81,$C0,$02,$00,$08
	.byte $40,$11,$00,$03,$81,$80,$32,$10
	.byte $02,$00,$00,$81,$C0,$00,$81,$84
	.byte $82,$0C,$00,$40,$00,$20,$04,$03
	.byte $02,$85,$00,$30,$22,$84,$00,$03
	.byte $83,$00,$33,$90,$00,$81,$C4,$81
	.byte $81,$2C,$81,$C0,$30,$00,$02,$00
	.byte $0C,$10,$04,$81,$80,$0B,$83,$00
	.byte $12,$30,$0C,$00,$00,$81,$C0,$48
	.byte $00,$04,$00,$81,$C0,$40,$20,$00
	.byte $02,$03,$84,$00,$20,$30,$84,$00
	.byte $03,$00,$00,$30,$92,$00,$02,$BB
	.byte $5A,$30,$5F,$EE,$3D,$A8,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00
