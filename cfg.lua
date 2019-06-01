Config = {}
Config.updatetick = 10000 -- in MS 10000 is 10 seconds 
Config.usingesx = true -- this must be False if you are not using esx_ambualncejob.

-- Each client spawns its own ai so as the number of players goes up the density must come down to level the amount of ai to be the same. 
Config.density = {
	peds1 = 0.5,    --- 0 to 5 players -- onfoot 
	vehicles1 = 0.5,                   -- driving cars
	pvehicles1 = 0.5,                  -- parked cars 
	
	peds2 = 0.4,  -- 6 to 10 
	vehicles2 = 0.4, 
	pvehicles2 = 0.4,
	
	peds3 = 0.3,    -- 11 to 15 
	vehicles3 = 0.3,  
	pvehicles3 = 0.3,
	
	peds4 = 0.1,  -- 16 to 20
	vehicles4 = 0.1,
	pvehicles4 = 0.1,
	
	peds5 = 0.1,   --- more than 20 
	vehicles5 = 0.1,
	pvehicles5 = 0.1,

	
}
-- blacklisted peds
Config.peds = { 
  "s_m_y_cop_01",
  "s_f_y_sheriff_01",
  "s_m_y_sheriff_01",
  "s_m_y_hwaycop_01",
  "s_f_y_cop_01",
  "s_m_y_swat_01",
  "s_m_m_snowcop_01",
  "s_m_y_fireman_01",
  "s_m_m_paramedic_01"
}


