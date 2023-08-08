---------------------------------------------------------------------
--實驗名稱：PWM實習
--檔案名稱：pwm.vhd
--功    能：以指撥開關來調整PWM訊號輸出
--日    期：2003.3.26
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pwmout is
port(
      clk :in  std_logic;                    --系統頻率
      A   :in  std_logic_vector(7 downto 0); --PWM控制訊號
      pwm :out std_logic                     --PWM訊號輸出
    );
end pwmout;

architecture a of pwmout is
  signal B:std_logic_vector(7 downto 0);
begin

  ----- 下數計數器 -----
  process(clk)
  begin
    if clk'event and clk='1' then
      B <= B-1;
    end if;
  end process;

  --比較器
  pwm<='1' when A > B else '0';

end a;
