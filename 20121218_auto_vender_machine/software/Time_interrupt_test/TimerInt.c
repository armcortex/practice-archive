#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include "system.h"
#include "DE0test.h"
#include <stdio.h>
#include <unistd.h>
#include "count_binary.h"


/* A "loop counter" variable. */
static alt_u8 count_timer;
/* A variable to hold the value of the button pio edge capture register. */
FILE * lcd;
    
//////////////////////
/* A "loop counter" variable. */
static alt_u8 count_button;
/* A variable to hold the value of the button pio edge capture register. */
int edge_capture;
int dir;

unsigned short up_delay; 
unsigned short down_delay; 

///////////////////
//#ifdef BUTTON_PIO_BASE
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
//#endif


////////////////////
/* Initialize the button_pio. */
        // 中斷服務程式Interrupt Serve Routine
    void TimerISR(void* context, alt_u32 id)
    {
        up_delay   = IORD(SWITCHES_BASE,0) & 0x000f;
        down_delay = IORD(SWITCHES_BASE,0)>>5;
        
        if(edge_capture==1)
        {        
            count_timer++;                                                             
            usleep(up_delay*5000);
        }
        else
        {
            count_timer--;
            usleep(down_delay*5000);
        } 
    //    IOWR(LED_PIO_BASE,0,count_timer);
        /* Reset the Status */
        IOWR(SYS_CLK_TIMER_BASE, 0, 0);
        // count direction              
        
        LCD_PRINTF(lcd, "%MineCraft  %d \n", count_timer); 
        printf("count_timer = %d  ",count_timer);                       
    //    printf("ptr = %d\n",edge_capture);
        printf("up = %d  down = %d\n",up_delay,down_delay);
    }
    
    //PIO 中斷致能副程式
    void DoEnableTimerInterrupt()
    {           
        alt_irq_register(SYS_CLK_TIMER_IRQ,0,TimerISR);
        // Set timer for 1 second
        IOWR(SYS_CLK_TIMER_BASE,2,(short)(((SYS_CLK_TIMER_FREQ)/10) & 0x0000ffff));
        IOWR(SYS_CLK_TIMER_BASE,3,(short)((((SYS_CLK_TIMER_FREQ)/10) >> 16) & 0x0000ffff));        
        // Set timer running, looping, interrupts
        IOWR(SYS_CLK_TIMER_BASE,1,0x07);
        printf("\n\nTimer interrupt enabled.\n\n");

    }
 /*
    void DoDisableTimerInterrupt(void)
    {   
         alt_irq_register(HIGH_RES_TIMER_IRQ,0,0);
           // Stop Timer Interrupt
         IOWR(SYS_CLK_TIMER_BASE, 1, 0);
         printf("\n\nTimer interrupt disabled.\n\n");
    }
*/
                 
// Main Program
int main(void)                                                                                                                 
{                                                                            
 lcd = LCD_OPEN();  

    up_delay   = IORD(SWITCHES_BASE,0) & 0x000f;
    down_delay = IORD(SWITCHES_BASE,0)>>5;
    
    init_button_pio();
    DoEnableTimerInterrupt();

    while( 1 );   
       LCD_CLOSE(lcd);
    return 0;                                                                
}
  
  
//                                                           
