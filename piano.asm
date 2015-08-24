; Description of program

.MODEL  SMALL                    ; Specify small memory model - overlap segments
.486                             ; Allows Pentium instructions. Must come after .MODEL
.STACK  1000h                    ; Reserve 256 bytes for the stack

.DATA
    ; Constants
        CR              EQU     13d
        LF              EQU     10d
        MsgEnd          EQU     '$'
		durDivisor		DW		55
        NewLine         DB      CR, LF, MsgEnd
		key_label		DB		28 DUP(' ')
						DB		'z','3','x','c','5','v','6','b','n','8','m','9','a','w','s','d','r','f','t','j','k','o','l','p','A','W','S','D','R','F','T','J','K','O','L','P',3 DUP(' ')
		key_colNum		DB		01d,02d,03d,04d,05d,06d,07d,09d,010d,011d,012d,013d,015d,016d,017d,018d,019d,020d,021d,023d,024d,025d,026d,027d,029d,030d,031d,032d
						DB		033d,034d,035d,037d,038d,039d,040d,041d,043d,044d,045d,046d,047d,048d,049d,051d,052d,053d,054d,055d,057d,058d,059d,060d,061d,062d,063d,065d,066d,067d,068d,069d,071d,072d,073d,074d,075d,076d,077d
		key_freq		DW		44d,56d,59d,52d,55d,58d,62d,65d,69d,73d,78d,82d,87d,93d,98d,104d,110d,117d,124d,131d,139d,147d,156d,165d,175d,185d,196d,208d
						DW		220d,233d,247d,262d,277d,294d,311d,330d,349d,370d,392d,415d,440d,466d,494d,523d,554d,587d,622d,659d,699d,740d,784d,861d,880d,932d,988d,1047d,1109d,1175d,1245d,1319d,1397d,1480d,1568d,1661d,1760d,1865d,1976d
		key_color		DB		5 DUP(0F0h,0fh,0F0h,0fh,0F0h,0fh,0F0h,0F0h,0fh,0F0h,0fh,0F0h),0F0h,0fh,0F0h,0fh,0F0h,0fh,0F0h,0F0h
		
	; Songs
		ImpMarch_length	DW		18
		ImpMarch_durs	DW		 0,500,500,500,350,150,500,350,150,1000,500,500,500,350,150,500,350,150,1000
		ImpMarch_freqs	DW		 0,440,440,440,349,523,440,349,523, 440,659,659,659,698,523,415,349,523, 440
		ImpMarch_pause	DW		55, 55, 55, 55, 55, 55, 55, 55, 55,  55, 55, 55, 55, 55, 55, 55, 55, 55,  55
		
		supMario_length DW      106
		supMario_durs   DW      125,125,125,125,125,125,125,125,125,125,125,125,125,125,125
						DW		125,125,125,125,125,125,125,125,125,125,125,125,125,125,125
						DW		125,125,125,125,125,125,125,125,125,125,125,125,125,125,125
						DW		125,125,125,125,125,125,125,125,125,125,125,125,125,125,125
						DW		125,125,125,125,125,125,125,125,125,125,125,125,125,125,125
						DW		125,125,125,125,125,125,125,125,125,125,125,125,125,125,125
						DW		125,125,125,125,125,125,125,125,125,125,125,125,125,125,125
						DW		125,125
		supMario_freqs  DW		659,659,659,523,659,784,392,523,392,330,440,494,466,440,392
						DW		659,784,880,698,784,659,523,587,494,523,392,330,440,494,466
						DW		440,392,659,784,880,698,784,659,523,587,494,784,740,698,622
						DW		659,415,440,523,440,523,587,784,740,698,622,659,698,698,698
						DW		784,740,698,622,659,415,440,523,440,523,587,622,587,523,784
						DW		740,698,622,659,415,440,523,440,523,587,784,740,698,622,659
						DW		698,698,698,784,740,698,622,659,415,440,523,440,523,587,622
						DW		587,523
		supMario_pause  DW		55,125,167,55,125,375,375,250,250,250,125,125,42,125,125,125
						DW		125,125,55,125,125,125,55,125,250,250,250,125,125,42,125,125
						DW		125,125,125,55,125,125,125,55,375,55,55,42,125,167,55,55,125,55
						DW		55,250,55,55,42,125,167,125,55,625,55,55,42,125,167,55,55,125,55
						DW		55,250,250,250,1125,55,55,42,125,167,55,55,125,55,55,250,55,55,42
						DW		125,167,125,55,625,55,55,42,125,167,55,55,125,55,55,250,250,250,625
						
		barbie_length	DW		19
		barbie_freqs	DW		831,659,831,1109,880,740,622,740,988,831,740,659,659,554,740,554,740,659,831,740
		barbie_durs		DW		240,240,240, 240,480,240,240,240,240,480,240,240,240,240,480,480,240,240,480,480
		barbie_pause	DW		 55, 55, 55,  55,480, 55, 55, 55, 55, 55, 55,480, 55, 55, 55,480, 55, 55, 55, 55
		
		tetris_length	DW		34
		tetris_durs		DW		200,100,100,200,100,100,200,100,100,200,100,100,300,100,200,200,200,200,400,200,100,200,100,100,300,100,200,100,100,200,100,100,200,200,200,200,200,300,300,300,300,300,300,300,300,300,300,300,300,200,200,300,600
		tetris_freqs	DW		82,62,65,73,65,62,55,55,65,82,73,65,62,65,73,82,65,55,55,73,87,110,98,87,82,65,82,73,65,62,62,65,73,82,65,55,55,41,33,37,31,33,28,2794,31,41,33,37,31,33,41,55,2794
		tetris_pause	DW		55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55
		
    ; Strings
		keys			DB		0DAh,3 DUP(0C4h,0DCh),0C4h,5 DUP(0C2h,2 DUP(0C4h,0DCh),0C4h,0C2h,3 DUP(0C4h,0DCh),0C4h),0BFh,CR,LF
						DB		4 DUP(0B3h,7 DUP(020h),5 DUP(0B3h,5 DUP(020h),0B3h,7 DUP(020h)),0B3h,CR,LF)
						DB		4 DUP(0B3h,3 DUP(020h,0B3h),020h,5 DUP(7 DUP(0B3h,020h)),0B3h,CR,LF)
						DB		0C0h,3 DUP(0C4h,0C1h),0C4h,5 DUP(7 DUP(0C1h,0C4h)),0D9h,CR,LF,MsgEnd
						
		Instructions	DB		CR,LF,'Use your computer keyboard to play the on-screen keyboard.',CR,LF
						DB		'Press "+" followed by a number below to play a song:',CR,LF
						DB		' 0: Imperial March',CR,LF
						DB		' 1: Super Mario Theme',CR,LF
						DB		' 2: Barbie Girl',CR,LF
						DB		' 3: Tetris',CR,LF,CR,LF
						DB		'Press ESC to quit.',CR,LF,MsgEnd
						
	; Variables
		durMilliSeconds	DW		?
		thisKey_ASCII	DB		?
		thisKey_offset	DW		?
		thisKey_colNum	DB		?
		thisKey_bottom	DB		?
		thisKey_color	DB		?
		thisKey_freq	DW		?
		quitSong		DB		0
	
.CODE
	main	PROC
		mov		cx, @DATA
		mov		ds, cx
		Call	cosmetics
		Call	showKeys
		mov		ah, 09h
		mov		dx, offset Instructions
		int		21h	
		Call	readKeys
		Call	doExit
	main	ENDP
	
	cosmetics	PROC
		mov		ax, 0200h							; set cursor position
		mov		bh, 0h								; set page number to 0
		mov		dx, 0h								; set row, column to 0, 0
		int		10h									; do it
		mov		ax, 0600h							; set screen colors
		mov		cx, 0h								; starting at position 0,0
		mov		dx, 4f4fh							; ending at position 79,79
		mov		bx, 0200h							; set background color to 0 (black), and foreground to 2 (green)
		int		10h									; do it
		ret
	cosmetics	ENDP
	
	showKeys	PROC
		; print chars on keyboard
			mov		ah, 09h
			mov		dx, offset keys
			int		21h
		; print white background
			mov		bx, 00f0h						; page = 0, color = white
			mov		cx, 0000h						; start at [0, 0]
			mov		dx, 094Eh						; end at [10, 43]
			Call	setColors
		; color and label individual keys
			mov		cx, -1
			showKeys_color_start:
				INC		cx
				CMP		cx, 66d
				JG		showKeys_color_end
				mov		dh, 02h						; find key from column offset
				mov		al, cl
				Call	GetKey
				Call	colorKey
				Call	labelKey
				JMP		showKeys_color_start
			showKeys_color_end:
		ret
	showKeys	ENDP
	
	readKeys	PROC
		mov		thisKey_freq, 0
		Call	spk_off
		readKeys_start:
			mov		ah, 06h
			mov		dl, 0ffh
			int		21h
			JZ		readKeys_start					; if no key pressed, check again
			CMP		al, 1Bh
			JE		readKeys_end					; if ESC pressed, exit loop
			
			CMP		al, 2Bh							; if '+' is pressed, go to menu
			JNE		next
			Call	play_existing_song
			JMP		readKeys_start
			next:
			
			CMP		al, 20h
			JNE		readKeys_notSpace				; if " " pressed, stop playing key, then restart loop
			mov		thisKey_freq, 0
			Call	colorKey						; un-shade previous key
			Call	spk_off
			JMP		readKeys_start
			readKeys_notSpace:
			Call	handleKey
			JMP		readKeys_start
		readKeys_end:
		Call	colorKey
		ret
	readKeys	ENDP
	
	handleKey	PROC
		; input: AL = ASCII value
		Call	colorKey						; un-shade previous key
		mov		dh, 0
		Call	getKey
		Call	shadeKey
		mov		bx, thisKey_freq
		Call	playFreq
		ret
	handleKey	ENDP
	
	play_existing_song	PROC
		Call	colorKey					; un-shade any clicked key and turn off the sound
		Call	spk_off
		xor		ax,ax
		xor		dx,dx
		mov		ah, 08h						; get character of song
		int		21h
		CMP		al, '0'
		JNE		not_ImpMarch
		mov		ax, offset ImpMarch_durs
		mov		bx, ImpMarch_length
		mov		cx, offset ImpMarch_pause
		mov		dx, offset ImpMarch_freqs
		Call	playSong
		not_ImpMarch:
		CMP		al, '1'
		JNE		not_supMario
		mov		ax, offset supMario_durs
		mov		bx, supMario_length
		mov		cx, offset supMario_pause
		mov		dx, offset supMario_freqs
		Call	playSong
		not_supMario:
		CMP		al, '2'
		JNE		not_barbie
		mov		ax, offset barbie_durs
		mov		bx, barbie_length
		mov		cx, offset barbie_pause
		mov		dx, offset barbie_freqs
		Call	playSong
		not_barbie:
		CMP		al, '3'
		JNE		not_killing
		mov		ax, offset tetris_durs
		mov		bx, tetris_length
		mov		cx, offset tetris_pause
		mov		dx, offset tetris_freqs
		Call	playSong
		not_killing:
		; where more songs would go
		
		ret
	play_existing_song	ENDP
	
	getKey		PROC
		; input		DH == 0 means get from ASCII		AL = ASCII value
		;			DH == 1 means get from frequency	AX = frequency
		;			DH == 2 means get from offset		AL = offset
		push	ax
		push	bx
		push	cx
		push	dx
		mov		dl, 66d								; there are 67 keys
		mov		cx, -1								; we're currently checking the key at position cx
		getKey_search_start:
			INC		cx
			CMP		cl, dl
			JG		getKey_search_notFound
			
			CMP		dh, 0
			JE		getKey_byASCII
			CMP		dh, 1
			JE		getKey_byFreq
			CMP		dh, 2
			JE		getKey_byOffset
			JMP		getKey_search_notFound
			getKey_byASCII:
				CMP		al, ' '
				JE		getKey_end
				mov		SI, offset key_label
				add		SI, cx
				CMP		al, [SI]
				JNE		getKey_search_start
				JMP		getKey_saveOffset
			getKey_byFreq:
				mov		SI, offset key_freq
				add		SI, cx
				add		SI, cx
				CMP		ax, [SI]
				JG		getKey_search_start				; JL instead of JNE in case we don't have the EXACT frequency
				JMP		getKey_saveOffset
			getKey_byOffset:
				CMP		al, 67d
				JG		getKey_search_notFound
				mov		cl, al
				JMP		getKey_saveOffset
			getKey_saveOffset:
			xor		ch, ch
			mov		thisKey_offset, cx
			JMP		getKey_search_end
		getKey_search_notFound:
			mov		cx, -1
		getKey_search_end:
		mov		SI, offset key_label
		add		SI, thisKey_offset
		mov		dl, [SI]
		mov		thisKey_ASCII, dl
		mov		SI, offset key_colNum
		add		SI, thisKey_offset
		mov		dl, [SI]
		mov		thisKey_colNum, dl
		mov		SI, offset key_freq
		mov		dx, thisKey_offset						; frequency has to be a word, so we have to double the size of the offset
		add		SI, dx
		add		SI, dx
		mov		dx, [SI]
		mov		thisKey_freq, dx
		mov		SI, offset key_color
		add		SI, thisKey_offset
		mov		dl, [SI]
		mov		thisKey_color, dl
		CMP		dl, 0fh
		JNE		getKey_bottom_White
		mov		thisKey_bottom, 4
		JMP		getKey_end
		getKey_bottom_White:
		mov		thisKey_bottom, 8
		getKey_end:
		pop		dx
		pop		cx
		pop		bx
		pop		ax
		ret
	getKey		ENDP
	
	colorKey	PROC
		push	ax
		push	bx
		push	cx
		push	dx
		mov		bh, 0
		mov		bl, thisKey_color
		mov		ch, 1
		mov		cl, thisKey_colNum
		mov		dh, thisKey_bottom
		mov		dl, thisKey_colNum
		Call	setColors
		pop		dx
		pop		cx
		pop		bx
		pop		ax
		ret
	colorKey	ENDP
	
	shadeKey	PROC
		push	ax
		push	bx
		push	cx
		push	dx
		mov		bh, 0
		mov		bl, thisKey_color
		xor		bl, 10000000b
		mov		ch, 1
		mov		cl, thisKey_colNum
		mov		dh, thisKey_bottom
		mov		dl, thisKey_colNum
		Call	setColors
		pop		dx
		pop		cx
		pop		bx
		pop		ax
		ret
	shadeKey	ENDP
	
	labelKey	PROC
		; input: AL = keyCol
		push	ax
		push	bx
		push	cx
		push	dx
		; save cursor position
			mov		ah, 03h
			mov		bh, 0h
			int		10h
			mov		saveCursor, dx
			
		; move cursor position to key label location (one above the bottom of the key)
			mov		ah, 02h
			mov		bh, 0
			mov		dl, thisKey_colNum
			mov		dh, thisKey_bottom
			DEC		dh
			int		10h	
		
		;write label
			mov		ah, 0Ah
			mov		al, thisKey_ASCII
			mov		cx, 1
			xor		bh, bh
			int		10h
		
		;restore cursor position
			mov		ah, 02h
			mov		bh, 0
			mov		dx, saveCursor
			int		10h
		pop		dx
		pop		cx
		pop		bx
		pop		ax
		ret
	labelKey	ENDP
	
	setColors	PROC
		.DATA
			pageNum		db		?
			color		db		?
			startRow	db		?						; zero-based
			startCol	db		?						; zero-based
			endRow		db		?						; zero-based
			endCol		db		?						; zero-based
			saveCursor	dw		?
		.CODE
			push	ax
			push	bx
			push	cx
			push	dx
			mov		pageNum, bh
			mov		color, bl
			mov		startRow, ch
			mov		startcol, cl
			mov		endRow, dh
			mov		endCol, dl
			; save cursor position
				mov		ah, 03h
				mov		bh, 0h
				int		10h
				mov		saveCursor, dx
			; move cursor position to [start row][start column]
				mov		ah, 02h
				mov		bh, 0
				mov		dh, startRow
				mov		dl, startCol
				int		10h	
			
			mov		dh, startRow
				CMP		dh, endRow
				JG		fillColor_row_loop_end
			mov		dl, startCol
				CMP		dl, endCol
				JG		fillColor_row_loop_end
			fillColor_row_loop_start:
				fillColor_column_loop_start:
					mov		ah, 02h
					mov		bh, 0
					int		10h							; set cursor position
					mov		ah, 08h
					mov		bh, 0
					int		10h							; get char at cursor -> al
					mov		ah, 09h
					mov		bh, pageNum
					mov		bl, color
					mov		cx, 1
					int		10h							; write char with new color
					INC		dl
					CMP		dl, endCol
					JG		fillColor_column_loop_end
					JMP		fillColor_column_loop_start
				fillColor_column_loop_end:
				mov		dl, startCol
				INC		dh
				CMP		dh, endRow
				JG		fillColor_row_loop_end
				JMP		fillColor_row_loop_start
			fillColor_row_loop_end:
			
			;restore cursor position
				mov		ah, 02h
				mov		bh, 0
				mov		dx, saveCursor
				int		10h
			pop		dx
			pop		cx
			pop		bx
			pop		ax
			ret
	setColors	ENDP
	
	spk_on		PROC
		; Switch speaker on
			in	 al,061h								; get port 61h contents
			or	 al,00000011b							; enable speaker
			out	061h,al
		ret
	spk_on		ENDP
	
	spk_off		PROC
		; Switch speaker off
			in	 al,61h									; get port contents
			and	al,11111100b							; disable speaker
			out	61h,al	
		ret
	spk_off		ENDP
	
	playFreq	PROC
		push cx
		Call spk_off
		push bx
		xor ebx, ebx									; NOTE: If BX is >= 80Ch, then no sound is produced
		pop bx
		
		xor edx, edx
		mov eax,1234DEh									; 1193182d (see http://en.wikibooks.org/wiki/X86_Assembly/Print_Version)
		div ebx
		mov cx,ax
		
		cli												; no interrupts
		mov	al,10110110b								; get ready byte
		out	043h,al
		mov	al,cl										; frequency divisor low byte
		out	042h,al
		mov	al,ch										; frequency divisor high byte
		out	042h,al
		Call spk_on
		sti												; must allow clock interrupt
		pop cx
		ret
	playFreq	ENDP
	
	waitMillSec	PROC
	; (System timer ticks 18.2 times per second = 54.9 ms / tick)
		push ds
		sti												; must allow clock interrupt
		mov	cx, durDivisor
		mov ax, durMilliSeconds							; Convert milliseconds to ticks
		xor dx, dx
		div cx
		CMP	ax, 0
		JLE	waitMillSec_end
		mov	cx, ax
		mov ax,040h										; point DS to BIOS
		mov es,ax
		mov si,06ch	   
		mov ds,ax
	waitlp:
		; allow user to interrupt song by pressing a key
			mov		ah, 06h
			mov		dl, 0ffh
			int		21h
			JZ		keep_waiting
			pop ds
			;Call	handleKey
			mov		quitSong, 1
			ret
		keep_waiting:
		mov ax,[si]										; get low word of tick counter
	wait1:
		cmp ax,[si]										; wait for it to change
		je  wait1
		loop waitlp										; count CX changes
	waitMillSec_end:
		pop ds
		ret
	waitMillSec	ENDP
	
	playSong	PROC
		; inputs:	bx = song_length (zero-based)
		;			ax = offset of song_durs
		;			dx = offset of song_freqs
		;			cx = offset of song_pause
		.DATA
			tmp_cx		DW		?
			song_length	DW		?
			song_durs	DW		?
			song_pause	DW		?
			song_freqs	DW		?
			wait_ms		DW		?
		.CODE
		mov		quitSong, 0
		mov		song_durs,   ax
		mov		song_length, bx
		add		song_length, bx							; we'll be incrementing our counter by 2 each iteration
		mov		song_pause,  cx
		mov		song_freqs,  dx
		mov		cx, -2
		playSong_start:
			INC		cx
			INC		cx									; double increment b/c the arrays are words
			mov		tmp_cx, cx
			CMP		cx, song_length
			JG		playSong_end
			mov		SI, song_durs
			add		SI, cx
			mov		ax, [SI]
			mov		durMilliSeconds, ax
			mov		SI, song_pause
			add		SI, cx
			mov		ax, [SI]
			mov		wait_ms, ax
			mov		SI, song_freqs
			add		SI, cx
			mov		ax, [SI]
			mov		dh, 1
			Call	getKey
			Call	shadeKey
			mov		bx, thisKey_freq
			Call	playFreq
			Call	waitMillSec
			Call	spk_off
			mov		bx, wait_ms
			mov		durMilliSeconds, bx
			Call	waitMillSec
			Call	colorKey
			mov		cx, tmp_cx
			CMP		quitSong, 1
			JNE		playSong_start
		playSong_end:
		ret
	playSong	ENDP

	doExit		PROC
		mov		ah, 09h
		mov		dx, offset NewLine
		int		21h
		mov ah, 04ch
		int 21h
		ret
	doExit		ENDP

END		main