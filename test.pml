mtype = {
	Controller_State_POS,
	Controller_State_Produce,
	Controller_State_Another,
	Controller_State_Take,
	Controller_State_Select,
	Controller_State_Info,
	Action_Select_Latte,
	Action_OK,
	Action_Select_Mocha,
	Action_Cancel,
	Action_Take,
	Action_Dec_Sugar,
	Action_Dec_Milk,
	Action_Select_Americano,
	Action_Inc_Milk,
	Action_Inc_Coffee,
	Action_Select_Espresso,
	Action_Dec_Coffee,
	Action_Inc_Sugar
};
chan Controller_State_cin = [0] of {mtype};

chan Action_cin = [0] of {mtype};

chan Action_cout = [0] of {mtype};

mtype Controller_State;
mtype Action;


active proctype USER(){
	do


	// TRIGGER
	::
		Controller_State_cin?Controller_State_POS;Controller_State=Controller_State_POS;



	// TRIGGER
	::
		Controller_State_cin?Controller_State_Produce;Controller_State=Controller_State_Produce;



	// TRIGGER
	::
		Controller_State_cin?Controller_State_Another;Controller_State=Controller_State_Another;



	// TRIGGER
	::
		Controller_State_cin?Controller_State_Take;Controller_State=Controller_State_Take;



	// TRIGGER
	::
		Controller_State_cin?Controller_State_Select;Controller_State=Controller_State_Select;



	// TRIGGER
	::
		Controller_State_cin?Controller_State_Info;Controller_State=Controller_State_Info;



	// TRIGGER
	::
		Action_cin?Action_Select_Latte;Action=Action_Select_Latte;



	// TRIGGER
	::
		Action_cin?Action_OK;Action=Action_OK;



	// TRIGGER
	::
		Action_cin?Action_Select_Mocha;Action=Action_Select_Mocha;



	// TRIGGER
	::
		Action_cin?Action_Cancel;Action=Action_Cancel;



	// TRIGGER
	::
		Action_cin?Action_Take;Action=Action_Take;



	// TRIGGER
	::
		Action_cin?Action_Dec_Sugar;Action=Action_Dec_Sugar;



	// TRIGGER
	::
		Action_cin?Action_Dec_Milk;Action=Action_Dec_Milk;



	// TRIGGER
	::
		Action_cin?Action_Select_Americano;Action=Action_Select_Americano;



	// TRIGGER
	::
		Action_cin?Action_Inc_Milk;Action=Action_Inc_Milk;



	// TRIGGER
	::
		Action_cin?Action_Inc_Coffee;Action=Action_Inc_Coffee;



	// TRIGGER
	::
		Action_cin?Action_Select_Espresso;Action=Action_Select_Espresso;



	// TRIGGER
	::
		Action_cin?Action_Dec_Coffee;Action=Action_Dec_Coffee;



	// TRIGGER
	::
		Action_cin?Action_Inc_Sugar;Action=Action_Inc_Sugar;

	::if
	// NO TRIG TRANSITION USER_SRS_1
			((Controller_State == Controller_State_Select))
			->
			Action_cout!Action_Select_Espresso; 
	// NO TRIG TRANSITION USER_SRS_2
			((Controller_State == Controller_State_Select))
			->
			Action_cout!Action_Select_Americano; 
	// NO TRIG TRANSITION USER_SRS_3
			((Controller_State == Controller_State_Select))
			->
			Action_cout!Action_Select_Latte; 
	// NO TRIG TRANSITION USER_SRS_4
			((Controller_State == Controller_State_Select))
			->
			Action_cout!Action_Select_Mocha; 
	// NO TRIG TRANSITION USER_SRS_5
			((Controller_State == Controller_State_Info))
			->
			Action_cout!Action_Cancel; 
	// NO TRIG TRANSITION USER_SRS_6
			((Controller_State == Controller_State_Info))
			->
			null 
	// NO TRIG TRANSITION USER_SRS_7
			((Controller_State == Controller_State_Info))
			->
			Action_cout!Action_Inc_Sugar; 
	// NO TRIG TRANSITION USER_SRS_8
			((Controller_State == Controller_State_Info))
			->
			Action_cout!Action_Dec_Sugar; 
	// NO TRIG TRANSITION USER_SRS_9
			((Controller_State == Controller_State_Info))
			->
			Action_cout!Action_Inc_Coffee; 
	// NO TRIG TRANSITION USER_SRS_10
			((Controller_State == Controller_State_Info))
			->
			Action_cout!Action_Dec_Coffee; 
	// NO TRIG TRANSITION USER_SRS_11
			((Controller_State == Controller_State_Info))
			->
			Action_cout!Action_Inc_Milk; 
	// NO TRIG TRANSITION USER_SRS_12
			((Controller_State == Controller_State_Info))
			->
			Action_cout!Action_Dec_Milk; 
	// NO TRIG TRANSITION USER_SRS_13
			((Controller_State == Controller_State_Take))
			->
			Action_cout!Action_Take; 
	// NO TRIG TRANSITION USER_SRS_14
			((Controller_State == Controller_State_Another))
			->
			null 
	// NO TRIG TRANSITION USER_SRS_15
			((Controller_State == Controller_State_Another))
			->
			Action_cout!Action_Cancel; 
	fi;
	od;
};

