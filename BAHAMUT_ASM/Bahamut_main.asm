arch snes.cpu
exhirom

org $7A0000
font:
	incbin "BAHAMUT_FONT/font.bin"
hajimari:
	incbin "BAHAMUT_FONT/hajimari.bin"
org $7B0000
	incbin "BAHAMUT_FONT/font_vn.bin"
org $F204C1
	db $CC, $7C, $FA, $18, $81
org $F20551
	db $BB, $7B
	
org $F0318B
	LDA #$0000

org $F000C2		//glyph table
	db $1B, $1C, $1D, $1E, $1F
	db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F
	db $30, $31, $32, $33, $34, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A
	db $4B, $4C, $4D, $4E, $4F, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5A
	
org $4043C6	//VN char table
	db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
	db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $1E, $1F
	db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F
	db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D, $3E, $3F
	db $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F
	
org $404280
WidthTable:
	db $04, $06, $06, $06, $06, $05, $05, $06, $06, $04, $06, $06, $05, $08, $06, $07
	db $06, $07, $06, $05, $06, $06, $06, $08, $06, $06, $05, $06, $06, $05, $06, $06
	db $05, $06, $06, $02, $04, $05, $02, $08, $06, $06, $06, $06, $05, $05, $05, $06
	db $06, $08, $06, $06, $05, $05, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
	db $02, $03, $07, $03, $03, $05, $03, $04, $06, $06, $06, $05, $05, $06, $06, $06
	db $07, $06, $06, $06, $06, $06, $06, $06, $06, $06, $01, $01, $01, $01, $01, $01
	db $04, $07, $06, $07, $07, $06, $06, $07, $07, $05, $07, $07, $05, $07, $07, $07
	db $07, $07, $07, $07, $06, $07, $06, $07, $07, $06, $07, $06, $06, $06, $07, $06
	db $06, $06, $06, $03, $05, $06, $03, $09, $06, $06, $07, $06, $06, $06, $05, $06
	db $06, $08, $07, $07, $06, $05, $06, $06, $06, $07, $06, $06, $07, $06, $07, $07
	db $02, $03, $05, $04, $03, $05, $03, $04, $07, $05, $05, $05, $05, $06, $06, $06
	db $05, $06, $06, $06, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $03, $03, $03, $03
	db $03, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $07, $07, $07, $07
	db $07, $07, $06, $06, $06, $06, $06, $07, $07, $07, $07, $07, $07, $06, $06, $06
	db $06, $06, $07, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $04
	db $04, $04, $04, $04, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $06, $06, $06, $06, $06, $07, $07, $07, $07, $07, $07
org $404340
VNWidthTable:
	db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $03, $03, $04, $05
	db $04, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $08, $08, $08, $08, $08, $08, $07, $07, $07
	db $07, $07, $07, $08, $07, $07, $08, $08, $08, $08, $08, $08, $08, $07, $07, $07
	

org $F033B0
	JML draw_non_accent_char
	
org $F0362A
	JML draw_accent_char
	
org $F03156
	JML check_char
	
org $7DF00D
	JML check_char2
	
org $F08CCC
	JSL draw_non_accent_char2
	
org $D5E6D4
	REP #$20
	LDA #$7C00
	STA $2116
	LDA #$1801
	STA $4300
	LDA #(hajimari)
	STA $4302
	LDA #$0800
	STA $4305
	SEP #$20
	LDA.b #(hajimari>>16)
	STA $4304
	LDA #$01
	STA $420B
	REP #$20
	
org $D593AC
	JML new_title
	
org $5C0000
new_title:
	REP #$20
	LDA $28
	CMP #$F6FF
	BNE +
	SEP #$20
	LDA.b #(newgame>>16)
	STA $2A
	REP #$20
	LDA #(newgame)
	STA $28
	BRA return	
+
	CMP #$F709
	BNE +
	SEP #$20
	LDA.b #(tsuzuki>>16)
	STA $2A
	REP #$20
	LDA #(tsuzuki)
	STA $28
	BRA return		
+
	CMP #$F713
	BNE +
	SEP #$20
	LDA.b #(temporary>>16)
	STA $2A
	REP #$20
	LDA #(temporary)
	STA $28
	BRA return	
+
	SEP #$20
	LDA [$28]
	BEQ +
return:
	STZ $24
	STZ $25
	JML $D593B4
+
	JML $D593CF
	
newgame:
	db $05
	dl $36DFF5, $37EFF5, $38FFF5, $390FF5, $3A1FF5
tsuzuki:
	db $04
	dl $3ADFF8, $3BEFF8, $3CFFF8, $3D0FF8
temporary:
	db $04
	dl $36DFF8, $37EFF8, $3EFDF8, $3F0DF8

define FontBank0 		$7A0000
define FontBank1 		$7B0000
define PrevChar			$3166E0
define shift						$3166E2
define MaxWidth			$3166E4
define PageOffset			$3166E6
define ColorIndex			$3166E8
define VNchar				$3166EA
define GlyphTable			$F0004E
define KerningTable	$440000
define WidthTable		$404280
define VNWidthTable	$404340
define VNBaseGlyph	$4043C6
define CurLine				$0960
define LineBufL 			$E2A0
define LineBufR 			$E2C0
define buffer1				$0400
define buffer2				$0402

	
draw_non_accent_char:
	PHY
	PHP
	REP #$30
	PHX
	AND #$00FF
	TAX
	LDA {GlyphTable},x
	AND #$00FF
	PLX
	PLP
	PHA
	ASL #6
	STA {buffer1}	
	LDA {shift}
	AND #$0007
	ASL #2
	PHA
	ASL #2
	CLC
	ADC $01,s
	XBA
	CLC
	ADC {buffer1}
	STA {buffer1}		//glyph adr
	TAX
	PLA
	LDA {CurLine}
	AND #$00FF
	XBA
	ASL #2
	PHA
	LDA {shift}
	AND #$00F8
	ASL #2
	CLC
	ADC $01,s
	TAY		//drawing pos
	PLA	
	PLA
	TAX
	LDA {WidthTable},x
	AND #$00FF
	CLC
	ADC {shift}
	LDX {buffer1}
	CMP {MaxWidth}
	BCC .fits
	BEQ .fits
	LDA {MaxWidth}
	STA {shift}
	PLY
	RTL

.fits:
	STA {shift}
	LDA {FontBank0}+$00,x
	ORA {LineBufL},y   
	STA {LineBufL},y
	LDA {FontBank0}+$20,x
	ORA {LineBufR},y   
	STA {LineBufR},y
	LDA {FontBank0}+$02,x
	ORA {LineBufL}+$02,y 
	STA {LineBufL}+$02,y
	LDA {FontBank0}+$22,x
	ORA {LineBufR}+$02,y 
	STA {LineBufR}+$02,y
	LDA {FontBank0}+$04,x
	ORA {LineBufL}+$04,y 
	STA {LineBufL}+$04,y
	LDA {FontBank0}+$24,x
	ORA {LineBufR}+$04,y 
	STA {LineBufR}+$04,y
	LDA {FontBank0}+$06,x
	ORA {LineBufL}+$06,y 
	STA {LineBufL}+$06,y
	LDA {FontBank0}+$26,x
	ORA {LineBufR}+$06,y 
	STA {LineBufR}+$06,y
	LDA {FontBank0}+$08,x
	ORA {LineBufL}+$08,y 
	STA {LineBufL}+$08,y
	LDA {FontBank0}+$28,x
	ORA {LineBufR}+$08,y 
	STA {LineBufR}+$08,y
	LDA {FontBank0}+$0A,x
	ORA {LineBufL}+$0A,y
	STA {LineBufL}+$0A,y
	LDA {FontBank0}+$2A,x
	ORA {LineBufR}+$0A,y
	STA {LineBufR}+$0A,y
	LDA {FontBank0}+$0C,x
	ORA {LineBufL}+$0C,y
	STA {LineBufL}+$0C,y
	LDA {FontBank0}+$2C,x
	ORA {LineBufR}+$0C,y
	STA {LineBufR}+$0C,y
	LDA {FontBank0}+$0E,x
	ORA {LineBufL}+$0E,y
	STA {LineBufL}+$0E,y
	LDA {FontBank0}+$2E,x
	ORA {LineBufR}+$0E,y
	STA {LineBufR}+$0E,y
	LDA {FontBank0}+$10,x
	ORA {LineBufL}+$10,y
	STA {LineBufL}+$10,y
	LDA {FontBank0}+$30,x
	ORA {LineBufR}+$10,y
	STA {LineBufR}+$10,y
	LDA {FontBank0}+$12,x
	ORA {LineBufL}+$12,y
	STA {LineBufL}+$12,y
	LDA {FontBank0}+$32,x
	ORA {LineBufR}+$12,y
	STA {LineBufR}+$12,y
	LDA {FontBank0}+$14,x
	ORA {LineBufL}+$14,y
	STA {LineBufL}+$14,y
	LDA {FontBank0}+$34,x
	ORA {LineBufR}+$14,y
	STA {LineBufR}+$14,y
	LDA {FontBank0}+$16,x
	ORA {LineBufL}+$16,y
	STA {LineBufL}+$16,y
	LDA {FontBank0}+$36,x
	ORA {LineBufR}+$16,y
	STA {LineBufR}+$16,y
	LDA {FontBank0}+$18,x
	ORA {LineBufL}+$18,y
	STA {LineBufL}+$18,y
	LDA {FontBank0}+$38,x
	ORA {LineBufR}+$18,y
	STA {LineBufR}+$18,y
	LDA {FontBank0}+$1A,x
	ORA {LineBufL}+$1A,y
	STA {LineBufL}+$1A,y
	LDA {FontBank0}+$3A,x
	ORA {LineBufR}+$1A,y
	STA {LineBufR}+$1A,y
	LDA {FontBank0}+$1C,x
	ORA {LineBufL}+$1C,y
	STA {LineBufL}+$1C,y
	LDA {FontBank0}+$3C,x
	ORA {LineBufR}+$1C,y
	STA {LineBufR}+$1C,y
	LDA {FontBank0}+$1E,x
	ORA {LineBufL}+$1E,y
	STA {LineBufL}+$1E,y
	LDA {FontBank0}+$3E,x
	ORA {LineBufR}+$1E,y
	STA {LineBufR}+$1E,y
	PLY
	RTL

draw_accent_char:
	PHY
	LDA {VNchar}
	TAX
	LDA {VNBaseGlyph},x
	AND #$00FF
	PHA
	ASL #6
	STA {buffer1}	
	LDA {shift}
	AND #$0007
	ASL #2
	PHA
	ASL #2
	CLC
	ADC $01,s
	XBA
	CLC
	ADC {buffer1}
	STA {buffer1}		//glyph adr
	TAX
	PLA
	LDA {CurLine}
	AND #$00FF
	XBA
	ASL #2
	PHA
	LDA {shift}
	AND #$00F8
	ASL #2
	CLC
	ADC $01,s
	TAY		//drawing pos
	PLA	
	PLA
	TAX
	LDA {VNWidthTable},x
	AND #$00FF
	CLC
	ADC {shift}
	LDX {buffer1}
	CMP {MaxWidth}
	BCC .fits
	BEQ .fits
	LDA {MaxWidth}
	STA {shift}
	PLY
	RTL

.fits:
	STA {shift}
	LDA {FontBank1}+$00,x
	ORA {LineBufL},y   
	STA {LineBufL},y
	LDA {FontBank1}+$20,x
	ORA {LineBufR},y   
	STA {LineBufR},y
	LDA {FontBank1}+$02,x
	ORA {LineBufL}+$02,y 
	STA {LineBufL}+$02,y
	LDA {FontBank1}+$22,x
	ORA {LineBufR}+$02,y 
	STA {LineBufR}+$02,y
	LDA {FontBank1}+$04,x
	ORA {LineBufL}+$04,y 
	STA {LineBufL}+$04,y
	LDA {FontBank1}+$24,x
	ORA {LineBufR}+$04,y 
	STA {LineBufR}+$04,y
	LDA {FontBank1}+$06,x
	ORA {LineBufL}+$06,y 
	STA {LineBufL}+$06,y
	LDA {FontBank1}+$26,x
	ORA {LineBufR}+$06,y 
	STA {LineBufR}+$06,y
	LDA {FontBank1}+$08,x
	ORA {LineBufL}+$08,y 
	STA {LineBufL}+$08,y
	LDA {FontBank1}+$28,x
	ORA {LineBufR}+$08,y 
	STA {LineBufR}+$08,y
	LDA {FontBank1}+$0A,x
	ORA {LineBufL}+$0A,y
	STA {LineBufL}+$0A,y
	LDA {FontBank1}+$2A,x
	ORA {LineBufR}+$0A,y
	STA {LineBufR}+$0A,y
	LDA {FontBank1}+$0C,x
	ORA {LineBufL}+$0C,y
	STA {LineBufL}+$0C,y
	LDA {FontBank1}+$2C,x
	ORA {LineBufR}+$0C,y
	STA {LineBufR}+$0C,y
	LDA {FontBank1}+$0E,x
	ORA {LineBufL}+$0E,y
	STA {LineBufL}+$0E,y
	LDA {FontBank1}+$2E,x
	ORA {LineBufR}+$0E,y
	STA {LineBufR}+$0E,y
	LDA {FontBank1}+$10,x
	ORA {LineBufL}+$10,y
	STA {LineBufL}+$10,y
	LDA {FontBank1}+$30,x
	ORA {LineBufR}+$10,y
	STA {LineBufR}+$10,y
	LDA {FontBank1}+$12,x
	ORA {LineBufL}+$12,y
	STA {LineBufL}+$12,y
	LDA {FontBank1}+$32,x
	ORA {LineBufR}+$12,y
	STA {LineBufR}+$12,y
	LDA {FontBank1}+$14,x
	ORA {LineBufL}+$14,y
	STA {LineBufL}+$14,y
	LDA {FontBank1}+$34,x
	ORA {LineBufR}+$14,y
	STA {LineBufR}+$14,y
	LDA {FontBank1}+$16,x
	ORA {LineBufL}+$16,y
	STA {LineBufL}+$16,y
	LDA {FontBank1}+$36,x
	ORA {LineBufR}+$16,y
	STA {LineBufR}+$16,y
	LDA {FontBank1}+$18,x
	ORA {LineBufL}+$18,y
	STA {LineBufL}+$18,y
	LDA {FontBank1}+$38,x
	ORA {LineBufR}+$18,y
	STA {LineBufR}+$18,y
	LDA {FontBank1}+$1A,x
	ORA {LineBufL}+$1A,y
	STA {LineBufL}+$1A,y
	LDA {FontBank1}+$3A,x
	ORA {LineBufR}+$1A,y
	STA {LineBufR}+$1A,y
	LDA {FontBank1}+$1C,x
	ORA {LineBufL}+$1C,y
	STA {LineBufL}+$1C,y
	LDA {FontBank1}+$3C,x
	ORA {LineBufR}+$1C,y
	STA {LineBufR}+$1C,y
	LDA {FontBank1}+$1E,x
	ORA {LineBufL}+$1E,y
	STA {LineBufL}+$1E,y
	LDA {FontBank1}+$3E,x
	ORA {LineBufR}+$1E,y
	STA {LineBufR}+$1E,y
	PLY
	RTL
	
check_char:
	CMP #$0085
	BNE +
	LDA #$0043
	BRL quit_check
+
	CMP #$004E
	BNE +
	LDA #$0045
	BRL quit_check
+
	CMP #$0069
	BNE +
	LDA #$0046
	BRL quit_check
+
	CMP #$006A
	BNE +
	LDA #$0027
	BRL quit_check	
+
	CMP #$006B
	BNE +
	LDA #$0028
	BRL quit_check	
+
	CMP #$006C
	BNE +
	LDA #$0029
	BRL quit_check	
+
	CMP #$006D
	BNE +
	LDA #$002A
	BRL quit_check	
+
	CMP #$006E
	BNE +
	LDA #$002B
	BRL quit_check	
+
	CMP #$006F
	BNE +
	LDA #$002C
	BRL quit_check	
+
	CMP #$005A
	BNE +
	LDA #$0017
	BRL quit_check
+
	CMP #$005B
	BNE +
	LDA #$0018
	BRL quit_check
+
	CMP #$0070
	BNE +
	LDA #$002D
	BRL quit_check	
+
	CMP #$0071
	BNE +
	LDA #$002E
	BRL quit_check	
+
	CMP #$0072
	BNE +
	LDA #$002F
	BRL quit_check	
+
	CMP #$0073
	BNE +
	LDA #$0030
	BRL quit_check	
+
	CMP #$0074
	BNE +
	LDA #$0031
	BRL quit_check	
+
	CMP #$0075
	BNE +
	LDA #$0032
	BRL quit_check	
+
	CMP #$0076
	BNE +
	LDA #$0033
	BRL quit_check	
+
	CMP #$0077
	BNE +
	LDA #$0034
	BRL quit_check	
+
	CMP #$0078
	BNE +
	LDA #$0035
	BRL quit_check	
+
	CMP #$0079
	BNE +
	LDA #$0036
	BRL quit_check	
+
	CMP #$007A
	BNE +
	LDA #$0037
	BRL quit_check	
+
	CMP #$007B
	BNE +
	LDA #$0038
	BRL quit_check	
+
	CMP #$007C
	BNE +
	LDA #$0039
	BRL quit_check	
+
	CMP #$007D
	BNE +
	LDA #$003A
	BRL quit_check	
+
	CMP #$007E
	BNE +
	LDA #$003B
	BRL quit_check	
+
	CMP #$007F
	BNE +
	LDA #$003C
	BRL quit_check	
+
	CMP #$0080
	BNE +
	LDA #$003D
	BRL quit_check	
+
	CMP #$0081
	BNE +
	LDA #$003E
	BRL quit_check	
+
	CMP #$0082
	BNE +
	LDA #$003F
	BRL quit_check	
+
	CMP #$0083
	BNE +
	LDA #$0040
	BRL quit_check	
+
	CMP #$0084
	BNE +
	LDA #$0041
	BRL quit_check	
+
	CMP #$0043
	BNE +
	LDA #$0000
	BRL quit_check	
+
	CMP #$0045
	BNE +
	LDA #$0002
	BRL quit_check	
+
	CMP #$0046
	BNE +
	LDA #$0003
	BRL quit_check	
+
	CMP #$0047
	BNE +
	LDA #$0004
	BRL quit_check	
+
	CMP #$0048
	BNE +
	LDA #$0005
	BRL quit_check	
+
	CMP #$0049
	BNE +
	LDA #$0006
	BRL quit_check	
+
	CMP #$004A
	BNE +
	LDA #$0007
	BRL quit_check	
+
	CMP #$004B
	BNE +
	LDA #$0008
	BRL quit_check	
+
	CMP #$004C
	BNE +
	LDA #$0009
	BRL quit_check	
+
	CMP #$004D
	BNE +
	LDA #$000A
	BRL quit_check	
+
	CMP #$004F
	BNE +
	LDA #$000C
	BRL quit_check	
+
	CMP #$0050
	BNE +
	LDA #$000D
	BRL quit_check	
+
	CMP #$0051
	BNE +
	LDA #$000E
	BRL quit_check	
+
	CMP #$0052
	BNE +
	LDA #$000F
	BRL quit_check	
+
	CMP #$0053
	BNE +
	LDA #$0010
	BRL quit_check	
+
	CMP #$0054
	BNE +
	LDA #$0011
	BRL quit_check	
+
	CMP #$0055
	BNE +
	LDA #$0012
	BRL quit_check	
+
	CMP #$0056
	BNE +
	LDA #$0013
	BRL quit_check	
+
	CMP #$0057
	BNE +
	LDA #$0014
	BRL quit_check	
+
	CMP #$0058
	BNE +
	LDA #$0015
	BRL quit_check	
+
	CMP #$0059
	BNE +
	LDA #$0016
	BRL quit_check	
+
	CMP #$005A
	BNE +
	LDA #$0017
	BRL quit_check	
+
	CMP #$005B
	BNE +
	LDA #$0018
	BRL quit_check	
+
	CMP #$005C
	BNE +
	LDA #$0019
	BRL quit_check	
+
	CMP #$005D
	BNE +
	LDA #$001A
	BRL quit_check	
+
	CMP #$005E
	BNE +
	LDA #$001B
	BRL quit_check	
+
	CMP #$005F
	BNE +
	LDA #$001C
	BRL quit_check	
+
	CMP #$0060
	BNE +
	LDA #$001D
	BRL quit_check	
+
	CMP #$0061
	BNE +
	LDA #$001E
	BRL quit_check	
+
	CMP #$0062
	BNE +
	LDA #$001F
	BRL quit_check	
+
	CMP #$0063
	BNE +
	LDA #$0020
	BRL quit_check	
+
	CMP #$0064
	BNE +
	LDA #$0021
	BRL quit_check	
+
	CMP #$0065
	BNE +
	LDA #$0022
	BRL quit_check	
+
	CMP #$0066
	BNE +
	LDA #$0023
	BRL quit_check	
+
	CMP #$0067
	BNE +
	LDA #$0024
	BRL quit_check	
+
quit_check:
	STA {VNchar}
	JSL draw_accent_char
	INY
	JML $F03141
	
define shift2				$316DFE
define MaxWidth2	$316E00
define CurLine2			$316DF8
define LineBufL2		$D000
define LineBufR2		$D020


draw_accent_char2:
	PHB
	PHP
	REP #$30
	PHA
	PHX
	PHY
	PEA $7E7E
	PLB #2
	LDA $316E06		//char
	TAX
	LDA $4043C6,x		//glyph table
	AND #$00FF
	PHA
	ASL #6
	STA {buffer1}	
	LDA {shift2}
	AND #$0007
	ASL #2
	PHA
	ASL #2
	CLC
	ADC $01,s
	XBA
	CLC
	ADC {buffer1}
	STA {buffer1}		//glyph adr
	TAX
	PLA
	
	LDA {CurLine2}
	AND #$0003
	PHA
	ASL #5
	SEC
	SBC $01,s
	SEC
	SBC $01,s
	STA $01,s
	PLA
	PHA
	LDA {shift2}
	LSR #3
	CLC
	ADC $01,s
	STA $01,s
	PLA
	SEP #$20
	STA $FA
	REP #$20	
	
	LDA {CurLine2}
	AND #$00FF
	PHA
	ASL #6
	STA {buffer2}
	PLA
	XBA
	ASL #2
	SEC
	SBC {buffer2}
	PHA
	LDA {shift2}
	AND #$00F8
	ASL #2
	CLC
	ADC $01,s
	TAY		//drawing pos
	PLA	
	PLA
	TAX
	LDA {VNWidthTable},x
	AND #$00FF
	CLC
	ADC {shift2}
	LDX {buffer1}
	CMP {MaxWidth2}
	BCC .fit2
	BEQ .fit2
	LDA {MaxWidth2}
	STA {shift2}
	REP #$30
	PLY
	PLX
	PLA
	PLP
	PLB
	RTL
	
.fit2:
	STA {shift2}
	LDA {FontBank1}+$00,x
	ORA {LineBufL2},y 
	STA {LineBufL2},y
	LDA {FontBank1}+$20,x
	ORA {LineBufR2},y   
	STA {LineBufR2},y
	LDA {FontBank1}+$02,x
	ORA {LineBufL2}+$02,y 
	STA {LineBufL2}+$02,y
	LDA {FontBank1}+$22,x
	ORA {LineBufR2}+$02,y 
	STA {LineBufR2}+$02,y
	LDA {FontBank1}+$04,x
	ORA {LineBufL2}+$04,y 
	STA {LineBufL2}+$04,y
	LDA {FontBank1}+$24,x
	ORA {LineBufR2}+$04,y 
	STA {LineBufR2}+$04,y
	LDA {FontBank1}+$06,x
	ORA {LineBufL2}+$06,y 
	STA {LineBufL2}+$06,y
	LDA {FontBank1}+$26,x
	ORA {LineBufR2}+$06,y 
	STA {LineBufR2}+$06,y
	LDA {FontBank1}+$08,x
	ORA {LineBufL2}+$08,y 
	STA {LineBufL2}+$08,y
	LDA {FontBank1}+$28,x
	ORA {LineBufR2}+$08,y 
	STA {LineBufR2}+$08,y
	LDA {FontBank1}+$0A,x
	ORA {LineBufL2}+$0A,y
	STA {LineBufL2}+$0A,y
	LDA {FontBank1}+$2A,x
	ORA {LineBufR2}+$0A,y
	STA {LineBufR2}+$0A,y
	LDA {FontBank1}+$0C,x
	ORA {LineBufL2}+$0C,y
	STA {LineBufL2}+$0C,y
	LDA {FontBank1}+$2C,x
	ORA {LineBufR2}+$0C,y
	STA {LineBufR2}+$0C,y
	LDA {FontBank1}+$0E,x
	ORA {LineBufL2}+$0E,y
	STA {LineBufL2}+$0E,y
	LDA {FontBank1}+$2E,x
	ORA {LineBufR2}+$0E,y
	STA {LineBufR2}+$0E,y
	LDA {FontBank1}+$10,x
	ORA {LineBufL2}+$10,y
	STA {LineBufL2}+$10,y
	LDA {FontBank1}+$30,x
	ORA {LineBufR2}+$10,y
	STA {LineBufR2}+$10,y
	LDA {FontBank1}+$12,x
	ORA {LineBufL2}+$12,y
	STA {LineBufL2}+$12,y
	LDA {FontBank1}+$32,x
	ORA {LineBufR2}+$12,y
	STA {LineBufR2}+$12,y
	LDA {FontBank1}+$14,x
	ORA {LineBufL2}+$14,y
	STA {LineBufL2}+$14,y
	LDA {FontBank1}+$34,x
	ORA {LineBufR2}+$14,y
	STA {LineBufR2}+$14,y
	LDA {FontBank1}+$16,x
	ORA {LineBufL2}+$16,y
	STA {LineBufL2}+$16,y
	LDA {FontBank1}+$36,x
	ORA {LineBufR2}+$16,y
	STA {LineBufR2}+$16,y
	LDA {FontBank1}+$18,x
	ORA {LineBufL2}+$18,y
	STA {LineBufL2}+$18,y
	LDA {FontBank1}+$38,x
	ORA {LineBufR2}+$18,y
	STA {LineBufR2}+$18,y
	LDA {FontBank1}+$1A,x
	ORA {LineBufL2}+$1A,y
	STA {LineBufL2}+$1A,y
	LDA {FontBank1}+$3A,x
	ORA {LineBufR2}+$1A,y
	STA {LineBufR2}+$1A,y
	LDA {FontBank1}+$1C,x
	ORA {LineBufL2}+$1C,y
	STA {LineBufL2}+$1C,y
	LDA {FontBank1}+$3C,x
	ORA {LineBufR2}+$1C,y
	STA {LineBufR2}+$1C,y
	LDA {FontBank1}+$1E,x
	ORA {LineBufL2}+$1E,y
	STA {LineBufL2}+$1E,y
	LDA {FontBank1}+$3E,x
	ORA {LineBufR2}+$1E,y
	STA {LineBufR2}+$1E,y
	REP #$30
	PLY
	PLX
	PLA
	PLP
	PLB
	RTL
	
draw_non_accent_char2:
	PHB
	PHP
	REP #$30
	PHA
	PHX
	PHY
	PEA $7E7E
	PLB #2
	PHP
	REP #$30
	PHX

	AND #$00FF
	TAX
	LDA {GlyphTable},x
	AND #$00FF
	PLX
	PLP
	PHA
	ASL #6
	STA {buffer1}	
	LDA {shift2}
	AND #$0007
	ASL #2
	PHA
	ASL #2
	CLC
	ADC $01,s
	XBA
	CLC
	ADC {buffer1}
	STA {buffer1}		//glyph adr
	TAX
	PLA
	
	LDA {CurLine2}
	AND #$0003
	PHA
	ASL #5
	SEC
	SBC $01,s
	SEC
	SBC $01,s
	STA $01,s
	PLA
	PHA
	LDA {shift2}
	LSR #3
	CLC
	ADC $01,s
	STA $01,s
	PLA
	SEP #$20
	STA $FA
	REP #$20	
	
	LDA {CurLine2}
	AND #$00FF
	PHA
	ASL #6
	STA {buffer2}
	PLA
	XBA
	ASL #2
	SEC
	SBC {buffer2}
	PHA
	LDA {shift2}
	AND #$00F8
	ASL #2
	CLC
	ADC $01,s
	TAY		//drawing pos
	PLA	
	PLA
	TAX
	LDA {WidthTable},x
	AND #$00FF
	CLC
	ADC {shift2}
	LDX {buffer1}
	CMP {MaxWidth2}
	BCC .fit1
	BEQ .fit1
	LDA {MaxWidth2}
	STA {shift2}

	REP #$30
	PLY
	PLX
	PLA
	PLP
	PLB
	RTL
	
.fit1:
	STA {shift2}
	LDA {FontBank0}+$00,x
	ORA {LineBufL2},y   
	STA {LineBufL2},y
	LDA {FontBank0}+$20,x
	ORA {LineBufR2},y   
	STA {LineBufR2},y
	LDA {FontBank0}+$02,x
	ORA {LineBufL2}+$02,y 
	STA {LineBufL2}+$02,y
	LDA {FontBank0}+$22,x
	ORA {LineBufR2}+$02,y 
	STA {LineBufR2}+$02,y
	LDA {FontBank0}+$04,x
	ORA {LineBufL2}+$04,y 
	STA {LineBufL2}+$04,y
	LDA {FontBank0}+$24,x
	ORA {LineBufR2}+$04,y 
	STA {LineBufR2}+$04,y
	LDA {FontBank0}+$06,x
	ORA {LineBufL2}+$06,y 
	STA {LineBufL2}+$06,y
	LDA {FontBank0}+$26,x
	ORA {LineBufR2}+$06,y 
	STA {LineBufR2}+$06,y
	LDA {FontBank0}+$08,x
	ORA {LineBufL2}+$08,y 
	STA {LineBufL2}+$08,y
	LDA {FontBank0}+$28,x
	ORA {LineBufR2}+$08,y 
	STA {LineBufR2}+$08,y
	LDA {FontBank0}+$0A,x
	ORA {LineBufL2}+$0A,y
	STA {LineBufL2}+$0A,y
	LDA {FontBank0}+$2A,x
	ORA {LineBufR2}+$0A,y
	STA {LineBufR2}+$0A,y
	LDA {FontBank0}+$0C,x
	ORA {LineBufL2}+$0C,y
	STA {LineBufL2}+$0C,y
	LDA {FontBank0}+$2C,x
	ORA {LineBufR2}+$0C,y
	STA {LineBufR2}+$0C,y
	LDA {FontBank0}+$0E,x
	ORA {LineBufL2}+$0E,y
	STA {LineBufL2}+$0E,y
	LDA {FontBank0}+$2E,x
	ORA {LineBufR2}+$0E,y
	STA {LineBufR2}+$0E,y
	LDA {FontBank0}+$10,x
	ORA {LineBufL2}+$10,y
	STA {LineBufL2}+$10,y
	LDA {FontBank0}+$30,x
	ORA {LineBufR2}+$10,y
	STA {LineBufR2}+$10,y
	LDA {FontBank0}+$12,x
	ORA {LineBufL2}+$12,y
	STA {LineBufL2}+$12,y
	LDA {FontBank0}+$32,x
	ORA {LineBufR2}+$12,y
	STA {LineBufR2}+$12,y
	LDA {FontBank0}+$14,x
	ORA {LineBufL2}+$14,y
	STA {LineBufL2}+$14,y
	LDA {FontBank0}+$34,x
	ORA {LineBufR2}+$14,y
	STA {LineBufR2}+$14,y
	LDA {FontBank0}+$16,x
	ORA {LineBufL2}+$16,y
	STA {LineBufL2}+$16,y
	LDA {FontBank0}+$36,x
	ORA {LineBufR2}+$16,y
	STA {LineBufR2}+$16,y
	LDA {FontBank0}+$18,x
	ORA {LineBufL2}+$18,y
	STA {LineBufL2}+$18,y
	LDA {FontBank0}+$38,x
	ORA {LineBufR2}+$18,y
	STA {LineBufR2}+$18,y
	LDA {FontBank0}+$1A,x
	ORA {LineBufL2}+$1A,y
	STA {LineBufL2}+$1A,y
	LDA {FontBank0}+$3A,x
	ORA {LineBufR2}+$1A,y
	STA {LineBufR2}+$1A,y
	LDA {FontBank0}+$1C,x
	ORA {LineBufL2}+$1C,y
	STA {LineBufL2}+$1C,y
	LDA {FontBank0}+$3C,x
	ORA {LineBufR2}+$1C,y
	STA {LineBufR2}+$1C,y
	LDA {FontBank0}+$1E,x
	ORA {LineBufL2}+$1E,y
	STA {LineBufL2}+$1E,y
	LDA {FontBank0}+$3E,x
	ORA {LineBufR2}+$1E,y
	STA {LineBufR2}+$1E,y
	REP #$30
	PLY
	PLX
	PLA
	PLP
	PLB
	RTL
	
check_char2:
	REP #$20
	AND #$00FF
	CMP #$0085
	BNE +
	LDA #$0043
	BRL quit_check2
+
	CMP #$004E
	BNE +
	LDA #$0045
	BRL quit_check2
+
	CMP #$0069
	BNE +
	LDA #$0046
	BRL quit_check2
+
	CMP #$006A
	BNE +
	LDA #$0027
	BRL quit_check2	
+
	CMP #$006B
	BNE +
	LDA #$0028
	BRL quit_check2	
+
	CMP #$006C
	BNE +
	LDA #$0029
	BRL quit_check2	
+
	CMP #$006D
	BNE +
	LDA #$002A
	BRL quit_check2	
+
	CMP #$006E
	BNE +
	LDA #$002B
	BRL quit_check2	
+
	CMP #$006F
	BNE +
	LDA #$002C
	BRL quit_check2	
+
	CMP #$005A
	BNE +
	LDA #$0017
	BRL quit_check2
+
	CMP #$005B
	BNE +
	LDA #$0018
	BRL quit_check2
+
	CMP #$0070
	BNE +
	LDA #$002D
	BRL quit_check2	
+
	CMP #$0071
	BNE +
	LDA #$002E
	BRL quit_check2	
+
	CMP #$0072
	BNE +
	LDA #$002F
	BRL quit_check2	
+
	CMP #$0073
	BNE +
	LDA #$0030
	BRL quit_check2	
+
	CMP #$0074
	BNE +
	LDA #$0031
	BRL quit_check2	
+
	CMP #$0075
	BNE +
	LDA #$0032
	BRL quit_check2	
+
	CMP #$0076
	BNE +
	LDA #$0033
	BRL quit_check2	
+
	CMP #$0077
	BNE +
	LDA #$0034
	BRL quit_check2	
+
	CMP #$0078
	BNE +
	LDA #$0035
	BRL quit_check2	
+
	CMP #$0079
	BNE +
	LDA #$0036
	BRL quit_check2	
+
	CMP #$007A
	BNE +
	LDA #$0037
	BRL quit_check2	
+
	CMP #$007B
	BNE +
	LDA #$0038
	BRL quit_check2	
+
	CMP #$007C
	BNE +
	LDA #$0039
	BRL quit_check2	
+
	CMP #$007D
	BNE +
	LDA #$003A
	BRL quit_check2	
+
	CMP #$007E
	BNE +
	LDA #$003B
	BRL quit_check2	
+
	CMP #$007F
	BNE +
	LDA #$003C
	BRL quit_check2	
+
	CMP #$0080
	BNE +
	LDA #$003D
	BRL quit_check2	
+
	CMP #$0081
	BNE +
	LDA #$003E
	BRL quit_check2	
+
	CMP #$0082
	BNE +
	LDA #$003F
	BRL quit_check2	
+
	CMP #$0083
	BNE +
	LDA #$0040
	BRL quit_check2	
+
	CMP #$0084
	BNE +
	LDA #$0041
	BRL quit_check2	
+
	CMP #$0043
	BNE +
	LDA #$0000
	BRL quit_check2	
+
	CMP #$0045
	BNE +
	LDA #$0002
	BRL quit_check2	
+
	CMP #$0046
	BNE +
	LDA #$0003
	BRL quit_check2	
+
	CMP #$0047
	BNE +
	LDA #$0004
	BRL quit_check2	
+
	CMP #$0048
	BNE +
	LDA #$0005
	BRL quit_check2	
+
	CMP #$0049
	BNE +
	LDA #$0006
	BRL quit_check2	
+
	CMP #$004A
	BNE +
	LDA #$0007
	BRL quit_check2	
+
	CMP #$004B
	BNE +
	LDA #$0008
	BRL quit_check2	
+
	CMP #$004C
	BNE +
	LDA #$0009
	BRL quit_check2	
+
	CMP #$004D
	BNE +
	LDA #$000A
	BRL quit_check2	
+
	CMP #$004F
	BNE +
	LDA #$000C
	BRL quit_check2	
+
	CMP #$0050
	BNE +
	LDA #$000D
	BRL quit_check2	
+
	CMP #$0051
	BNE +
	LDA #$000E
	BRL quit_check2	
+
	CMP #$0052
	BNE +
	LDA #$000F
	BRL quit_check2	
+
	CMP #$0053
	BNE +
	LDA #$0010
	BRL quit_check2	
+
	CMP #$0054
	BNE +
	LDA #$0011
	BRL quit_check2	
+
	CMP #$0055
	BNE +
	LDA #$0012
	BRL quit_check2	
+
	CMP #$0056
	BNE +
	LDA #$0013
	BRL quit_check2	
+
	CMP #$0057
	BNE +
	LDA #$0014
	BRL quit_check2	
+
	CMP #$0058
	BNE +
	LDA #$0015
	BRL quit_check2	
+
	CMP #$0059
	BNE +
	LDA #$0016
	BRL quit_check2	
+
	CMP #$005A
	BNE +
	LDA #$0017
	BRL quit_check2	
+
	CMP #$005B
	BNE +
	LDA #$0018
	BRL quit_check2	
+
	CMP #$005C
	BNE +
	LDA #$0019
	BRL quit_check2	
+
	CMP #$005D
	BNE +
	LDA #$001A
	BRL quit_check2	
+
	CMP #$005E
	BNE +
	LDA #$001B
	BRL quit_check2	
+
	CMP #$005F
	BNE +
	LDA #$001C
	BRL quit_check2	
+
	CMP #$0060
	BNE +
	LDA #$001D
	BRL quit_check2	
+
	CMP #$0061
	BNE +
	LDA #$001E
	BRL quit_check2	
+
	CMP #$0062
	BNE +
	LDA #$001F
	BRL quit_check2	
+
	CMP #$0063
	BNE +
	LDA #$0020
	BRL quit_check2	
+
	CMP #$0064
	BNE +
	LDA #$0021
	BRL quit_check2	
+
	CMP #$0065
	BNE +
	LDA #$0022
	BRL quit_check2	
+
	CMP #$0066
	BNE +
	LDA #$0023
	BRL quit_check2	
+
	CMP #$0067
	BNE +
	LDA #$0024
	BRL quit_check2	
+
quit_check2:
	STA $316E06
	PLP
	JSL draw_accent_char2
	JSL $F08B9F
	RTL
	