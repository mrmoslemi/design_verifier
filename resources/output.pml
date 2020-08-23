mtype:Mode = {
	S, T
};

mtype:Action_states = {
	Action_Take, Action_Select_Latte, Action_Another_No, Action_Another_Yes, Action_Inc_Sugar, Action_Dec_Sugar, Action_Produce_Cancel, Action_Select_Americano, Action_Dec_Milk, Action_Select_Espresso, Action_Inc_Milk, Action_Dec_Coffee, Action_Inc_Coffee, Action_Select_Mocha, Action_POS_Failed, Action_POS_Paid, Action_Produce_Ok, Action_Select_Mocca
};
typedef Action {
	mtype:Action_states state;
	mtype:Mode mode
};
Action _Action;

mtype:Produce_Timer_states = {
	Produce_Timer_Stop, Produce_Timer_Start, Produce_Timer_Timeout, Produce_Timer_Running
};
typedef Produce_Timer {
	mtype:Produce_Timer_states state;
	mtype:Mode mode;
	int value
};
Produce_Timer _Produce_Timer;

mtype:Message_states = {
	Message_Send
};
typedef Message {
	mtype:Message_states state;
	mtype:Mode mode;
	int value
};
Message _Message;

mtype:Beeper_states = {
	Beeper_Beep
};
typedef Beeper {
	mtype:Beeper_states state;
	mtype:Mode mode
};
Beeper _Beeper;

mtype:Producer_State_states = {
	Producer_State_Take, Producer_State_Produced, Producer_State_Producing
};
typedef Producer_State {
	mtype:Producer_State_states state;
	mtype:Mode mode
};
Producer_State _Producer_State;

mtype:Milk_Counter_states = {
	Milk_Counter_Dec, Milk_Counter_Inc
};
typedef Milk_Counter {
	mtype:Milk_Counter_states state;
	mtype:Mode mode;
	int value
};
Milk_Counter _Milk_Counter;

typedef Data {
	int value
};
Data _Data;

mtype:Another_Timer_states = {
	Another_Timer_Stop, Another_Timer_Start, Another_Timer_Timeout, Another_Timer_Running
};
typedef Another_Timer {
	mtype:Another_Timer_states state;
	mtype:Mode mode;
	int value
};
Another_Timer _Another_Timer;

mtype:Coffee_Type_states = {
	Coffee_Type_Espresso, Coffee_Type_Americano, Coffee_Type_Latte, Coffee_Type_Mocca
};
typedef Coffee_Type {
	mtype:Coffee_Type_states state;
	mtype:Mode mode
};
Coffee_Type _Coffee_Type;

mtype:POS_State_states = {
	POS_State_Working, POS_State_Idle, POS_State_Failed, POS_State_Paid
};
typedef POS_State {
	mtype:POS_State_states state;
	mtype:Mode mode
};
POS_State _POS_State;

mtype:Sugar_Counter_states = {
	Sugar_Counter_Dec, Sugar_Counter_Inc
};
typedef Sugar_Counter {
	mtype:Sugar_Counter_states state;
	mtype:Mode mode;
	int value
};
Sugar_Counter _Sugar_Counter;

mtype:Controller_State_states = {
	Controller_State_POS, Controller_State_Produce, Controller_State_Select, Controller_State_Info, Controller_State_Another
};
typedef Controller_State {
	mtype:Controller_State_states state;
	mtype:Mode mode
};
Controller_State _Controller_State;

mtype:Coffee_Counter_states = {
	Coffee_Counter_Dec, Coffee_Counter_Inc
};
typedef Coffee_Counter {
	mtype:Coffee_Counter_states state;
	mtype:Mode mode;
	int value
};
Coffee_Counter _Coffee_Counter;

mtype:Door_Lock_states = {
	Door_Lock_Unlock, Door_Lock_Lock
};
typedef Door_Lock {
	mtype:Door_Lock_states state;
	mtype:Mode mode
};
Door_Lock _Door_Lock;

mtype:Beep_Timer_states = {
	Beep_Timer_Stop, Beep_Timer_Start, Beep_Timer_Timeout, Beep_Timer_Running
};
typedef Beep_Timer {
	mtype:Beep_Timer_states state;
	mtype:Mode mode;
	int value
};
Beep_Timer _Beep_Timer;

active proctype Input (){
	printf("Hello World in Input\n");
	if
	:: ((_Action.state== Action_Inc_Sugar) && (_Action.mode == T)) -> _Action.state= Action_Inc_Sugar;_Action.mode = S;
	:: ((_Action.state== Action_Dec_Sugar) && (_Action.mode == T)) -> _Action.state= Action_Dec_Sugar;_Action.mode = S;
	:: ((_Action.state== Action_Inc_Coffee) && (_Action.mode == T)) -> _Action.state= Action_Inc_Coffee;_Action.mode = S;
	:: ((_Action.state== Action_Dec_Coffee) && (_Action.mode == T)) -> _Action.state= Action_Dec_Coffee;_Action.mode = S;
	:: ((_Action.state== Action_Inc_Milk) && (_Action.mode == T)) -> _Action.state= Action_Inc_Milk;_Action.mode = S;
	:: ((_Action.state== Action_Dec_Milk) && (_Action.mode == T)) -> _Action.state= Action_Dec_Milk;_Action.mode = S;
	:: ((_Action.state== Action_Select_Espresso) && (_Action.mode == T)) -> _Action.state= Action_Select_Espresso;_Action.mode = S;
	:: ((_Action.state== Action_Select_Americano) && (_Action.mode == T)) -> _Action.state= Action_Select_Americano;_Action.mode = S;
	:: ((_Action.state== Action_Select_Latte) && (_Action.mode == T)) -> _Action.state= Action_Select_Latte;_Action.mode = S;
	:: ((_Action.state== Action_Select_Mocca) && (_Action.mode == T)) -> _Action.state= Action_Select_Mocca;_Action.mode = S;
	:: ((_Action.state== Action_POS_Paid) && (_Action.mode == T)) -> _Action.state= Action_POS_Paid;_Action.mode = S;
	:: ((_Action.state== Action_POS_Failed) && (_Action.mode == T)) -> _Action.state= Action_POS_Failed;_Action.mode = S;
	:: ((_Action.state== Action_Produce_Ok) && (_Action.mode == T)) -> _Action.state= Action_Produce_Ok;_Action.mode = S;
	:: ((_Action.state== Action_Produce_Cancel) && (_Action.mode == T)) -> _Action.state= Action_Produce_Cancel;_Action.mode = S;
	:: ((_Action.state== Action_Another_Yes) && (_Action.mode == T)) -> _Action.state= Action_Another_Yes;_Action.mode = S;
	:: ((_Action.state== Action_Another_No) && (_Action.mode == T)) -> _Action.state= Action_Another_No;_Action.mode = S;
	:: ((_Action.state== Action_Take) && (_Action.mode == T)) -> _Action.state= Action_Take;_Action.mode = S;
	:: ((_Data.value == 0) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 0)) -> _Action.state= Action_Inc_Sugar;_Action.mode = T;
	:: ((_Data.value == 1) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 0)) -> _Action.state= Action_Dec_Sugar;_Action.mode = T;
	:: ((_Data.value == 2) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 0)) -> _Action.state= Action_Inc_Coffee;_Action.mode = T;
	:: ((_Data.value == 3) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 0)) -> _Action.state= Action_Dec_Coffee;_Action.mode = T;
	:: ((_Data.value == 4) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 0)) -> _Action.state= Action_Inc_Milk;_Action.mode = T;
	:: ((_Data.value == 5) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 0)) -> _Action.state= Action_Dec_Milk;_Action.mode = T;
	:: ((_Data.value == 0) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 1)) -> _Action.state= Action_Select_Espresso;_Action.mode = T;
	:: ((_Data.value == 1) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 1)) -> _Action.state= Action_Select_Americano;_Action.mode = T;
	:: ((_Data.value == 2) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 1)) -> _Action.state= Action_Select_Latte;_Action.mode = T;
	:: ((_Data.value == 3) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 1)) -> _Action.state= Action_Select_Mocca;_Action.mode = T;
	:: ((_Data.value == 1) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 2)) -> _Action.state= Action_POS_Paid;_Action.mode = T;
	:: ((_Data.value == 2) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 2)) -> _Action.state= Action_POS_Failed;_Action.mode = T;
	:: ((_Data.value == 1) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 3)) -> _Action.state= Action_Produce_Ok;_Action.mode = T;
	:: ((_Data.value == 2) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 3)) -> _Action.state= Action_Produce_Cancel;_Action.mode = T;
	:: ((_Data.value == 3) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 3)) -> _Action.state= Action_Another_Yes;_Action.mode = T;
	:: ((_Data.value == 4) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 3)) -> _Action.state= Action_Another_No;_Action.mode = T;
	:: ((_Data.value == 1) && (_Message.state== Message_Send) && (_Message.mode == T) && (_Message.value == 4)) -> _Action.state= Action_Take;_Action.mode = T;
	fi;
};

active proctype User (){
	printf("Hello World in User\n");
	if
	:: ((_Message.state== Message_Send) && (_Message.mode == T)) -> _Message.state= Message_Send;_Message.mode = S;
	:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 0;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 1;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 2;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 3;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 4;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 0;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 1;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 2;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 3;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 4;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 0;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 1;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 2;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 3;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 4;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 0;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 1;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 2;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 3;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 4;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 0;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 1;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 2;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 3;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 4;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 0;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 1;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 2;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 3;
:: ((_Message.state== Message_Send) && (_Message.mode == S)) -> _Data.value = 5;_Message.state= Message_Send;_Message.mode = T;_Message.value = 4;
	fi;
};

active proctype Producer (){
	printf("Hello World in Producer\n");
	if
	:: ((_Produce_Timer.state== Produce_Timer_Start) && (_Produce_Timer.mode == T)) -> _Produce_Timer.state= Produce_Timer_Running;_Produce_Timer.mode = S;_Produce_Timer.value = 0;
	:: ((_Produce_Timer.state== Produce_Timer_Timeout) && (_Produce_Timer.mode == T)) -> _Produce_Timer.state= Produce_Timer_Stop;_Produce_Timer.mode = S;
	:: ((_Producer_State.state== Producer_State_Producing) && (_Producer_State.mode == T)) -> _Producer_State.state= Producer_State_Producing;_Producer_State.mode = S;
	:: ((_Producer_State.state== Producer_State_Produced) && (_Producer_State.mode == T)) -> _Producer_State.state= Producer_State_Produced;_Producer_State.mode = S;
	:: ((_Producer_State.state== Producer_State_Take) && (_Producer_State.mode == T)) -> _Producer_State.state= Producer_State_Take;_Producer_State.mode = S;
	:: ((_Door_Lock.state== Door_Lock_Lock) && (_Door_Lock.mode == T)) -> _Door_Lock.state= Door_Lock_Lock;_Door_Lock.mode = S;
	:: ((_Door_Lock.state== Door_Lock_Unlock) && (_Door_Lock.mode == T)) -> _Door_Lock.state= Door_Lock_Unlock;_Door_Lock.mode = S;
	:: ((_Beep_Timer.state== Beep_Timer_Start) && (_Beep_Timer.mode == T)) -> _Beep_Timer.state= Beep_Timer_Running;_Beep_Timer.mode = S;_Beep_Timer.value = 0;
	:: ((_Beep_Timer.state== Beep_Timer_Timeout) && (_Beep_Timer.mode == T)) -> _Beep_Timer.state= Beep_Timer_Stop;_Beep_Timer.mode = S;
	:: ((_Produce_Timer.state== Produce_Timer_Running) && (_Produce_Timer.mode == S)) -> _Produce_Timer.state= Produce_Timer_Timeout;_Produce_Timer.mode = T;_Produce_Timer.value = 200;
	:: ((_Beep_Timer.state== Beep_Timer_Running) && (_Beep_Timer.mode == S)) -> _Beep_Timer.state= Beep_Timer_Timeout;_Beep_Timer.mode = T;_Beep_Timer.value = 2;
	:: ((_Controller_State.state== Controller_State_Produce) && (_Controller_State.mode == T) && (_Producer_State.state== Producer_State_Take) && (_Producer_State.mode == S)) -> _Produce_Timer.state= Produce_Timer_Start;_Produce_Timer.mode = T;_Producer_State.state= Producer_State_Producing;_Producer_State.mode = T;
	:: ((_Produce_Timer.state== Produce_Timer_Timeout) && (_Produce_Timer.mode == T) && (_Producer_State.state== Producer_State_Producing) && (_Producer_State.mode == S)) -> _Produce_Timer.state= Produce_Timer_Stop;_Produce_Timer.mode = T;_Beep_Timer.state= Beep_Timer_Start;_Beep_Timer.mode = T;_Door_Lock.state= Door_Lock_Unlock;_Door_Lock.mode = T;_Producer_State.state= Producer_State_Produced;_Producer_State.mode = T;
	:: ((_Beep_Timer.state== Beep_Timer_Timeout) && (_Beep_Timer.mode == T) && (_Producer_State.state== Producer_State_Produced) && (_Producer_State.mode == S)) -> _Beep_Timer.state= Beep_Timer_Start;_Beep_Timer.mode = T;_Beeper.state= Beeper_Beep;_Beeper.mode = T;
	:: ((_Action.state== Action_Take) && (_Action.mode == T) && (_Producer_State.state== Producer_State_Produced) && (_Producer_State.mode == S) && (_Door_Lock.state== Door_Lock_Unlock) && (_Door_Lock.mode == S)) -> _Beep_Timer.state= Beep_Timer_Stop;_Beep_Timer.mode = T;_Door_Lock.state= Door_Lock_Lock;_Door_Lock.mode = T;_Producer_State.state= Producer_State_Take;_Producer_State.mode = T;
	fi;
};

active proctype POS (){
	printf("Hello World in POS\n");
	if
	:: ((_POS_State.state== POS_State_Idle) && (_POS_State.mode == T)) -> _POS_State.state= POS_State_Idle;_POS_State.mode = S;
	:: ((_POS_State.state== POS_State_Working) && (_POS_State.mode == T)) -> _POS_State.state= POS_State_Working;_POS_State.mode = S;
	:: ((_POS_State.state== POS_State_Paid) && (_POS_State.mode == T)) -> _POS_State.state= POS_State_Paid;_POS_State.mode = S;
	:: ((_POS_State.state== POS_State_Failed) && (_POS_State.mode == T)) -> _POS_State.state= POS_State_Failed;_POS_State.mode = S;
	:: ((_POS_State.state== POS_State_Paid) && (_POS_State.mode == S)) -> _POS_State.state= POS_State_Idle;_POS_State.mode = T;
	:: ((_POS_State.state== POS_State_Failed) && (_POS_State.mode == S)) -> _POS_State.state= POS_State_Idle;_POS_State.mode = T;
	:: ((_Controller_State.state== Controller_State_POS) && (_Controller_State.mode == T) && (_POS_State.state== POS_State_Idle) && (_POS_State.mode == S)) -> _POS_State.state= POS_State_Working;_POS_State.mode = T;
	:: ((_Action.state== Action_POS_Paid) && (_Action.mode == T) && (_POS_State.state== POS_State_Working) && (_POS_State.mode == S)) -> _POS_State.state= POS_State_Paid;_POS_State.mode = T;
	:: ((_Action.state== Action_POS_Failed) && (_Action.mode == T) && (_POS_State.state== POS_State_Working) && (_POS_State.mode == S)) -> _POS_State.state= POS_State_Failed;_POS_State.mode = T;
	fi;
};

active proctype Controller (){
	printf("Hello World in Controller\n");
	if
	:: ((_Controller_State.state== Controller_State_Select) && (_Controller_State.mode == T)) -> _Controller_State.state= Controller_State_Select;_Controller_State.mode = S;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == T)) -> _Controller_State.state= Controller_State_Info;_Controller_State.mode = S;
	:: ((_Controller_State.state== Controller_State_POS) && (_Controller_State.mode == T)) -> _Controller_State.state= Controller_State_POS;_Controller_State.mode = S;
	:: ((_Controller_State.state== Controller_State_Produce) && (_Controller_State.mode == T)) -> _Controller_State.state= Controller_State_Produce;_Controller_State.mode = S;
	:: ((_Controller_State.state== Controller_State_Another) && (_Controller_State.mode == T)) -> _Controller_State.state= Controller_State_Another;_Controller_State.mode = S;
	:: ((_Coffee_Counter.state== Coffee_Counter_Inc) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 0)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = S;_Coffee_Counter.value = 1;
	:: ((_Coffee_Counter.state== Coffee_Counter_Inc) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 1)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = S;_Coffee_Counter.value = 2;
	:: ((_Coffee_Counter.state== Coffee_Counter_Inc) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 2)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = S;_Coffee_Counter.value = 3;
	:: ((_Coffee_Counter.state== Coffee_Counter_Inc) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 3)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = S;_Coffee_Counter.value = 4;
	:: ((_Coffee_Counter.state== Coffee_Counter_Inc) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 4)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = S;_Coffee_Counter.value = 5;
	:: ((_Coffee_Counter.state== Coffee_Counter_Inc) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 5)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = S;_Coffee_Counter.value = 6;
	:: ((_Coffee_Counter.state== Coffee_Counter_Inc) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 6)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = S;_Coffee_Counter.value = 7;
	:: ((_Coffee_Counter.state== Coffee_Counter_Inc) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 7)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = S;_Coffee_Counter.value = 7;
	:: ((_Coffee_Counter.state== Coffee_Counter_Dec) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 0)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = S;_Coffee_Counter.value = 0;
	:: ((_Coffee_Counter.state== Coffee_Counter_Dec) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 1)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = S;_Coffee_Counter.value = 0;
	:: ((_Coffee_Counter.state== Coffee_Counter_Dec) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 2)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = S;_Coffee_Counter.value = 1;
	:: ((_Coffee_Counter.state== Coffee_Counter_Dec) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 3)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = S;_Coffee_Counter.value = 2;
	:: ((_Coffee_Counter.state== Coffee_Counter_Dec) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 4)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = S;_Coffee_Counter.value = 3;
	:: ((_Coffee_Counter.state== Coffee_Counter_Dec) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 5)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = S;_Coffee_Counter.value = 4;
	:: ((_Coffee_Counter.state== Coffee_Counter_Dec) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 6)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = S;_Coffee_Counter.value = 5;
	:: ((_Coffee_Counter.state== Coffee_Counter_Dec) && (_Coffee_Counter.mode == T) && (_Coffee_Counter.value == 7)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = S;_Coffee_Counter.value = 6;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Coffee_Type.state== Coffee_Type_Espresso) && (_Coffee_Type.mode == T)) -> _Milk_Counter.value = 0;_Sugar_Counter.value = 0;_Coffee_Counter.value = 7;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Coffee_Type.state== Coffee_Type_Americano) && (_Coffee_Type.mode == T)) -> _Milk_Counter.value = 0;_Sugar_Counter.value = 0;_Coffee_Counter.value = 7;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Coffee_Type.state== Coffee_Type_Latte) && (_Coffee_Type.mode == T)) -> _Milk_Counter.value = 5;_Sugar_Counter.value = 3;_Coffee_Counter.value = 5;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Coffee_Type.state== Coffee_Type_Mocca) && (_Coffee_Type.mode == T)) -> _Milk_Counter.value = 3;_Sugar_Counter.value = 3;_Coffee_Counter.value = 4;
	:: ((_Sugar_Counter.state== Sugar_Counter_Inc) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 0)) -> _Sugar_Counter.state= Sugar_Counter_Inc;_Sugar_Counter.mode = S;_Sugar_Counter.value = 1;
	:: ((_Sugar_Counter.state== Sugar_Counter_Inc) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 1)) -> _Sugar_Counter.state= Sugar_Counter_Inc;_Sugar_Counter.mode = S;_Sugar_Counter.value = 2;
	:: ((_Sugar_Counter.state== Sugar_Counter_Inc) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 2)) -> _Sugar_Counter.state= Sugar_Counter_Inc;_Sugar_Counter.mode = S;_Sugar_Counter.value = 3;
	:: ((_Sugar_Counter.state== Sugar_Counter_Inc) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 3)) -> _Sugar_Counter.state= Sugar_Counter_Inc;_Sugar_Counter.mode = S;_Sugar_Counter.value = 4;
	:: ((_Sugar_Counter.state== Sugar_Counter_Inc) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 4)) -> _Sugar_Counter.state= Sugar_Counter_Inc;_Sugar_Counter.mode = S;_Sugar_Counter.value = 5;
	:: ((_Sugar_Counter.state== Sugar_Counter_Inc) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 5)) -> _Sugar_Counter.state= Sugar_Counter_Inc;_Sugar_Counter.mode = S;_Sugar_Counter.value = 6;
	:: ((_Sugar_Counter.state== Sugar_Counter_Inc) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 6)) -> _Sugar_Counter.state= Sugar_Counter_Inc;_Sugar_Counter.mode = S;_Sugar_Counter.value = 7;
	:: ((_Sugar_Counter.state== Sugar_Counter_Inc) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 7)) -> _Sugar_Counter.state= Sugar_Counter_Inc;_Sugar_Counter.mode = S;_Sugar_Counter.value = 7;
	:: ((_Sugar_Counter.state== Sugar_Counter_Dec) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 0)) -> _Sugar_Counter.state= Sugar_Counter_Dec;_Sugar_Counter.mode = S;_Sugar_Counter.value = 0;
	:: ((_Sugar_Counter.state== Sugar_Counter_Dec) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 1)) -> _Sugar_Counter.state= Sugar_Counter_Dec;_Sugar_Counter.mode = S;_Sugar_Counter.value = 0;
	:: ((_Sugar_Counter.state== Sugar_Counter_Dec) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 2)) -> _Sugar_Counter.state= Sugar_Counter_Dec;_Sugar_Counter.mode = S;_Sugar_Counter.value = 1;
	:: ((_Sugar_Counter.state== Sugar_Counter_Dec) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 3)) -> _Sugar_Counter.state= Sugar_Counter_Dec;_Sugar_Counter.mode = S;_Sugar_Counter.value = 2;
	:: ((_Sugar_Counter.state== Sugar_Counter_Dec) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 4)) -> _Sugar_Counter.state= Sugar_Counter_Dec;_Sugar_Counter.mode = S;_Sugar_Counter.value = 3;
	:: ((_Sugar_Counter.state== Sugar_Counter_Dec) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 5)) -> _Sugar_Counter.state= Sugar_Counter_Dec;_Sugar_Counter.mode = S;_Sugar_Counter.value = 4;
	:: ((_Sugar_Counter.state== Sugar_Counter_Dec) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 6)) -> _Sugar_Counter.state= Sugar_Counter_Dec;_Sugar_Counter.mode = S;_Sugar_Counter.value = 5;
	:: ((_Sugar_Counter.state== Sugar_Counter_Dec) && (_Sugar_Counter.mode == T) && (_Sugar_Counter.value == 7)) -> _Sugar_Counter.state= Sugar_Counter_Dec;_Sugar_Counter.mode = S;_Sugar_Counter.value = 6;
	:: ((_Milk_Counter.state== Milk_Counter_Inc) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 0)) -> _Milk_Counter.state= Milk_Counter_Inc;_Milk_Counter.mode = S;_Milk_Counter.value = 1;
	:: ((_Milk_Counter.state== Milk_Counter_Inc) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 1)) -> _Milk_Counter.state= Milk_Counter_Inc;_Milk_Counter.mode = S;_Milk_Counter.value = 2;
	:: ((_Milk_Counter.state== Milk_Counter_Inc) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 2)) -> _Milk_Counter.state= Milk_Counter_Inc;_Milk_Counter.mode = S;_Milk_Counter.value = 3;
	:: ((_Milk_Counter.state== Milk_Counter_Inc) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 3)) -> _Milk_Counter.state= Milk_Counter_Inc;_Milk_Counter.mode = S;_Milk_Counter.value = 4;
	:: ((_Milk_Counter.state== Milk_Counter_Inc) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 4)) -> _Milk_Counter.state= Milk_Counter_Inc;_Milk_Counter.mode = S;_Milk_Counter.value = 5;
	:: ((_Milk_Counter.state== Milk_Counter_Inc) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 5)) -> _Milk_Counter.state= Milk_Counter_Inc;_Milk_Counter.mode = S;_Milk_Counter.value = 6;
	:: ((_Milk_Counter.state== Milk_Counter_Inc) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 6)) -> _Milk_Counter.state= Milk_Counter_Inc;_Milk_Counter.mode = S;_Milk_Counter.value = 7;
	:: ((_Milk_Counter.state== Milk_Counter_Inc) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 7)) -> _Milk_Counter.state= Milk_Counter_Inc;_Milk_Counter.mode = S;_Milk_Counter.value = 7;
	:: ((_Milk_Counter.state== Milk_Counter_Dec) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 0)) -> _Milk_Counter.state= Milk_Counter_Dec;_Milk_Counter.mode = S;_Milk_Counter.value = 0;
	:: ((_Milk_Counter.state== Milk_Counter_Dec) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 1)) -> _Milk_Counter.state= Milk_Counter_Dec;_Milk_Counter.mode = S;_Milk_Counter.value = 0;
	:: ((_Milk_Counter.state== Milk_Counter_Dec) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 2)) -> _Milk_Counter.state= Milk_Counter_Dec;_Milk_Counter.mode = S;_Milk_Counter.value = 1;
	:: ((_Milk_Counter.state== Milk_Counter_Dec) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 3)) -> _Milk_Counter.state= Milk_Counter_Dec;_Milk_Counter.mode = S;_Milk_Counter.value = 2;
	:: ((_Milk_Counter.state== Milk_Counter_Dec) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 4)) -> _Milk_Counter.state= Milk_Counter_Dec;_Milk_Counter.mode = S;_Milk_Counter.value = 3;
	:: ((_Milk_Counter.state== Milk_Counter_Dec) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 5)) -> _Milk_Counter.state= Milk_Counter_Dec;_Milk_Counter.mode = S;_Milk_Counter.value = 4;
	:: ((_Milk_Counter.state== Milk_Counter_Dec) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 6)) -> _Milk_Counter.state= Milk_Counter_Dec;_Milk_Counter.mode = S;_Milk_Counter.value = 5;
	:: ((_Milk_Counter.state== Milk_Counter_Dec) && (_Milk_Counter.mode == T) && (_Milk_Counter.value == 7)) -> _Milk_Counter.state= Milk_Counter_Dec;_Milk_Counter.mode = S;_Milk_Counter.value = 6;
	:: ((_Another_Timer.state== Another_Timer_Start) && (_Another_Timer.mode == T)) -> _Another_Timer.state= Another_Timer_Running;_Another_Timer.mode = S;_Another_Timer.value = 0;
	:: ((_Another_Timer.state== Another_Timer_Timeout) && (_Another_Timer.mode == T)) -> _Another_Timer.state= Another_Timer_Stop;_Another_Timer.mode = S;
	:: ((_Another_Timer.state== Another_Timer_Running) && (_Another_Timer.mode == S)) -> _Another_Timer.state= Another_Timer_Timeout;_Another_Timer.mode = T;_Another_Timer.value = 100;
	:: ((_Controller_State.state== Controller_State_Select) && (_Controller_State.mode == S) && (_Action.state== Action_Select_Espresso) && (_Action.mode == T)) -> _Controller_State.state= Controller_State_Info;_Controller_State.mode = T;_Coffee_Type.state= Coffee_Type_Espresso;_Coffee_Type.mode = T;
	:: ((_Controller_State.state== Controller_State_Select) && (_Controller_State.mode == S) && (_Action.state== Action_Select_Americano) && (_Action.mode == T)) -> _Controller_State.state= Controller_State_Info;_Controller_State.mode = T;_Coffee_Type.state= Coffee_Type_Americano;_Coffee_Type.mode = T;
	:: ((_Controller_State.state== Controller_State_Select) && (_Controller_State.mode == S) && (_Action.state== Action_Select_Latte) && (_Action.mode == T)) -> _Controller_State.state= Controller_State_Info;_Controller_State.mode = T;_Coffee_Type.state= Coffee_Type_Latte;_Coffee_Type.mode = T;
	:: ((_Controller_State.state== Controller_State_Select) && (_Controller_State.mode == S) && (_Action.state== Action_Select_Mocca) && (_Action.mode == T)) -> _Controller_State.state= Controller_State_Info;_Controller_State.mode = T;_Coffee_Type.state= Coffee_Type_Mocca;_Coffee_Type.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Inc_Coffee) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Espresso) && (_Coffee_Type.mode == S)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Inc_Coffee) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Americano) && (_Coffee_Type.mode == S)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Inc_Coffee) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Latte) && (_Coffee_Type.mode == S)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Inc_Coffee) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Mocca) && (_Coffee_Type.mode == S)) -> _Coffee_Counter.state= Coffee_Counter_Inc;_Coffee_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Dec_Coffee) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Espresso) && (_Coffee_Type.mode == S)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Dec_Coffee) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Americano) && (_Coffee_Type.mode == S)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Dec_Coffee) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Latte) && (_Coffee_Type.mode == S)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Dec_Coffee) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Mocca) && (_Coffee_Type.mode == S)) -> _Coffee_Counter.state= Coffee_Counter_Dec;_Coffee_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Inc_Sugar) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Americano) && (_Coffee_Type.mode == S)) -> _Sugar_Counter.state= Sugar_Counter_Inc;_Sugar_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Inc_Sugar) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Latte) && (_Coffee_Type.mode == S)) -> _Sugar_Counter.state= Sugar_Counter_Inc;_Sugar_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Inc_Sugar) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Mocca) && (_Coffee_Type.mode == S)) -> _Sugar_Counter.state= Sugar_Counter_Inc;_Sugar_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Dec_Sugar) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Americano) && (_Coffee_Type.mode == S)) -> _Sugar_Counter.state= Sugar_Counter_Dec;_Sugar_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Dec_Sugar) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Latte) && (_Coffee_Type.mode == S)) -> _Sugar_Counter.state= Sugar_Counter_Dec;_Sugar_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Dec_Sugar) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Mocca) && (_Coffee_Type.mode == S)) -> _Sugar_Counter.state= Sugar_Counter_Dec;_Sugar_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Inc_Milk) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Latte) && (_Coffee_Type.mode == S)) -> _Milk_Counter.state= Milk_Counter_Inc;_Milk_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Inc_Milk) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Mocca) && (_Coffee_Type.mode == S)) -> _Milk_Counter.state= Milk_Counter_Inc;_Milk_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Dec_Milk) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Latte) && (_Coffee_Type.mode == S)) -> _Milk_Counter.state= Milk_Counter_Dec;_Milk_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Dec_Milk) && (_Action.mode == T) && (_Coffee_Type.state== Coffee_Type_Mocca) && (_Coffee_Type.mode == S)) -> _Milk_Counter.state= Milk_Counter_Dec;_Milk_Counter.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Produce_Ok) && (_Action.mode == T)) -> _Controller_State.state= Controller_State_POS;_Controller_State.mode = T;
	:: ((_Controller_State.state== Controller_State_Info) && (_Controller_State.mode == S) && (_Action.state== Action_Produce_Cancel) && (_Action.mode == T)) -> _Controller_State.state= Controller_State_Select;_Controller_State.mode = T;
	:: ((_Controller_State.state== Controller_State_Another) && (_Controller_State.mode == S) && (_Action.state== Action_Another_Yes) && (_Action.mode == T)) -> _Another_Timer.state= Another_Timer_Stop;_Another_Timer.mode = T;_Controller_State.state= Controller_State_Info;_Controller_State.mode = T;
	:: ((_Controller_State.state== Controller_State_Another) && (_Controller_State.mode == S) && (_Action.state== Action_Another_No) && (_Action.mode == T)) -> _Another_Timer.state= Another_Timer_Stop;_Another_Timer.mode = T;_Controller_State.state= Controller_State_Select;_Controller_State.mode = T;
	:: ((_Controller_State.state== Controller_State_Another) && (_Controller_State.mode == S) && (_Another_Timer.state== Another_Timer_Timeout) && (_Another_Timer.mode == T)) -> _Controller_State.state= Controller_State_Select;_Controller_State.mode = T;
	fi;
};

