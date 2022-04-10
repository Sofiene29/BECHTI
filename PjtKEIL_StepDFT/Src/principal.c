

#include "DriverJeuLaser.h" 

extern short int  LeSignal[];
extern int DFT_ModuleAuCarre( short int * Signal64ech, char k);


//	Valeurs de k {17,18,19,20,23,24}
int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
CLOCK_Configure();




//============================================================================	
	
	DFT_ModuleAuCarre( &LeSignal[0], 17);
while	(1)
	{
	}
}

