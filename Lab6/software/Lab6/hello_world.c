/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include "io.h"
#include "system.h"


#define BRAM_0_BASE 0x2000
#define NAMES_SIZE 418

static const char NAMES[NAMES_SIZE] = "PATRICIA ABE TURATO +++--+++ ANDERSON ANTONIO CAMPANHA +++--+++ GUSTAVO FELIPE GOLTZ +++--+++ LUIZ FERNANDO COPETTI +++--+++ JOAO GUILHERME MARTINS SILVA +++--+++ GABRIEL HENRIQUE LINKE +++--+++ JHONNY KRISTYAN VAZ TOSTES DE ASSIS +++--+++ MATHEUS KUNNEN LEDESMA +++--+++ LEONARDO MURAROTO DE FRANCA REIS +++--+++ LUCAS SANTANA RAMOS E SILVA +++--+++ GABRIEL TEODORO COBLINSKI HRYSAY +++--+++ JOAO VITOR DOTTO RISSARDI";

int main()
{
	char tmp;
	int i = 0;

	for(i = 0; i < NAMES_SIZE; i++){
		IOWR_8DIRECT(BRAM_0_BASE, i, NAMES[i]);
	}

	for(i = 0; i < NAMES_SIZE; i++){
		tmp = IORD_8DIRECT(BRAM_0_BASE, i);
	}

	return 0;
}
