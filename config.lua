---
-- Author Script  : Shepard & iired
-- Website: https://altitude-dev.com
---


Config 					= {}
Config.BlipsMap         = true             
Config.KeyOpenMenu      = 0xC7B5340A        
Config.Distance			= 2.0		

Config.Peds = {
	{-281.45, 778.93, 119.5, 356.74, "U_M_M_ValGunsmith_01", 1},
    {-288.06, 804.38, 119.39, 283.34, "U_M_M_ValDoctor_01", 2},
	{-313.4, 806.12, 118.98, 283.68, "U_M_O_ValBartender_01", 3},
	{-324.13, 803.44, 117.88, 249.76, "S_M_M_MarketVendor_01", 4},
	{-239.0, 770.3, 118.1, 118.81, "S_M_M_MarketVendor_01", 5},
	{-294.49, 863.61, 121.01, 174.39, "A_F_M_SDChinatown_01", 6},
	{-177.8, 647.22, 113.58, 66.56, "U_F_M_STORY_BLACKBELLE_01", 7},
	{-1806.09, -429.08, 158.83, 240.94, "U_M_M_RHDDOCTOR_01", 8},
	{2717.56, -1286.67, 49.64, 29.12, "U_M_M_AsbGunsmith_01", 9}
}

Config.Stores 			= 
{
	{ 
		sprite 	        =  819673798, 							
        Name 	        = 'General Store', 
		type		    = 'general',
		pedid 			= 0,		
		pedSound		= '',
		dialog 			= 'CHAT_PEDTYPE_DIALOG',
		DescName 		= 'A beautiful general store',	
		tax 			= 1.0,		
		x 		        = -784.45, y = -1323.83,  z = 43.88
	},
	{ 
		sprite 	        =  819673798, 							
        Name 	        = 'General Store', 
		type		    = 'general',		
		pedid 			= 4,			
		pedSound		= '0678_U_M_M_STRGENSTOREOWNER_01',
		dialog 			= 'CHAT_PEDTYPE_DIALOG',
		DescName 		= 'Valentines General Store',	
		tax 			= 1.0,			
		x 		        = -322.33, y = 803.77,  z = 117.88
	},
	{ 
		sprite 	        =  1879260108, 							
        Name 	        = 'Saloon Valentines', 
		type		    = 'saloon',		
		pedid 			= 3,				
		pedSound		= '0475_U_M_M_VALBARTENDER_01',
		dialog 			= 'HAND_OVER_BAR_DRINK',
		DescName 		= 'Need a rest? take easy with prostitutes',
		tax 			= 1.0,				
		x 		        = -311.64, y = 806.27,  z = 118.98
	},
	{ 
		sprite 	        =  -1739686743, 							
        Name 	        = 'Doctor', 
		type		    = 'doctor',	
		pedid 			= 2,			
		pedSound		= '0315_U_M_M_NbxDoctor_01',		
		dialog 			= 'CHAT_PEDTYPE_DIALOG',
		DescName 		= 'Need a help ?',
		tax 			= 1.0,				
		x 		        = -286.3, y = 804.86,  z = 119.39
	},
	{ 
		sprite 	        =  -1739686743, 							
        Name 	        = 'Doctor', 
		type		    = 'doctor',	
		pedid 			= 8,			
		pedSound		= '0477_U_M_M_VALDOCTOR_01',		
		dialog 			= 'CHAT_PEDTYPE_DIALOG',
		DescName 		= 'Need a help ?',
		tax 			= 1.2,				
		x				= -1804.49, y = -429.98, z = 158.83
	},
	{ 
		sprite 	        =  -145868367, 							
        Name 	        = 'Gunshop', 
		type		    = 'gunshop',	
		pedid 			= 1,			
		pedSound		= '0319_U_M_M_NBXGUNSMITH_01',	
		dialog 			= 'CHAT_PEDTYPE_DIALOG',	
		DescName 		= 'Need a gun? or ammo ?',	
		tax 			= 1.0,			
		x 		        = -280.97, y = 780.75,  z = 119.53
	},
	{ 
		sprite 	        =  -145868367, 							
        Name 	        = 'Gunshop', 
		type		    = 'gunshop',	
		pedid 			= 0,			
		pedSound		= '',	
		dialog 			= '',	
		DescName 		= 'Need a gun? or ammo ?',	
		tax 			= 0.5,			
		x 				= 2946.45, y = 1319.38, z = 44.82
	},
	{ 
		sprite 	        =  -758970771, 							
        Name 	        = 'Craft Table', 
		type		    = 'crafting',	
		pedid 			= 0,			
		pedSound		= '',		
		dialog 			= 'CHAT_PEDTYPE_DIALOG',
		DescName 		= 'Make your ideas',
		tax 			= 1.0,				
		x 		        = -277.16, y = 779.3,  z = 119.5
	},
	{ 
		sprite 	        =  669307703, 							
        Name 	        = 'Herborist', 
		type		    = 'herborist',		
		pedid 			= 0,		
		pedSound		= '',		
		dialog 			= 'CHAT_PEDTYPE_DIALOG',
		DescName 		= 'Make your potions',	
		tax 			= 2.0,			
		x 		        = -283.51, y = 807.1,  z = 119.39
	},
	{ 
		sprite 	        =  935247438, 							
        Name 	        = 'Restaurant', 
		type		    = 'restaurant',	
		pedid 			= 5,		
		pedSound		= '0475_U_M_M_VALBARTENDER_01',			
		dialog 			= 'FOOD_OR_DRINK',
		DescName 		= 'Need a eat ?',	
		tax 			= 1.0,			
		x 		        = -240.56, y = 769.63,  z = 118.09
	},
	{ 
		sprite 	        =  -1665418949, 							
        Name 	        = 'Butcher', 
		type		    = 'sellerbutcher',
		pedid 			= 0,				
		pedSound		= '',		
		dialog 			= '',
		DescName 		= 'Buy all skins, pelts and meats',
		tax 			= 1.8,				
		x 		        = -341.07, y = 767.23,  z = 116.71
	},
	{ 
		sprite 	        =  -1606321000, 							
        Name 	        = 'Store Camping', 
		type		    = 'survivalist',	
		pedid 			= 0,		
		pedSound		= '',			
		dialog 			= 'CHAT_PEDTYPE_DIALOG',
		DescName 		= 'Build your camp',
		tax 			= 1.0,				
		x 		        = -325.36, y = 797.57,  z = 117.88
	},
	{ 
		sprite 	        =  -758970771, 							
        Name 	        = 'Forge', 
		type		    = 'forge',		
		pedid 			= 0,		
		pedSound		= '',		
		dialog 			= 'CHAT_PEDTYPE_DIALOG',
		DescName 		= 'Forge your weapons and more',
		tax 			= 2.0,				
		x 		        = -369.35, y = 796.27,  z = 116.2
	},
	{ 
		sprite 	        =  552659337, 							
        Name 	        = 'Farmer', 
		type		    = 'farm',
		pedid 			= 6,			
		pedSound		= '0216_U_F_M_LAGMOTHER_01',			
		dialog 			= 'CHAT_PEDTYPE_DIALOG',
		DescName 		= 'Buy a fresh eat and provisions',
		tax 			= 1.0,				
		x 		        = -294.49, y = 863.59,  z = 120.99
	},
	{ 
		sprite 	        =  -1989306548, 							
        Name 	        = 'Seller', 
		type		    = 'seller',	
		pedid 			= 7,			
		pedSound		= '0216_U_F_M_LAGMOTHER_01',			
		dialog 			= 'SALES_PITCH',
		DescName 		= 'Buy yours items',
		tax 			= 0.12,				
		x 		        = -179.25, y = 648.35,  z = 113.58
	},
	{ 
		sprite 	        =  819673798, 							
        Name 	        = 'General Store', 
		type		    = 'general',		
		pedid 			= 0,			
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'Strawberry General Store',	
		tax 			= 2.5,			
		x 				= -1791.23, y = -387.08, z = 160.33
	},
	{ 
		sprite 	        =  819673798, 							
        Name 	        = 'General Store', 
		type		    = 'general',		
		pedid 			= 0,			
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'Tumbleweed General Store',	
		tax 			= 1.5,			
		x 				= -5487.28, y = -2938.91, z = -0.39
	},
	{ 
		sprite 	        =  1879260108, 							
        Name 	        = 'Saloon Blackwater', 
		type		    = 'saloon',		
		pedid 			= 0,				
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'Need a rest? take easy',
		tax 			= 1.6,				
		x 				= -815.87, y = -1318.5, z = 43.67
	},
	{ 
		sprite 	        =  1879260108, 							
        Name 	        = 'Saloon Armadillo', 
		type		    = 'saloon',		
		pedid 			= 0,				
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'Stop drink here move out the town',
		tax 			= 0.3,				
		x 				= -3701.43, y = -2594.24, z = -13.32
	},
	{ 
		sprite 	        =  1879260108, 							
        Name 	        = 'Saloon VanHorn', 
		type		    = 'saloon',		
		pedid 			= 0,				
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'No tax here welcome',
		tax 			= 0.0,				
		x 				= 2947.8, y = 526.29, z = 45.32
	},
	{ 
		sprite 	        =  1879260108, 							
        Name 	        = 'Saloon Tumbleweed', 
		type		    = 'saloon',		
		pedid 			= 0,				
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'You need a drink ?',
		tax 			= 0.1,				
		x 				= -5517.38, y = -2907.81, z = -1.76
	},
	{ 
		sprite 	        =  819673798, 							
        Name 	        = 'General Store', 
		type		    = 'general',		
		pedid 			= 0,			
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'Armadillo General Store',	
		tax 			= 0.0,			
		x 				= -3685.52, y = -2623.5, z = -13.44
	},
	{ 
		sprite 	        =  -1989306548, 							
        Name 	        = 'Seller', 
		type		    = 'seller',	
		pedid 			= 0,			
		pedSound		= '',			
		dialog 			= '',
		DescName 		= 'Buy yours items',
		tax 			= 0.10,				
		x 				= 2994.32, y = 571.88, z = 44.34
	},
	{ 
		sprite 	        =  -145868367, 							
        Name 	        = 'Gunshop', 
		type		    = 'gunshop',	
		pedid 			= 0,			
		pedSound		= '',	
		dialog 			= '',	
		DescName 		= 'Need a gun? or ammo ?',	
		tax 			= 0.2,			
		x 				= -5508.19, y = -2964.21, z = -0.63
	},
	{ 
		sprite 	        =  -145868367, 							
        Name 	        = 'Gunshop', 
		type		    = 'gunshop',	
		pedid 			= 0,			
		pedSound		= '',	
		dialog 			= '',	
		DescName 		= 'Need a gun? or ammo ?',	
		tax 			= 2.5,			
		x 				= 1323.1, y = -1321.55, z = 77.88
	},
	{ 
		sprite 	        =  819673798, 							
        Name 	        = 'General Store', 
		type		    = 'general',		
		pedid 			= 0,			
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'Rhodes General Store',	
		tax 			= 2.0,			
		x 				= 1328.38, y = -1293.27, z = 77.02
	},
	{ 
		sprite 	        =  1879260108, 							
        Name 	        = 'Saloon Rhodes', 
		type		    = 'saloon',		
		pedid 			= 0,				
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'You need a drink ?',
		tax 			= 2.0,				
		x 				= 1341.89, y = -1375.2, z = 80.48
	},
	{ 
		sprite 	        =  1879260108, 							
        Name 	        = 'Bar Saint-Denis', 
		type		    = 'saloon',		
		pedid 			= 0,				
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'You need a drink ?',
		tax 			= 15.0,				
		x 				= 2794.08, y = -1168.74, z = 47.92
	},
	{ 
		sprite 	        =  -1739686743, 							
        Name 	        = 'Doctor', 
		type		    = 'doctor',	
		pedid 			= 0,			
		pedSound		= '',		
		dialog 			= '',
		DescName 		= 'Need a help ?',
		tax 			= 35.0,				
		x 				= 2719.61, y = -1232.02, z = 50.36
	},
	{ 
		sprite 	        =  -145868367, 							
        Name 	        = 'Gunshop', 
		type		    = 'gunshop',	
		pedid 			= 9,			
		pedSound		= '0036_U_M_M_ASBGUNSMITH_01',	
		dialog 			= 'CHAT_PEDTYPE_DIALOG',	
		DescName 		= 'Need a gun? or ammo ?',	
		tax 			= 100.0,			
		x 				= 2716.42, y = -1285.43, z = 49.63
	},
	{ 
		sprite 	        =  819673798, 							
        Name 	        = 'General Store', 
		type		    = 'general',		
		pedid 			= 0,			
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'Saint-Denis General Store',	
		tax 			= 4.5,			
		x 				= 2825.66, y = -1318.28, z = 46.75
	},
	{ 
		sprite 	        =  1879260108, 							
        Name 	        = 'La Bastille Saint-Denis', 
		type		    = 'saloon',		
		pedid 			= 0,				
		pedSound		= '',
		dialog 			= '',
		DescName 		= 'You need a drink ?',
		tax 			= 5.0,				
		x 				= 2638.11, y = -1224.37, z = 53.38
	},
	{ 
		sprite 	        =  -1989306548, 							
        Name 	        = 'Seller', 
		type		    = 'seller',	
		pedid 			= 0,			
		pedSound		= '',			
		dialog 			= '',
		DescName 		= 'Buy yours items',
		tax 			= 0.0,				
		x 				= 2832.51, y = -1225.59, z = 47.66
	}
}

