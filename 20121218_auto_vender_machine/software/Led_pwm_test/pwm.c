#include "alt_types.h"
#include "sys/alt_irq.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>
#include <io.h>

int main(void)
{
    unsigned char i;

    i=0xff;    //設定PWM值
    while(1)
    {
      printf("pwm= %x\n ",i);   
      IOWR(LED_PWM_BASE, 0, i=i-10);     //送出PWM數值
      usleep(10000);
   /*
      if (i<127)
      {
        i=0;
      }
*/
    }

}

