mtype:Mode = {
	S, T
};

mtype:Produce_Timer_states = {
	Produce_Timer_Stop, Produce_Timer_Start, Produce_Timer_Timeout, Produce_Timer_Running
};
typedef Produce_Timer {
	mtype:Produce_Timer_states state;
	mtype:Mode mode;
	int value;

};
Produce_Timer _Produce_Timer;


mtype:Producer_State_states = {
	Producer_State_Take, Producer_State_Produced, Producer_State_Producing
};
typedef Producer_State {
	mtype:Producer_State_states state;
	mtype:Mode mode;
};
Producer_State _Producer_State;


mtype:Door_Lock_states = {
	Door_Lock_Unlock, Door_Lock_Lock
};
typedef Door_Lock {
	mtype:Door_Lock_states state;
	mtype:Mode mode;
};
Door_Lock _Door_Lock;

bit initialized =0;


active proctype initializer(){
    if
    :: !initialized -> atomic{
        _Produce_Timer.state = Produce_Timer_
        initialized = 1;
    }
    fi;
}
active proctype Producer (){
    if
    :: initialized -> {
    do
    	:: ((_Produce_Timer.state== Produce_Timer_Start) && (_Produce_Timer.mode == T)) -> _Produce_Timer.state= Produce_Timer_Running;_Produce_Timer.mode = S;_Produce_Timer.value = 0;
    	:: ((_Produce_Timer.state== Produce_Timer_Timeout) && (_Produce_Timer.mode == T)) -> _Produce_Timer.state= Produce_Timer_Stop;_Produce_Timer.mode = S;
    	:: ((_Producer_State.state== Producer_State_Producing) && (_Producer_State.mode == T)) -> _Producer_State.state= Producer_State_Producing;_Producer_State.mode = S;
    	:: ((_Producer_State.state== Producer_State_Produced) && (_Producer_State.mode == T)) -> _Producer_State.state= Producer_State_Produced;_Producer_State.mode = S;
    	:: ((_Producer_State.state== Producer_State_Take) && (_Producer_State.mode == T)) -> _Producer_State.state= Producer_State_Take;_Producer_State.mode = S;
    	:: ((_Door_Lock.state== Door_Lock_Lock) && (_Door_Lock.mode == T)) -> _Door_Lock.state= Door_Lock_Lock;_Door_Lock.mode = S;
    	:: ((_Door_Lock.state== Door_Lock_Unlock) && (_Door_Lock.mode == T)) -> _Door_Lock.state= Door_Lock_Unlock;_Door_Lock.mode = S;
    	:: ((_Produce_Timer.state== Produce_Timer_Running) && (_Produce_Timer.mode == S)) -> _Produce_Timer.state= Produce_Timer_Timeout;_Produce_Timer.mode = T;_Produce_Timer.value = 200;
    	:: ((_Produce_Timer.state== Produce_Timer_Timeout) && (_Produce_Timer.mode == T) && (_Producer_State.state== Producer_State_Producing) && (_Producer_State.mode == S)) -> _Produce_Timer.state= Produce_Timer_Stop;_Produce_Timer.mode = T;_Door_Lock.state= Door_Lock_Unlock;_Door_Lock.mode = T;_Producer_State.state= Producer_State_Produced;_Producer_State.mode = T;
    	od;
    }
    fi;

};
ltl p2 {always false};