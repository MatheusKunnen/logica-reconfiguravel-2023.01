#include <stdio.h>
#include "io.h"
#include "system.h"


#define BRAM_0_BASE 0x2000

#define NAMES_SIZE 418
static const char NAMES[NAMES_SIZE] = "ANDERSON ANTONIO CAMPANHA +++--+++ GABRIEL HENRIQUE LINKE +++--+++ GABRIEL TEODORO COBLINSKI HRYSAY +++--+++ GUSTAVO FELIPE GOLTZ +++--+++ JHONNY KRISTYAN VAZ TOSTES DE ASSIS +++--+++ JOAO GUILHERME MARTINS SILVA +++--+++ JOAO VITOR DOTTO RISSARDI +++--+++ LEONARDO MURAROTO DE FRANCA REIS +++--+++ LUCAS SANTANA RAMOS E SILVA +++--+++ LUIZ FERNANDO COPETTI +++--+++ MATHEUS KUNNEN LEDESMA +++--+++ PATRICIA ABE TURATO";

#if defined(VALIDATE_READ)

char NAMES_READ[NAMES_SIZE] = {0};

#endif

int main()
{
	int i = 0;

	for(i = 0; i < NAMES_SIZE; i++){
		IOWR_8DIRECT(BRAM_0_BASE, i, NAMES[i]);
	}

	for(i = 0; i < NAMES_SIZE; i++){
#if defined(VALIDATE_READ)
		NAMES_READ[i] = IORD_8DIRECT(BRAM_0_BASE, i);
#else
		IORD_8DIRECT(BRAM_0_BASE, i);
#endif
	}

#if defined(VALIDATE_READ)
	for(i = 0; i < NAMES_SIZE; i++){
		IOWR_8DIRECT(BRAM_0_BASE, NAMES_SIZE + i, NAMES_READ[i]);
	}
#endif

	return 0;
}
