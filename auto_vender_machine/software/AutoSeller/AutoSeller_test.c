#include "alt_types.h"
#include "sys/alt_irq.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>
#include <io.h>
#include "DE0test.h"
#include "count_binary.h"
#include "SEG7.h"


//////////////////////////////////////////////////////////////////////////////////////////////////////////
#ifndef LCD_DISPLAY_NAME
/* Some hardware is not present because of system or because of simulation */
    #define LCD_CLOSE(x)    /* Do Nothing */
    #define LCD_OPEN() NULL
    #define LCD_PRINTF(lcd, args...) fprintf(lcd, args)
#else
/* With hardware devices present, use these definitions */
    #define LCD_CLOSE(x) fclose((x))
    #define LCD_OPEN() fopen("/dev/lcd_display", "w")
    #define LCD_PRINTF fprintf
#endif

#define ESC 27                          // clear
#define ESC_CLEAR "K"                   // position cursor at row 1, column 1
#define ESC_COL1_INDENT2 "[1;2H"        // position cursor at row 1, column 2
#define ESC_COL2_INDENT2 "[2;2H"        // position cursor at row 2, column 5
#define ESC_TOP_LEFT "[1;0H"            // integer ASCII value of the ESC character

//////////////////////////////////////////////////////////////////////////////////////////////////////////

/* A "loop counter" variable. */
/* A variable to hold the value of the button pio edge capture register. */
FILE * lcd;
    
//////////////////////
/* A "loop counter" variable. */
/* A variable to hold the value of the button pio edge capture register. */
int edge_capture;
int dir;
int button_cnt = 0;
int money = 0;
int money_calc = 0;
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
    //    printf("edge_capture_value=0x%x\n",*edge_capture_ptr);
        
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
        if((IORD(MODE_SW_BASE,0)==0) && edge_capture==1){
            button_cnt++;
            edge_capture = 0;
        }
        if(edge_capture==4){
            button_cnt = 0;
            edge_capture = 0;
            money = 0;
            SEG7_Decimal(money, 0x10);
            money_calc = 0; 
        }
        if(edge_capture==2){
            edge_capture = 0;
            switch(IORD(SWITCHES_BASE,0))
            {
                case 1: money += 1;
                        break;
                case 2: money += 5;
                        break;
                case 4: money += 10;
                        break;
                case 8: money += 50;
                        break;
                default: money = 0;
            }
            SEG7_Decimal(money, 0x10);    
        }

        if((IORD(MODE_SW_BASE,0)==1) && edge_capture==1){
            switch(button_cnt)
            {
                case 1: 
                        money_calc = money - 10;
                        if(money_calc < 0){
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;1H" , "Not enough     ");
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;1H" , "               ");
                        }
                        else{
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;1H" , "Thank you for  ");
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;1H" , "buying Juice   ");
                            SEG7_Decimal(money_calc, 0x10);
                        }
                        break;
                case 2: 
                        money_calc = money - 15;
                        if(money_calc < 0){
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;1H" , "Not enough     ");
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;1H" , "               ");
                        }
                        else{
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;1H" , "Thank you for  ");
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;1H" , "buying Coke    ");
                            SEG7_Decimal(money_calc, 0x10);
                        }
                        break;
                case 3: 
                        money_calc = money - 20;
                        if(money_calc < 0){
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;1H" , "Not enough     ");
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;1H" , "               ");
                        }
                        else{
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;1H" , "Thank you for  ");
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;1H" , "buying Tea     ");
                            SEG7_Decimal(money_calc, 0x10);
                        }
                        break;
                case 4: 
                        money_calc = money - 25;
                        if(money_calc < 0){
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;1H" , "Not enough     ");
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;1H" , "               ");
                        }
                        else{
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;1H" , "Thank you for  ");
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;1H" , "buying Milk    ");
                            SEG7_Decimal(money_calc, 0x10);
                        }
                        break;                                                  
                default: 
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;2H"  , "               ");
                            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;2H"  , "               ");
            
            }
        }
         
        if(money_calc ==0)
        {            
           if(button_cnt > 4)
                button_cnt = 0;
           else if(button_cnt==1){
                LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;1H" , "oJuice10 Coke15");
                LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;2H" , "Tea  20 Milk25");
           }
           else if(button_cnt==2){
                LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;2H" , "Juice10oCoke15");
                LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;2H" , "Tea  20 Milk25");
           }
           else if(button_cnt==3){
                LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;2H" , "Juice10 Coke15");
                LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;1H" , "oTea  20 Milk25");
           }
           else if(button_cnt==4){
                LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;2H" , "Juice10 Coke15");
                LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;2H" , "Tea  20oMilk25");
           //     button_cnt = 0;
           }
           else {
                LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;2H"  , "Juice10 Coke15");
                LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;2H"  , "Tea  20 Milk25");
                
    //            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;2H"  , "               ");
    //            LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;2H"  , "               ");
           }
        } 
            /* Reset the Status */
            IOWR(SYS_CLK_TIMER_BASE, 0, 0);
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


int main(void)
{
    
    lcd = LCD_OPEN();
    SEG7_Decimal(0, 0x10);  

  
    LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[1;2H"  , "Juice10 Coke15");
    LCD_PRINTF(lcd, "%c%s %s\n", ESC, "[2;2H"  , "Tea  20 Milk25");


    init_button_pio();
    DoEnableTimerInterrupt();

    while( 1 );   
    LCD_CLOSE(lcd);
    

    
    return 0;
}
