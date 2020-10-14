mtype = {
	Controller_State_POS,
	Controller_State_Produce,
	Controller_State_Another,
	Controller_State_Select,
	Controller_State_Info,
	Coffee_Type_Americano,
	Coffee_Type_Espresso,
	Coffee_Type_Latte,
	Coffee_Type_Mocha,
	Sugar_Counter_Inc,
	Sugar_Counter_Dec,
	Milk_Counter_Dec,
	Milk_Counter_Inc,
	Coffee_Counter_Dec,
	Coffee_Counter_Inc,
	Another_Timer_Timeout,
	Another_Timer_Stop,
	Another_Timer_Start,
	Another_Timer_Running,
	Producer_State_Take,
	Producer_State_Producing,
	Producer_State_Produced,
	POS_State_Paid,
	POS_State_Idle,
	POS_State_Failed,
	POS_State_Working,
	Action_Take,
	Action_Select_Mocha,
	Action_POS_Failed,
	Action_Another_Yes,
	Action_POS_Paid,
	Action_Produce_Ok,
	Action_Produce_Cancel,
	Action_Inc_Coffee,
	Action_Select_Espresso,
	Action_Select_Latte,
	Action_Dec_Milk,
	Action_Another_No,
	Action_Dec_Coffee,
	Action_Select_Americano,
	Action_Inc_Milk,
	Action_Dec_Sugar,
	Action_Inc_Sugar
};
chan Controller_State_cin = [0] of {mtype};

chan Coffee_Type_cin = [0] of {mtype};

chan Sugar_Counter_cin = [0] of {mtype};

chan Milk_Counter_cin = [0] of {mtype};

chan Coffee_Counter_cin = [0] of {mtype};

chan Another_Timer_cin = [0] of {mtype};

chan Producer_State_cin = [0] of {mtype};

chan POS_State_cin = [0] of {mtype};

chan Action_cin = [0] of {mtype};

chan Controller_State_cout = [0] of {mtype};

chan Coffee_Type_cout = [0] of {mtype};

chan Sugar_Counter_cout = [0] of {mtype};

chan Milk_Counter_cout = [0] of {mtype};

chan Coffee_Counter_cout = [0] of {mtype};

chan Another_Timer_cout = [0] of {mtype};

mtype Controller_State;
mtype Coffee_Type;
mtype Sugar_Counter;
int Sugar_Counter_value;
mtype Milk_Counter;
int Milk_Counter_value;
mtype Coffee_Counter;
int Coffee_Counter_value;
mtype Another_Timer;
int Another_Timer_value;
mtype Producer_State;
mtype POS_State;
mtype Action;


active proctype CONTROLLER(){
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
		Controller_State_cin?Controller_State_Select;Controller_State=Controller_State_Select;



	// TRIGGER
	::
		Controller_State_cin?Controller_State_Info;Controller_State=Controller_State_Info;



	// TRIGGER
	::
		Coffee_Type_cin?Coffee_Type_Americano;Coffee_Type=Coffee_Type_Americano;

		if
		// TRANSITION CONTROLLER_SRS_6
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Americano))
			->
			Sugar_Counter_value = 0; Coffee_Counter_value = 7; Milk_Counter_value = 0; 

		fi;


	// TRIGGER
	::
		Coffee_Type_cin?Coffee_Type_Espresso;Coffee_Type=Coffee_Type_Espresso;

		if
		// TRANSITION CONTROLLER_SRS_5
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Espresso))
			->
			Sugar_Counter_value = 0; Coffee_Counter_value = 7; Milk_Counter_value = 0; 

		fi;


	// TRIGGER
	::
		Coffee_Type_cin?Coffee_Type_Latte;Coffee_Type=Coffee_Type_Latte;

		if
		// TRANSITION CONTROLLER_SRS_7
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Latte))
			->
			Sugar_Counter_value = 3; Coffee_Counter_value = 5; Milk_Counter_value = 5; 

		fi;


	// TRIGGER
	::
		Coffee_Type_cin?Coffee_Type_Mocha;Coffee_Type=Coffee_Type_Mocha;

		if
		// TRANSITION CONTROLLER_SRS_8
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Mocha))
			->
			Sugar_Counter_value = 3; Coffee_Counter_value = 4; Milk_Counter_value = 3; 

		fi;


	// TRIGGER
	::
		Sugar_Counter_cin?Sugar_Counter_Inc;Sugar_Counter=Sugar_Counter_Inc;

		if
		// TRANSITION Sugar_Counter_SRS_1
		::
			((Sugar_Counter == Sugar_Counter_Inc) && (Sugar_Counter_value == 0))
			->
			Sugar_Counter_value = 1; 

		// TRANSITION Sugar_Counter_SRS_2
		::
			((Sugar_Counter == Sugar_Counter_Inc) && (Sugar_Counter_value == 1))
			->
			Sugar_Counter_value = 2; 

		// TRANSITION Sugar_Counter_SRS_3
		::
			((Sugar_Counter == Sugar_Counter_Inc) && (Sugar_Counter_value == 2))
			->
			Sugar_Counter_value = 3; 

		// TRANSITION Sugar_Counter_SRS_4
		::
			((Sugar_Counter == Sugar_Counter_Inc) && (Sugar_Counter_value == 3))
			->
			Sugar_Counter_value = 4; 

		// TRANSITION Sugar_Counter_SRS_5
		::
			((Sugar_Counter == Sugar_Counter_Inc) && (Sugar_Counter_value == 4))
			->
			Sugar_Counter_value = 5; 

		// TRANSITION Sugar_Counter_SRS_6
		::
			((Sugar_Counter == Sugar_Counter_Inc) && (Sugar_Counter_value == 5))
			->
			Sugar_Counter_value = 6; 

		// TRANSITION Sugar_Counter_SRS_7
		::
			((Sugar_Counter == Sugar_Counter_Inc) && (Sugar_Counter_value == 6))
			->
			Sugar_Counter_value = 7; 

		fi;


	// TRIGGER
	::
		Sugar_Counter_cin?Sugar_Counter_Dec;Sugar_Counter=Sugar_Counter_Dec;

		if
		// TRANSITION Sugar_Counter_SRS_8
		::
			((Sugar_Counter == Sugar_Counter_Dec) && (Sugar_Counter_value == 1))
			->
			Sugar_Counter_value = 0; 

		// TRANSITION Sugar_Counter_SRS_9
		::
			((Sugar_Counter == Sugar_Counter_Dec) && (Sugar_Counter_value == 2))
			->
			Sugar_Counter_value = 1; 

		// TRANSITION Sugar_Counter_SRS_10
		::
			((Sugar_Counter == Sugar_Counter_Dec) && (Sugar_Counter_value == 3))
			->
			Sugar_Counter_value = 2; 

		// TRANSITION Sugar_Counter_SRS_11
		::
			((Sugar_Counter == Sugar_Counter_Dec) && (Sugar_Counter_value == 4))
			->
			Sugar_Counter_value = 3; 

		// TRANSITION Sugar_Counter_SRS_12
		::
			((Sugar_Counter == Sugar_Counter_Dec) && (Sugar_Counter_value == 5))
			->
			Sugar_Counter_value = 4; 

		// TRANSITION Sugar_Counter_SRS_13
		::
			((Sugar_Counter == Sugar_Counter_Dec) && (Sugar_Counter_value == 6))
			->
			Sugar_Counter_value = 5; 

		// TRANSITION Sugar_Counter_SRS_14
		::
			((Sugar_Counter == Sugar_Counter_Dec) && (Sugar_Counter_value == 7))
			->
			Sugar_Counter_value = 6; 

		fi;


	// TRIGGER
	::
		Milk_Counter_cin?Milk_Counter_Dec;Milk_Counter=Milk_Counter_Dec;

		if
		// TRANSITION Milk_Counter_SRS_8
		::
			((Milk_Counter == Milk_Counter_Dec) && (Milk_Counter_value == 1))
			->
			Milk_Counter_value = 0; 

		// TRANSITION Milk_Counter_SRS_9
		::
			((Milk_Counter == Milk_Counter_Dec) && (Milk_Counter_value == 2))
			->
			Milk_Counter_value = 1; 

		// TRANSITION Milk_Counter_SRS_10
		::
			((Milk_Counter == Milk_Counter_Dec) && (Milk_Counter_value == 3))
			->
			Milk_Counter_value = 2; 

		// TRANSITION Milk_Counter_SRS_11
		::
			((Milk_Counter == Milk_Counter_Dec) && (Milk_Counter_value == 4))
			->
			Milk_Counter_value = 3; 

		// TRANSITION Milk_Counter_SRS_12
		::
			((Milk_Counter == Milk_Counter_Dec) && (Milk_Counter_value == 5))
			->
			Milk_Counter_value = 4; 

		// TRANSITION Milk_Counter_SRS_13
		::
			((Milk_Counter == Milk_Counter_Dec) && (Milk_Counter_value == 6))
			->
			Milk_Counter_value = 5; 

		// TRANSITION Milk_Counter_SRS_14
		::
			((Milk_Counter == Milk_Counter_Dec) && (Milk_Counter_value == 7))
			->
			Milk_Counter_value = 6; 

		fi;


	// TRIGGER
	::
		Milk_Counter_cin?Milk_Counter_Inc;Milk_Counter=Milk_Counter_Inc;

		if
		// TRANSITION Milk_Counter_SRS_1
		::
			((Milk_Counter == Milk_Counter_Inc) && (Milk_Counter_value == 0))
			->
			Milk_Counter_value = 1; 

		// TRANSITION Milk_Counter_SRS_2
		::
			((Milk_Counter == Milk_Counter_Inc) && (Milk_Counter_value == 1))
			->
			Milk_Counter_value = 2; 

		// TRANSITION Milk_Counter_SRS_3
		::
			((Milk_Counter == Milk_Counter_Inc) && (Milk_Counter_value == 2))
			->
			Milk_Counter_value = 3; 

		// TRANSITION Milk_Counter_SRS_4
		::
			((Milk_Counter == Milk_Counter_Inc) && (Milk_Counter_value == 3))
			->
			Milk_Counter_value = 4; 

		// TRANSITION Milk_Counter_SRS_5
		::
			((Milk_Counter == Milk_Counter_Inc) && (Milk_Counter_value == 4))
			->
			Milk_Counter_value = 5; 

		// TRANSITION Milk_Counter_SRS_6
		::
			((Milk_Counter == Milk_Counter_Inc) && (Milk_Counter_value == 5))
			->
			Milk_Counter_value = 6; 

		// TRANSITION Milk_Counter_SRS_7
		::
			((Milk_Counter == Milk_Counter_Inc) && (Milk_Counter_value == 6))
			->
			Milk_Counter_value = 7; 

		fi;


	// TRIGGER
	::
		Coffee_Counter_cin?Coffee_Counter_Dec;Coffee_Counter=Coffee_Counter_Dec;

		if
		// TRANSITION Coffee_Counter_SRS_8
		::
			((Coffee_Counter == Coffee_Counter_Dec) && (Coffee_Counter_value == 1))
			->
			Coffee_Counter_value = 0; 

		// TRANSITION Coffee_Counter_SRS_9
		::
			((Coffee_Counter == Coffee_Counter_Dec) && (Coffee_Counter_value == 2))
			->
			Coffee_Counter_value = 1; 

		// TRANSITION Coffee_Counter_SRS_10
		::
			((Coffee_Counter == Coffee_Counter_Dec) && (Coffee_Counter_value == 3))
			->
			Coffee_Counter_value = 2; 

		// TRANSITION Coffee_Counter_SRS_11
		::
			((Coffee_Counter == Coffee_Counter_Dec) && (Coffee_Counter_value == 4))
			->
			Coffee_Counter_value = 3; 

		// TRANSITION Coffee_Counter_SRS_12
		::
			((Coffee_Counter == Coffee_Counter_Dec) && (Coffee_Counter_value == 5))
			->
			Coffee_Counter_value = 4; 

		// TRANSITION Coffee_Counter_SRS_13
		::
			((Coffee_Counter == Coffee_Counter_Dec) && (Coffee_Counter_value == 6))
			->
			Coffee_Counter_value = 5; 

		// TRANSITION Coffee_Counter_SRS_14
		::
			((Coffee_Counter == Coffee_Counter_Dec) && (Coffee_Counter_value == 7))
			->
			Coffee_Counter_value = 6; 

		fi;


	// TRIGGER
	::
		Coffee_Counter_cin?Coffee_Counter_Inc;Coffee_Counter=Coffee_Counter_Inc;

		if
		// TRANSITION Coffee_Counter_SRS_1
		::
			((Coffee_Counter == Coffee_Counter_Inc) && (Coffee_Counter_value == 0))
			->
			Coffee_Counter_value = 1; 

		// TRANSITION Coffee_Counter_SRS_2
		::
			((Coffee_Counter == Coffee_Counter_Inc) && (Coffee_Counter_value == 1))
			->
			Coffee_Counter_value = 2; 

		// TRANSITION Coffee_Counter_SRS_3
		::
			((Coffee_Counter == Coffee_Counter_Inc) && (Coffee_Counter_value == 2))
			->
			Coffee_Counter_value = 3; 

		// TRANSITION Coffee_Counter_SRS_4
		::
			((Coffee_Counter == Coffee_Counter_Inc) && (Coffee_Counter_value == 3))
			->
			Coffee_Counter_value = 4; 

		// TRANSITION Coffee_Counter_SRS_5
		::
			((Coffee_Counter == Coffee_Counter_Inc) && (Coffee_Counter_value == 4))
			->
			Coffee_Counter_value = 5; 

		// TRANSITION Coffee_Counter_SRS_6
		::
			((Coffee_Counter == Coffee_Counter_Inc) && (Coffee_Counter_value == 5))
			->
			Coffee_Counter_value = 6; 

		// TRANSITION Coffee_Counter_SRS_7
		::
			((Coffee_Counter == Coffee_Counter_Inc) && (Coffee_Counter_value == 6))
			->
			Coffee_Counter_value = 7; 

		fi;


	// TRIGGER
	::
		Another_Timer_cin?Another_Timer_Timeout;Another_Timer=Another_Timer_Timeout;

		if
		// TRANSITION CONTROLLER_SRS_31
		::
			((Another_Timer == Another_Timer_Timeout) && (Controller_State == Controller_State_Another))
			->
			Controller_State_cout!Controller_State_Select; 

		// TRANSITION Another_Timer_SRS_3
		::
			((Another_Timer == Another_Timer_Timeout))
			->
			Another_Timer_cout!Another_Timer_Stop; 

		fi;


	// TRIGGER
	::
		Another_Timer_cin?Another_Timer_Stop;Another_Timer=Another_Timer_Stop;



	// TRIGGER
	::
		Another_Timer_cin?Another_Timer_Start;Another_Timer=Another_Timer_Start;

		if
		// TRANSITION Another_Timer_SRS_1
		::
			((Another_Timer == Another_Timer_Start))
			->
			Another_Timer_cout!Another_Timer_Running; 

		fi;


	// TRIGGER
	::
		Another_Timer_cin?Another_Timer_Running;Another_Timer=Another_Timer_Running;



	// TRIGGER
	::
		Producer_State_cin?Producer_State_Take;Producer_State=Producer_State_Take;

		if
		// TRANSITION CONTROLLER_SRS_34
		::
			((Producer_State == Producer_State_Take))
			->
			Controller_State_cout!Controller_State_Another; 

		fi;


	// TRIGGER
	::
		Producer_State_cin?Producer_State_Producing;Producer_State=Producer_State_Producing;



	// TRIGGER
	::
		Producer_State_cin?Producer_State_Produced;Producer_State=Producer_State_Produced;



	// TRIGGER
	::
		POS_State_cin?POS_State_Paid;POS_State=POS_State_Paid;

		if
		// TRANSITION CONTROLLER_SRS_32
		::
			((Controller_State == Controller_State_POS) && (POS_State == POS_State_Paid))
			->
			Controller_State_cout!Controller_State_Produce; 

		fi;


	// TRIGGER
	::
		POS_State_cin?POS_State_Idle;POS_State=POS_State_Idle;



	// TRIGGER
	::
		POS_State_cin?POS_State_Failed;POS_State=POS_State_Failed;

		if
		// TRANSITION CONTROLLER_SRS_33
		::
			((Controller_State == Controller_State_POS) && (POS_State == POS_State_Failed))
			->
			Controller_State_cout!Controller_State_Select; 

		fi;


	// TRIGGER
	::
		POS_State_cin?POS_State_Working;POS_State=POS_State_Working;



	// TRIGGER
	::
		Action_cin?Action_Take;Action=Action_Take;



	// TRIGGER
	::
		Action_cin?Action_Select_Mocha;Action=Action_Select_Mocha;

		if
		// TRANSITION CONTROLLER_SRS_4
		::
			((Controller_State == Controller_State_Select) && (Action == Action_Select_Mocha))
			->
			Controller_State_cout!Controller_State_Info; Coffee_Type_cout!Coffee_Type_Mocha; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_POS_Failed;Action=Action_POS_Failed;



	// TRIGGER
	::
		Action_cin?Action_Another_Yes;Action=Action_Another_Yes;

		if
		// TRANSITION CONTROLLER_SRS_29
		::
			((Controller_State == Controller_State_Another) && (Action == Action_Another_Yes))
			->
			Another_Timer_cout!Another_Timer_Start; Controller_State_cout!Controller_State_Info; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_POS_Paid;Action=Action_POS_Paid;



	// TRIGGER
	::
		Action_cin?Action_Produce_Ok;Action=Action_Produce_Ok;

		if
		// TRANSITION CONTROLLER_SRS_27
		::
			((Controller_State == Controller_State_Info) && (Action == Action_Produce_Ok))
			->
			Controller_State_cout!Controller_State_POS; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_Produce_Cancel;Action=Action_Produce_Cancel;

		if
		// TRANSITION CONTROLLER_SRS_28
		::
			((Controller_State == Controller_State_Info) && (Action == Action_Produce_Cancel))
			->
			Controller_State_cout!Controller_State_Select; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_Inc_Coffee;Action=Action_Inc_Coffee;

		if
		// TRANSITION CONTROLLER_SRS_9
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Espresso) && (Action == Action_Inc_Coffee))
			->
			Coffee_Counter_cout!Coffee_Counter_Inc; 

		// TRANSITION CONTROLLER_SRS_10
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Americano) && (Action == Action_Inc_Coffee))
			->
			Coffee_Counter_cout!Coffee_Counter_Inc; 

		// TRANSITION CONTROLLER_SRS_11
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Latte) && (Action == Action_Inc_Coffee))
			->
			Coffee_Counter_cout!Coffee_Counter_Inc; 

		// TRANSITION CONTROLLER_SRS_12
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Mocha) && (Action == Action_Inc_Coffee))
			->
			Coffee_Counter_cout!Coffee_Counter_Inc; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_Select_Espresso;Action=Action_Select_Espresso;

		if
		// TRANSITION CONTROLLER_SRS_1
		::
			((Controller_State == Controller_State_Select) && (Action == Action_Select_Espresso))
			->
			Controller_State_cout!Controller_State_Info; Coffee_Type_cout!Coffee_Type_Espresso; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_Select_Latte;Action=Action_Select_Latte;

		if
		// TRANSITION CONTROLLER_SRS_3
		::
			((Controller_State == Controller_State_Select) && (Action == Action_Select_Latte))
			->
			Controller_State_cout!Controller_State_Info; Coffee_Type_cout!Coffee_Type_Latte; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_Dec_Milk;Action=Action_Dec_Milk;

		if
		// TRANSITION CONTROLLER_SRS_25
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Latte) && (Action == Action_Dec_Milk))
			->
			Milk_Counter_cout!Milk_Counter_Dec; 

		// TRANSITION CONTROLLER_SRS_26
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Mocha) && (Action == Action_Dec_Milk))
			->
			Milk_Counter_cout!Milk_Counter_Dec; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_Another_No;Action=Action_Another_No;

		if
		// TRANSITION CONTROLLER_SRS_30
		::
			((Controller_State == Controller_State_Another) && (Action == Action_Another_No))
			->
			Another_Timer_cout!Another_Timer_Stop; Controller_State_cout!Controller_State_Select; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_Dec_Coffee;Action=Action_Dec_Coffee;

		if
		// TRANSITION CONTROLLER_SRS_13
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Espresso) && (Action == Action_Dec_Coffee))
			->
			Coffee_Counter_cout!Coffee_Counter_Dec; 

		// TRANSITION CONTROLLER_SRS_14
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Americano) && (Action == Action_Dec_Coffee))
			->
			Coffee_Counter_cout!Coffee_Counter_Dec; 

		// TRANSITION CONTROLLER_SRS_15
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Latte) && (Action == Action_Dec_Coffee))
			->
			Coffee_Counter_cout!Coffee_Counter_Dec; 

		// TRANSITION CONTROLLER_SRS_16
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Mocha) && (Action == Action_Dec_Coffee))
			->
			Coffee_Counter_cout!Coffee_Counter_Dec; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_Select_Americano;Action=Action_Select_Americano;

		if
		// TRANSITION CONTROLLER_SRS_2
		::
			((Controller_State == Controller_State_Select) && (Action == Action_Select_Americano))
			->
			Controller_State_cout!Controller_State_Info; Coffee_Type_cout!Coffee_Type_Americano; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_Inc_Milk;Action=Action_Inc_Milk;

		if
		// TRANSITION CONTROLLER_SRS_23
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Latte) && (Action == Action_Inc_Milk))
			->
			Milk_Counter_cout!Milk_Counter_Inc; 

		// TRANSITION CONTROLLER_SRS_24
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Mocha) && (Action == Action_Inc_Milk))
			->
			Milk_Counter_cout!Milk_Counter_Inc; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_Dec_Sugar;Action=Action_Dec_Sugar;

		if
		// TRANSITION CONTROLLER_SRS_20
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Americano) && (Action == Action_Dec_Sugar))
			->
			Sugar_Counter_cout!Sugar_Counter_Dec; 

		// TRANSITION CONTROLLER_SRS_21
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Latte) && (Action == Action_Dec_Sugar))
			->
			Sugar_Counter_cout!Sugar_Counter_Dec; 

		// TRANSITION CONTROLLER_SRS_22
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Mocha) && (Action == Action_Dec_Sugar))
			->
			Sugar_Counter_cout!Sugar_Counter_Dec; 

		fi;


	// TRIGGER
	::
		Action_cin?Action_Inc_Sugar;Action=Action_Inc_Sugar;

		if
		// TRANSITION CONTROLLER_SRS_17
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Americano) && (Action == Action_Inc_Sugar))
			->
			Sugar_Counter_cout!Sugar_Counter_Inc; 

		// TRANSITION CONTROLLER_SRS_18
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Latte) && (Action == Action_Inc_Sugar))
			->
			Sugar_Counter_cout!Sugar_Counter_Inc; 

		// TRANSITION CONTROLLER_SRS_19
		::
			((Controller_State == Controller_State_Info) && (Coffee_Type == Coffee_Type_Mocha) && (Action == Action_Inc_Sugar))
			->
			Sugar_Counter_cout!Sugar_Counter_Inc; 

		fi;
	::if
	// NO TRIG TRANSITION Another_Timer_SRS_2
			((Another_Timer == Another_Timer_Running))
			->
			Another_Timer_cout!Another_Timer_Timeout; 
	fi;
	od;
};

