	PRESERVE8
	THUMB   
	export timer_callback
	include DriverJeuLaser.inc  
	export StartSon
; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly

	extern Son
	extern LongueurSon
;Section RAM (read write):
	area    maram,data,readwrite
	export index 
	export SortieSon
SortieSon dcw 0
index dcd 0
	
; ===============================================================================================
	
	export timer_callback
	

		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici		
StartSon proc 
	ldr r0,=index  
	mov r1,#0 
	str r1,[r0] 
	bx lr 
	endp
	
timer_callback proc
	
	push{lr, r0, r1, r2, r3, r4,r5}
	ldr r0, =index ; adressede var adresse
	ldr r4, =Son
	ldr r2, [r0]  ; index
	
	ldr r3,=LongueurSon 
	ldr r5, [r3] ; r5 longuer son
	; compare index et long son
	cmp r2, r5 
	bgt label	
	
	;SortieSon=Son[i] 
	ldrsh r1, [r4,r2, lsl #1]	; son[index]
	ldr r3,=SortieSon   ; adresse sortieSon
	
	;SortieSon=((SortieSon+32768)/92)
	adds r1,#32768  
	mov r4,#719
	mul r1,r4 
	asr r1,#16

	

	
	strh r1,[r3]  ; update la sortieSon
	
	add r2,#1   ; incremente index
	str r2, [r0]  ; update index
	
	mov r0, r1
	BL PWM_Set_Value_TIM3_Ch3 
	
label	 
	pop {lr, r0, r1, r2, r3, r4,r5}
	bx lr
 
	endp



		
		
	END	