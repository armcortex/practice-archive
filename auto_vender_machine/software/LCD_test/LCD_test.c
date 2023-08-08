#include "count_binary.h"
#include "DE0test.h"

    int main(void)
    {
        int i;
        FILE * lcd;
        lcd = LCD_OPEN();
     //   if(lcd != NULL) {lcd_init( lcd );}
          
        LCD_PRINTF(lcd, "%Hello MineCraft", ESC, ESC_COL2_INDENT5);
    
        LCD_CLOSE(lcd);
        return 0;
    
    
    }