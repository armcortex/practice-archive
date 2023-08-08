#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include "system.h"
#include <DE0test.h>
#include <stdio.h>
#include <unistd.h>

/* A "loop counter" variable. */
static alt_u8 count;
/* A variable to hold the value of the button pio edge capture register. */
int edge_capture;
int dir;

/* Initialize the button_pio. */
#ifdef BUTTON_PIO_BASE
		// 中斷服務程式Interrupt Serve Routine
    void handle_button_interrupts(void* context, alt_u32 id)
    {
        /* Cast context to edge_capture's type. It is important that this be 
         * declared volatile to avoid unwanted compiler optimization.
         */
        int* edge_capture_ptr = (int*) context;
        /* Store the value in the Button's edge capture register in *context. */
        *edge_capture_ptr = IORD(BUTTON_PIO_BASE,3);
        printf("edge_capture_value=0x%x\n",*edge_capture_ptr);
        
        IOWR(LED_PIO_BASE,0,*edge_capture_ptr);
        
        /* Reset the Button's edge capture register. */
        IOWR_ALTERA_AVALON_PIO_EDGE_CAP(BUTTON_PIO_BASE, 0);
        // count direction                                     
    		dir=~dir &0x01;
    }
    //IO 中斷致能副程式
    void init_button_pio()
    {
        /* Recast the edge_capture pointer to match the alt_irq_register() function
         * prototype. */
        void* edge_capture_ptr = (void*) &edge_capture;
        /* Enable all 4 button interrupts. */
        IOWR(BUTTON_PIO_BASE, 2,0xf);
        /* Reset the edge capture register. */
        IOWR(BUTTON_PIO_BASE, 3,0x0);
        /* Register the interrupt handler. */
        alt_irq_register( BUTTON_PIO_IRQ, edge_capture_ptr, handle_button_interrupts );
    }
#endif

                 
// Main Program
int main(void)                                                                                                                 
{                                                                            
    int i;                                                                   
                                                     
    count = 0;                                                               
    /* Initialize the button pio. */                                         
                                                           
    init_button_pio();                                                       
    
    while( 1 )                                                               
    {
        usleep(100000);
				if(dir==1)        
        	count++;                                                             
        else
        	count--; 
    }                                                                        
    return 0;                                                                
}                                                                            