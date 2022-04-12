

#include "DriverJeuLaser.h" 

extern short int  LeSignal[];
extern int DFT_ModuleAuCarre( short int * Signal64ech, char k);

int resultat[64];
//	Valeurs de k {17,18,19,20,23,24}
int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
	CLOCK_Configure(); 
	


	for (int k=0; k<64; k++) { 
		resultat[k]=DFT_ModuleAuCarre(&LeSignal[0],k);
	}


	
//============================================================================	
	

while	(1)
	{
	}
}

