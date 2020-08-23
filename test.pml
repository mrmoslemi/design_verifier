#define N 12
	controller_state_pos,
	controller_state_produce,
	controller_state_select,
	controller_state_info,
	controller_state_another
	coffee_type_espresso,
	coffee_type_americano,
	coffee_type_mocha,
	coffee_type_latte
	sugar_counter_dec,
	sugar_counter_inc
	milk_counter_dec,
	milk_counter_inc
	coffee_counter_dec,
	coffee_counter_inc
	another_timer_stop,
	another_timer_start,
	another_timer_timeout,
	another_timer_running
	producer_state_take,
	producer_state_produced,
	producer_state_producing
	pos_state_working,
	pos_state_idle,
	pos_state_failed,
	pos_state_paid
	action_take,
	action_select_latte,
	action_another_no,
	action_another_yes,
	action_inc_sugar,
	action_dec_sugar,
	action_produce_cancel,
	action_select_americano,
	action_dec_milk,
	action_select_espresso,
	action_inc_milk,
	action_dec_coffee,
	action_inc_coffee,
	action_select_mocha,
	action_pos_failed,
	action_pos_paid,
	action_produce_ok


controller_state_parameter controller_state;
coffee_type_parameter coffee_type;
sugar_counter_parameter sugar_counter;
milk_counter_parameter milk_counter;
coffee_counter_parameter coffee_counter;
another_timer_parameter another_timer;
producer_state_parameter producer_state;
pos_state_parameter pos_state;
action_parameter action;

active proctype controller (){

	do
	::
		if
		:: ((another_timer.state == another_timer_running)) -> another_timer.state = another_timer_timeout; another_timer_channel!another_timer_timeout;
		fi;
	::another_timer_channel?another_timer_timeout;
		if
		:: ((controller_state.state == controller_state_another) && (another_timer.state == another_timer_timeout)) -> controller_state.state = controller_state_select; controller_state_channel!controller_state_select;
		:: ((another_timer.state == another_timer_timeout)) -> another_timer.state = another_timer_stop;
		fi;
	::coffee_type_channel?coffee_type_americano;
		if
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_americano)) -> sugar_counter.value = 0; milk_counter.value = 0; coffee_counter.value = 7;
		:: ((coffee_type.state == coffee_type_americano)) -> coffee_type.state = coffee_type_americano;
		fi;
	::controller_state_channel?controller_state_pos;
		if
		:: ((controller_state.state == controller_state_pos)) -> controller_state.state = controller_state_pos;
		fi;
	::coffee_type_channel?coffee_type_latte;
		if
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_latte)) -> sugar_counter.value = 3; milk_counter.value = 5; coffee_counter.value = 5;
		:: ((coffee_type.state == coffee_type_latte)) -> coffee_type.state = coffee_type_latte;
		fi;
	::pos_state_channel?pos_state_paid;
		if
		:: ((controller_state.state == controller_state_pos) && (pos_state.state == pos_state_paid)) -> controller_state.state = controller_state_produce; controller_state_channel!controller_state_produce;
		fi;
	::controller_state_channel?controller_state_info;
		if
		:: ((controller_state.state == controller_state_info)) -> controller_state.state = controller_state_info;
		fi;
	::controller_state_channel?controller_state_another;
		if
		:: ((controller_state.state == controller_state_another)) -> controller_state.state = controller_state_another;
		fi;
	::action_channel?action_dec_milk;
		if
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_latte) && (action.state == action_dec_milk)) -> milk_counter.state = milk_counter_dec; milk_counter_channel!milk_counter_dec;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_mocha) && (action.state == action_dec_milk)) -> milk_counter.state = milk_counter_dec; milk_counter_channel!milk_counter_dec;
		fi;
	::sugar_counter_channel?sugar_counter_inc;
		if
		:: ((sugar_counter.state == sugar_counter_inc) && (sugar_counter.value == 0)) -> sugar_counter.state = sugar_counter_inc; sugar_counter.value = 1;
		:: ((sugar_counter.state == sugar_counter_inc) && (sugar_counter.value == 1)) -> sugar_counter.state = sugar_counter_inc; sugar_counter.value = 2;
		:: ((sugar_counter.state == sugar_counter_inc) && (sugar_counter.value == 2)) -> sugar_counter.state = sugar_counter_inc; sugar_counter.value = 3;
		:: ((sugar_counter.state == sugar_counter_inc) && (sugar_counter.value == 3)) -> sugar_counter.state = sugar_counter_inc; sugar_counter.value = 4;
		:: ((sugar_counter.state == sugar_counter_inc) && (sugar_counter.value == 4)) -> sugar_counter.state = sugar_counter_inc; sugar_counter.value = 5;
		:: ((sugar_counter.state == sugar_counter_inc) && (sugar_counter.value == 5)) -> sugar_counter.state = sugar_counter_inc; sugar_counter.value = 6;
		:: ((sugar_counter.state == sugar_counter_inc) && (sugar_counter.value == 6)) -> sugar_counter.state = sugar_counter_inc; sugar_counter.value = 7;
		:: ((sugar_counter.state == sugar_counter_inc) && (sugar_counter.value == 7)) -> sugar_counter.state = sugar_counter_inc; sugar_counter.value = 7;
		fi;
	::coffee_type_channel?coffee_type_mocha;
		if
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_mocha)) -> sugar_counter.value = 3; milk_counter.value = 3; coffee_counter.value = 4;
		fi;
	::sugar_counter_channel?sugar_counter_dec;
		if
		:: ((sugar_counter.state == sugar_counter_dec) && (sugar_counter.value == 0)) -> sugar_counter.state = sugar_counter_dec; sugar_counter.value = 0;
		:: ((sugar_counter.state == sugar_counter_dec) && (sugar_counter.value == 1)) -> sugar_counter.state = sugar_counter_dec; sugar_counter.value = 0;
		:: ((sugar_counter.state == sugar_counter_dec) && (sugar_counter.value == 2)) -> sugar_counter.state = sugar_counter_dec; sugar_counter.value = 1;
		:: ((sugar_counter.state == sugar_counter_dec) && (sugar_counter.value == 3)) -> sugar_counter.state = sugar_counter_dec; sugar_counter.value = 2;
		:: ((sugar_counter.state == sugar_counter_dec) && (sugar_counter.value == 4)) -> sugar_counter.state = sugar_counter_dec; sugar_counter.value = 3;
		:: ((sugar_counter.state == sugar_counter_dec) && (sugar_counter.value == 5)) -> sugar_counter.state = sugar_counter_dec; sugar_counter.value = 4;
		:: ((sugar_counter.state == sugar_counter_dec) && (sugar_counter.value == 6)) -> sugar_counter.state = sugar_counter_dec; sugar_counter.value = 5;
		:: ((sugar_counter.state == sugar_counter_dec) && (sugar_counter.value == 7)) -> sugar_counter.state = sugar_counter_dec; sugar_counter.value = 6;
		fi;
	::pos_state_channel?pos_state_failed;
		if
		:: ((controller_state.state == controller_state_pos) && (pos_state.state == pos_state_failed)) -> controller_state.state = controller_state_select; controller_state_channel!controller_state_select;
		fi;
	::another_timer_channel?another_timer_start;
		if
		:: ((another_timer.state == another_timer_start)) -> another_timer.state = another_timer_running;
		fi;
	::action_channel?action_another_yes;
		if
		:: ((controller_state.state == controller_state_another) && (action.state == action_another_yes)) -> controller_state.state = controller_state_info; controller_state_channel!controller_state_info; another_timer.state = another_timer_start; another_timer_channel!another_timer_start;
		fi;
	::action_channel?action_another_no;
		if
		:: ((controller_state.state == controller_state_another) && (action.state == action_another_no)) -> controller_state.state = controller_state_select; controller_state_channel!controller_state_select; another_timer.state = another_timer_stop; another_timer_channel!another_timer_stop;
		fi;
	::producer_state_channel?producer_state_take;
		if
		:: ((producer_state.state == producer_state_take)) -> controller_state.state = controller_state_another; controller_state_channel!controller_state_another;
		fi;
	::controller_state_channel?controller_state_produce;
		if
		:: ((controller_state.state == controller_state_produce)) -> controller_state.state = controller_state_produce;
		fi;
	::action_channel?action_select_americano;
		if
		:: ((controller_state.state == controller_state_select) && (action.state == action_select_americano)) -> controller_state.state = controller_state_info; controller_state_channel!controller_state_info; coffee_type.state = coffee_type_americano; coffee_type_channel!coffee_type_americano;
		fi;
	::action_channel?action_inc_coffee;
		if
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_espresso) && (action.state == action_inc_coffee)) -> coffee_counter.state = coffee_counter_inc; coffee_counter_channel!coffee_counter_inc;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_americano) && (action.state == action_inc_coffee)) -> coffee_counter.state = coffee_counter_inc; coffee_counter_channel!coffee_counter_inc;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_latte) && (action.state == action_inc_coffee)) -> coffee_counter.state = coffee_counter_inc; coffee_counter_channel!coffee_counter_inc;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_mocha) && (action.state == action_inc_coffee)) -> coffee_counter.state = coffee_counter_inc; coffee_counter_channel!coffee_counter_inc;
		fi;
	::action_channel?action_select_espresso;
		if
		:: ((controller_state.state == controller_state_select) && (action.state == action_select_espresso)) -> controller_state.state = controller_state_info; controller_state_channel!controller_state_info; coffee_type.state = coffee_type_espresso; coffee_type_channel!coffee_type_espresso;
		fi;
	::controller_state_channel?controller_state_select;
		if
		:: ((controller_state.state == controller_state_select)) -> controller_state.state = controller_state_select;
		fi;
	::milk_counter_channel?milk_counter_inc;
		if
		:: ((milk_counter.state == milk_counter_inc) && (milk_counter.value == 0)) -> milk_counter.state = milk_counter_inc; milk_counter.value = 1;
		:: ((milk_counter.state == milk_counter_inc) && (milk_counter.value == 1)) -> milk_counter.state = milk_counter_inc; milk_counter.value = 2;
		:: ((milk_counter.state == milk_counter_inc) && (milk_counter.value == 2)) -> milk_counter.state = milk_counter_inc; milk_counter.value = 3;
		:: ((milk_counter.state == milk_counter_inc) && (milk_counter.value == 3)) -> milk_counter.state = milk_counter_inc; milk_counter.value = 4;
		:: ((milk_counter.state == milk_counter_inc) && (milk_counter.value == 4)) -> milk_counter.state = milk_counter_inc; milk_counter.value = 5;
		:: ((milk_counter.state == milk_counter_inc) && (milk_counter.value == 5)) -> milk_counter.state = milk_counter_inc; milk_counter.value = 6;
		:: ((milk_counter.state == milk_counter_inc) && (milk_counter.value == 6)) -> milk_counter.state = milk_counter_inc; milk_counter.value = 7;
		:: ((milk_counter.state == milk_counter_inc) && (milk_counter.value == 7)) -> milk_counter.state = milk_counter_inc; milk_counter.value = 7;
		fi;
	::action_channel?action_inc_milk;
		if
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_latte) && (action.state == action_inc_milk)) -> milk_counter.state = milk_counter_inc; milk_counter_channel!milk_counter_inc;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_mocha) && (action.state == action_inc_milk)) -> milk_counter.state = milk_counter_inc; milk_counter_channel!milk_counter_inc;
		fi;
	::coffee_counter_channel?coffee_counter_inc;
		if
		:: ((coffee_counter.state == coffee_counter_inc) && (coffee_counter.value == 0)) -> coffee_counter.state = coffee_counter_inc; coffee_counter.value = 1;
		:: ((coffee_counter.state == coffee_counter_inc) && (coffee_counter.value == 1)) -> coffee_counter.state = coffee_counter_inc; coffee_counter.value = 2;
		:: ((coffee_counter.state == coffee_counter_inc) && (coffee_counter.value == 2)) -> coffee_counter.state = coffee_counter_inc; coffee_counter.value = 3;
		:: ((coffee_counter.state == coffee_counter_inc) && (coffee_counter.value == 3)) -> coffee_counter.state = coffee_counter_inc; coffee_counter.value = 4;
		:: ((coffee_counter.state == coffee_counter_inc) && (coffee_counter.value == 4)) -> coffee_counter.state = coffee_counter_inc; coffee_counter.value = 5;
		:: ((coffee_counter.state == coffee_counter_inc) && (coffee_counter.value == 5)) -> coffee_counter.state = coffee_counter_inc; coffee_counter.value = 6;
		:: ((coffee_counter.state == coffee_counter_inc) && (coffee_counter.value == 6)) -> coffee_counter.state = coffee_counter_inc; coffee_counter.value = 7;
		:: ((coffee_counter.state == coffee_counter_inc) && (coffee_counter.value == 7)) -> coffee_counter.state = coffee_counter_inc; coffee_counter.value = 7;
		fi;
	::action_channel?action_select_latte;
		if
		:: ((controller_state.state == controller_state_select) && (action.state == action_select_latte)) -> controller_state.state = controller_state_info; controller_state_channel!controller_state_info; coffee_type.state = coffee_type_latte; coffee_type_channel!coffee_type_latte;
		fi;
	::coffee_type_channel?coffee_type_mocha;
		if
		:: ((coffee_type.state == coffee_type_mocha)) -> coffee_type.state = coffee_type_mocha;
		fi;
	::action_channel?action_produce_ok;
		if
		:: ((controller_state.state == controller_state_info) && (action.state == action_produce_ok)) -> controller_state.state = controller_state_pos; controller_state_channel!controller_state_pos;
		fi;
	::coffee_type_channel?coffee_type_espresso;
		if
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_espresso)) -> sugar_counter.value = 0; milk_counter.value = 0; coffee_counter.value = 7;
		:: ((coffee_type.state == coffee_type_espresso)) -> coffee_type.state = coffee_type_espresso;
		fi;
	::action_channel?action_dec_coffee;
		if
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_espresso) && (action.state == action_dec_coffee)) -> coffee_counter.state = coffee_counter_dec; coffee_counter_channel!coffee_counter_dec;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_americano) && (action.state == action_dec_coffee)) -> coffee_counter.state = coffee_counter_dec; coffee_counter_channel!coffee_counter_dec;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_latte) && (action.state == action_dec_coffee)) -> coffee_counter.state = coffee_counter_dec; coffee_counter_channel!coffee_counter_dec;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_mocha) && (action.state == action_dec_coffee)) -> coffee_counter.state = coffee_counter_dec; coffee_counter_channel!coffee_counter_dec;
		fi;
	::coffee_counter_channel?coffee_counter_dec;
		if
		:: ((coffee_counter.state == coffee_counter_dec) && (coffee_counter.value == 0)) -> coffee_counter.state = coffee_counter_dec; coffee_counter.value = 0;
		:: ((coffee_counter.state == coffee_counter_dec) && (coffee_counter.value == 1)) -> coffee_counter.state = coffee_counter_dec; coffee_counter.value = 0;
		:: ((coffee_counter.state == coffee_counter_dec) && (coffee_counter.value == 2)) -> coffee_counter.state = coffee_counter_dec; coffee_counter.value = 1;
		:: ((coffee_counter.state == coffee_counter_dec) && (coffee_counter.value == 3)) -> coffee_counter.state = coffee_counter_dec; coffee_counter.value = 2;
		:: ((coffee_counter.state == coffee_counter_dec) && (coffee_counter.value == 4)) -> coffee_counter.state = coffee_counter_dec; coffee_counter.value = 3;
		:: ((coffee_counter.state == coffee_counter_dec) && (coffee_counter.value == 5)) -> coffee_counter.state = coffee_counter_dec; coffee_counter.value = 4;
		:: ((coffee_counter.state == coffee_counter_dec) && (coffee_counter.value == 6)) -> coffee_counter.state = coffee_counter_dec; coffee_counter.value = 5;
		:: ((coffee_counter.state == coffee_counter_dec) && (coffee_counter.value == 7)) -> coffee_counter.state = coffee_counter_dec; coffee_counter.value = 6;
		fi;
	::action_channel?action_produce_cancel;
		if
		:: ((controller_state.state == controller_state_info) && (action.state == action_produce_cancel)) -> controller_state.state = controller_state_select; controller_state_channel!controller_state_select;
		fi;
	::action_channel?action_select_mocha;
		if
		:: ((controller_state.state == controller_state_select) && (action.state == action_select_mocha)) -> controller_state.state = controller_state_info; controller_state_channel!controller_state_info; coffee_type.state = coffee_type_mocha; coffee_type_channel!coffee_type_mocha;
		fi;
	::milk_counter_channel?milk_counter_dec;
		if
		:: ((milk_counter.state == milk_counter_dec) && (milk_counter.value == 0)) -> milk_counter.state = milk_counter_dec; milk_counter.value = 0;
		:: ((milk_counter.state == milk_counter_dec) && (milk_counter.value == 1)) -> milk_counter.state = milk_counter_dec; milk_counter.value = 0;
		:: ((milk_counter.state == milk_counter_dec) && (milk_counter.value == 2)) -> milk_counter.state = milk_counter_dec; milk_counter.value = 1;
		:: ((milk_counter.state == milk_counter_dec) && (milk_counter.value == 3)) -> milk_counter.state = milk_counter_dec; milk_counter.value = 2;
		:: ((milk_counter.state == milk_counter_dec) && (milk_counter.value == 4)) -> milk_counter.state = milk_counter_dec; milk_counter.value = 3;
		:: ((milk_counter.state == milk_counter_dec) && (milk_counter.value == 5)) -> milk_counter.state = milk_counter_dec; milk_counter.value = 4;
		:: ((milk_counter.state == milk_counter_dec) && (milk_counter.value == 6)) -> milk_counter.state = milk_counter_dec; milk_counter.value = 5;
		:: ((milk_counter.state == milk_counter_dec) && (milk_counter.value == 7)) -> milk_counter.state = milk_counter_dec; milk_counter.value = 6;
		fi;
	::action_channel?action_inc_sugar;
		if
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_americano) && (action.state == action_inc_sugar)) -> sugar_counter.state = sugar_counter_inc; sugar_counter_channel!sugar_counter_inc;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_latte) && (action.state == action_inc_sugar)) -> sugar_counter.state = sugar_counter_inc; sugar_counter_channel!sugar_counter_inc;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_mocha) && (action.state == action_inc_sugar)) -> sugar_counter.state = sugar_counter_inc; sugar_counter_channel!sugar_counter_inc;
		fi;
	::action_channel?action_dec_sugar;
		if
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_americano) && (action.state == action_dec_sugar)) -> sugar_counter.state = sugar_counter_dec; sugar_counter_channel!sugar_counter_dec;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_latte) && (action.state == action_dec_sugar)) -> sugar_counter.state = sugar_counter_dec; sugar_counter_channel!sugar_counter_dec;
		:: ((controller_state.state == controller_state_info) && (coffee_type.state == coffee_type_mocha) && (action.state == action_dec_sugar)) -> sugar_counter.state = sugar_counter_dec; sugar_counter_channel!sugar_counter_dec;
		fi;
	od;
};