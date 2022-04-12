

#include "DriverJeuLaser.h" 
//#include "GestionSon.h" 

void StartSon(void);
void timer_callback(void); 
int bouton=0;

int main(void)
{
//LongueurSon	 DCD 5512 
//PeriodeSonMicroSec	 DCD 91 
// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
CLOCK_Configure();

//**T = x*TCk = x*1/72Mhz=91µs // 

GPIO_Configure(GPIOB, 0, OUTPUT, ALT_PPULL);
	
Timer_1234_Init_ff(TIM4,6552);	
Active_IT_Debordement_Timer( TIM4, 2, timer_callback );	
	

	
	//PWM 
	//Fpwm=72MHz/720 
PWM_Init_ff(TIM3,3,720);	 

	 

//faut l'appeler dans .s
	//PWM_Set_Value_TIM3_Ch3(sortieSon);
//============================================================================	

	
while	(1)
	{ 
		if (bouton==1) {StartSon(); bouton=0;}
	}
}

