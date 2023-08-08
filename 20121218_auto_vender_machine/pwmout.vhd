---------------------------------------------------------------------
--����W�١GPWM���
--�ɮצW�١Gpwm.vhd
--�\    ��G�H�����}���ӽվ�PWM�T����X
--��    ���G2003.3.26
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pwmout is
port(
      clk :in  std_logic;                    --�t���W�v
      A   :in  std_logic_vector(7 downto 0); --PWM����T��
      pwm :out std_logic                     --PWM�T����X
    );
end pwmout;

architecture a of pwmout is
  signal B:std_logic_vector(7 downto 0);
begin

  ----- �U�ƭp�ƾ� -----
  process(clk)
  begin
    if clk'event and clk='1' then
      B <= B-1;
    end if;
  end process;

  --�����
  pwm<='1' when A > B else '0';

end a;
