#include "alt_types.h"
#include "sys/alt_irq.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>
#include <io.h>

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
#define ESC_COL2_INDENT5 "[2;5H"        // position cursor at row 2, column 5
#define ESC_TOP_LEFT "[1;0H"            // integer ASCII value of the ESC character


int main(void)
{
    FILE * lcd;
    lcd = LCD_OPEN();
//    if(lcd != NULL) {
//        lcd_init(lcd);
//    }
    
    int status, k=0, t=0, data=0;
  
    unsigned char mesa[15];
    unsigned char mesb[15];  

    printf("Please input your name.\n");
    gets(mesa);
    while(1) {
        if(t < 63) {
            t++;
        }else {
            IOWR(UART_BASE, 1, mesa[data]);
            usleep(5000);
            status=IORD(UART2_BASE, 2);
            printf(" status=0x%x %d\n", status,k++);
            if(status & 0x080) {        // check read ready flag
                if( status & 0x0100) {      // check error flag
                    printf("error rxdata ..!\n");
                    IOWR(UART2_BASE, 2, 0x00);
                } else {
                    mesb[data] = IORD(UART2_BASE, 0);
                    printf("Your character rxd is:\t%x  %d\n", mesb[data++], k);
                    if(IORD(UART2_BASE, 0) == 0x0d) {
                        break;
                    }
                    IOWR(UART2_BASE, 2, 0x00);
                }
            }
        }
    }
  
    LCD_PRINTF(lcd, "%c%s %s\n", ESC, ESC_TOP_LEFT, mesb);
    //printf("Hello! %s. Nice to meet you.\n", mesb);
    printf("Hello!");
    printf(mesb);
    printf("Nice to meet you.\n");

    LCD_CLOSE(lcd);
    return 0;
}




/*
#include "alt_types.h"
#include "sys/alt_irq.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>
#include <io.h>


int main(void)
{
  unsigned char indata[7];
  unsigned char outdata[7]; 


//  int indata,outdata;
  
  int rxdata=0,status,k=0,t=0;  
  int data_cnt=0;

//while(1)

  printf("Please input your name");
  gets(indata); 
  
  printf("indata = %s\n",indata);
 
 while(1)
 {
  IOWR(UART_BASE,1,indata[data_cnt]);
  
  if(IORD(UART2_BASE,2) & 0x080)
  {
     // check error flag
          if(IORD(UART2_BASE,2) & 0x0100)
          {
   //           printf("error rxdata ..!\n");
              IOWR(UART2_BASE,2,0x00);
          } 
          else 
          {
              outdata[data_cnt++] = IORD(UART2_BASE,0);
          //    printf("Your character rxd is:\t%d ", outdata);
              IOWR(UART2_BASE,2,0x00);
              break;
          }
  }
 }  
 int i;
 for(i=0;i<7;i++)
 {
    printf("char = %s",outdata[i]);
 }
printf("\n");

*/


/*
  while(1)
  {
      IOWR(UART_BASE,1,t++);
      usleep(100000);
      printf(" status=0x%x %d\n", status,k++);
      if(status & 0x080)
      { // check error flag
          if( status & 0x0100)
          {
              printf("error rxdata ..!\n");
              IOWR(UART2_BASE,2,0x00);
          } else {
              rxdata = IORD(UART2_BASE,0);
              printf("Your character rxd is:\t%x  %d\n", rxdata,k);
              IOWR(UART2_BASE,2,0x00);
          }
      }
  }
*/  
  
//  return 0;
//}
