	PRESERVE8
	THUMB   
	

    export timer_callback
	include DriverJeuLaser.inc
; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite 
		export FlagCligno  
FlagCligno dcb 1
		

	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici 

	

timer_callback   proc
	ldr r0,=FlagCligno
	ldr r1, [r0]
;	{
;	if (FlagCligno==1)	
	cmp r1,  #1  
	bne label	
;	{
;		FlagCligno=0;
	mov r1, #0
	str r1, [r0]
;		GPIOB_Set(1);
	push {lr} 
	mov r0, #1
	bl GPIOB_Set 
	pop {pc}
;	}
;	else
label
;	{
;		FlagCligno=1;
	mov r1,#1 
	str r1,[r0]
	mov r0, #1
;		GPIOB_Clear(1);
	push {lr}
	bl GPIOB_Clear 
	pop {pc}
;	}
		
;}
	

	







	endp
		
		
	END	