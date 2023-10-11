library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity main is
    Port ( CLK : in std_logic;
           UART_TXD 	: out  STD_LOGIC;
           BTN 			: in  STD_LOGIC_VECTOR (4 downto 0));
end main;

architecture Behavioral of main is

component UART_TX_CTRL
Port(
	SEND : in std_logic;
	DATA : in std_logic_vector(7 downto 0);
	CLK : in std_logic;          
	READY : out std_logic;
	UART_TX : out std_logic
	);
end component;

component frequenzmessung is
    Port ( uhr_ref,uhr_mess : in std_logic;
           frequenz : out std_logic_vector(63 downto 0));
end component;

type UART_STATE_TYPE is (RST_REG, LD_INIT_STR, SEND_CHAR, RDY_LOW, WAIT_RDY, WAIT_BTN, LD_BTN_STR);
type CHAR_ARRAY is array (integer range<>) of std_logic_vector(7 downto 0);

constant RESET_CNTR_MAX : std_logic_vector(17 downto 0) := "110000110101000000";-- 100,000,000 * 0.002 = 200,000 = clk cycles per 2 ms
constant MAX_STR_LEN : integer := 27;
constant WELCOME_STR_LEN : natural := 27;
constant BTN_STR_LEN : natural := 24;

signal freq : std_logic_vector (63 downto 0);
alias freq0 is freq (7 downto 0);
alias freq1 is freq (15 downto 8);
alias freq2 is freq (23 downto 16);
alias freq3 is freq (31 downto 24);
alias freq4 is freq (39 downto 32);
alias freq5 is freq (47 downto 40);
alias freq6 is freq (55 downto 48);
alias freq7 is freq (63 downto 56);
signal zeilenende : std_logic_vector( 7 downto 0) :=X"0A";
signal FREQ_STR : CHAR_ARRAY(0 to 8):=(freq7,freq6,freq5,freq4,freq3,freq2,freq1,freq0,zeilenende);
constant FREQ_STR_LEN : natural := 9;

signal teiler : std_logic_vector (26 downto 0):="101111101011110000100000000";

constant WELCOME_STR : CHAR_ARRAY(0 to 26) := (X"0A",X"0D",X"42",X"41",X"53",X"59",X"53",X"33",X"20",X"47",X"50",X"49",X"4F",X"2F",
X"55",X"41",X"52",X"54",X"20",X"44",X"45",X"4D",X"4F",X"21",X"0A",X"0A",X"0D");
constant BTN_STR : CHAR_ARRAY(0 to 23) := (X"42",X"75",X"74",X"74",X"6F",X"6E",X"20",X"70",X"72",X"65",X"73",X"73",X"20",X"64",X"65",
X"74",X"65",X"63",X"74",X"65",X"64",X"21",X"0A",X"0D");



signal sendStr : CHAR_ARRAY(0 to (MAX_STR_LEN - 1));
signal strEnd : natural;
signal strIndex : natural;

signal uartRdy : std_logic;
signal uartSend : std_logic := '0';
signal uartData : std_logic_vector (7 downto 0):= "00000000";
signal uartTX : std_logic;

signal uartState : UART_STATE_TYPE := RST_REG;
signal reset_cntr : std_logic_vector (17 downto 0) := (others=>'0');

signal btnDetect : std_logic;

signal btnReg : std_logic_vector (3 downto 0) := "0000";

begin

process(CLK)
begin
if (rising_edge(CLK)) then
if (teiler="000000000000000000000000000") then
teiler<="101111101011110000100000000";
btnDetect<='1';
else
teiler<=teiler-1;
btnDetect<='0';
end if;
end if;
end process;

process(CLK)
begin
  if (rising_edge(CLK)) then
    if ((reset_cntr = RESET_CNTR_MAX) or (uartState /= RST_REG)) then
      reset_cntr <= (others=>'0');
    else
      reset_cntr <= reset_cntr + 1;
    end if;
  end if;
end process;

next_uartState_process : process (CLK)
begin
	if (rising_edge(CLK)) then
			case uartState is 
			when RST_REG =>
        if (reset_cntr = RESET_CNTR_MAX) then
          uartState <= LD_INIT_STR;
        end if;
			when LD_INIT_STR =>
				uartState <= SEND_CHAR;
			when SEND_CHAR =>
				uartState <= RDY_LOW;
			when RDY_LOW =>
				uartState <= WAIT_RDY;
			when WAIT_RDY =>
				if (uartRdy = '1') then
					if (strEnd = strIndex) then
						uartState <= WAIT_BTN;
					else
						uartState <= SEND_CHAR;
					end if;
				end if;
			when WAIT_BTN =>
				if (btnDetect = '1') then
					uartState <= LD_BTN_STR;
				end if;
			when LD_BTN_STR =>
				uartState <= SEND_CHAR;
			when others=> --should never be reached
				uartState <= RST_REG;
			end case;
	end if;
end process;

string_load_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = LD_INIT_STR) then
			sendStr <= WELCOME_STR;
			strEnd <= WELCOME_STR_LEN;
		elsif (uartState = LD_BTN_STR) then
			sendStr(0 to 8) <= FREQ_STR;--sendStr(0 to 23) <= BTN_STR;
			strEnd <= FREQ_STR_LEN;--strEnd <= BTN_STR_LEN;
		end if;
	end if;
end process;

char_count_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = LD_INIT_STR or uartState = LD_BTN_STR) then
			strIndex <= 0;
		elsif (uartState = SEND_CHAR) then
			strIndex <= strIndex + 1;
		end if;
	end if;
end process;

char_load_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = SEND_CHAR) then
			uartSend <= '1';
			uartData <= sendStr(strIndex);
		else
			uartSend <= '0';
		end if;
	end if;
end process;

Inst_UART_TX_CTRL: UART_TX_CTRL port map(
		SEND => uartSend,
		DATA => uartData,
		CLK => CLK,
		READY => uartRdy,
		UART_TX => uartTX 
	);
	
Inst_Frequenzmessung: Frequenzmessung port map(
        uhr_ref=>CLK,
        uhr_mess=>CLK,
        frequenz=>freq
    );
        
UART_TXD <= uartTX;

end Behavioral;