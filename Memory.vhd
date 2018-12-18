----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:15:11 12/18/2018 
-- Design Name: 
-- Module Name:    Memory - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Memory is
Port(
reset, rd , wr : in std_logic;
addres_bus : in std_logic_vector(4 downto 0);
data_bus: inout std_logic_vector(7 downto 0));
end entity Memory;
architecture structure of Memory is

type mem_array is array(natural range<>) of std_logic_vector(7 downto 0);
signal memory : mem_array(31 downto 0);
begin



	Memory_Process : process(rd,wr,addres_bus,data_bus, reset)
	begin
			if reset = '1' then
			
				for I in 0 to 31 loop
					memory(I) <= "00000000";
				end loop;
			
			elsif(rd = '1' and wr ='0') then
			
					data_bus <= memory(to_integer(unsigned(addres_bus)));
					
					
			elsif(wr = '1' and rd ='0') then 
			
					memory(to_integer(unsigned(addres_bus))) <= data_bus;
			
			end if;
	
	end process;

end structure;
