------------------------------
-- use two changeable resistor one control ADC output value , 
--                             one control DC motor by using pwm   
--------------------------------
Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;  
use ieee.std_logic_arith.all;

entity FPGA_ADC_MOTOR_TWO_ANALOG_CONTROL is  
	port(
			clk : in std_logic;
-----------------------------------------------------------------------------------------50MHZ			
			adc_sdat : in   std_logic;	
			adc_cs_n	:	out std_logic ;
			adc_saddr :	out std_logic;
			adc_sclk : out std_logic;
			dout : out std_logic;-------------- adc_sdat straight data out
			ch1_pin : out std_logic;
			ch2_pin : out std_logic;
-----------------------------------------------------------------------------------------ADC			
	--		led : out std_logic_vector(11 downto 0);
			ch1 : out std_logic_vector(11 downto 0);
			ch2 : out std_logic_vector(11 downto 0);
-----------------------------------------------------------------------------------------LED 			
			div_1600hz_out : out std_logic;
			pwm_out : out std_logic;
------------------------------------------------------------------------------------------pwm
			motor_pin1 : out std_logic;
			motor_pin2 : out std_logic;
------------------------------------------------------------------------------------------motor_output_pin
			pid_conv : out std_logic);
------------------------------------------------------------------------------------------pid_conv led test larger light smaller dark			
	end FPGA_ADC_MOTOR_TWO_ANALOG_CONTROL;
	
architecture ADC_MOTOR_TWO_ANALOG_CONTROL of FPGA_ADC_MOTOR_TWO_ANALOG_CONTROL is
	signal div_12mhz : std_logic;	
	signal div_6mhz : std_logic;	
	signal div_3mhz : std_logic;-------ADC_clock
	signal div_1500khz : std_logic;
	signal div_780khz : std_logic;
	signal div_390khz : std_logic;
	signal div_100khz : std_logic;
	signal div_50khz : std_logic;
	signal div_12khz : std_logic;
	signal div_1600hz : std_logic;-------PWM_period
	signal div_50hz : std_logic;-----------LED_SHOW_CLOCK
------------------------------------------------------------------------------------------CLK_div	
	signal temp : std_logic_vector(7 downto 0) := "00000000" ;
	signal s_out : std_logic;
	signal cs_n : std_logic ;
	signal count : std_logic_vector(3 downto 0) := (others => '0');
--	signal data_count : std_logic_vector(2 downto 0) := (others => '0');	
	signal ch_sel : std_logic := '0';
------------------------------------------------------------------------------------------ADC_SENT
	signal adc_data : std_logic;------ receive adc_sdat
	signal adc_temp : std_logic_vector(11 downto 0) := (others => '0'); ---- temp receive adc convert data
	signal adc_ch1 : std_logic_vector(11 downto 0) := (others => '0');
	signal adc_ch2 : std_logic_vector(11 downto 0) := (others => '0');
	signal adc_data_trans : std_logic_vector(15 downto 0) := (others => '0'); --------- adc data 16 bit to 12 bit
	signal zero_4 : std_logic; ------- dout 4zeros 
	signal ch1_conv : std_logic_vector(7 downto 0) := (others => '0');
	signal ch2_conv : std_logic_vector(7 downto 0) := (others => '0');
------------------------------------------------------------------------------------------ADC_RECEIVE&PRESENT	
	signal period : integer range 0 to 40000000 ;
------------------------------------------------------------------------------------------pulse
	signal pwm_convert : std_logic_vector(11 downto 0) := (others => '0'); ------ADC 12BIT VERCTOR CONVERT TO INTEGER
--  signal pwm_duty : integer range 700 to 2300;	---- 0.7ms ~  2.3ms  servo
--  signal pwm_duty : integer range 0 to 1999;	---- DC motor
	signal pwm_duty : std_logic_vector(7 downto 0);
	signal motor_pwm1 : std_logic;
	signal motor_pwm2 : std_logic;
--	signal pwm_data : std_logic_vector(7 downto 0);
	signal pwm_data : integer range 0 to 1500;
------------------------------------------------------------------------------------------pwm
	signal kp 					: integer := 100;
	signal ki 					: integer := 50;
	signal kd 					: integer := 10;
	signal dt 					: integer := 100;
	signal epsilon 			: integer := 100;
	signal integral			: integer := 0;
	signal derivative			: integer;
	
	signal pre_error			: integer := 0;	
	signal error				: integer;
	signal pid_output			: integer;
	signal setpoint			: integer;
	signal actual_position	: integer;
	
	signal pid_output_conv 	: std_logic_vector(7 downto 0) := (others => '0');

-------------------------------------------------------------------------------------------pid_calc
	
	begin
		clk_div:process(clk)
				Variable Q:std_logic_vector(24 downto 0) := (others => '0');
		begin
			if rising_edge(clk) then
				Q:=Q+'1';
			end if;
			div_12mhz <= Q(2);
			div_6mhz <= Q(3);			
	      div_3mhz <=	Q(4);
			adc_sclk <= div_3mhz;
			div_1500khz <= Q(5);
			div_780khz <= Q(6);
		   div_390khz <= Q(7);
			div_100khz <= Q(9);
			div_50khz <= Q(10);
			div_12khz <= Q(12);
			div_1600hz <=	Q(15);
			div_50hz <= Q(20);
			div_1600hz_out <=  div_1600hz;
			
		end process;	

	
		ADC_SENT:process(div_3mhz)
		begin
			if falling_edge(div_3mhz) then		 
				adc_cs_n <= '0';
				if(count < "1100") then
					adc_temp(0) <= adc_sdat;   ---------------------------receive adc data SIPO
					for i in 1 to 11 loop
--						adc_data_trans(i) <= adc_data_trans(i-1);
						adc_temp(i) <= adc_temp(i-1);
					end loop;
				end if;
				
 				s_out <= temp(7);--------------------sent PISO the data which channel we wanna choose
				adc_saddr <= s_out;
			   temp(7 downto 1) <= temp(6 downto 0); 	
				
				count <= count + 1;	
    
				if count = "1101"	then
					if(ch_sel = '0') then temp <= "00000000"; end if;
					if(ch_sel = '1') then temp <= "00001000"; end if; 
				end if;	       
				if count = "1110" then adc_cs_n <= '1'; end if; 				 
				if count = "1111" then ch_sel <= not ch_sel; end if;			
			end if;
		end process;						
	
		ADC_DATA_SELECT:process(div_3mhz)
		begin 				
			if(rising_edge(div_3mhz)) then  
				if(ch_sel = '0') then
					adc_ch1 <= adc_temp;
--					actual_position <= adc_temp ;
--					actual_position <= conv_integer(adc_temp) ;
				elsif(ch_sel = '1') then
					adc_ch2 <= adc_temp;
--					setpoint <= adc_temp;
--					setpoint <= conv_integer(adc_temp) ;					
				end if;	
			end if;
--			pwm_duty <= adc_ch2;
--			if(pwm_duty < "000000111111") then pwm_duty <= "000000000000"; end if;
--		actual_position <= conv_integer(adc_ch1) ;
--		setpoint <= conv_integer(adc_ch2) ;	
		end process;

		ADC_sel:process(div_50hz)
		begin	
			if(rising_edge(div_50hz)) then 
					CH1 <= adc_ch1;
					CH2 <= adc_ch2;
				--	CH1 <= "110011001010";
				--	CH2 <= "101010110011";
			 end if;
		end process;
		
		pulse:process(div_3mhz)
		begin
			if rising_edge(div_3mhz) then
	--		  period <= period + 1;
			  pwm_data <= pwm_data + 1; 
--		  	end if;  			
--			if period = 3000000 then period <= 0; end if;	
			end if;
		end process;
		
--		motor:process(div_100khz)
--		begin
--			if(rising_edge(div_100khz)) then
--				if(adc_ch1 > adc_ch2) then 
--					motor_pin1 <= '1';
--					motor_pin2 <= '0';
			--		end if; 
--				elsif(adc_ch1 < adc_ch2) then  
--					motor_pin1 <= '0';
--					motor_pin2 <= '1';
--				else
--					motor_pin1 <= '0';
--					motor_pin2 <= '0';
--				end if;
--			end if;
--		end process;

		ADC_conv_1:process(clk)
		begin
			if rising_edge(clk) then
				for j in 0 to 7 loop                   ------12bit -> 8bit led output convert
					ch1_conv(j)<= adc_ch1(j);						
		      end loop;  ----------------------------------------------------------------------------------------clk_div			
			end if;					
		end process; 
		
		ADC_conv_2:process(clk)
		begin
			if rising_edge(clk) then
				for j in 0 to 7 loop                   ------12bit -> 8bit led output convert
					ch2_conv(j) <= adc_ch2(j);						
		      end loop;  ----------------------------------------------------------------------------------------clk_div			
			end if;					
		end process;
		
		actual_position <= conv_integer(ch1_conv);
		setpoint <= conv_integer(ch2_conv);
	   		
--		pwm_duty <= conv_integer(adc_ch1);
--		pwm_duty <= conv_integer(pwm_convert);------------------------------------ 12bit convert to duty cycle		
--		pwm_out <= '1' when period < pwm_duty else '0';-------------------pwm output

--		pwm_duty <= '0' when adc_ch2 < "00111111" else '1';

--		if(pwm_duty < "00111111") then pwm_duty <= "00000000"; end if;
		
--		motor_pin1 <= '1' when  adc_ch2 > pwm_data else '0';
	--	motor_pin1 <= '1' when period < pwm_duty else '0';
		
		PID_calc:process(clk)
		begin
--			if(rising_edge(clk)) then
				error <= (setpoint - actual_position) ;
--				error <=  - 10 ;
	--			if(abs(error) > epsilon) then 
	--			integral <= integral + error * dt; 
	--			end if;
				
	--			derivative <= (error - pre_error) / dt;
--				pid_output <= kp*error + ki*integral + kd*derivative;
				
				integral <= error + pre_error;
				derivative <= error - pre_error;
				
				pid_output <= kp*error + ki*integral + kd*derivative;
				pre_error <= error;
--			end if;
			
			if(pid_output > 0) then pid_conv <= '1'; else pid_conv <= '0'; end if;
		end process;


		pwm_output:process(pid_output)
		begin
--			if(rising_edge(clk)) then
				if(pid_output > 0) then			
--					pid_output_conv <= conv_std_logic_vector(pid_output,8);
					if(pid_output > pwm_data) then 
						motor_pin1 <= '1';
						motor_pin2 <= '0';
					else 
						motor_pin1 <= '0'; 
						motor_pin2 <= '0';
					end if;

--				else
				elsif(pid_output < 0) then				
--					pid_output_conv <= conv_std_logic_vector(abs(pid_output),8);
					
					if(abs(pid_output) > pwm_data) then 
						motor_pin1 <= '0'; 
						motor_pin2 <= '1';
					else 
						motor_pin1 <= '0'; 
						motor_pin2 <= '0';
					end if;
				else
					null;
				end if;
				
--			end if;
		end process;


		
--		motor_pin1 <= '1' when  adc_ch2 > pwm_data else '0';		
		
--		motor_pin2 <= '1' when  adc_ch2 > pwm_data else '0';
		


		dout <= adc_sdat; ---------------make sure adc is converting test pin
		
end ADC_MOTOR_TWO_ANALOG_CONTROL;		



