	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM p2 */
;
		
	case 3: // STATE 1
		goto R999;

	case 4: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Producer */
;
		;
		;
		;
		;
		;
		
	case 8: // STATE 4
		;
		now._Produce_Timer.state = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 5
		;
		now._Produce_Timer.mode = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 6
		;
		now._Produce_Timer.value = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 12: // STATE 8
		;
		now._Produce_Timer.state = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 9
		;
		now._Produce_Timer.mode = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 15: // STATE 11
		;
		now._Producer_State.state = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 12
		;
		now._Producer_State.mode = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 18: // STATE 14
		;
		now._Producer_State.state = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 15
		;
		now._Producer_State.mode = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 21: // STATE 17
		;
		now._Producer_State.state = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 18
		;
		now._Producer_State.mode = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 24: // STATE 20
		;
		now._Door_Lock.state = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 21
		;
		now._Door_Lock.mode = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 27: // STATE 23
		;
		now._Door_Lock.state = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 24
		;
		now._Door_Lock.mode = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 30: // STATE 26
		;
		now._Produce_Timer.state = trpt->bup.oval;
		;
		goto R999;

	case 31: // STATE 27
		;
		now._Produce_Timer.mode = trpt->bup.oval;
		;
		goto R999;

	case 32: // STATE 28
		;
		now._Produce_Timer.value = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 34: // STATE 30
		;
		now._Produce_Timer.state = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 31
		;
		now._Produce_Timer.mode = trpt->bup.oval;
		;
		goto R999;

	case 36: // STATE 32
		;
		now._Door_Lock.state = trpt->bup.oval;
		;
		goto R999;

	case 37: // STATE 33
		;
		now._Door_Lock.mode = trpt->bup.oval;
		;
		goto R999;

	case 38: // STATE 34
		;
		now._Producer_State.state = trpt->bup.oval;
		;
		goto R999;

	case 39: // STATE 35
		;
		now._Producer_State.mode = trpt->bup.oval;
		;
		goto R999;

	case 40: // STATE 42
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC initializer */
;
		;
		
	case 42: // STATE 2
		;
		now.initialized = trpt->bup.oval;
		;
		goto R999;

	case 43: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;
	}

