#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>

/* A "loop counter" variable. */
static alt_u8 count;
/* A variable to hold the value of the button pio edge capture register. */
int edge_capture;
char dir;

/* Initialize the button_pio. */
        // 中斷服務程式Interrupt Serve Routine
    void TimerISR(void* context, alt_u32 id)
    {
        if(dir==1)        
            count++;                                                             
        else
            count--; 
        IOWR(LED_PIO_BASE,0,count);
        /* Reset the Status */
        IOWR(SYS_CLK_TIMER_BASE, 0, 0);
        // count direction                                     
    }
    //PIO 中斷致能副程式
    void DoEnableTimerInterrupt(void)
    {   
        alt_irq_register(SYS_CLK_TIMER_IRQ,0,TimerISR);
        // Set timer for 1 second
        IOWR(SYS_CLK_TIMER_BASE,2,(short)(SYS_CLK_TIMER_FREQ & 0x0000ffff));
        IOWR(SYS_CLK_TIMER_BASE,3,(short)((SYS_CLK_TIMER_FREQ >> 16) & 0x0000ffff));
        // Set timer running, looping, interrupts
        IOWR(SYS_CLK_TIMER_BASE,1,0x07);
        printf("\n\nTimer interrupt enabled.\n\n");

    }
    void DoDisableTimerInterrupt(void)
    {   
         alt_irq_register(HIGH_RES_TIMER_IRQ,0,0);
           // Stop Timer Interrupt
         IOWR(SYS_CLK_TIMER_BASE, 1, 0);
         printf("\n\nTimer interrupt disabled.\n\n");
    }

                 
// Main Program
int main(void)                                                                                                                 
{                                                                            
    DoEnableTimerInterrupt();
    while( 1 );
    return 0;                                                                
}
                                                           