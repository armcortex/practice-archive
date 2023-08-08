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
#include "DE0test.h"
#include "alt_types.h"
#include "sys/alt_irq.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>
#include <io.h>


int main(void)
{
 
//////////////////////////////////////////////HomeWork1////////////////////////////////////// 
   IOWR(SYS_CLK_TIMER_BASE,0,0);
   printf("Finish");

#define clk 5000      //0.1ms
#define wanted_ms 5
#define time_delay clk*wanted_ms


int flag = 0;
int sw_count = 0;
int led_shift = 1;
int delay_cnt = 0;
int led_mode = 0;
    
    // Set timer for 1 second
    IOWR(SYS_CLK_TIMER_BASE,2,(short)(time_delay & 0x0000ffff));
    IOWR(SYS_CLK_TIMER_BASE,3,(short)((time_delay >> 16) & 0x0000ffff));
    // Set timer running, no looping, no interrupts
    IOWR(SYS_CLK_TIMER_BASE,1,0x04);
   // Poll timer forever, print once per second

////////////////////////Lumen change//////////////////////

    while(1)
    {
        sw_count = IORD(SWITCHES_BASE,0);
        led_mode = IORD(MODE_SW_BASE,0);
   //     IOWR(LED_PIO_BASE, 0, 1023);
   
       if( (IORD(SYS_CLK_TIMER_BASE,0) & 0x01) && flag==0)
//       if( (IORD(SYS_CLK_TIMER_BASE,0) & 0x01))
      {
           // Clear the to (timeout) bit
           IOWR(SYS_CLK_TIMER_BASE,0,0); // (any value)
           IOWR(SYS_CLK_TIMER_BASE,1,0x04);
           IOWR(LED_PIO_BASE, 0, led_shift);
           led_shift = (led_shift << 1) + 1;
           
           
           flag = 1;
           
           if(led_mode == 0)
           {
               IOWR(SYS_CLK_TIMER_BASE,2,(short)(time_delay & 0x0000ffff));
               IOWR(SYS_CLK_TIMER_BASE,3,(short)((time_delay >> 16) & 0x0000ffff));           
           }
           else 
           {    
               IOWR(SYS_CLK_TIMER_BASE,2,(short)(clk*sw_count+1 & 0x0000ffff));
               IOWR(SYS_CLK_TIMER_BASE,3,(short)((clk*sw_count+1 >> 16) & 0x0000ffff)); 
           }

           IOWR(SYS_CLK_TIMER_BASE,1,0x04);
           
      }

       if( (IORD(SYS_CLK_TIMER_BASE,0) & 0x01) && flag==1)
      {
           // Clear the to (timeout) bit
           IOWR(SYS_CLK_TIMER_BASE,0,0); // (any value)
           IOWR(SYS_CLK_TIMER_BASE,1,0x04);
           IOWR(LED_PIO_BASE, 0, 0);
           flag = 0;
           
           if(led_mode == 0)
           {
             IOWR(SYS_CLK_TIMER_BASE,2,(short)(clk*sw_count+1 & 0x0000ffff));
             IOWR(SYS_CLK_TIMER_BASE,3,(short)((clk*sw_count+1 >> 16) & 0x0000ffff));           
           }
           else
           {
            IOWR(SYS_CLK_TIMER_BASE,2,(short)(time_delay & 0x0000ffff));
            IOWR(SYS_CLK_TIMER_BASE,3,(short)((time_delay >> 16) & 0x0000ffff));
           }
           
           
           IOWR(SYS_CLK_TIMER_BASE,1,0x04);
      }              
        
        
       if(led_shift >= 1024)
            led_shift = 1;
       if(delay_cnt >= 50)
            delay_cnt = 0; 
    
    }

///////////////////////Lumen change end///////////////////

///////////////////////LED Blink///////////////   
  /* 
   while(1)
  {
      sw_count = IORD(SWITCHES_BASE,0);
      
       if( (IORD(SYS_CLK_TIMER_BASE,0) & 0x01) && flag==0)
      {
           // Clear the to (timeout) bit
           IOWR(SYS_CLK_TIMER_BASE,0,0); // (any value)
           IOWR(SYS_CLK_TIMER_BASE,1,0x04);
           IOWR(LED_PIO_BASE, 0, 1);
           flag = 1;
           IOWR(SYS_CLK_TIMER_BASE,2,(short)(clk*sw_count & 0x0000ffff));
           IOWR(SYS_CLK_TIMER_BASE,3,(short)((clk*sw_count >> 16) & 0x0000ffff));
           IOWR(SYS_CLK_TIMER_BASE,1,0x04);
      }
       if( (IORD(SYS_CLK_TIMER_BASE,0) & 0x01) && flag==1)
      {
           // Clear the to (timeout) bit
           IOWR(SYS_CLK_TIMER_BASE,0,0); // (any value)
           IOWR(SYS_CLK_TIMER_BASE,1,0x04);
           IOWR(LED_PIO_BASE, 0, 0);
           flag = 0;
           IOWR(SYS_CLK_TIMER_BASE,2,(short)(time_delay & 0x0000ffff));
           IOWR(SYS_CLK_TIMER_BASE,3,(short)((time_delay >> 16) & 0x0000ffff));
           IOWR(SYS_CLK_TIMER_BASE,1,0x04);
      }      
  }    
  */
////////////////////////LED Blink End/////////////////////////////////////////    
 
 //////////////////////////////////////////////HomeWork1 End//////////////////////////////////////    
    
/*   
    int led_shift=1024;
    int flag=0;
    int sw_count=0;
    
    int num[9] = {0x98,0x80,0xd8,0x83,0x92,0x99,0xb0,0xa4,0xf9,0xc0}; 
    int cnt_temp = 0;
    int seg_temp = 0;
    int i = 0;

    printf("Finish");
    
    while(1)
    {
        sw_count = IORD(SWITCHES_BASE,0);
        
        if(flag==0)
        {
            led_shift = led_shift >> 1;
            IOWR(LED_PIO_BASE, 0, led_shift);
            //usleep(10000);
            usleep(sw_count*1);
            if(led_shift == 1)
                flag = 1;
        }
        else
        {
            led_shift = led_shift << 1;
            IOWR(LED_PIO_BASE, 0, led_shift);
            //usleep(10000);
            usleep(sw_count*1);
            if(led_shift == 512)
                flag = 0;
        }
        
        switch(sw_count)
        {
            case 0: 
                    IOWR(SEG7_BASE , 0 , 0xc0);  //0x3f
                    break;
            case 1: 
                    IOWR(SEG7_BASE , 0 , 0xf9);  //0x06
                    break;
            case 2: 
                    IOWR(SEG7_BASE , 0 , 0xa4);  //0x5b
                    break;
            case 3: 
                    IOWR(SEG7_BASE , 0 , 0xb0);  //0x4f
                    break;
            case 4: 
                    IOWR(SEG7_BASE , 0 , 0x99);  //0x66
                    break;
            case 5: 
                    IOWR(SEG7_BASE , 0 , 0x92);  //0x6d
                    break;                    
            case 6: 
                    IOWR(SEG7_BASE , 0 , 0x83);  //0x7c
                    break;                                    
            case 7: 
                    IOWR(SEG7_BASE , 0 , 0xd8);  //0x27 
                    break;
            case 8: 
                    IOWR(SEG7_BASE , 0 , 0x80);  //0x7f
                    break;                   
            case 9: 
                    IOWR(SEG7_BASE , 0 , 0x98);  //0x67
                    break;                                   
        }
        
        
//        if(cnt_temp >= 9)
//            cnt_temp = 0;
//            
//        for(i=0 ; i<3 ;i++)    
//            seg_temp = seg_temp + (num[cnt_temp] << ((i*8)+8));    
//        
//        IOWR(SEG7_BASE ,0 , seg_temp);
//        usleep(sw_count*1000);
//        cnt_temp = cnt_temp + 1;
    
    }
*/
    return 0;
}