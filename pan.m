#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM :trace: */
	case 3: // STATE 1 - test.pml:902 - [Another_Timer_cin?Another_Timer_Running] (0:0:0 - 1)
		reached[4][1] = 1;
		if ((II == -EVENT_TRACE && _tp != 'r') || _qid+1 != now.Another_Timer_cin \
		|| qrecv(now.Another_Timer_cin, 0, 0, 0) != 25)
			continue;
		_m = 4; goto P999; /* 0 */
	case 4: // STATE 2 - test.pml:902 - [Another_Timer_cin?Another_Timer_Timeout] (0:0:0 - 1)
		reached[4][2] = 1;
		if ((II == -EVENT_TRACE && _tp != 'r') || _qid+1 != now.Another_Timer_cin \
		|| qrecv(now.Another_Timer_cin, 0, 0, 0) != 28)
			continue;
		_m = 4; goto P999; /* 0 */
	case 5: // STATE 5 - test.pml:904 - [-end-] (0:0:0 - 2)
		reached[4][5] = 1;
		return 0;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM :trace: */
	case 6: // STATE 1 - test.pml:897 - [Another_Timer_cin?Another_Timer_Running] (0:0:0 - 1)
		reached[3][1] = 1;
		if (boq != now.Another_Timer_cin) continue;
		if (q_len(now.Another_Timer_cin) == 0) continue;

		XX=1;
		if (25 != qrecv(now.Another_Timer_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 25); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 7: // STATE 2 - test.pml:897 - [Another_Timer_cin?Another_Timer_Timeout] (0:0:0 - 1)
		reached[3][2] = 1;
		if (boq != now.Another_Timer_cin) continue;
		if (q_len(now.Another_Timer_cin) == 0) continue;

		XX=1;
		if (28 != qrecv(now.Another_Timer_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 28); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 8: // STATE 5 - test.pml:899 - [-end-] (0:0:0 - 2)
		IfNotBlocked
		reached[3][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM :trace: */
	case 9: // STATE 1 - test.pml:892 - [Another_Timer_cin?Another_Timer_Running] (0:0:0 - 1)
		reached[2][1] = 1;
		if (boq != now.Another_Timer_cin) continue;
		if (q_len(now.Another_Timer_cin) == 0) continue;

		XX=1;
		if (25 != qrecv(now.Another_Timer_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 25); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 10: // STATE 2 - test.pml:892 - [Another_Timer_cin?Another_Timer_Timeout] (0:0:0 - 1)
		reached[2][2] = 1;
		if (boq != now.Another_Timer_cin) continue;
		if (q_len(now.Another_Timer_cin) == 0) continue;

		XX=1;
		if (28 != qrecv(now.Another_Timer_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 28); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 11: // STATE 6 - test.pml:894 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC CONTROLLER_environment */
	case 12: // STATE 1 - test.pml:834 - [Producer_State_cin!Producer_State_Take] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (q_len(now.Producer_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Producer_State_cin);
		sprintf(simtmp, "%d", 24); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Producer_State_cin, 0, 24, 1);
		{ boq = now.Producer_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 13: // STATE 2 - test.pml:835 - [Producer_State_cin!Producer_State_Producing] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (q_len(now.Producer_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Producer_State_cin);
		sprintf(simtmp, "%d", 23); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Producer_State_cin, 0, 23, 1);
		{ boq = now.Producer_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 14: // STATE 3 - test.pml:836 - [Producer_State_cin!Producer_State_Produced] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (q_len(now.Producer_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Producer_State_cin);
		sprintf(simtmp, "%d", 22); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Producer_State_cin, 0, 22, 1);
		{ boq = now.Producer_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 15: // STATE 4 - test.pml:838 - [POS_State_cin!POS_State_Paid] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (q_len(now.POS_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.POS_State_cin);
		sprintf(simtmp, "%d", 21); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.POS_State_cin, 0, 21, 1);
		{ boq = now.POS_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 16: // STATE 5 - test.pml:839 - [POS_State_cin!POS_State_Idle] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (q_len(now.POS_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.POS_State_cin);
		sprintf(simtmp, "%d", 20); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.POS_State_cin, 0, 20, 1);
		{ boq = now.POS_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 17: // STATE 6 - test.pml:840 - [POS_State_cin!POS_State_Failed] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (q_len(now.POS_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.POS_State_cin);
		sprintf(simtmp, "%d", 19); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.POS_State_cin, 0, 19, 1);
		{ boq = now.POS_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 18: // STATE 7 - test.pml:841 - [POS_State_cin!POS_State_Working] (0:0:0 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (q_len(now.POS_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.POS_State_cin);
		sprintf(simtmp, "%d", 18); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.POS_State_cin, 0, 18, 1);
		{ boq = now.POS_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 19: // STATE 8 - test.pml:843 - [Action_cin!Action_Take] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 17); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 17, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 20: // STATE 9 - test.pml:844 - [Action_cin!Action_Select_Mocha] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 16); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 16, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 21: // STATE 10 - test.pml:845 - [Action_cin!Action_POS_Failed] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 15); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 15, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 22: // STATE 11 - test.pml:846 - [Action_cin!Action_Another_Yes] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 14); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 14, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 23: // STATE 12 - test.pml:847 - [Action_cin!Action_POS_Paid] (0:0:0 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 13); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 13, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 24: // STATE 13 - test.pml:848 - [Action_cin!Action_Produce_Ok] (0:0:0 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 12); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 12, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 25: // STATE 14 - test.pml:849 - [Action_cin!Action_Produce_Cancel] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 11); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 11, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 26: // STATE 15 - test.pml:850 - [Action_cin!Action_Inc_Coffee] (0:0:0 - 1)
		IfNotBlocked
		reached[1][15] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 10); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 10, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 27: // STATE 16 - test.pml:851 - [Action_cin!Action_Select_Espresso] (0:0:0 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 9); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 9, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 28: // STATE 17 - test.pml:852 - [Action_cin!Action_Select_Latte] (0:0:0 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 8); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 8, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 29: // STATE 18 - test.pml:853 - [Action_cin!Action_Dec_Milk] (0:0:0 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 7); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 7, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 30: // STATE 19 - test.pml:854 - [Action_cin!Action_Another_No] (0:0:0 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 6, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 31: // STATE 20 - test.pml:855 - [Action_cin!Action_Dec_Coffee] (0:0:0 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 5); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 5, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 32: // STATE 21 - test.pml:856 - [Action_cin!Action_Select_Americano] (0:0:0 - 1)
		IfNotBlocked
		reached[1][21] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 4, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 33: // STATE 22 - test.pml:857 - [Action_cin!Action_Inc_Milk] (0:0:0 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 3, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 34: // STATE 23 - test.pml:858 - [Action_cin!Action_Dec_Sugar] (0:0:0 - 1)
		IfNotBlocked
		reached[1][23] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 2, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 35: // STATE 24 - test.pml:859 - [Action_cin!Action_Inc_Sugar] (0:0:0 - 1)
		IfNotBlocked
		reached[1][24] = 1;
		if (q_len(now.Action_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Action_cin);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Action_cin, 0, 1, 1);
		{ boq = now.Action_cin; };
		_m = 2; goto P999; /* 0 */
	case 36: // STATE 25 - test.pml:862 - [Controller_State_cout?Controller_State_POS] (0:0:0 - 1)
		reached[1][25] = 1;
		if (boq != now.Controller_State_cout) continue;
		if (q_len(now.Controller_State_cout) == 0) continue;

		XX=1;
		if (43 != qrecv(now.Controller_State_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Controller_State_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Controller_State_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Controller_State_cout);
		sprintf(simtmp, "%d", 43); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Controller_State_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 37: // STATE 26 - test.pml:862 - [Controller_State_cin!Controller_State_POS] (0:0:0 - 1)
		IfNotBlocked
		reached[1][26] = 1;
		if (q_len(now.Controller_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cin);
		sprintf(simtmp, "%d", 43); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cin, 0, 43, 1);
		{ boq = now.Controller_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 38: // STATE 27 - test.pml:863 - [Controller_State_cout?Controller_State_Produce] (0:0:0 - 1)
		reached[1][27] = 1;
		if (boq != now.Controller_State_cout) continue;
		if (q_len(now.Controller_State_cout) == 0) continue;

		XX=1;
		if (42 != qrecv(now.Controller_State_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Controller_State_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Controller_State_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Controller_State_cout);
		sprintf(simtmp, "%d", 42); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Controller_State_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 39: // STATE 28 - test.pml:863 - [Controller_State_cin!Controller_State_Produce] (0:0:0 - 1)
		IfNotBlocked
		reached[1][28] = 1;
		if (q_len(now.Controller_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cin);
		sprintf(simtmp, "%d", 42); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cin, 0, 42, 1);
		{ boq = now.Controller_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 40: // STATE 29 - test.pml:864 - [Controller_State_cout?Controller_State_Another] (0:0:0 - 1)
		reached[1][29] = 1;
		if (boq != now.Controller_State_cout) continue;
		if (q_len(now.Controller_State_cout) == 0) continue;

		XX=1;
		if (41 != qrecv(now.Controller_State_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Controller_State_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Controller_State_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Controller_State_cout);
		sprintf(simtmp, "%d", 41); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Controller_State_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 41: // STATE 30 - test.pml:864 - [Controller_State_cin!Controller_State_Another] (0:0:0 - 1)
		IfNotBlocked
		reached[1][30] = 1;
		if (q_len(now.Controller_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cin);
		sprintf(simtmp, "%d", 41); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cin, 0, 41, 1);
		{ boq = now.Controller_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 42: // STATE 31 - test.pml:865 - [Controller_State_cout?Controller_State_Select] (0:0:0 - 1)
		reached[1][31] = 1;
		if (boq != now.Controller_State_cout) continue;
		if (q_len(now.Controller_State_cout) == 0) continue;

		XX=1;
		if (40 != qrecv(now.Controller_State_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Controller_State_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Controller_State_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Controller_State_cout);
		sprintf(simtmp, "%d", 40); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Controller_State_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 43: // STATE 32 - test.pml:865 - [Controller_State_cin!Controller_State_Select] (0:0:0 - 1)
		IfNotBlocked
		reached[1][32] = 1;
		if (q_len(now.Controller_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cin);
		sprintf(simtmp, "%d", 40); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cin, 0, 40, 1);
		{ boq = now.Controller_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 44: // STATE 33 - test.pml:866 - [Controller_State_cout?Controller_State_Info] (0:0:0 - 1)
		reached[1][33] = 1;
		if (boq != now.Controller_State_cout) continue;
		if (q_len(now.Controller_State_cout) == 0) continue;

		XX=1;
		if (39 != qrecv(now.Controller_State_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Controller_State_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Controller_State_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Controller_State_cout);
		sprintf(simtmp, "%d", 39); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Controller_State_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 45: // STATE 34 - test.pml:866 - [Controller_State_cin!Controller_State_Info] (0:0:0 - 1)
		IfNotBlocked
		reached[1][34] = 1;
		if (q_len(now.Controller_State_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cin);
		sprintf(simtmp, "%d", 39); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cin, 0, 39, 1);
		{ boq = now.Controller_State_cin; };
		_m = 2; goto P999; /* 0 */
	case 46: // STATE 35 - test.pml:868 - [Coffee_Type_cout?Coffee_Type_Americano] (0:0:0 - 1)
		reached[1][35] = 1;
		if (boq != now.Coffee_Type_cout) continue;
		if (q_len(now.Coffee_Type_cout) == 0) continue;

		XX=1;
		if (38 != qrecv(now.Coffee_Type_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Type_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Type_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Type_cout);
		sprintf(simtmp, "%d", 38); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Type_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 47: // STATE 36 - test.pml:868 - [Coffee_Type_cin!Coffee_Type_Americano] (0:0:0 - 1)
		IfNotBlocked
		reached[1][36] = 1;
		if (q_len(now.Coffee_Type_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Type_cin);
		sprintf(simtmp, "%d", 38); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Type_cin, 0, 38, 1);
		{ boq = now.Coffee_Type_cin; };
		_m = 2; goto P999; /* 0 */
	case 48: // STATE 37 - test.pml:869 - [Coffee_Type_cout?Coffee_Type_Espresso] (0:0:0 - 1)
		reached[1][37] = 1;
		if (boq != now.Coffee_Type_cout) continue;
		if (q_len(now.Coffee_Type_cout) == 0) continue;

		XX=1;
		if (37 != qrecv(now.Coffee_Type_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Type_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Type_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Type_cout);
		sprintf(simtmp, "%d", 37); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Type_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 49: // STATE 38 - test.pml:869 - [Coffee_Type_cin!Coffee_Type_Espresso] (0:0:0 - 1)
		IfNotBlocked
		reached[1][38] = 1;
		if (q_len(now.Coffee_Type_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Type_cin);
		sprintf(simtmp, "%d", 37); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Type_cin, 0, 37, 1);
		{ boq = now.Coffee_Type_cin; };
		_m = 2; goto P999; /* 0 */
	case 50: // STATE 39 - test.pml:870 - [Coffee_Type_cout?Coffee_Type_Latte] (0:0:0 - 1)
		reached[1][39] = 1;
		if (boq != now.Coffee_Type_cout) continue;
		if (q_len(now.Coffee_Type_cout) == 0) continue;

		XX=1;
		if (36 != qrecv(now.Coffee_Type_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Type_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Type_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Type_cout);
		sprintf(simtmp, "%d", 36); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Type_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 51: // STATE 40 - test.pml:870 - [Coffee_Type_cin!Coffee_Type_Latte] (0:0:0 - 1)
		IfNotBlocked
		reached[1][40] = 1;
		if (q_len(now.Coffee_Type_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Type_cin);
		sprintf(simtmp, "%d", 36); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Type_cin, 0, 36, 1);
		{ boq = now.Coffee_Type_cin; };
		_m = 2; goto P999; /* 0 */
	case 52: // STATE 41 - test.pml:871 - [Coffee_Type_cout?Coffee_Type_Mocha] (0:0:0 - 1)
		reached[1][41] = 1;
		if (boq != now.Coffee_Type_cout) continue;
		if (q_len(now.Coffee_Type_cout) == 0) continue;

		XX=1;
		if (35 != qrecv(now.Coffee_Type_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Type_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Type_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Type_cout);
		sprintf(simtmp, "%d", 35); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Type_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 53: // STATE 42 - test.pml:871 - [Coffee_Type_cin!Coffee_Type_Mocha] (0:0:0 - 1)
		IfNotBlocked
		reached[1][42] = 1;
		if (q_len(now.Coffee_Type_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Type_cin);
		sprintf(simtmp, "%d", 35); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Type_cin, 0, 35, 1);
		{ boq = now.Coffee_Type_cin; };
		_m = 2; goto P999; /* 0 */
	case 54: // STATE 43 - test.pml:873 - [Sugar_Counter_cout?Sugar_Counter_Inc] (0:0:0 - 1)
		reached[1][43] = 1;
		if (boq != now.Sugar_Counter_cout) continue;
		if (q_len(now.Sugar_Counter_cout) == 0) continue;

		XX=1;
		if (34 != qrecv(now.Sugar_Counter_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Sugar_Counter_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Sugar_Counter_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Sugar_Counter_cout);
		sprintf(simtmp, "%d", 34); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Sugar_Counter_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 55: // STATE 44 - test.pml:873 - [Sugar_Counter_cin!Sugar_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[1][44] = 1;
		if (q_len(now.Sugar_Counter_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Sugar_Counter_cin);
		sprintf(simtmp, "%d", 34); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Sugar_Counter_cin, 0, 34, 1);
		{ boq = now.Sugar_Counter_cin; };
		_m = 2; goto P999; /* 0 */
	case 56: // STATE 45 - test.pml:874 - [Sugar_Counter_cout?Sugar_Counter_Dec] (0:0:0 - 1)
		reached[1][45] = 1;
		if (boq != now.Sugar_Counter_cout) continue;
		if (q_len(now.Sugar_Counter_cout) == 0) continue;

		XX=1;
		if (33 != qrecv(now.Sugar_Counter_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Sugar_Counter_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Sugar_Counter_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Sugar_Counter_cout);
		sprintf(simtmp, "%d", 33); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Sugar_Counter_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 57: // STATE 46 - test.pml:874 - [Sugar_Counter_cin!Sugar_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[1][46] = 1;
		if (q_len(now.Sugar_Counter_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Sugar_Counter_cin);
		sprintf(simtmp, "%d", 33); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Sugar_Counter_cin, 0, 33, 1);
		{ boq = now.Sugar_Counter_cin; };
		_m = 2; goto P999; /* 0 */
	case 58: // STATE 47 - test.pml:876 - [Milk_Counter_cout?Milk_Counter_Dec] (0:0:0 - 1)
		reached[1][47] = 1;
		if (boq != now.Milk_Counter_cout) continue;
		if (q_len(now.Milk_Counter_cout) == 0) continue;

		XX=1;
		if (32 != qrecv(now.Milk_Counter_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Milk_Counter_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Milk_Counter_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Milk_Counter_cout);
		sprintf(simtmp, "%d", 32); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Milk_Counter_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 59: // STATE 48 - test.pml:876 - [Milk_Counter_cin!Milk_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[1][48] = 1;
		if (q_len(now.Milk_Counter_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Milk_Counter_cin);
		sprintf(simtmp, "%d", 32); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Milk_Counter_cin, 0, 32, 1);
		{ boq = now.Milk_Counter_cin; };
		_m = 2; goto P999; /* 0 */
	case 60: // STATE 49 - test.pml:877 - [Milk_Counter_cout?Milk_Counter_Inc] (0:0:0 - 1)
		reached[1][49] = 1;
		if (boq != now.Milk_Counter_cout) continue;
		if (q_len(now.Milk_Counter_cout) == 0) continue;

		XX=1;
		if (31 != qrecv(now.Milk_Counter_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Milk_Counter_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Milk_Counter_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Milk_Counter_cout);
		sprintf(simtmp, "%d", 31); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Milk_Counter_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 61: // STATE 50 - test.pml:877 - [Milk_Counter_cin!Milk_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[1][50] = 1;
		if (q_len(now.Milk_Counter_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Milk_Counter_cin);
		sprintf(simtmp, "%d", 31); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Milk_Counter_cin, 0, 31, 1);
		{ boq = now.Milk_Counter_cin; };
		_m = 2; goto P999; /* 0 */
	case 62: // STATE 51 - test.pml:879 - [Coffee_Counter_cout?Coffee_Counter_Dec] (0:0:0 - 1)
		reached[1][51] = 1;
		if (boq != now.Coffee_Counter_cout) continue;
		if (q_len(now.Coffee_Counter_cout) == 0) continue;

		XX=1;
		if (30 != qrecv(now.Coffee_Counter_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Counter_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Counter_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Counter_cout);
		sprintf(simtmp, "%d", 30); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Counter_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 63: // STATE 52 - test.pml:879 - [Coffee_Counter_cin!Coffee_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[1][52] = 1;
		if (q_len(now.Coffee_Counter_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Counter_cin);
		sprintf(simtmp, "%d", 30); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Counter_cin, 0, 30, 1);
		{ boq = now.Coffee_Counter_cin; };
		_m = 2; goto P999; /* 0 */
	case 64: // STATE 53 - test.pml:880 - [Coffee_Counter_cout?Coffee_Counter_Inc] (0:0:0 - 1)
		reached[1][53] = 1;
		if (boq != now.Coffee_Counter_cout) continue;
		if (q_len(now.Coffee_Counter_cout) == 0) continue;

		XX=1;
		if (29 != qrecv(now.Coffee_Counter_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Counter_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Counter_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Counter_cout);
		sprintf(simtmp, "%d", 29); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Counter_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 65: // STATE 54 - test.pml:880 - [Coffee_Counter_cin!Coffee_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[1][54] = 1;
		if (q_len(now.Coffee_Counter_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Counter_cin);
		sprintf(simtmp, "%d", 29); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Counter_cin, 0, 29, 1);
		{ boq = now.Coffee_Counter_cin; };
		_m = 2; goto P999; /* 0 */
	case 66: // STATE 55 - test.pml:882 - [Another_Timer_cout?Another_Timer_Timeout] (0:0:0 - 1)
		reached[1][55] = 1;
		if (boq != now.Another_Timer_cout) continue;
		if (q_len(now.Another_Timer_cout) == 0) continue;

		XX=1;
		if (28 != qrecv(now.Another_Timer_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cout);
		sprintf(simtmp, "%d", 28); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 67: // STATE 56 - test.pml:882 - [Another_Timer_cin!Another_Timer_Timeout] (0:0:0 - 1)
		IfNotBlocked
		reached[1][56] = 1;
		if (q_len(now.Another_Timer_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 28); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Another_Timer_cin, 0, 28, 1);
		{ boq = now.Another_Timer_cin; };
		_m = 2; goto P999; /* 0 */
	case 68: // STATE 57 - test.pml:883 - [Another_Timer_cout?Another_Timer_Stop] (0:0:0 - 1)
		reached[1][57] = 1;
		if (boq != now.Another_Timer_cout) continue;
		if (q_len(now.Another_Timer_cout) == 0) continue;

		XX=1;
		if (27 != qrecv(now.Another_Timer_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cout);
		sprintf(simtmp, "%d", 27); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 69: // STATE 58 - test.pml:883 - [Another_Timer_cin!Another_Timer_Stop] (0:0:0 - 1)
		IfNotBlocked
		reached[1][58] = 1;
		if (q_len(now.Another_Timer_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 27); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Another_Timer_cin, 0, 27, 1);
		{ boq = now.Another_Timer_cin; };
		_m = 2; goto P999; /* 0 */
	case 70: // STATE 59 - test.pml:884 - [Another_Timer_cout?Another_Timer_Start] (0:0:0 - 1)
		reached[1][59] = 1;
		if (boq != now.Another_Timer_cout) continue;
		if (q_len(now.Another_Timer_cout) == 0) continue;

		XX=1;
		if (26 != qrecv(now.Another_Timer_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cout);
		sprintf(simtmp, "%d", 26); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 71: // STATE 60 - test.pml:884 - [Another_Timer_cin!Another_Timer_Start] (0:0:0 - 1)
		IfNotBlocked
		reached[1][60] = 1;
		if (q_len(now.Another_Timer_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 26); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Another_Timer_cin, 0, 26, 1);
		{ boq = now.Another_Timer_cin; };
		_m = 2; goto P999; /* 0 */
	case 72: // STATE 61 - test.pml:885 - [Another_Timer_cout?Another_Timer_Running] (0:0:0 - 1)
		reached[1][61] = 1;
		if (boq != now.Another_Timer_cout) continue;
		if (q_len(now.Another_Timer_cout) == 0) continue;

		XX=1;
		if (25 != qrecv(now.Another_Timer_cout, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cout-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cout, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cout);
		sprintf(simtmp, "%d", 25); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cout))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 73: // STATE 62 - test.pml:885 - [Another_Timer_cin!Another_Timer_Running] (0:0:0 - 1)
		IfNotBlocked
		reached[1][62] = 1;
		if (q_len(now.Another_Timer_cin))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 25); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Another_Timer_cin, 0, 25, 1);
		{ boq = now.Another_Timer_cin; };
		_m = 2; goto P999; /* 0 */
	case 74: // STATE 66 - test.pml:888 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][66] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC controller */
	case 75: // STATE 1 - test.pml:97 - [Controller_State_cin?Controller_State_POS] (0:0:0 - 1)
		reached[0][1] = 1;
		if (boq != now.Controller_State_cin) continue;
		if (q_len(now.Controller_State_cin) == 0) continue;

		XX=1;
		if (43 != qrecv(now.Controller_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Controller_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Controller_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Controller_State_cin);
		sprintf(simtmp, "%d", 43); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Controller_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 76: // STATE 2 - test.pml:97 - [Controller_State = Controller_State_POS] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = now.Controller_State;
		now.Controller_State = 43;
#ifdef VAR_RANGES
		logval("Controller_State", now.Controller_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 77: // STATE 3 - test.pml:102 - [Controller_State_cin?Controller_State_Produce] (0:0:0 - 1)
		reached[0][3] = 1;
		if (boq != now.Controller_State_cin) continue;
		if (q_len(now.Controller_State_cin) == 0) continue;

		XX=1;
		if (42 != qrecv(now.Controller_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Controller_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Controller_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Controller_State_cin);
		sprintf(simtmp, "%d", 42); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Controller_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 78: // STATE 4 - test.pml:102 - [Controller_State = Controller_State_Produce] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = now.Controller_State;
		now.Controller_State = 42;
#ifdef VAR_RANGES
		logval("Controller_State", now.Controller_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 79: // STATE 5 - test.pml:107 - [Controller_State_cin?Controller_State_Another] (0:0:0 - 1)
		reached[0][5] = 1;
		if (boq != now.Controller_State_cin) continue;
		if (q_len(now.Controller_State_cin) == 0) continue;

		XX=1;
		if (41 != qrecv(now.Controller_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Controller_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Controller_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Controller_State_cin);
		sprintf(simtmp, "%d", 41); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Controller_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 80: // STATE 6 - test.pml:107 - [Controller_State = Controller_State_Another] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = now.Controller_State;
		now.Controller_State = 41;
#ifdef VAR_RANGES
		logval("Controller_State", now.Controller_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 81: // STATE 7 - test.pml:112 - [Controller_State_cin?Controller_State_Select] (0:0:0 - 1)
		reached[0][7] = 1;
		if (boq != now.Controller_State_cin) continue;
		if (q_len(now.Controller_State_cin) == 0) continue;

		XX=1;
		if (40 != qrecv(now.Controller_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Controller_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Controller_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Controller_State_cin);
		sprintf(simtmp, "%d", 40); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Controller_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 82: // STATE 8 - test.pml:112 - [Controller_State = Controller_State_Select] (0:0:1 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = now.Controller_State;
		now.Controller_State = 40;
#ifdef VAR_RANGES
		logval("Controller_State", now.Controller_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 83: // STATE 9 - test.pml:117 - [Controller_State_cin?Controller_State_Info] (0:0:0 - 1)
		reached[0][9] = 1;
		if (boq != now.Controller_State_cin) continue;
		if (q_len(now.Controller_State_cin) == 0) continue;

		XX=1;
		if (39 != qrecv(now.Controller_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Controller_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Controller_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Controller_State_cin);
		sprintf(simtmp, "%d", 39); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Controller_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 84: // STATE 10 - test.pml:117 - [Controller_State = Controller_State_Info] (0:0:1 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		(trpt+1)->bup.oval = now.Controller_State;
		now.Controller_State = 39;
#ifdef VAR_RANGES
		logval("Controller_State", now.Controller_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 85: // STATE 11 - test.pml:122 - [Coffee_Type_cin?Coffee_Type_Americano] (0:0:0 - 1)
		reached[0][11] = 1;
		if (boq != now.Coffee_Type_cin) continue;
		if (q_len(now.Coffee_Type_cin) == 0) continue;

		XX=1;
		if (38 != qrecv(now.Coffee_Type_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Type_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Type_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Type_cin);
		sprintf(simtmp, "%d", 38); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Type_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 86: // STATE 12 - test.pml:122 - [Coffee_Type = Coffee_Type_Americano] (0:0:1 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		(trpt+1)->bup.oval = now.Coffee_Type;
		now.Coffee_Type = 38;
#ifdef VAR_RANGES
		logval("Coffee_Type", now.Coffee_Type);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 87: // STATE 13 - test.pml:127 - [(((Coffee_Type==Coffee_Type_Americano)&&(Controller_State==Controller_State_Info)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!(((now.Coffee_Type==38)&&(now.Controller_State==39))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 88: // STATE 14 - test.pml:129 - [Milk_Counter_value = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 0;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 89: // STATE 15 - test.pml:130 - [Sugar_Counter_value = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 0;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 90: // STATE 16 - test.pml:131 - [Coffee_Counter_value = 7] (0:0:1 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 7;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 91: // STATE 19 - test.pml:137 - [Coffee_Type_cin?Coffee_Type_Espresso] (0:0:0 - 1)
		reached[0][19] = 1;
		if (boq != now.Coffee_Type_cin) continue;
		if (q_len(now.Coffee_Type_cin) == 0) continue;

		XX=1;
		if (37 != qrecv(now.Coffee_Type_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Type_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Type_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Type_cin);
		sprintf(simtmp, "%d", 37); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Type_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 92: // STATE 20 - test.pml:137 - [Coffee_Type = Coffee_Type_Espresso] (0:0:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.oval = now.Coffee_Type;
		now.Coffee_Type = 37;
#ifdef VAR_RANGES
		logval("Coffee_Type", now.Coffee_Type);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 93: // STATE 21 - test.pml:142 - [(((Coffee_Type==Coffee_Type_Espresso)&&(Controller_State==Controller_State_Info)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][21] = 1;
		if (!(((now.Coffee_Type==37)&&(now.Controller_State==39))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 94: // STATE 22 - test.pml:144 - [Milk_Counter_value = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 0;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 95: // STATE 23 - test.pml:145 - [Sugar_Counter_value = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][23] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 0;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 96: // STATE 24 - test.pml:146 - [Coffee_Counter_value = 7] (0:0:1 - 1)
		IfNotBlocked
		reached[0][24] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 7;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 97: // STATE 27 - test.pml:152 - [Coffee_Type_cin?Coffee_Type_Latte] (0:0:0 - 1)
		reached[0][27] = 1;
		if (boq != now.Coffee_Type_cin) continue;
		if (q_len(now.Coffee_Type_cin) == 0) continue;

		XX=1;
		if (36 != qrecv(now.Coffee_Type_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Type_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Type_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Type_cin);
		sprintf(simtmp, "%d", 36); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Type_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 98: // STATE 28 - test.pml:152 - [Coffee_Type = Coffee_Type_Latte] (0:0:1 - 1)
		IfNotBlocked
		reached[0][28] = 1;
		(trpt+1)->bup.oval = now.Coffee_Type;
		now.Coffee_Type = 36;
#ifdef VAR_RANGES
		logval("Coffee_Type", now.Coffee_Type);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 99: // STATE 29 - test.pml:157 - [(((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][29] = 1;
		if (!(((now.Coffee_Type==36)&&(now.Controller_State==39))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 100: // STATE 30 - test.pml:159 - [Milk_Counter_value = 5] (0:0:1 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 5;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 101: // STATE 31 - test.pml:160 - [Sugar_Counter_value = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[0][31] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 3;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 102: // STATE 32 - test.pml:161 - [Coffee_Counter_value = 5] (0:0:1 - 1)
		IfNotBlocked
		reached[0][32] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 5;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 103: // STATE 35 - test.pml:167 - [Coffee_Type_cin?Coffee_Type_Mocha] (0:0:0 - 1)
		reached[0][35] = 1;
		if (boq != now.Coffee_Type_cin) continue;
		if (q_len(now.Coffee_Type_cin) == 0) continue;

		XX=1;
		if (35 != qrecv(now.Coffee_Type_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Type_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Type_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Type_cin);
		sprintf(simtmp, "%d", 35); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Type_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 104: // STATE 36 - test.pml:167 - [Coffee_Type = Coffee_Type_Mocha] (0:0:1 - 1)
		IfNotBlocked
		reached[0][36] = 1;
		(trpt+1)->bup.oval = now.Coffee_Type;
		now.Coffee_Type = 35;
#ifdef VAR_RANGES
		logval("Coffee_Type", now.Coffee_Type);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 105: // STATE 37 - test.pml:172 - [(((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][37] = 1;
		if (!(((now.Coffee_Type==35)&&(now.Controller_State==39))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 106: // STATE 38 - test.pml:174 - [Milk_Counter_value = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[0][38] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 3;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 107: // STATE 39 - test.pml:175 - [Sugar_Counter_value = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[0][39] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 3;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 108: // STATE 40 - test.pml:176 - [Coffee_Counter_value = 4] (0:0:1 - 1)
		IfNotBlocked
		reached[0][40] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 4;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 109: // STATE 43 - test.pml:182 - [Sugar_Counter_cin?Sugar_Counter_Inc] (0:0:0 - 1)
		reached[0][43] = 1;
		if (boq != now.Sugar_Counter_cin) continue;
		if (q_len(now.Sugar_Counter_cin) == 0) continue;

		XX=1;
		if (34 != qrecv(now.Sugar_Counter_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Sugar_Counter_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Sugar_Counter_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Sugar_Counter_cin);
		sprintf(simtmp, "%d", 34); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Sugar_Counter_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 110: // STATE 44 - test.pml:182 - [Sugar_Counter = Sugar_Counter_Inc] (0:0:1 - 1)
		IfNotBlocked
		reached[0][44] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter;
		now.Sugar_Counter = 34;
#ifdef VAR_RANGES
		logval("Sugar_Counter", now.Sugar_Counter);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 111: // STATE 45 - test.pml:186 - [(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][45] = 1;
		if (!(((now.Sugar_Counter==34)&&(now.Sugar_Counter_value==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 112: // STATE 46 - test.pml:188 - [Sugar_Counter_value = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][46] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 1;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 113: // STATE 47 - test.pml:191 - [(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][47] = 1;
		if (!(((now.Sugar_Counter==34)&&(now.Sugar_Counter_value==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 114: // STATE 48 - test.pml:193 - [Sugar_Counter_value = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[0][48] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 2;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 115: // STATE 49 - test.pml:196 - [(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][49] = 1;
		if (!(((now.Sugar_Counter==34)&&(now.Sugar_Counter_value==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 116: // STATE 50 - test.pml:198 - [Sugar_Counter_value = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[0][50] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 3;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 117: // STATE 51 - test.pml:201 - [(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==3)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][51] = 1;
		if (!(((now.Sugar_Counter==34)&&(now.Sugar_Counter_value==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 118: // STATE 52 - test.pml:203 - [Sugar_Counter_value = 4] (0:0:1 - 1)
		IfNotBlocked
		reached[0][52] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 4;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 119: // STATE 53 - test.pml:206 - [(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==4)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][53] = 1;
		if (!(((now.Sugar_Counter==34)&&(now.Sugar_Counter_value==4))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 120: // STATE 54 - test.pml:208 - [Sugar_Counter_value = 5] (0:0:1 - 1)
		IfNotBlocked
		reached[0][54] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 5;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 121: // STATE 55 - test.pml:211 - [(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==5)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][55] = 1;
		if (!(((now.Sugar_Counter==34)&&(now.Sugar_Counter_value==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 122: // STATE 56 - test.pml:213 - [Sugar_Counter_value = 6] (0:0:1 - 1)
		IfNotBlocked
		reached[0][56] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 6;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 123: // STATE 57 - test.pml:216 - [(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==6)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][57] = 1;
		if (!(((now.Sugar_Counter==34)&&(now.Sugar_Counter_value==6))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 124: // STATE 58 - test.pml:218 - [Sugar_Counter_value = 7] (0:0:1 - 1)
		IfNotBlocked
		reached[0][58] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 7;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 125: // STATE 61 - test.pml:224 - [Sugar_Counter_cin?Sugar_Counter_Dec] (0:0:0 - 1)
		reached[0][61] = 1;
		if (boq != now.Sugar_Counter_cin) continue;
		if (q_len(now.Sugar_Counter_cin) == 0) continue;

		XX=1;
		if (33 != qrecv(now.Sugar_Counter_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Sugar_Counter_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Sugar_Counter_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Sugar_Counter_cin);
		sprintf(simtmp, "%d", 33); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Sugar_Counter_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 126: // STATE 62 - test.pml:224 - [Sugar_Counter = Sugar_Counter_Dec] (0:0:1 - 1)
		IfNotBlocked
		reached[0][62] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter;
		now.Sugar_Counter = 33;
#ifdef VAR_RANGES
		logval("Sugar_Counter", now.Sugar_Counter);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 127: // STATE 63 - test.pml:228 - [(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][63] = 1;
		if (!(((now.Sugar_Counter==33)&&(now.Sugar_Counter_value==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 128: // STATE 64 - test.pml:230 - [Sugar_Counter_value = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][64] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 0;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 129: // STATE 65 - test.pml:233 - [(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][65] = 1;
		if (!(((now.Sugar_Counter==33)&&(now.Sugar_Counter_value==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 130: // STATE 66 - test.pml:235 - [Sugar_Counter_value = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][66] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 1;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 131: // STATE 67 - test.pml:238 - [(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==3)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][67] = 1;
		if (!(((now.Sugar_Counter==33)&&(now.Sugar_Counter_value==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 132: // STATE 68 - test.pml:240 - [Sugar_Counter_value = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[0][68] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 2;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 133: // STATE 69 - test.pml:243 - [(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==4)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][69] = 1;
		if (!(((now.Sugar_Counter==33)&&(now.Sugar_Counter_value==4))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 134: // STATE 70 - test.pml:245 - [Sugar_Counter_value = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[0][70] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 3;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 135: // STATE 71 - test.pml:248 - [(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==5)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][71] = 1;
		if (!(((now.Sugar_Counter==33)&&(now.Sugar_Counter_value==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 136: // STATE 72 - test.pml:250 - [Sugar_Counter_value = 4] (0:0:1 - 1)
		IfNotBlocked
		reached[0][72] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 4;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 137: // STATE 73 - test.pml:253 - [(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==6)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][73] = 1;
		if (!(((now.Sugar_Counter==33)&&(now.Sugar_Counter_value==6))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 138: // STATE 74 - test.pml:255 - [Sugar_Counter_value = 5] (0:0:1 - 1)
		IfNotBlocked
		reached[0][74] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 5;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 139: // STATE 75 - test.pml:258 - [(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==7)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][75] = 1;
		if (!(((now.Sugar_Counter==33)&&(now.Sugar_Counter_value==7))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 140: // STATE 76 - test.pml:260 - [Sugar_Counter_value = 6] (0:0:1 - 1)
		IfNotBlocked
		reached[0][76] = 1;
		(trpt+1)->bup.oval = now.Sugar_Counter_value;
		now.Sugar_Counter_value = 6;
#ifdef VAR_RANGES
		logval("Sugar_Counter_value", now.Sugar_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 141: // STATE 79 - test.pml:266 - [Milk_Counter_cin?Milk_Counter_Dec] (0:0:0 - 1)
		reached[0][79] = 1;
		if (boq != now.Milk_Counter_cin) continue;
		if (q_len(now.Milk_Counter_cin) == 0) continue;

		XX=1;
		if (32 != qrecv(now.Milk_Counter_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Milk_Counter_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Milk_Counter_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Milk_Counter_cin);
		sprintf(simtmp, "%d", 32); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Milk_Counter_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 142: // STATE 80 - test.pml:266 - [Milk_Counter = Milk_Counter_Dec] (0:0:1 - 1)
		IfNotBlocked
		reached[0][80] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter;
		now.Milk_Counter = 32;
#ifdef VAR_RANGES
		logval("Milk_Counter", now.Milk_Counter);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 143: // STATE 81 - test.pml:270 - [(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][81] = 1;
		if (!(((now.Milk_Counter==32)&&(now.Milk_Counter_value==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 144: // STATE 82 - test.pml:272 - [Milk_Counter_value = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][82] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 0;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 145: // STATE 83 - test.pml:275 - [(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][83] = 1;
		if (!(((now.Milk_Counter==32)&&(now.Milk_Counter_value==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 146: // STATE 84 - test.pml:277 - [Milk_Counter_value = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][84] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 1;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 147: // STATE 85 - test.pml:280 - [(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==3)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][85] = 1;
		if (!(((now.Milk_Counter==32)&&(now.Milk_Counter_value==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 148: // STATE 86 - test.pml:282 - [Milk_Counter_value = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[0][86] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 2;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 149: // STATE 87 - test.pml:285 - [(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==4)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][87] = 1;
		if (!(((now.Milk_Counter==32)&&(now.Milk_Counter_value==4))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 150: // STATE 88 - test.pml:287 - [Milk_Counter_value = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[0][88] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 3;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 151: // STATE 89 - test.pml:290 - [(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==5)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][89] = 1;
		if (!(((now.Milk_Counter==32)&&(now.Milk_Counter_value==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 152: // STATE 90 - test.pml:292 - [Milk_Counter_value = 4] (0:0:1 - 1)
		IfNotBlocked
		reached[0][90] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 4;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 153: // STATE 91 - test.pml:295 - [(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==6)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][91] = 1;
		if (!(((now.Milk_Counter==32)&&(now.Milk_Counter_value==6))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 154: // STATE 92 - test.pml:297 - [Milk_Counter_value = 5] (0:0:1 - 1)
		IfNotBlocked
		reached[0][92] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 5;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 155: // STATE 93 - test.pml:300 - [(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==7)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][93] = 1;
		if (!(((now.Milk_Counter==32)&&(now.Milk_Counter_value==7))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 156: // STATE 94 - test.pml:302 - [Milk_Counter_value = 6] (0:0:1 - 1)
		IfNotBlocked
		reached[0][94] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 6;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 157: // STATE 97 - test.pml:308 - [Milk_Counter_cin?Milk_Counter_Inc] (0:0:0 - 1)
		reached[0][97] = 1;
		if (boq != now.Milk_Counter_cin) continue;
		if (q_len(now.Milk_Counter_cin) == 0) continue;

		XX=1;
		if (31 != qrecv(now.Milk_Counter_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Milk_Counter_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Milk_Counter_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Milk_Counter_cin);
		sprintf(simtmp, "%d", 31); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Milk_Counter_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 158: // STATE 98 - test.pml:308 - [Milk_Counter = Milk_Counter_Inc] (0:0:1 - 1)
		IfNotBlocked
		reached[0][98] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter;
		now.Milk_Counter = 31;
#ifdef VAR_RANGES
		logval("Milk_Counter", now.Milk_Counter);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 159: // STATE 99 - test.pml:312 - [(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][99] = 1;
		if (!(((now.Milk_Counter==31)&&(now.Milk_Counter_value==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 160: // STATE 100 - test.pml:314 - [Milk_Counter_value = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][100] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 1;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 161: // STATE 101 - test.pml:317 - [(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][101] = 1;
		if (!(((now.Milk_Counter==31)&&(now.Milk_Counter_value==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 162: // STATE 102 - test.pml:319 - [Milk_Counter_value = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[0][102] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 2;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 163: // STATE 103 - test.pml:322 - [(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][103] = 1;
		if (!(((now.Milk_Counter==31)&&(now.Milk_Counter_value==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 164: // STATE 104 - test.pml:324 - [Milk_Counter_value = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[0][104] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 3;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 165: // STATE 105 - test.pml:327 - [(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==3)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][105] = 1;
		if (!(((now.Milk_Counter==31)&&(now.Milk_Counter_value==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 166: // STATE 106 - test.pml:329 - [Milk_Counter_value = 4] (0:0:1 - 1)
		IfNotBlocked
		reached[0][106] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 4;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 167: // STATE 107 - test.pml:332 - [(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==4)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][107] = 1;
		if (!(((now.Milk_Counter==31)&&(now.Milk_Counter_value==4))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 168: // STATE 108 - test.pml:334 - [Milk_Counter_value = 5] (0:0:1 - 1)
		IfNotBlocked
		reached[0][108] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 5;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 169: // STATE 109 - test.pml:337 - [(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==5)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][109] = 1;
		if (!(((now.Milk_Counter==31)&&(now.Milk_Counter_value==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 170: // STATE 110 - test.pml:339 - [Milk_Counter_value = 6] (0:0:1 - 1)
		IfNotBlocked
		reached[0][110] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 6;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 171: // STATE 111 - test.pml:342 - [(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==6)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][111] = 1;
		if (!(((now.Milk_Counter==31)&&(now.Milk_Counter_value==6))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 172: // STATE 112 - test.pml:344 - [Milk_Counter_value = 7] (0:0:1 - 1)
		IfNotBlocked
		reached[0][112] = 1;
		(trpt+1)->bup.oval = now.Milk_Counter_value;
		now.Milk_Counter_value = 7;
#ifdef VAR_RANGES
		logval("Milk_Counter_value", now.Milk_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 173: // STATE 115 - test.pml:350 - [Coffee_Counter_cin?Coffee_Counter_Dec] (0:0:0 - 1)
		reached[0][115] = 1;
		if (boq != now.Coffee_Counter_cin) continue;
		if (q_len(now.Coffee_Counter_cin) == 0) continue;

		XX=1;
		if (30 != qrecv(now.Coffee_Counter_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Counter_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Counter_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Counter_cin);
		sprintf(simtmp, "%d", 30); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Counter_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 174: // STATE 116 - test.pml:350 - [Coffee_Counter = Coffee_Counter_Dec] (0:0:1 - 1)
		IfNotBlocked
		reached[0][116] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter;
		now.Coffee_Counter = 30;
#ifdef VAR_RANGES
		logval("Coffee_Counter", now.Coffee_Counter);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 175: // STATE 117 - test.pml:354 - [(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][117] = 1;
		if (!(((now.Coffee_Counter==30)&&(now.Coffee_Counter_value==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 176: // STATE 118 - test.pml:356 - [Coffee_Counter_value = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][118] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 0;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 177: // STATE 119 - test.pml:359 - [(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][119] = 1;
		if (!(((now.Coffee_Counter==30)&&(now.Coffee_Counter_value==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 178: // STATE 120 - test.pml:361 - [Coffee_Counter_value = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][120] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 1;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 179: // STATE 121 - test.pml:364 - [(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==3)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][121] = 1;
		if (!(((now.Coffee_Counter==30)&&(now.Coffee_Counter_value==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 180: // STATE 122 - test.pml:366 - [Coffee_Counter_value = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[0][122] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 2;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 181: // STATE 123 - test.pml:369 - [(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==4)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][123] = 1;
		if (!(((now.Coffee_Counter==30)&&(now.Coffee_Counter_value==4))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 182: // STATE 124 - test.pml:371 - [Coffee_Counter_value = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[0][124] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 3;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 183: // STATE 125 - test.pml:374 - [(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==5)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][125] = 1;
		if (!(((now.Coffee_Counter==30)&&(now.Coffee_Counter_value==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 184: // STATE 126 - test.pml:376 - [Coffee_Counter_value = 4] (0:0:1 - 1)
		IfNotBlocked
		reached[0][126] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 4;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 185: // STATE 127 - test.pml:379 - [(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==6)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][127] = 1;
		if (!(((now.Coffee_Counter==30)&&(now.Coffee_Counter_value==6))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 186: // STATE 128 - test.pml:381 - [Coffee_Counter_value = 5] (0:0:1 - 1)
		IfNotBlocked
		reached[0][128] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 5;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 187: // STATE 129 - test.pml:384 - [(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==7)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][129] = 1;
		if (!(((now.Coffee_Counter==30)&&(now.Coffee_Counter_value==7))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 188: // STATE 130 - test.pml:386 - [Coffee_Counter_value = 6] (0:0:1 - 1)
		IfNotBlocked
		reached[0][130] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 6;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 189: // STATE 133 - test.pml:392 - [Coffee_Counter_cin?Coffee_Counter_Inc] (0:0:0 - 1)
		reached[0][133] = 1;
		if (boq != now.Coffee_Counter_cin) continue;
		if (q_len(now.Coffee_Counter_cin) == 0) continue;

		XX=1;
		if (29 != qrecv(now.Coffee_Counter_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Coffee_Counter_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Coffee_Counter_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Coffee_Counter_cin);
		sprintf(simtmp, "%d", 29); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Coffee_Counter_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 190: // STATE 134 - test.pml:392 - [Coffee_Counter = Coffee_Counter_Inc] (0:0:1 - 1)
		IfNotBlocked
		reached[0][134] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter;
		now.Coffee_Counter = 29;
#ifdef VAR_RANGES
		logval("Coffee_Counter", now.Coffee_Counter);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 191: // STATE 135 - test.pml:396 - [(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][135] = 1;
		if (!(((now.Coffee_Counter==29)&&(now.Coffee_Counter_value==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 192: // STATE 136 - test.pml:398 - [Coffee_Counter_value = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][136] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 1;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 193: // STATE 137 - test.pml:401 - [(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][137] = 1;
		if (!(((now.Coffee_Counter==29)&&(now.Coffee_Counter_value==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 194: // STATE 138 - test.pml:403 - [Coffee_Counter_value = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[0][138] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 2;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 195: // STATE 139 - test.pml:406 - [(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][139] = 1;
		if (!(((now.Coffee_Counter==29)&&(now.Coffee_Counter_value==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 196: // STATE 140 - test.pml:408 - [Coffee_Counter_value = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[0][140] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 3;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 197: // STATE 141 - test.pml:411 - [(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==3)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][141] = 1;
		if (!(((now.Coffee_Counter==29)&&(now.Coffee_Counter_value==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 198: // STATE 142 - test.pml:413 - [Coffee_Counter_value = 4] (0:0:1 - 1)
		IfNotBlocked
		reached[0][142] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 4;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 199: // STATE 143 - test.pml:416 - [(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==4)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][143] = 1;
		if (!(((now.Coffee_Counter==29)&&(now.Coffee_Counter_value==4))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 200: // STATE 144 - test.pml:418 - [Coffee_Counter_value = 5] (0:0:1 - 1)
		IfNotBlocked
		reached[0][144] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 5;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 201: // STATE 145 - test.pml:421 - [(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==5)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][145] = 1;
		if (!(((now.Coffee_Counter==29)&&(now.Coffee_Counter_value==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 202: // STATE 146 - test.pml:423 - [Coffee_Counter_value = 6] (0:0:1 - 1)
		IfNotBlocked
		reached[0][146] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 6;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 203: // STATE 147 - test.pml:426 - [(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==6)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][147] = 1;
		if (!(((now.Coffee_Counter==29)&&(now.Coffee_Counter_value==6))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 204: // STATE 148 - test.pml:428 - [Coffee_Counter_value = 7] (0:0:1 - 1)
		IfNotBlocked
		reached[0][148] = 1;
		(trpt+1)->bup.oval = now.Coffee_Counter_value;
		now.Coffee_Counter_value = 7;
#ifdef VAR_RANGES
		logval("Coffee_Counter_value", now.Coffee_Counter_value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 205: // STATE 151 - test.pml:434 - [Another_Timer_cin?Another_Timer_Timeout] (0:0:0 - 1)
		reached[0][151] = 1;
		if (boq != now.Another_Timer_cin) continue;
		if (q_len(now.Another_Timer_cin) == 0) continue;

		XX=1;
		if (28 != qrecv(now.Another_Timer_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 28); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 206: // STATE 152 - test.pml:434 - [Another_Timer = Another_Timer_Timeout] (0:0:1 - 1)
		IfNotBlocked
		reached[0][152] = 1;
		(trpt+1)->bup.oval = now.Another_Timer;
		now.Another_Timer = 28;
#ifdef VAR_RANGES
		logval("Another_Timer", now.Another_Timer);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 207: // STATE 153 - test.pml:439 - [(((Controller_State==Controller_State_Another)&&(Another_Timer==Another_Timer_Timeout)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][153] = 1;
		if (!(((now.Controller_State==41)&&(now.Another_Timer==28))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 208: // STATE 154 - test.pml:441 - [Controller_State_cout!Controller_State_Select] (0:0:0 - 1)
		IfNotBlocked
		reached[0][154] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 40); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 40, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 209: // STATE 155 - test.pml:444 - [((Another_Timer==Another_Timer_Timeout))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][155] = 1;
		if (!((now.Another_Timer==28)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 210: // STATE 156 - test.pml:446 - [Another_Timer_cout!Another_Timer_Stop] (0:0:0 - 1)
		IfNotBlocked
		reached[0][156] = 1;
		if (q_len(now.Another_Timer_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Another_Timer_cout);
		sprintf(simtmp, "%d", 27); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Another_Timer_cout, 0, 27, 1);
		{ boq = now.Another_Timer_cout; };
		_m = 2; goto P999; /* 0 */
	case 211: // STATE 159 - test.pml:452 - [Another_Timer_cin?Another_Timer_Stop] (0:0:0 - 1)
		reached[0][159] = 1;
		if (boq != now.Another_Timer_cin) continue;
		if (q_len(now.Another_Timer_cin) == 0) continue;

		XX=1;
		if (27 != qrecv(now.Another_Timer_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 27); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 212: // STATE 160 - test.pml:452 - [Another_Timer = Another_Timer_Stop] (0:0:1 - 1)
		IfNotBlocked
		reached[0][160] = 1;
		(trpt+1)->bup.oval = now.Another_Timer;
		now.Another_Timer = 27;
#ifdef VAR_RANGES
		logval("Another_Timer", now.Another_Timer);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 213: // STATE 161 - test.pml:457 - [Another_Timer_cin?Another_Timer_Start] (0:0:0 - 1)
		reached[0][161] = 1;
		if (boq != now.Another_Timer_cin) continue;
		if (q_len(now.Another_Timer_cin) == 0) continue;

		XX=1;
		if (26 != qrecv(now.Another_Timer_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 26); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 214: // STATE 162 - test.pml:457 - [Another_Timer = Another_Timer_Start] (0:0:1 - 1)
		IfNotBlocked
		reached[0][162] = 1;
		(trpt+1)->bup.oval = now.Another_Timer;
		now.Another_Timer = 26;
#ifdef VAR_RANGES
		logval("Another_Timer", now.Another_Timer);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 215: // STATE 163 - test.pml:461 - [((Another_Timer==Another_Timer_Start))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][163] = 1;
		if (!((now.Another_Timer==26)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 216: // STATE 164 - test.pml:463 - [Another_Timer_cout!Another_Timer_Running] (0:0:0 - 1)
		IfNotBlocked
		reached[0][164] = 1;
		if (q_len(now.Another_Timer_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Another_Timer_cout);
		sprintf(simtmp, "%d", 25); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Another_Timer_cout, 0, 25, 1);
		{ boq = now.Another_Timer_cout; };
		_m = 2; goto P999; /* 0 */
	case 217: // STATE 167 - test.pml:469 - [Another_Timer_cin?Another_Timer_Running] (0:0:0 - 1)
		reached[0][167] = 1;
		if (boq != now.Another_Timer_cin) continue;
		if (q_len(now.Another_Timer_cin) == 0) continue;

		XX=1;
		if (25 != qrecv(now.Another_Timer_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Another_Timer_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Another_Timer_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Another_Timer_cin);
		sprintf(simtmp, "%d", 25); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Another_Timer_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 218: // STATE 168 - test.pml:469 - [Another_Timer = Another_Timer_Running] (0:0:1 - 1)
		IfNotBlocked
		reached[0][168] = 1;
		(trpt+1)->bup.oval = now.Another_Timer;
		now.Another_Timer = 25;
#ifdef VAR_RANGES
		logval("Another_Timer", now.Another_Timer);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 219: // STATE 169 - test.pml:474 - [Producer_State_cin?Producer_State_Take] (0:0:0 - 1)
		reached[0][169] = 1;
		if (boq != now.Producer_State_cin) continue;
		if (q_len(now.Producer_State_cin) == 0) continue;

		XX=1;
		if (24 != qrecv(now.Producer_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Producer_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Producer_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Producer_State_cin);
		sprintf(simtmp, "%d", 24); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Producer_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 220: // STATE 170 - test.pml:474 - [Producer_State = Producer_State_Take] (0:0:1 - 1)
		IfNotBlocked
		reached[0][170] = 1;
		(trpt+1)->bup.oval = now.Producer_State;
		now.Producer_State = 24;
#ifdef VAR_RANGES
		logval("Producer_State", now.Producer_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 221: // STATE 171 - test.pml:478 - [((Producer_State==Producer_State_Take))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][171] = 1;
		if (!((now.Producer_State==24)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 222: // STATE 172 - test.pml:480 - [Controller_State_cout!Controller_State_Another] (0:0:0 - 1)
		IfNotBlocked
		reached[0][172] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 41); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 41, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 223: // STATE 175 - test.pml:486 - [Producer_State_cin?Producer_State_Producing] (0:0:0 - 1)
		reached[0][175] = 1;
		if (boq != now.Producer_State_cin) continue;
		if (q_len(now.Producer_State_cin) == 0) continue;

		XX=1;
		if (23 != qrecv(now.Producer_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Producer_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Producer_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Producer_State_cin);
		sprintf(simtmp, "%d", 23); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Producer_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 224: // STATE 176 - test.pml:486 - [Producer_State = Producer_State_Producing] (0:0:1 - 1)
		IfNotBlocked
		reached[0][176] = 1;
		(trpt+1)->bup.oval = now.Producer_State;
		now.Producer_State = 23;
#ifdef VAR_RANGES
		logval("Producer_State", now.Producer_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 225: // STATE 177 - test.pml:491 - [Producer_State_cin?Producer_State_Produced] (0:0:0 - 1)
		reached[0][177] = 1;
		if (boq != now.Producer_State_cin) continue;
		if (q_len(now.Producer_State_cin) == 0) continue;

		XX=1;
		if (22 != qrecv(now.Producer_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Producer_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Producer_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Producer_State_cin);
		sprintf(simtmp, "%d", 22); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Producer_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 226: // STATE 178 - test.pml:491 - [Producer_State = Producer_State_Produced] (0:0:1 - 1)
		IfNotBlocked
		reached[0][178] = 1;
		(trpt+1)->bup.oval = now.Producer_State;
		now.Producer_State = 22;
#ifdef VAR_RANGES
		logval("Producer_State", now.Producer_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 227: // STATE 179 - test.pml:496 - [POS_State_cin?POS_State_Paid] (0:0:0 - 1)
		reached[0][179] = 1;
		if (boq != now.POS_State_cin) continue;
		if (q_len(now.POS_State_cin) == 0) continue;

		XX=1;
		if (21 != qrecv(now.POS_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.POS_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.POS_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.POS_State_cin);
		sprintf(simtmp, "%d", 21); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.POS_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 228: // STATE 180 - test.pml:496 - [POS_State = POS_State_Paid] (0:0:1 - 1)
		IfNotBlocked
		reached[0][180] = 1;
		(trpt+1)->bup.oval = now.POS_State;
		now.POS_State = 21;
#ifdef VAR_RANGES
		logval("POS_State", now.POS_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 229: // STATE 181 - test.pml:501 - [(((Controller_State==Controller_State_POS)&&(POS_State==POS_State_Paid)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][181] = 1;
		if (!(((now.Controller_State==43)&&(now.POS_State==21))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 230: // STATE 182 - test.pml:503 - [Controller_State_cout!Controller_State_Produce] (0:0:0 - 1)
		IfNotBlocked
		reached[0][182] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 42); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 42, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 231: // STATE 185 - test.pml:509 - [POS_State_cin?POS_State_Idle] (0:0:0 - 1)
		reached[0][185] = 1;
		if (boq != now.POS_State_cin) continue;
		if (q_len(now.POS_State_cin) == 0) continue;

		XX=1;
		if (20 != qrecv(now.POS_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.POS_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.POS_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.POS_State_cin);
		sprintf(simtmp, "%d", 20); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.POS_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 232: // STATE 186 - test.pml:509 - [POS_State = POS_State_Idle] (0:0:1 - 1)
		IfNotBlocked
		reached[0][186] = 1;
		(trpt+1)->bup.oval = now.POS_State;
		now.POS_State = 20;
#ifdef VAR_RANGES
		logval("POS_State", now.POS_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 233: // STATE 187 - test.pml:514 - [POS_State_cin?POS_State_Failed] (0:0:0 - 1)
		reached[0][187] = 1;
		if (boq != now.POS_State_cin) continue;
		if (q_len(now.POS_State_cin) == 0) continue;

		XX=1;
		if (19 != qrecv(now.POS_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.POS_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.POS_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.POS_State_cin);
		sprintf(simtmp, "%d", 19); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.POS_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 234: // STATE 188 - test.pml:514 - [POS_State = POS_State_Failed] (0:0:1 - 1)
		IfNotBlocked
		reached[0][188] = 1;
		(trpt+1)->bup.oval = now.POS_State;
		now.POS_State = 19;
#ifdef VAR_RANGES
		logval("POS_State", now.POS_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 235: // STATE 189 - test.pml:519 - [(((Controller_State==Controller_State_POS)&&(POS_State==POS_State_Failed)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][189] = 1;
		if (!(((now.Controller_State==43)&&(now.POS_State==19))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 236: // STATE 190 - test.pml:521 - [Controller_State_cout!Controller_State_Select] (0:0:0 - 1)
		IfNotBlocked
		reached[0][190] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 40); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 40, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 237: // STATE 193 - test.pml:527 - [POS_State_cin?POS_State_Working] (0:0:0 - 1)
		reached[0][193] = 1;
		if (boq != now.POS_State_cin) continue;
		if (q_len(now.POS_State_cin) == 0) continue;

		XX=1;
		if (18 != qrecv(now.POS_State_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.POS_State_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.POS_State_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.POS_State_cin);
		sprintf(simtmp, "%d", 18); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.POS_State_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 238: // STATE 194 - test.pml:527 - [POS_State = POS_State_Working] (0:0:1 - 1)
		IfNotBlocked
		reached[0][194] = 1;
		(trpt+1)->bup.oval = now.POS_State;
		now.POS_State = 18;
#ifdef VAR_RANGES
		logval("POS_State", now.POS_State);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 239: // STATE 195 - test.pml:532 - [Action_cin?Action_Take] (0:0:0 - 1)
		reached[0][195] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (17 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 17); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 240: // STATE 196 - test.pml:532 - [Action = Action_Take] (0:0:1 - 1)
		IfNotBlocked
		reached[0][196] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 17;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 241: // STATE 197 - test.pml:537 - [Action_cin?Action_Select_Mocha] (0:0:0 - 1)
		reached[0][197] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (16 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 16); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 242: // STATE 198 - test.pml:537 - [Action = Action_Select_Mocha] (0:0:1 - 1)
		IfNotBlocked
		reached[0][198] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 16;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 243: // STATE 199 - test.pml:542 - [(((Controller_State==Controller_State_Select)&&(Action==Action_Select_Mocha)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][199] = 1;
		if (!(((now.Controller_State==40)&&(now.Action==16))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 244: // STATE 200 - test.pml:544 - [Coffee_Type_cout!Coffee_Type_Mocha] (0:0:0 - 1)
		IfNotBlocked
		reached[0][200] = 1;
		if (q_len(now.Coffee_Type_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Type_cout);
		sprintf(simtmp, "%d", 35); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Type_cout, 0, 35, 1);
		{ boq = now.Coffee_Type_cout; };
		_m = 2; goto P999; /* 0 */
	case 245: // STATE 201 - test.pml:545 - [Controller_State_cout!Controller_State_Info] (0:0:0 - 1)
		IfNotBlocked
		reached[0][201] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 39); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 39, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 246: // STATE 204 - test.pml:551 - [Action_cin?Action_POS_Failed] (0:0:0 - 1)
		reached[0][204] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (15 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 15); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 247: // STATE 205 - test.pml:551 - [Action = Action_POS_Failed] (0:0:1 - 1)
		IfNotBlocked
		reached[0][205] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 15;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 248: // STATE 206 - test.pml:556 - [Action_cin?Action_Another_Yes] (0:0:0 - 1)
		reached[0][206] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (14 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 14); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 249: // STATE 207 - test.pml:556 - [Action = Action_Another_Yes] (0:0:1 - 1)
		IfNotBlocked
		reached[0][207] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 14;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 250: // STATE 208 - test.pml:561 - [(((Controller_State==Controller_State_Another)&&(Action==Action_Another_Yes)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][208] = 1;
		if (!(((now.Controller_State==41)&&(now.Action==14))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 251: // STATE 209 - test.pml:563 - [Controller_State_cout!Controller_State_Info] (0:0:0 - 1)
		IfNotBlocked
		reached[0][209] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 39); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 39, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 252: // STATE 210 - test.pml:564 - [Another_Timer_cout!Another_Timer_Start] (0:0:0 - 1)
		IfNotBlocked
		reached[0][210] = 1;
		if (q_len(now.Another_Timer_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Another_Timer_cout);
		sprintf(simtmp, "%d", 26); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Another_Timer_cout, 0, 26, 1);
		{ boq = now.Another_Timer_cout; };
		_m = 2; goto P999; /* 0 */
	case 253: // STATE 213 - test.pml:570 - [Action_cin?Action_POS_Paid] (0:0:0 - 1)
		reached[0][213] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (13 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 13); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 254: // STATE 214 - test.pml:570 - [Action = Action_POS_Paid] (0:0:1 - 1)
		IfNotBlocked
		reached[0][214] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 13;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 255: // STATE 215 - test.pml:575 - [Action_cin?Action_Produce_Ok] (0:0:0 - 1)
		reached[0][215] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (12 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 12); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 256: // STATE 216 - test.pml:575 - [Action = Action_Produce_Ok] (0:0:1 - 1)
		IfNotBlocked
		reached[0][216] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 12;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 257: // STATE 217 - test.pml:580 - [(((Controller_State==Controller_State_Info)&&(Action==Action_Produce_Ok)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][217] = 1;
		if (!(((now.Controller_State==39)&&(now.Action==12))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 258: // STATE 218 - test.pml:582 - [Controller_State_cout!Controller_State_POS] (0:0:0 - 1)
		IfNotBlocked
		reached[0][218] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 43); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 43, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 259: // STATE 221 - test.pml:588 - [Action_cin?Action_Produce_Cancel] (0:0:0 - 1)
		reached[0][221] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (11 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 11); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 260: // STATE 222 - test.pml:588 - [Action = Action_Produce_Cancel] (0:0:1 - 1)
		IfNotBlocked
		reached[0][222] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 11;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 261: // STATE 223 - test.pml:593 - [(((Controller_State==Controller_State_Info)&&(Action==Action_Produce_Cancel)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][223] = 1;
		if (!(((now.Controller_State==39)&&(now.Action==11))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 262: // STATE 224 - test.pml:595 - [Controller_State_cout!Controller_State_Select] (0:0:0 - 1)
		IfNotBlocked
		reached[0][224] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 40); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 40, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 263: // STATE 227 - test.pml:601 - [Action_cin?Action_Inc_Coffee] (0:0:0 - 1)
		reached[0][227] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (10 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 10); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 264: // STATE 228 - test.pml:601 - [Action = Action_Inc_Coffee] (0:0:1 - 1)
		IfNotBlocked
		reached[0][228] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 10;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 265: // STATE 229 - test.pml:607 - [((((Coffee_Type==Coffee_Type_Espresso)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Coffee)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][229] = 1;
		if (!((((now.Coffee_Type==37)&&(now.Controller_State==39))&&(now.Action==10))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 266: // STATE 230 - test.pml:609 - [Coffee_Counter_cout!Coffee_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[0][230] = 1;
		if (q_len(now.Coffee_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Counter_cout);
		sprintf(simtmp, "%d", 29); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Counter_cout, 0, 29, 1);
		{ boq = now.Coffee_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 267: // STATE 231 - test.pml:614 - [((((Coffee_Type==Coffee_Type_Americano)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Coffee)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][231] = 1;
		if (!((((now.Coffee_Type==38)&&(now.Controller_State==39))&&(now.Action==10))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 268: // STATE 232 - test.pml:616 - [Coffee_Counter_cout!Coffee_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[0][232] = 1;
		if (q_len(now.Coffee_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Counter_cout);
		sprintf(simtmp, "%d", 29); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Counter_cout, 0, 29, 1);
		{ boq = now.Coffee_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 269: // STATE 233 - test.pml:621 - [((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Coffee)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][233] = 1;
		if (!((((now.Coffee_Type==36)&&(now.Controller_State==39))&&(now.Action==10))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 270: // STATE 234 - test.pml:623 - [Coffee_Counter_cout!Coffee_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[0][234] = 1;
		if (q_len(now.Coffee_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Counter_cout);
		sprintf(simtmp, "%d", 29); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Counter_cout, 0, 29, 1);
		{ boq = now.Coffee_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 271: // STATE 235 - test.pml:628 - [((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Coffee)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][235] = 1;
		if (!((((now.Coffee_Type==35)&&(now.Controller_State==39))&&(now.Action==10))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 272: // STATE 236 - test.pml:630 - [Coffee_Counter_cout!Coffee_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[0][236] = 1;
		if (q_len(now.Coffee_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Counter_cout);
		sprintf(simtmp, "%d", 29); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Counter_cout, 0, 29, 1);
		{ boq = now.Coffee_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 273: // STATE 239 - test.pml:636 - [Action_cin?Action_Select_Espresso] (0:0:0 - 1)
		reached[0][239] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (9 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 9); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 274: // STATE 240 - test.pml:636 - [Action = Action_Select_Espresso] (0:0:1 - 1)
		IfNotBlocked
		reached[0][240] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 9;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 275: // STATE 241 - test.pml:641 - [(((Controller_State==Controller_State_Select)&&(Action==Action_Select_Espresso)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][241] = 1;
		if (!(((now.Controller_State==40)&&(now.Action==9))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 276: // STATE 242 - test.pml:643 - [Coffee_Type_cout!Coffee_Type_Espresso] (0:0:0 - 1)
		IfNotBlocked
		reached[0][242] = 1;
		if (q_len(now.Coffee_Type_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Type_cout);
		sprintf(simtmp, "%d", 37); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Type_cout, 0, 37, 1);
		{ boq = now.Coffee_Type_cout; };
		_m = 2; goto P999; /* 0 */
	case 277: // STATE 243 - test.pml:644 - [Controller_State_cout!Controller_State_Info] (0:0:0 - 1)
		IfNotBlocked
		reached[0][243] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 39); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 39, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 278: // STATE 246 - test.pml:650 - [Action_cin?Action_Select_Latte] (0:0:0 - 1)
		reached[0][246] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (8 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 8); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 279: // STATE 247 - test.pml:650 - [Action = Action_Select_Latte] (0:0:1 - 1)
		IfNotBlocked
		reached[0][247] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 8;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 280: // STATE 248 - test.pml:655 - [(((Controller_State==Controller_State_Select)&&(Action==Action_Select_Latte)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][248] = 1;
		if (!(((now.Controller_State==40)&&(now.Action==8))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 281: // STATE 249 - test.pml:657 - [Coffee_Type_cout!Coffee_Type_Latte] (0:0:0 - 1)
		IfNotBlocked
		reached[0][249] = 1;
		if (q_len(now.Coffee_Type_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Type_cout);
		sprintf(simtmp, "%d", 36); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Type_cout, 0, 36, 1);
		{ boq = now.Coffee_Type_cout; };
		_m = 2; goto P999; /* 0 */
	case 282: // STATE 250 - test.pml:658 - [Controller_State_cout!Controller_State_Info] (0:0:0 - 1)
		IfNotBlocked
		reached[0][250] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 39); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 39, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 283: // STATE 253 - test.pml:664 - [Action_cin?Action_Dec_Milk] (0:0:0 - 1)
		reached[0][253] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (7 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 7); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 284: // STATE 254 - test.pml:664 - [Action = Action_Dec_Milk] (0:0:1 - 1)
		IfNotBlocked
		reached[0][254] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 7;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 285: // STATE 255 - test.pml:670 - [((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Milk)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][255] = 1;
		if (!((((now.Coffee_Type==36)&&(now.Controller_State==39))&&(now.Action==7))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 286: // STATE 256 - test.pml:672 - [Milk_Counter_cout!Milk_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[0][256] = 1;
		if (q_len(now.Milk_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Milk_Counter_cout);
		sprintf(simtmp, "%d", 32); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Milk_Counter_cout, 0, 32, 1);
		{ boq = now.Milk_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 287: // STATE 257 - test.pml:677 - [((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Milk)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][257] = 1;
		if (!((((now.Coffee_Type==35)&&(now.Controller_State==39))&&(now.Action==7))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 288: // STATE 258 - test.pml:679 - [Milk_Counter_cout!Milk_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[0][258] = 1;
		if (q_len(now.Milk_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Milk_Counter_cout);
		sprintf(simtmp, "%d", 32); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Milk_Counter_cout, 0, 32, 1);
		{ boq = now.Milk_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 289: // STATE 261 - test.pml:685 - [Action_cin?Action_Another_No] (0:0:0 - 1)
		reached[0][261] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (6 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 290: // STATE 262 - test.pml:685 - [Action = Action_Another_No] (0:0:1 - 1)
		IfNotBlocked
		reached[0][262] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 6;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 291: // STATE 263 - test.pml:690 - [(((Controller_State==Controller_State_Another)&&(Action==Action_Another_No)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][263] = 1;
		if (!(((now.Controller_State==41)&&(now.Action==6))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 292: // STATE 264 - test.pml:692 - [Controller_State_cout!Controller_State_Select] (0:0:0 - 1)
		IfNotBlocked
		reached[0][264] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 40); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 40, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 293: // STATE 265 - test.pml:693 - [Another_Timer_cout!Another_Timer_Stop] (0:0:0 - 1)
		IfNotBlocked
		reached[0][265] = 1;
		if (q_len(now.Another_Timer_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Another_Timer_cout);
		sprintf(simtmp, "%d", 27); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Another_Timer_cout, 0, 27, 1);
		{ boq = now.Another_Timer_cout; };
		_m = 2; goto P999; /* 0 */
	case 294: // STATE 268 - test.pml:699 - [Action_cin?Action_Dec_Coffee] (0:0:0 - 1)
		reached[0][268] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (5 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 5); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 295: // STATE 269 - test.pml:699 - [Action = Action_Dec_Coffee] (0:0:1 - 1)
		IfNotBlocked
		reached[0][269] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 5;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 296: // STATE 270 - test.pml:705 - [((((Coffee_Type==Coffee_Type_Espresso)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Coffee)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][270] = 1;
		if (!((((now.Coffee_Type==37)&&(now.Controller_State==39))&&(now.Action==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 297: // STATE 271 - test.pml:707 - [Coffee_Counter_cout!Coffee_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[0][271] = 1;
		if (q_len(now.Coffee_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Counter_cout);
		sprintf(simtmp, "%d", 30); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Counter_cout, 0, 30, 1);
		{ boq = now.Coffee_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 298: // STATE 272 - test.pml:712 - [((((Coffee_Type==Coffee_Type_Americano)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Coffee)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][272] = 1;
		if (!((((now.Coffee_Type==38)&&(now.Controller_State==39))&&(now.Action==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 299: // STATE 273 - test.pml:714 - [Coffee_Counter_cout!Coffee_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[0][273] = 1;
		if (q_len(now.Coffee_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Counter_cout);
		sprintf(simtmp, "%d", 30); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Counter_cout, 0, 30, 1);
		{ boq = now.Coffee_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 300: // STATE 274 - test.pml:719 - [((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Coffee)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][274] = 1;
		if (!((((now.Coffee_Type==36)&&(now.Controller_State==39))&&(now.Action==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 301: // STATE 275 - test.pml:721 - [Coffee_Counter_cout!Coffee_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[0][275] = 1;
		if (q_len(now.Coffee_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Counter_cout);
		sprintf(simtmp, "%d", 30); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Counter_cout, 0, 30, 1);
		{ boq = now.Coffee_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 302: // STATE 276 - test.pml:726 - [((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Coffee)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][276] = 1;
		if (!((((now.Coffee_Type==35)&&(now.Controller_State==39))&&(now.Action==5))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 303: // STATE 277 - test.pml:728 - [Coffee_Counter_cout!Coffee_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[0][277] = 1;
		if (q_len(now.Coffee_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Counter_cout);
		sprintf(simtmp, "%d", 30); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Counter_cout, 0, 30, 1);
		{ boq = now.Coffee_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 304: // STATE 280 - test.pml:734 - [Action_cin?Action_Select_Americano] (0:0:0 - 1)
		reached[0][280] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (4 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 305: // STATE 281 - test.pml:734 - [Action = Action_Select_Americano] (0:0:1 - 1)
		IfNotBlocked
		reached[0][281] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 4;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 306: // STATE 282 - test.pml:739 - [(((Controller_State==Controller_State_Select)&&(Action==Action_Select_Americano)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][282] = 1;
		if (!(((now.Controller_State==40)&&(now.Action==4))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 307: // STATE 283 - test.pml:741 - [Coffee_Type_cout!Coffee_Type_Americano] (0:0:0 - 1)
		IfNotBlocked
		reached[0][283] = 1;
		if (q_len(now.Coffee_Type_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Coffee_Type_cout);
		sprintf(simtmp, "%d", 38); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Coffee_Type_cout, 0, 38, 1);
		{ boq = now.Coffee_Type_cout; };
		_m = 2; goto P999; /* 0 */
	case 308: // STATE 284 - test.pml:742 - [Controller_State_cout!Controller_State_Info] (0:0:0 - 1)
		IfNotBlocked
		reached[0][284] = 1;
		if (q_len(now.Controller_State_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Controller_State_cout);
		sprintf(simtmp, "%d", 39); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Controller_State_cout, 0, 39, 1);
		{ boq = now.Controller_State_cout; };
		_m = 2; goto P999; /* 0 */
	case 309: // STATE 287 - test.pml:748 - [Action_cin?Action_Inc_Milk] (0:0:0 - 1)
		reached[0][287] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (3 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 310: // STATE 288 - test.pml:748 - [Action = Action_Inc_Milk] (0:0:1 - 1)
		IfNotBlocked
		reached[0][288] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 3;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 311: // STATE 289 - test.pml:754 - [((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Milk)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][289] = 1;
		if (!((((now.Coffee_Type==36)&&(now.Controller_State==39))&&(now.Action==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 312: // STATE 290 - test.pml:756 - [Milk_Counter_cout!Milk_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[0][290] = 1;
		if (q_len(now.Milk_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Milk_Counter_cout);
		sprintf(simtmp, "%d", 31); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Milk_Counter_cout, 0, 31, 1);
		{ boq = now.Milk_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 313: // STATE 291 - test.pml:761 - [((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Milk)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][291] = 1;
		if (!((((now.Coffee_Type==35)&&(now.Controller_State==39))&&(now.Action==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 314: // STATE 292 - test.pml:763 - [Milk_Counter_cout!Milk_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[0][292] = 1;
		if (q_len(now.Milk_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Milk_Counter_cout);
		sprintf(simtmp, "%d", 31); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Milk_Counter_cout, 0, 31, 1);
		{ boq = now.Milk_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 315: // STATE 295 - test.pml:769 - [Action_cin?Action_Dec_Sugar] (0:0:0 - 1)
		reached[0][295] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (2 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 316: // STATE 296 - test.pml:769 - [Action = Action_Dec_Sugar] (0:0:1 - 1)
		IfNotBlocked
		reached[0][296] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 2;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 317: // STATE 297 - test.pml:775 - [((((Coffee_Type==Coffee_Type_Americano)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Sugar)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][297] = 1;
		if (!((((now.Coffee_Type==38)&&(now.Controller_State==39))&&(now.Action==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 318: // STATE 298 - test.pml:777 - [Sugar_Counter_cout!Sugar_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[0][298] = 1;
		if (q_len(now.Sugar_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Sugar_Counter_cout);
		sprintf(simtmp, "%d", 33); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Sugar_Counter_cout, 0, 33, 1);
		{ boq = now.Sugar_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 319: // STATE 299 - test.pml:782 - [((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Sugar)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][299] = 1;
		if (!((((now.Coffee_Type==36)&&(now.Controller_State==39))&&(now.Action==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 320: // STATE 300 - test.pml:784 - [Sugar_Counter_cout!Sugar_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[0][300] = 1;
		if (q_len(now.Sugar_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Sugar_Counter_cout);
		sprintf(simtmp, "%d", 33); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Sugar_Counter_cout, 0, 33, 1);
		{ boq = now.Sugar_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 321: // STATE 301 - test.pml:789 - [((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Sugar)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][301] = 1;
		if (!((((now.Coffee_Type==35)&&(now.Controller_State==39))&&(now.Action==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 322: // STATE 302 - test.pml:791 - [Sugar_Counter_cout!Sugar_Counter_Dec] (0:0:0 - 1)
		IfNotBlocked
		reached[0][302] = 1;
		if (q_len(now.Sugar_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Sugar_Counter_cout);
		sprintf(simtmp, "%d", 33); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Sugar_Counter_cout, 0, 33, 1);
		{ boq = now.Sugar_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 323: // STATE 305 - test.pml:797 - [Action_cin?Action_Inc_Sugar] (0:0:0 - 1)
		reached[0][305] = 1;
		if (boq != now.Action_cin) continue;
		if (q_len(now.Action_cin) == 0) continue;

		XX=1;
		if (1 != qrecv(now.Action_cin, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.Action_cin-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.Action_cin, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.Action_cin);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.Action_cin))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 324: // STATE 306 - test.pml:797 - [Action = Action_Inc_Sugar] (0:0:1 - 1)
		IfNotBlocked
		reached[0][306] = 1;
		(trpt+1)->bup.oval = now.Action;
		now.Action = 1;
#ifdef VAR_RANGES
		logval("Action", now.Action);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 325: // STATE 307 - test.pml:803 - [((((Coffee_Type==Coffee_Type_Americano)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Sugar)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][307] = 1;
		if (!((((now.Coffee_Type==38)&&(now.Controller_State==39))&&(now.Action==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 326: // STATE 308 - test.pml:805 - [Sugar_Counter_cout!Sugar_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[0][308] = 1;
		if (q_len(now.Sugar_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Sugar_Counter_cout);
		sprintf(simtmp, "%d", 34); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Sugar_Counter_cout, 0, 34, 1);
		{ boq = now.Sugar_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 327: // STATE 309 - test.pml:810 - [((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Sugar)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][309] = 1;
		if (!((((now.Coffee_Type==36)&&(now.Controller_State==39))&&(now.Action==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 328: // STATE 310 - test.pml:812 - [Sugar_Counter_cout!Sugar_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[0][310] = 1;
		if (q_len(now.Sugar_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Sugar_Counter_cout);
		sprintf(simtmp, "%d", 34); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Sugar_Counter_cout, 0, 34, 1);
		{ boq = now.Sugar_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 329: // STATE 311 - test.pml:817 - [((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Sugar)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][311] = 1;
		if (!((((now.Coffee_Type==35)&&(now.Controller_State==39))&&(now.Action==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 330: // STATE 312 - test.pml:819 - [Sugar_Counter_cout!Sugar_Counter_Inc] (0:0:0 - 1)
		IfNotBlocked
		reached[0][312] = 1;
		if (q_len(now.Sugar_Counter_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Sugar_Counter_cout);
		sprintf(simtmp, "%d", 34); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Sugar_Counter_cout, 0, 34, 1);
		{ boq = now.Sugar_Counter_cout; };
		_m = 2; goto P999; /* 0 */
	case 331: // STATE 315 - test.pml:824 - [((Another_Timer==Another_Timer_Running))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][315] = 1;
		if (!((now.Another_Timer==25)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 332: // STATE 316 - test.pml:826 - [Another_Timer_cout!Another_Timer_Timeout] (0:0:0 - 1)
		IfNotBlocked
		reached[0][316] = 1;
		if (q_len(now.Another_Timer_cout))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.Another_Timer_cout);
		sprintf(simtmp, "%d", 28); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.Another_Timer_cout, 0, 28, 1);
		{ boq = now.Another_Timer_cout; };
		_m = 2; goto P999; /* 0 */
	case 333: // STATE 322 - test.pml:830 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][322] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

