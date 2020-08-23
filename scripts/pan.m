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

		 /* CLAIM p2 */
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [(!(0))] (6:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!( !(0)))
			continue;
		/* merge: assert(!(!(0)))(0, 2, 6) */
		reached[2][2] = 1;
		spin_assert( !( !(0)), " !( !(0))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[2][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 4: // STATE 10 - _spin_nvr.tmp:8 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Producer */
	case 5: // STATE 1 - /home/reza/crouse/design-verifier/resources/properties.pml:47 - [(initialized)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!(((int)now.initialized)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - /home/reza/crouse/design-verifier/resources/properties.pml:48 - [printf('doing\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		Printf("doing\n");
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 3 - /home/reza/crouse/design-verifier/resources/properties.pml:50 - [(((Produce_Timer.state==3)&&(Produce_Timer.mode==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!(((now._Produce_Timer.state==3)&&(now._Produce_Timer.mode==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 4 - /home/reza/crouse/design-verifier/resources/properties.pml:50 - [Produce_Timer.state = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.oval = now._Produce_Timer.state;
		now._Produce_Timer.state = 1;
#ifdef VAR_RANGES
		logval("Produce_Timer.state", now._Produce_Timer.state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 5 - /home/reza/crouse/design-verifier/resources/properties.pml:50 - [Produce_Timer.mode = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		(trpt+1)->bup.oval = now._Produce_Timer.mode;
		now._Produce_Timer.mode = 2;
#ifdef VAR_RANGES
		logval("Produce_Timer.mode", now._Produce_Timer.mode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 6 - /home/reza/crouse/design-verifier/resources/properties.pml:50 - [Produce_Timer.value = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		(trpt+1)->bup.oval = now._Produce_Timer.value;
		now._Produce_Timer.value = 0;
#ifdef VAR_RANGES
		logval("Produce_Timer.value", now._Produce_Timer.value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 7 - /home/reza/crouse/design-verifier/resources/properties.pml:51 - [(((Produce_Timer.state==2)&&(Produce_Timer.mode==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (!(((now._Produce_Timer.state==2)&&(now._Produce_Timer.mode==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 8 - /home/reza/crouse/design-verifier/resources/properties.pml:51 - [Produce_Timer.state = 4] (0:0:1 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		(trpt+1)->bup.oval = now._Produce_Timer.state;
		now._Produce_Timer.state = 4;
#ifdef VAR_RANGES
		logval("Produce_Timer.state", now._Produce_Timer.state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 9 - /home/reza/crouse/design-verifier/resources/properties.pml:51 - [Produce_Timer.mode = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		(trpt+1)->bup.oval = now._Produce_Timer.mode;
		now._Produce_Timer.mode = 2;
#ifdef VAR_RANGES
		logval("Produce_Timer.mode", now._Produce_Timer.mode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 10 - /home/reza/crouse/design-verifier/resources/properties.pml:52 - [(((Producer_State.state==1)&&(Producer_State.mode==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		if (!(((now._Producer_State.state==1)&&(now._Producer_State.mode==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 11 - /home/reza/crouse/design-verifier/resources/properties.pml:52 - [Producer_State.state = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.oval = now._Producer_State.state;
		now._Producer_State.state = 1;
#ifdef VAR_RANGES
		logval("Producer_State.state", now._Producer_State.state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 12 - /home/reza/crouse/design-verifier/resources/properties.pml:52 - [Producer_State.mode = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		(trpt+1)->bup.oval = now._Producer_State.mode;
		now._Producer_State.mode = 2;
#ifdef VAR_RANGES
		logval("Producer_State.mode", now._Producer_State.mode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 13 - /home/reza/crouse/design-verifier/resources/properties.pml:53 - [(((Producer_State.state==2)&&(Producer_State.mode==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!(((now._Producer_State.state==2)&&(now._Producer_State.mode==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 14 - /home/reza/crouse/design-verifier/resources/properties.pml:53 - [Producer_State.state = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		(trpt+1)->bup.oval = now._Producer_State.state;
		now._Producer_State.state = 2;
#ifdef VAR_RANGES
		logval("Producer_State.state", now._Producer_State.state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 15 - /home/reza/crouse/design-verifier/resources/properties.pml:53 - [Producer_State.mode = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][15] = 1;
		(trpt+1)->bup.oval = now._Producer_State.mode;
		now._Producer_State.mode = 2;
#ifdef VAR_RANGES
		logval("Producer_State.mode", now._Producer_State.mode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 16 - /home/reza/crouse/design-verifier/resources/properties.pml:54 - [(((Producer_State.state==3)&&(Producer_State.mode==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		if (!(((now._Producer_State.state==3)&&(now._Producer_State.mode==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 17 - /home/reza/crouse/design-verifier/resources/properties.pml:54 - [Producer_State.state = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		(trpt+1)->bup.oval = now._Producer_State.state;
		now._Producer_State.state = 3;
#ifdef VAR_RANGES
		logval("Producer_State.state", now._Producer_State.state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 18 - /home/reza/crouse/design-verifier/resources/properties.pml:54 - [Producer_State.mode = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		(trpt+1)->bup.oval = now._Producer_State.mode;
		now._Producer_State.mode = 2;
#ifdef VAR_RANGES
		logval("Producer_State.mode", now._Producer_State.mode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 19 - /home/reza/crouse/design-verifier/resources/properties.pml:55 - [(((Door_Lock.state==1)&&(Door_Lock.mode==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		if (!(((now._Door_Lock.state==1)&&(now._Door_Lock.mode==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 20 - /home/reza/crouse/design-verifier/resources/properties.pml:55 - [Door_Lock.state = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		(trpt+1)->bup.oval = now._Door_Lock.state;
		now._Door_Lock.state = 1;
#ifdef VAR_RANGES
		logval("Door_Lock.state", now._Door_Lock.state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 21 - /home/reza/crouse/design-verifier/resources/properties.pml:55 - [Door_Lock.mode = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][21] = 1;
		(trpt+1)->bup.oval = now._Door_Lock.mode;
		now._Door_Lock.mode = 2;
#ifdef VAR_RANGES
		logval("Door_Lock.mode", now._Door_Lock.mode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 22 - /home/reza/crouse/design-verifier/resources/properties.pml:56 - [(((Door_Lock.state==2)&&(Door_Lock.mode==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		if (!(((now._Door_Lock.state==2)&&(now._Door_Lock.mode==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 23 - /home/reza/crouse/design-verifier/resources/properties.pml:56 - [Door_Lock.state = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][23] = 1;
		(trpt+1)->bup.oval = now._Door_Lock.state;
		now._Door_Lock.state = 2;
#ifdef VAR_RANGES
		logval("Door_Lock.state", now._Door_Lock.state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 24 - /home/reza/crouse/design-verifier/resources/properties.pml:56 - [Door_Lock.mode = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][24] = 1;
		(trpt+1)->bup.oval = now._Door_Lock.mode;
		now._Door_Lock.mode = 2;
#ifdef VAR_RANGES
		logval("Door_Lock.mode", now._Door_Lock.mode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 25 - /home/reza/crouse/design-verifier/resources/properties.pml:57 - [(((Produce_Timer.state==1)&&(Produce_Timer.mode==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][25] = 1;
		if (!(((now._Produce_Timer.state==1)&&(now._Produce_Timer.mode==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 26 - /home/reza/crouse/design-verifier/resources/properties.pml:57 - [Produce_Timer.state = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][26] = 1;
		(trpt+1)->bup.oval = now._Produce_Timer.state;
		now._Produce_Timer.state = 2;
#ifdef VAR_RANGES
		logval("Produce_Timer.state", now._Produce_Timer.state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 27 - /home/reza/crouse/design-verifier/resources/properties.pml:57 - [Produce_Timer.mode = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][27] = 1;
		(trpt+1)->bup.oval = now._Produce_Timer.mode;
		now._Produce_Timer.mode = 1;
#ifdef VAR_RANGES
		logval("Produce_Timer.mode", now._Produce_Timer.mode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 28 - /home/reza/crouse/design-verifier/resources/properties.pml:57 - [Produce_Timer.value = 200] (0:0:1 - 1)
		IfNotBlocked
		reached[1][28] = 1;
		(trpt+1)->bup.oval = now._Produce_Timer.value;
		now._Produce_Timer.value = 200;
#ifdef VAR_RANGES
		logval("Produce_Timer.value", now._Produce_Timer.value);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 29 - /home/reza/crouse/design-verifier/resources/properties.pml:58 - [(((((Produce_Timer.state==2)&&(Produce_Timer.mode==1))&&(Producer_State.state==1))&&(Producer_State.mode==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][29] = 1;
		if (!(((((now._Produce_Timer.state==2)&&(now._Produce_Timer.mode==1))&&(now._Producer_State.state==1))&&(now._Producer_State.mode==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 30 - /home/reza/crouse/design-verifier/resources/properties.pml:58 - [Produce_Timer.state = 4] (0:0:1 - 1)
		IfNotBlocked
		reached[1][30] = 1;
		(trpt+1)->bup.oval = now._Produce_Timer.state;
		now._Produce_Timer.state = 4;
#ifdef VAR_RANGES
		logval("Produce_Timer.state", now._Produce_Timer.state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 31 - /home/reza/crouse/design-verifier/resources/properties.pml:58 - [Produce_Timer.mode = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][31] = 1;
		(trpt+1)->bup.oval = now._Produce_Timer.mode;
		now._Produce_Timer.mode = 1;
#ifdef VAR_RANGES
		logval("Produce_Timer.mode", now._Produce_Timer.mode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 32 - /home/reza/crouse/design-verifier/resources/properties.pml:58 - [Door_Lock.state = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][32] = 1;
		(trpt+1)->bup.oval = now._Door_Lock.state;
		now._Door_Lock.state = 2;
#ifdef VAR_RANGES
		logval("Door_Lock.state", now._Door_Lock.state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 33 - /home/reza/crouse/design-verifier/resources/properties.pml:58 - [Door_Lock.mode = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][33] = 1;
		(trpt+1)->bup.oval = now._Door_Lock.mode;
		now._Door_Lock.mode = 1;
#ifdef VAR_RANGES
		logval("Door_Lock.mode", now._Door_Lock.mode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 34 - /home/reza/crouse/design-verifier/resources/properties.pml:58 - [Producer_State.state = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][34] = 1;
		(trpt+1)->bup.oval = now._Producer_State.state;
		now._Producer_State.state = 2;
#ifdef VAR_RANGES
		logval("Producer_State.state", now._Producer_State.state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 35 - /home/reza/crouse/design-verifier/resources/properties.pml:58 - [Producer_State.mode = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][35] = 1;
		(trpt+1)->bup.oval = now._Producer_State.mode;
		now._Producer_State.mode = 1;
#ifdef VAR_RANGES
		logval("Producer_State.mode", now._Producer_State.mode);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 42 - /home/reza/crouse/design-verifier/resources/properties.pml:63 - [-end-] (0:0:0 - 2)
		IfNotBlocked
		reached[1][42] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC initializer */
	case 41: // STATE 1 - /home/reza/crouse/design-verifier/resources/properties.pml:40 - [(!(initialized))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!( !(((int)now.initialized))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 2 - /home/reza/crouse/design-verifier/resources/properties.pml:41 - [initialized = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.initialized);
		now.initialized = 1;
#ifdef VAR_RANGES
		logval("initialized", ((int)now.initialized));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 6 - /home/reza/crouse/design-verifier/resources/properties.pml:44 - [-end-] (0:0:0 - 2)
		IfNotBlocked
		reached[0][6] = 1;
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

