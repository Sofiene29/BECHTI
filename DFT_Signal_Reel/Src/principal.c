

#include "DriverJeuLaser.h" 

extern short int  LeSignal[];
extern int DFT_ModuleAuCarre( short int * Signal64ech, char k);

int resultat[64];    //	Valeurs de k {17,18,19,20} 
unsigned short int dma_buf[64];



void systick_callback(void) {  
		int k;
		//d�marrage de la DMA sur 64 �chantillons:
		Start_DMA1(64); 
		//attente de la fin de DMA: 
		Wait_On_End_Of_DMA1();
		//arr�ter la DMA 
		Stop_DMA1;  
		for (int k=0;k<64 ;k++) { 
			
			resultat[k]=DFT_ModuleAuCarre((short int*)&dma_buf[0],k);
		} 
		
}
	
	
int main(void) {	
	

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Apr�s ex�cution : le coeur CPU est clock� � 72MHz ainsi que tous les timers
	CLOCK_Configure();   
	
	//ADC
	Init_TimingADC_ActiveADC_ff( ADC1, 72 ); 
	//de choisir la pin d'entr�e, ici PA2
	Single_Channel_ADC( ADC1, 2 ); 
	Init_Conversion_On_Trig_Timer_ff( ADC1, TIM2_CC2, 225 );  
	Init_ADC1_DMA1( 0, (short *)dma_buf ); 
	
	
	//CLOCK
	//**T = x*TCk = x*1/72Mhz=5ms // 
	Systick_Period_ff( 360E3 ); //R�gler p�riodicit�
	Systick_Prio_IT( 1 , systick_callback );//configurer le timer pour qu'il puisse g�n�rer une interruption d�bordemen 
	SysTick_On;
	SysTick_Enable_IT; 
	
	
	
	
//============================================================================	
	

while	(1)
	{
	}
}

