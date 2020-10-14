#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(6*sizeof(Trans **));

	/* proctype 4: :trace: */

	trans[4] = (Trans **) emalloc(6*sizeof(Trans *));

	T = trans[4][3] = settr(401,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(401,0,1,0,0,"IF", 0, 2, 0);
	trans[4][1]	= settr(399,0,2,3,3,"Another_Timer_cin?Another_Timer_Running", 1, 508, 0);
	trans[4][2]	= settr(400,0,5,4,4,"Another_Timer_cin?Another_Timer_Timeout", 1, 508, 0);
	trans[4][4]	= settr(402,0,5,1,0,".(goto)", 0, 2, 0);
	trans[4][5]	= settr(403,0,0,5,5,"-end-", 0, 3500, 0);

	/* proctype 3: :trace: */

	trans[3] = (Trans **) emalloc(6*sizeof(Trans *));

	T = trans[3][3] = settr(396,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(396,0,1,0,0,"IF", 0, 2, 0);
	trans[3][1]	= settr(394,0,2,6,6,"Another_Timer_cin?Another_Timer_Running", 1, 508, 0);
	trans[3][2]	= settr(395,0,5,7,7,"Another_Timer_cin?Another_Timer_Timeout", 1, 508, 0);
	trans[3][4]	= settr(397,0,5,1,0,".(goto)", 0, 2, 0);
	trans[3][5]	= settr(398,0,0,8,8,"-end-", 0, 3500, 0);

	/* proctype 2: :trace: */

	trans[2] = (Trans **) emalloc(7*sizeof(Trans *));

	trans[2][4]	= settr(391,0,3,1,0,".(goto)", 0, 2, 0);
	T = trans[2][3] = settr(390,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(390,0,1,0,0,"DO", 0, 2, 0);
	trans[2][1]	= settr(388,0,2,9,9,"Another_Timer_cin?Another_Timer_Running", 1, 508, 0);
	trans[2][2]	= settr(389,0,3,10,10,"Another_Timer_cin?Another_Timer_Timeout", 1, 508, 0);
	trans[2][5]	= settr(392,0,6,1,0,"break", 0, 2, 0);
	trans[2][6]	= settr(393,0,0,11,11,"-end-", 0, 3500, 0);

	/* proctype 1: CONTROLLER_environment */

	trans[1] = (Trans **) emalloc(67*sizeof(Trans *));

	trans[1][64]	= settr(385,0,63,1,0,".(goto)", 0, 2, 0);
	T = trans[1][63] = settr(384,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,1,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,2,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,3,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,4,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,5,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,6,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,7,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,8,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,9,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,10,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,11,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,12,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,13,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,14,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,15,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,16,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,17,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,18,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,19,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,20,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,21,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,22,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,23,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,24,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,25,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,27,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,29,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,31,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,33,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,35,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,37,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,39,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,41,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,43,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,45,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,47,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,49,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,51,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,53,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,55,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,57,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(384,0,59,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(384,0,61,0,0,"DO", 0, 2, 0);
	trans[1][1]	= settr(322,0,63,12,12,"Producer_State_cin!Producer_State_Take", 1, 9, 0);
	trans[1][2]	= settr(323,0,63,13,13,"Producer_State_cin!Producer_State_Producing", 1, 9, 0);
	trans[1][3]	= settr(324,0,63,14,14,"Producer_State_cin!Producer_State_Produced", 1, 9, 0);
	trans[1][4]	= settr(325,0,63,15,15,"POS_State_cin!POS_State_Paid", 1, 10, 0);
	trans[1][5]	= settr(326,0,63,16,16,"POS_State_cin!POS_State_Idle", 1, 10, 0);
	trans[1][6]	= settr(327,0,63,17,17,"POS_State_cin!POS_State_Failed", 1, 10, 0);
	trans[1][7]	= settr(328,0,63,18,18,"POS_State_cin!POS_State_Working", 1, 10, 0);
	trans[1][8]	= settr(329,0,63,19,19,"Action_cin!Action_Take", 1, 11, 0);
	trans[1][9]	= settr(330,0,63,20,20,"Action_cin!Action_Select_Mocha", 1, 11, 0);
	trans[1][10]	= settr(331,0,63,21,21,"Action_cin!Action_POS_Failed", 1, 11, 0);
	trans[1][11]	= settr(332,0,63,22,22,"Action_cin!Action_Another_Yes", 1, 11, 0);
	trans[1][12]	= settr(333,0,63,23,23,"Action_cin!Action_POS_Paid", 1, 11, 0);
	trans[1][13]	= settr(334,0,63,24,24,"Action_cin!Action_Produce_Ok", 1, 11, 0);
	trans[1][14]	= settr(335,0,63,25,25,"Action_cin!Action_Produce_Cancel", 1, 11, 0);
	trans[1][15]	= settr(336,0,63,26,26,"Action_cin!Action_Inc_Coffee", 1, 11, 0);
	trans[1][16]	= settr(337,0,63,27,27,"Action_cin!Action_Select_Espresso", 1, 11, 0);
	trans[1][17]	= settr(338,0,63,28,28,"Action_cin!Action_Select_Latte", 1, 11, 0);
	trans[1][18]	= settr(339,0,63,29,29,"Action_cin!Action_Dec_Milk", 1, 11, 0);
	trans[1][19]	= settr(340,0,63,30,30,"Action_cin!Action_Another_No", 1, 11, 0);
	trans[1][20]	= settr(341,0,63,31,31,"Action_cin!Action_Dec_Coffee", 1, 11, 0);
	trans[1][21]	= settr(342,0,63,32,32,"Action_cin!Action_Select_Americano", 1, 11, 0);
	trans[1][22]	= settr(343,0,63,33,33,"Action_cin!Action_Inc_Milk", 1, 11, 0);
	trans[1][23]	= settr(344,0,63,34,34,"Action_cin!Action_Dec_Sugar", 1, 11, 0);
	trans[1][24]	= settr(345,0,63,35,35,"Action_cin!Action_Inc_Sugar", 1, 11, 0);
	trans[1][25]	= settr(346,0,26,36,36,"Controller_State_cout?Controller_State_POS", 1, 512, 0);
	trans[1][26]	= settr(347,0,63,37,37,"Controller_State_cin!Controller_State_POS", 1, 3, 0);
	trans[1][27]	= settr(348,0,28,38,38,"Controller_State_cout?Controller_State_Produce", 1, 512, 0);
	trans[1][28]	= settr(349,0,63,39,39,"Controller_State_cin!Controller_State_Produce", 1, 3, 0);
	trans[1][29]	= settr(350,0,30,40,40,"Controller_State_cout?Controller_State_Another", 1, 512, 0);
	trans[1][30]	= settr(351,0,63,41,41,"Controller_State_cin!Controller_State_Another", 1, 3, 0);
	trans[1][31]	= settr(352,0,32,42,42,"Controller_State_cout?Controller_State_Select", 1, 512, 0);
	trans[1][32]	= settr(353,0,63,43,43,"Controller_State_cin!Controller_State_Select", 1, 3, 0);
	trans[1][33]	= settr(354,0,34,44,44,"Controller_State_cout?Controller_State_Info", 1, 512, 0);
	trans[1][34]	= settr(355,0,63,45,45,"Controller_State_cin!Controller_State_Info", 1, 3, 0);
	trans[1][35]	= settr(356,0,36,46,46,"Coffee_Type_cout?Coffee_Type_Americano", 1, 513, 0);
	trans[1][36]	= settr(357,0,63,47,47,"Coffee_Type_cin!Coffee_Type_Americano", 1, 4, 0);
	trans[1][37]	= settr(358,0,38,48,48,"Coffee_Type_cout?Coffee_Type_Espresso", 1, 513, 0);
	trans[1][38]	= settr(359,0,63,49,49,"Coffee_Type_cin!Coffee_Type_Espresso", 1, 4, 0);
	trans[1][39]	= settr(360,0,40,50,50,"Coffee_Type_cout?Coffee_Type_Latte", 1, 513, 0);
	trans[1][40]	= settr(361,0,63,51,51,"Coffee_Type_cin!Coffee_Type_Latte", 1, 4, 0);
	trans[1][41]	= settr(362,0,42,52,52,"Coffee_Type_cout?Coffee_Type_Mocha", 1, 513, 0);
	trans[1][42]	= settr(363,0,63,53,53,"Coffee_Type_cin!Coffee_Type_Mocha", 1, 4, 0);
	trans[1][43]	= settr(364,0,44,54,54,"Sugar_Counter_cout?Sugar_Counter_Inc", 1, 514, 0);
	trans[1][44]	= settr(365,0,63,55,55,"Sugar_Counter_cin!Sugar_Counter_Inc", 1, 5, 0);
	trans[1][45]	= settr(366,0,46,56,56,"Sugar_Counter_cout?Sugar_Counter_Dec", 1, 514, 0);
	trans[1][46]	= settr(367,0,63,57,57,"Sugar_Counter_cin!Sugar_Counter_Dec", 1, 5, 0);
	trans[1][47]	= settr(368,0,48,58,58,"Milk_Counter_cout?Milk_Counter_Dec", 1, 515, 0);
	trans[1][48]	= settr(369,0,63,59,59,"Milk_Counter_cin!Milk_Counter_Dec", 1, 6, 0);
	trans[1][49]	= settr(370,0,50,60,60,"Milk_Counter_cout?Milk_Counter_Inc", 1, 515, 0);
	trans[1][50]	= settr(371,0,63,61,61,"Milk_Counter_cin!Milk_Counter_Inc", 1, 6, 0);
	trans[1][51]	= settr(372,0,52,62,62,"Coffee_Counter_cout?Coffee_Counter_Dec", 1, 516, 0);
	trans[1][52]	= settr(373,0,63,63,63,"Coffee_Counter_cin!Coffee_Counter_Dec", 1, 7, 0);
	trans[1][53]	= settr(374,0,54,64,64,"Coffee_Counter_cout?Coffee_Counter_Inc", 1, 516, 0);
	trans[1][54]	= settr(375,0,63,65,65,"Coffee_Counter_cin!Coffee_Counter_Inc", 1, 7, 0);
	trans[1][55]	= settr(376,0,56,66,66,"Another_Timer_cout?Another_Timer_Timeout", 1, 517, 0);
	trans[1][56]	= settr(377,0,63,67,67,"Another_Timer_cin!Another_Timer_Timeout", 1, 8, 0);
	trans[1][57]	= settr(378,0,58,68,68,"Another_Timer_cout?Another_Timer_Stop", 1, 517, 0);
	trans[1][58]	= settr(379,0,63,69,69,"Another_Timer_cin!Another_Timer_Stop", 1, 8, 0);
	trans[1][59]	= settr(380,0,60,70,70,"Another_Timer_cout?Another_Timer_Start", 1, 517, 0);
	trans[1][60]	= settr(381,0,63,71,71,"Another_Timer_cin!Another_Timer_Start", 1, 8, 0);
	trans[1][61]	= settr(382,0,62,72,72,"Another_Timer_cout?Another_Timer_Running", 1, 517, 0);
	trans[1][62]	= settr(383,0,63,73,73,"Another_Timer_cin!Another_Timer_Running", 1, 8, 0);
	trans[1][65]	= settr(386,0,66,1,0,"break", 0, 2, 0);
	trans[1][66]	= settr(387,0,0,74,74,"-end-", 0, 3500, 0);

	/* proctype 0: controller */

	trans[0] = (Trans **) emalloc(323*sizeof(Trans *));

	trans[0][320]	= settr(319,0,319,1,0,".(goto)", 0, 2, 0);
	T = trans[0][319] = settr(318,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,1,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,3,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,5,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,7,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,9,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,11,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,19,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,27,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,35,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,43,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,61,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,79,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,97,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,115,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,133,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,151,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,159,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,161,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,167,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,169,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,175,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,177,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,179,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,185,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,187,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,193,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,195,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,197,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,204,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,206,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,213,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,215,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,221,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,227,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,239,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,246,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,253,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,261,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,268,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,280,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,287,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,295,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(318,0,305,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(318,0,317,0,0,"DO", 0, 2, 0);
	trans[0][1]	= settr(0,0,2,75,75,"Controller_State_cin?Controller_State_POS", 1, 503, 0);
	trans[0][2]	= settr(1,0,319,76,76,"Controller_State = Controller_State_POS", 1, 2, 0);
	trans[0][3]	= settr(2,0,4,77,77,"Controller_State_cin?Controller_State_Produce", 1, 503, 0);
	trans[0][4]	= settr(3,0,319,78,78,"Controller_State = Controller_State_Produce", 1, 2, 0);
	trans[0][5]	= settr(4,0,6,79,79,"Controller_State_cin?Controller_State_Another", 1, 503, 0);
	trans[0][6]	= settr(5,0,319,80,80,"Controller_State = Controller_State_Another", 1, 2, 0);
	trans[0][7]	= settr(6,0,8,81,81,"Controller_State_cin?Controller_State_Select", 1, 503, 0);
	trans[0][8]	= settr(7,0,319,82,82,"Controller_State = Controller_State_Select", 1, 2, 0);
	trans[0][9]	= settr(8,0,10,83,83,"Controller_State_cin?Controller_State_Info", 1, 503, 0);
	trans[0][10]	= settr(9,0,319,84,84,"Controller_State = Controller_State_Info", 1, 2, 0);
	trans[0][11]	= settr(10,0,12,85,85,"Coffee_Type_cin?Coffee_Type_Americano", 1, 504, 0);
	trans[0][12]	= settr(11,0,17,86,86,"Coffee_Type = Coffee_Type_Americano", 1, 2, 0);
	T = trans[0][17] = settr(16,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(16,0,13,0,0,"IF", 0, 2, 0);
	trans[0][13]	= settr(12,0,14,87,0,"(((Coffee_Type==Coffee_Type_Americano)&&(Controller_State==Controller_State_Info)))", 1, 2, 0);
	trans[0][14]	= settr(13,0,15,88,88,"Milk_Counter_value = 0", 1, 2, 0);
	trans[0][15]	= settr(14,0,16,89,89,"Sugar_Counter_value = 0", 1, 2, 0);
	trans[0][16]	= settr(15,0,319,90,90,"Coffee_Counter_value = 7", 1, 2, 0);
	trans[0][18]	= settr(17,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][19]	= settr(18,0,20,91,91,"Coffee_Type_cin?Coffee_Type_Espresso", 1, 504, 0);
	trans[0][20]	= settr(19,0,25,92,92,"Coffee_Type = Coffee_Type_Espresso", 1, 2, 0);
	T = trans[0][25] = settr(24,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(24,0,21,0,0,"IF", 0, 2, 0);
	trans[0][21]	= settr(20,0,22,93,0,"(((Coffee_Type==Coffee_Type_Espresso)&&(Controller_State==Controller_State_Info)))", 1, 2, 0);
	trans[0][22]	= settr(21,0,23,94,94,"Milk_Counter_value = 0", 1, 2, 0);
	trans[0][23]	= settr(22,0,24,95,95,"Sugar_Counter_value = 0", 1, 2, 0);
	trans[0][24]	= settr(23,0,319,96,96,"Coffee_Counter_value = 7", 1, 2, 0);
	trans[0][26]	= settr(25,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][27]	= settr(26,0,28,97,97,"Coffee_Type_cin?Coffee_Type_Latte", 1, 504, 0);
	trans[0][28]	= settr(27,0,33,98,98,"Coffee_Type = Coffee_Type_Latte", 1, 2, 0);
	T = trans[0][33] = settr(32,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(32,0,29,0,0,"IF", 0, 2, 0);
	trans[0][29]	= settr(28,0,30,99,0,"(((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info)))", 1, 2, 0);
	trans[0][30]	= settr(29,0,31,100,100,"Milk_Counter_value = 5", 1, 2, 0);
	trans[0][31]	= settr(30,0,32,101,101,"Sugar_Counter_value = 3", 1, 2, 0);
	trans[0][32]	= settr(31,0,319,102,102,"Coffee_Counter_value = 5", 1, 2, 0);
	trans[0][34]	= settr(33,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][35]	= settr(34,0,36,103,103,"Coffee_Type_cin?Coffee_Type_Mocha", 1, 504, 0);
	trans[0][36]	= settr(35,0,41,104,104,"Coffee_Type = Coffee_Type_Mocha", 1, 2, 0);
	T = trans[0][41] = settr(40,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(40,0,37,0,0,"IF", 0, 2, 0);
	trans[0][37]	= settr(36,0,38,105,0,"(((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info)))", 1, 2, 0);
	trans[0][38]	= settr(37,0,39,106,106,"Milk_Counter_value = 3", 1, 2, 0);
	trans[0][39]	= settr(38,0,40,107,107,"Sugar_Counter_value = 3", 1, 2, 0);
	trans[0][40]	= settr(39,0,319,108,108,"Coffee_Counter_value = 4", 1, 2, 0);
	trans[0][42]	= settr(41,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][43]	= settr(42,0,44,109,109,"Sugar_Counter_cin?Sugar_Counter_Inc", 1, 505, 0);
	trans[0][44]	= settr(43,0,59,110,110,"Sugar_Counter = Sugar_Counter_Inc", 1, 2, 0);
	T = trans[0][59] = settr(58,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(58,0,45,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(58,0,47,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(58,0,49,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(58,0,51,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(58,0,53,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(58,0,55,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(58,0,57,0,0,"IF", 0, 2, 0);
	trans[0][45]	= settr(44,0,46,111,0,"(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==0)))", 1, 2, 0);
	trans[0][46]	= settr(45,0,319,112,112,"Sugar_Counter_value = 1", 1, 2, 0);
	trans[0][60]	= settr(59,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][47]	= settr(46,0,48,113,0,"(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==1)))", 1, 2, 0);
	trans[0][48]	= settr(47,0,319,114,114,"Sugar_Counter_value = 2", 1, 2, 0);
	trans[0][49]	= settr(48,0,50,115,0,"(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==2)))", 1, 2, 0);
	trans[0][50]	= settr(49,0,319,116,116,"Sugar_Counter_value = 3", 1, 2, 0);
	trans[0][51]	= settr(50,0,52,117,0,"(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==3)))", 1, 2, 0);
	trans[0][52]	= settr(51,0,319,118,118,"Sugar_Counter_value = 4", 1, 2, 0);
	trans[0][53]	= settr(52,0,54,119,0,"(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==4)))", 1, 2, 0);
	trans[0][54]	= settr(53,0,319,120,120,"Sugar_Counter_value = 5", 1, 2, 0);
	trans[0][55]	= settr(54,0,56,121,0,"(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==5)))", 1, 2, 0);
	trans[0][56]	= settr(55,0,319,122,122,"Sugar_Counter_value = 6", 1, 2, 0);
	trans[0][57]	= settr(56,0,58,123,0,"(((Sugar_Counter==Sugar_Counter_Inc)&&(Sugar_Counter_value==6)))", 1, 2, 0);
	trans[0][58]	= settr(57,0,319,124,124,"Sugar_Counter_value = 7", 1, 2, 0);
	trans[0][61]	= settr(60,0,62,125,125,"Sugar_Counter_cin?Sugar_Counter_Dec", 1, 505, 0);
	trans[0][62]	= settr(61,0,77,126,126,"Sugar_Counter = Sugar_Counter_Dec", 1, 2, 0);
	T = trans[0][77] = settr(76,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(76,0,63,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(76,0,65,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(76,0,67,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(76,0,69,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(76,0,71,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(76,0,73,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(76,0,75,0,0,"IF", 0, 2, 0);
	trans[0][63]	= settr(62,0,64,127,0,"(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==1)))", 1, 2, 0);
	trans[0][64]	= settr(63,0,319,128,128,"Sugar_Counter_value = 0", 1, 2, 0);
	trans[0][78]	= settr(77,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][65]	= settr(64,0,66,129,0,"(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==2)))", 1, 2, 0);
	trans[0][66]	= settr(65,0,319,130,130,"Sugar_Counter_value = 1", 1, 2, 0);
	trans[0][67]	= settr(66,0,68,131,0,"(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==3)))", 1, 2, 0);
	trans[0][68]	= settr(67,0,319,132,132,"Sugar_Counter_value = 2", 1, 2, 0);
	trans[0][69]	= settr(68,0,70,133,0,"(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==4)))", 1, 2, 0);
	trans[0][70]	= settr(69,0,319,134,134,"Sugar_Counter_value = 3", 1, 2, 0);
	trans[0][71]	= settr(70,0,72,135,0,"(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==5)))", 1, 2, 0);
	trans[0][72]	= settr(71,0,319,136,136,"Sugar_Counter_value = 4", 1, 2, 0);
	trans[0][73]	= settr(72,0,74,137,0,"(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==6)))", 1, 2, 0);
	trans[0][74]	= settr(73,0,319,138,138,"Sugar_Counter_value = 5", 1, 2, 0);
	trans[0][75]	= settr(74,0,76,139,0,"(((Sugar_Counter==Sugar_Counter_Dec)&&(Sugar_Counter_value==7)))", 1, 2, 0);
	trans[0][76]	= settr(75,0,319,140,140,"Sugar_Counter_value = 6", 1, 2, 0);
	trans[0][79]	= settr(78,0,80,141,141,"Milk_Counter_cin?Milk_Counter_Dec", 1, 506, 0);
	trans[0][80]	= settr(79,0,95,142,142,"Milk_Counter = Milk_Counter_Dec", 1, 2, 0);
	T = trans[0][95] = settr(94,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(94,0,81,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(94,0,83,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(94,0,85,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(94,0,87,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(94,0,89,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(94,0,91,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(94,0,93,0,0,"IF", 0, 2, 0);
	trans[0][81]	= settr(80,0,82,143,0,"(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==1)))", 1, 2, 0);
	trans[0][82]	= settr(81,0,319,144,144,"Milk_Counter_value = 0", 1, 2, 0);
	trans[0][96]	= settr(95,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][83]	= settr(82,0,84,145,0,"(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==2)))", 1, 2, 0);
	trans[0][84]	= settr(83,0,319,146,146,"Milk_Counter_value = 1", 1, 2, 0);
	trans[0][85]	= settr(84,0,86,147,0,"(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==3)))", 1, 2, 0);
	trans[0][86]	= settr(85,0,319,148,148,"Milk_Counter_value = 2", 1, 2, 0);
	trans[0][87]	= settr(86,0,88,149,0,"(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==4)))", 1, 2, 0);
	trans[0][88]	= settr(87,0,319,150,150,"Milk_Counter_value = 3", 1, 2, 0);
	trans[0][89]	= settr(88,0,90,151,0,"(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==5)))", 1, 2, 0);
	trans[0][90]	= settr(89,0,319,152,152,"Milk_Counter_value = 4", 1, 2, 0);
	trans[0][91]	= settr(90,0,92,153,0,"(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==6)))", 1, 2, 0);
	trans[0][92]	= settr(91,0,319,154,154,"Milk_Counter_value = 5", 1, 2, 0);
	trans[0][93]	= settr(92,0,94,155,0,"(((Milk_Counter==Milk_Counter_Dec)&&(Milk_Counter_value==7)))", 1, 2, 0);
	trans[0][94]	= settr(93,0,319,156,156,"Milk_Counter_value = 6", 1, 2, 0);
	trans[0][97]	= settr(96,0,98,157,157,"Milk_Counter_cin?Milk_Counter_Inc", 1, 506, 0);
	trans[0][98]	= settr(97,0,113,158,158,"Milk_Counter = Milk_Counter_Inc", 1, 2, 0);
	T = trans[0][113] = settr(112,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(112,0,99,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(112,0,101,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(112,0,103,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(112,0,105,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(112,0,107,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(112,0,109,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(112,0,111,0,0,"IF", 0, 2, 0);
	trans[0][99]	= settr(98,0,100,159,0,"(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==0)))", 1, 2, 0);
	trans[0][100]	= settr(99,0,319,160,160,"Milk_Counter_value = 1", 1, 2, 0);
	trans[0][114]	= settr(113,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][101]	= settr(100,0,102,161,0,"(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==1)))", 1, 2, 0);
	trans[0][102]	= settr(101,0,319,162,162,"Milk_Counter_value = 2", 1, 2, 0);
	trans[0][103]	= settr(102,0,104,163,0,"(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==2)))", 1, 2, 0);
	trans[0][104]	= settr(103,0,319,164,164,"Milk_Counter_value = 3", 1, 2, 0);
	trans[0][105]	= settr(104,0,106,165,0,"(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==3)))", 1, 2, 0);
	trans[0][106]	= settr(105,0,319,166,166,"Milk_Counter_value = 4", 1, 2, 0);
	trans[0][107]	= settr(106,0,108,167,0,"(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==4)))", 1, 2, 0);
	trans[0][108]	= settr(107,0,319,168,168,"Milk_Counter_value = 5", 1, 2, 0);
	trans[0][109]	= settr(108,0,110,169,0,"(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==5)))", 1, 2, 0);
	trans[0][110]	= settr(109,0,319,170,170,"Milk_Counter_value = 6", 1, 2, 0);
	trans[0][111]	= settr(110,0,112,171,0,"(((Milk_Counter==Milk_Counter_Inc)&&(Milk_Counter_value==6)))", 1, 2, 0);
	trans[0][112]	= settr(111,0,319,172,172,"Milk_Counter_value = 7", 1, 2, 0);
	trans[0][115]	= settr(114,0,116,173,173,"Coffee_Counter_cin?Coffee_Counter_Dec", 1, 507, 0);
	trans[0][116]	= settr(115,0,131,174,174,"Coffee_Counter = Coffee_Counter_Dec", 1, 2, 0);
	T = trans[0][131] = settr(130,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(130,0,117,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(130,0,119,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(130,0,121,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(130,0,123,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(130,0,125,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(130,0,127,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(130,0,129,0,0,"IF", 0, 2, 0);
	trans[0][117]	= settr(116,0,118,175,0,"(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==1)))", 1, 2, 0);
	trans[0][118]	= settr(117,0,319,176,176,"Coffee_Counter_value = 0", 1, 2, 0);
	trans[0][132]	= settr(131,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][119]	= settr(118,0,120,177,0,"(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==2)))", 1, 2, 0);
	trans[0][120]	= settr(119,0,319,178,178,"Coffee_Counter_value = 1", 1, 2, 0);
	trans[0][121]	= settr(120,0,122,179,0,"(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==3)))", 1, 2, 0);
	trans[0][122]	= settr(121,0,319,180,180,"Coffee_Counter_value = 2", 1, 2, 0);
	trans[0][123]	= settr(122,0,124,181,0,"(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==4)))", 1, 2, 0);
	trans[0][124]	= settr(123,0,319,182,182,"Coffee_Counter_value = 3", 1, 2, 0);
	trans[0][125]	= settr(124,0,126,183,0,"(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==5)))", 1, 2, 0);
	trans[0][126]	= settr(125,0,319,184,184,"Coffee_Counter_value = 4", 1, 2, 0);
	trans[0][127]	= settr(126,0,128,185,0,"(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==6)))", 1, 2, 0);
	trans[0][128]	= settr(127,0,319,186,186,"Coffee_Counter_value = 5", 1, 2, 0);
	trans[0][129]	= settr(128,0,130,187,0,"(((Coffee_Counter==Coffee_Counter_Dec)&&(Coffee_Counter_value==7)))", 1, 2, 0);
	trans[0][130]	= settr(129,0,319,188,188,"Coffee_Counter_value = 6", 1, 2, 0);
	trans[0][133]	= settr(132,0,134,189,189,"Coffee_Counter_cin?Coffee_Counter_Inc", 1, 507, 0);
	trans[0][134]	= settr(133,0,149,190,190,"Coffee_Counter = Coffee_Counter_Inc", 1, 2, 0);
	T = trans[0][149] = settr(148,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(148,0,135,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(148,0,137,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(148,0,139,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(148,0,141,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(148,0,143,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(148,0,145,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(148,0,147,0,0,"IF", 0, 2, 0);
	trans[0][135]	= settr(134,0,136,191,0,"(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==0)))", 1, 2, 0);
	trans[0][136]	= settr(135,0,319,192,192,"Coffee_Counter_value = 1", 1, 2, 0);
	trans[0][150]	= settr(149,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][137]	= settr(136,0,138,193,0,"(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==1)))", 1, 2, 0);
	trans[0][138]	= settr(137,0,319,194,194,"Coffee_Counter_value = 2", 1, 2, 0);
	trans[0][139]	= settr(138,0,140,195,0,"(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==2)))", 1, 2, 0);
	trans[0][140]	= settr(139,0,319,196,196,"Coffee_Counter_value = 3", 1, 2, 0);
	trans[0][141]	= settr(140,0,142,197,0,"(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==3)))", 1, 2, 0);
	trans[0][142]	= settr(141,0,319,198,198,"Coffee_Counter_value = 4", 1, 2, 0);
	trans[0][143]	= settr(142,0,144,199,0,"(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==4)))", 1, 2, 0);
	trans[0][144]	= settr(143,0,319,200,200,"Coffee_Counter_value = 5", 1, 2, 0);
	trans[0][145]	= settr(144,0,146,201,0,"(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==5)))", 1, 2, 0);
	trans[0][146]	= settr(145,0,319,202,202,"Coffee_Counter_value = 6", 1, 2, 0);
	trans[0][147]	= settr(146,0,148,203,0,"(((Coffee_Counter==Coffee_Counter_Inc)&&(Coffee_Counter_value==6)))", 1, 2, 0);
	trans[0][148]	= settr(147,0,319,204,204,"Coffee_Counter_value = 7", 1, 2, 0);
	trans[0][151]	= settr(150,0,152,205,205,"Another_Timer_cin?Another_Timer_Timeout", 1, 508, 0);
	trans[0][152]	= settr(151,0,157,206,206,"Another_Timer = Another_Timer_Timeout", 1, 2, 0);
	T = trans[0][157] = settr(156,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(156,0,153,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(156,0,155,0,0,"IF", 0, 2, 0);
	trans[0][153]	= settr(152,0,154,207,0,"(((Controller_State==Controller_State_Another)&&(Another_Timer==Another_Timer_Timeout)))", 1, 2, 0);
	trans[0][154]	= settr(153,0,319,208,208,"Controller_State_cout!Controller_State_Select", 1, 12, 0);
	trans[0][158]	= settr(157,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][155]	= settr(154,0,156,209,0,"((Another_Timer==Another_Timer_Timeout))", 1, 2, 0);
	trans[0][156]	= settr(155,0,319,210,210,"Another_Timer_cout!Another_Timer_Stop", 1, 17, 0);
	trans[0][159]	= settr(158,0,160,211,211,"Another_Timer_cin?Another_Timer_Stop", 1, 508, 0);
	trans[0][160]	= settr(159,0,319,212,212,"Another_Timer = Another_Timer_Stop", 1, 2, 0);
	trans[0][161]	= settr(160,0,162,213,213,"Another_Timer_cin?Another_Timer_Start", 1, 508, 0);
	trans[0][162]	= settr(161,0,165,214,214,"Another_Timer = Another_Timer_Start", 1, 2, 0);
	T = trans[0][165] = settr(164,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(164,0,163,0,0,"IF", 0, 2, 0);
	trans[0][163]	= settr(162,0,164,215,0,"((Another_Timer==Another_Timer_Start))", 1, 2, 0);
	trans[0][164]	= settr(163,0,319,216,216,"Another_Timer_cout!Another_Timer_Running", 1, 17, 0);
	trans[0][166]	= settr(165,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][167]	= settr(166,0,168,217,217,"Another_Timer_cin?Another_Timer_Running", 1, 508, 0);
	trans[0][168]	= settr(167,0,319,218,218,"Another_Timer = Another_Timer_Running", 1, 2, 0);
	trans[0][169]	= settr(168,0,170,219,219,"Producer_State_cin?Producer_State_Take", 1, 509, 0);
	trans[0][170]	= settr(169,0,173,220,220,"Producer_State = Producer_State_Take", 1, 2, 0);
	T = trans[0][173] = settr(172,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(172,0,171,0,0,"IF", 0, 2, 0);
	trans[0][171]	= settr(170,0,172,221,0,"((Producer_State==Producer_State_Take))", 1, 2, 0);
	trans[0][172]	= settr(171,0,319,222,222,"Controller_State_cout!Controller_State_Another", 1, 12, 0);
	trans[0][174]	= settr(173,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][175]	= settr(174,0,176,223,223,"Producer_State_cin?Producer_State_Producing", 1, 509, 0);
	trans[0][176]	= settr(175,0,319,224,224,"Producer_State = Producer_State_Producing", 1, 2, 0);
	trans[0][177]	= settr(176,0,178,225,225,"Producer_State_cin?Producer_State_Produced", 1, 509, 0);
	trans[0][178]	= settr(177,0,319,226,226,"Producer_State = Producer_State_Produced", 1, 2, 0);
	trans[0][179]	= settr(178,0,180,227,227,"POS_State_cin?POS_State_Paid", 1, 510, 0);
	trans[0][180]	= settr(179,0,183,228,228,"POS_State = POS_State_Paid", 1, 2, 0);
	T = trans[0][183] = settr(182,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(182,0,181,0,0,"IF", 0, 2, 0);
	trans[0][181]	= settr(180,0,182,229,0,"(((Controller_State==Controller_State_POS)&&(POS_State==POS_State_Paid)))", 1, 2, 0);
	trans[0][182]	= settr(181,0,319,230,230,"Controller_State_cout!Controller_State_Produce", 1, 12, 0);
	trans[0][184]	= settr(183,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][185]	= settr(184,0,186,231,231,"POS_State_cin?POS_State_Idle", 1, 510, 0);
	trans[0][186]	= settr(185,0,319,232,232,"POS_State = POS_State_Idle", 1, 2, 0);
	trans[0][187]	= settr(186,0,188,233,233,"POS_State_cin?POS_State_Failed", 1, 510, 0);
	trans[0][188]	= settr(187,0,191,234,234,"POS_State = POS_State_Failed", 1, 2, 0);
	T = trans[0][191] = settr(190,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(190,0,189,0,0,"IF", 0, 2, 0);
	trans[0][189]	= settr(188,0,190,235,0,"(((Controller_State==Controller_State_POS)&&(POS_State==POS_State_Failed)))", 1, 2, 0);
	trans[0][190]	= settr(189,0,319,236,236,"Controller_State_cout!Controller_State_Select", 1, 12, 0);
	trans[0][192]	= settr(191,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][193]	= settr(192,0,194,237,237,"POS_State_cin?POS_State_Working", 1, 510, 0);
	trans[0][194]	= settr(193,0,319,238,238,"POS_State = POS_State_Working", 1, 2, 0);
	trans[0][195]	= settr(194,0,196,239,239,"Action_cin?Action_Take", 1, 511, 0);
	trans[0][196]	= settr(195,0,319,240,240,"Action = Action_Take", 1, 2, 0);
	trans[0][197]	= settr(196,0,198,241,241,"Action_cin?Action_Select_Mocha", 1, 511, 0);
	trans[0][198]	= settr(197,0,202,242,242,"Action = Action_Select_Mocha", 1, 2, 0);
	T = trans[0][202] = settr(201,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(201,0,199,0,0,"IF", 0, 2, 0);
	trans[0][199]	= settr(198,0,200,243,0,"(((Controller_State==Controller_State_Select)&&(Action==Action_Select_Mocha)))", 1, 2, 0);
	trans[0][200]	= settr(199,0,201,244,244,"Coffee_Type_cout!Coffee_Type_Mocha", 1, 13, 0);
	trans[0][201]	= settr(200,0,319,245,245,"Controller_State_cout!Controller_State_Info", 1, 12, 0);
	trans[0][203]	= settr(202,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][204]	= settr(203,0,205,246,246,"Action_cin?Action_POS_Failed", 1, 511, 0);
	trans[0][205]	= settr(204,0,319,247,247,"Action = Action_POS_Failed", 1, 2, 0);
	trans[0][206]	= settr(205,0,207,248,248,"Action_cin?Action_Another_Yes", 1, 511, 0);
	trans[0][207]	= settr(206,0,211,249,249,"Action = Action_Another_Yes", 1, 2, 0);
	T = trans[0][211] = settr(210,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(210,0,208,0,0,"IF", 0, 2, 0);
	trans[0][208]	= settr(207,0,209,250,0,"(((Controller_State==Controller_State_Another)&&(Action==Action_Another_Yes)))", 1, 2, 0);
	trans[0][209]	= settr(208,0,210,251,251,"Controller_State_cout!Controller_State_Info", 1, 12, 0);
	trans[0][210]	= settr(209,0,319,252,252,"Another_Timer_cout!Another_Timer_Start", 1, 17, 0);
	trans[0][212]	= settr(211,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][213]	= settr(212,0,214,253,253,"Action_cin?Action_POS_Paid", 1, 511, 0);
	trans[0][214]	= settr(213,0,319,254,254,"Action = Action_POS_Paid", 1, 2, 0);
	trans[0][215]	= settr(214,0,216,255,255,"Action_cin?Action_Produce_Ok", 1, 511, 0);
	trans[0][216]	= settr(215,0,219,256,256,"Action = Action_Produce_Ok", 1, 2, 0);
	T = trans[0][219] = settr(218,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(218,0,217,0,0,"IF", 0, 2, 0);
	trans[0][217]	= settr(216,0,218,257,0,"(((Controller_State==Controller_State_Info)&&(Action==Action_Produce_Ok)))", 1, 2, 0);
	trans[0][218]	= settr(217,0,319,258,258,"Controller_State_cout!Controller_State_POS", 1, 12, 0);
	trans[0][220]	= settr(219,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][221]	= settr(220,0,222,259,259,"Action_cin?Action_Produce_Cancel", 1, 511, 0);
	trans[0][222]	= settr(221,0,225,260,260,"Action = Action_Produce_Cancel", 1, 2, 0);
	T = trans[0][225] = settr(224,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(224,0,223,0,0,"IF", 0, 2, 0);
	trans[0][223]	= settr(222,0,224,261,0,"(((Controller_State==Controller_State_Info)&&(Action==Action_Produce_Cancel)))", 1, 2, 0);
	trans[0][224]	= settr(223,0,319,262,262,"Controller_State_cout!Controller_State_Select", 1, 12, 0);
	trans[0][226]	= settr(225,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][227]	= settr(226,0,228,263,263,"Action_cin?Action_Inc_Coffee", 1, 511, 0);
	trans[0][228]	= settr(227,0,237,264,264,"Action = Action_Inc_Coffee", 1, 2, 0);
	T = trans[0][237] = settr(236,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(236,0,229,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(236,0,231,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(236,0,233,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(236,0,235,0,0,"IF", 0, 2, 0);
	trans[0][229]	= settr(228,0,230,265,0,"((((Coffee_Type==Coffee_Type_Espresso)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Coffee)))", 1, 2, 0);
	trans[0][230]	= settr(229,0,319,266,266,"Coffee_Counter_cout!Coffee_Counter_Inc", 1, 16, 0);
	trans[0][238]	= settr(237,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][231]	= settr(230,0,232,267,0,"((((Coffee_Type==Coffee_Type_Americano)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Coffee)))", 1, 2, 0);
	trans[0][232]	= settr(231,0,319,268,268,"Coffee_Counter_cout!Coffee_Counter_Inc", 1, 16, 0);
	trans[0][233]	= settr(232,0,234,269,0,"((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Coffee)))", 1, 2, 0);
	trans[0][234]	= settr(233,0,319,270,270,"Coffee_Counter_cout!Coffee_Counter_Inc", 1, 16, 0);
	trans[0][235]	= settr(234,0,236,271,0,"((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Coffee)))", 1, 2, 0);
	trans[0][236]	= settr(235,0,319,272,272,"Coffee_Counter_cout!Coffee_Counter_Inc", 1, 16, 0);
	trans[0][239]	= settr(238,0,240,273,273,"Action_cin?Action_Select_Espresso", 1, 511, 0);
	trans[0][240]	= settr(239,0,244,274,274,"Action = Action_Select_Espresso", 1, 2, 0);
	T = trans[0][244] = settr(243,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(243,0,241,0,0,"IF", 0, 2, 0);
	trans[0][241]	= settr(240,0,242,275,0,"(((Controller_State==Controller_State_Select)&&(Action==Action_Select_Espresso)))", 1, 2, 0);
	trans[0][242]	= settr(241,0,243,276,276,"Coffee_Type_cout!Coffee_Type_Espresso", 1, 13, 0);
	trans[0][243]	= settr(242,0,319,277,277,"Controller_State_cout!Controller_State_Info", 1, 12, 0);
	trans[0][245]	= settr(244,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][246]	= settr(245,0,247,278,278,"Action_cin?Action_Select_Latte", 1, 511, 0);
	trans[0][247]	= settr(246,0,251,279,279,"Action = Action_Select_Latte", 1, 2, 0);
	T = trans[0][251] = settr(250,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(250,0,248,0,0,"IF", 0, 2, 0);
	trans[0][248]	= settr(247,0,249,280,0,"(((Controller_State==Controller_State_Select)&&(Action==Action_Select_Latte)))", 1, 2, 0);
	trans[0][249]	= settr(248,0,250,281,281,"Coffee_Type_cout!Coffee_Type_Latte", 1, 13, 0);
	trans[0][250]	= settr(249,0,319,282,282,"Controller_State_cout!Controller_State_Info", 1, 12, 0);
	trans[0][252]	= settr(251,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][253]	= settr(252,0,254,283,283,"Action_cin?Action_Dec_Milk", 1, 511, 0);
	trans[0][254]	= settr(253,0,259,284,284,"Action = Action_Dec_Milk", 1, 2, 0);
	T = trans[0][259] = settr(258,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(258,0,255,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(258,0,257,0,0,"IF", 0, 2, 0);
	trans[0][255]	= settr(254,0,256,285,0,"((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Milk)))", 1, 2, 0);
	trans[0][256]	= settr(255,0,319,286,286,"Milk_Counter_cout!Milk_Counter_Dec", 1, 15, 0);
	trans[0][260]	= settr(259,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][257]	= settr(256,0,258,287,0,"((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Milk)))", 1, 2, 0);
	trans[0][258]	= settr(257,0,319,288,288,"Milk_Counter_cout!Milk_Counter_Dec", 1, 15, 0);
	trans[0][261]	= settr(260,0,262,289,289,"Action_cin?Action_Another_No", 1, 511, 0);
	trans[0][262]	= settr(261,0,266,290,290,"Action = Action_Another_No", 1, 2, 0);
	T = trans[0][266] = settr(265,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(265,0,263,0,0,"IF", 0, 2, 0);
	trans[0][263]	= settr(262,0,264,291,0,"(((Controller_State==Controller_State_Another)&&(Action==Action_Another_No)))", 1, 2, 0);
	trans[0][264]	= settr(263,0,265,292,292,"Controller_State_cout!Controller_State_Select", 1, 12, 0);
	trans[0][265]	= settr(264,0,319,293,293,"Another_Timer_cout!Another_Timer_Stop", 1, 17, 0);
	trans[0][267]	= settr(266,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][268]	= settr(267,0,269,294,294,"Action_cin?Action_Dec_Coffee", 1, 511, 0);
	trans[0][269]	= settr(268,0,278,295,295,"Action = Action_Dec_Coffee", 1, 2, 0);
	T = trans[0][278] = settr(277,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(277,0,270,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(277,0,272,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(277,0,274,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(277,0,276,0,0,"IF", 0, 2, 0);
	trans[0][270]	= settr(269,0,271,296,0,"((((Coffee_Type==Coffee_Type_Espresso)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Coffee)))", 1, 2, 0);
	trans[0][271]	= settr(270,0,319,297,297,"Coffee_Counter_cout!Coffee_Counter_Dec", 1, 16, 0);
	trans[0][279]	= settr(278,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][272]	= settr(271,0,273,298,0,"((((Coffee_Type==Coffee_Type_Americano)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Coffee)))", 1, 2, 0);
	trans[0][273]	= settr(272,0,319,299,299,"Coffee_Counter_cout!Coffee_Counter_Dec", 1, 16, 0);
	trans[0][274]	= settr(273,0,275,300,0,"((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Coffee)))", 1, 2, 0);
	trans[0][275]	= settr(274,0,319,301,301,"Coffee_Counter_cout!Coffee_Counter_Dec", 1, 16, 0);
	trans[0][276]	= settr(275,0,277,302,0,"((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Coffee)))", 1, 2, 0);
	trans[0][277]	= settr(276,0,319,303,303,"Coffee_Counter_cout!Coffee_Counter_Dec", 1, 16, 0);
	trans[0][280]	= settr(279,0,281,304,304,"Action_cin?Action_Select_Americano", 1, 511, 0);
	trans[0][281]	= settr(280,0,285,305,305,"Action = Action_Select_Americano", 1, 2, 0);
	T = trans[0][285] = settr(284,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(284,0,282,0,0,"IF", 0, 2, 0);
	trans[0][282]	= settr(281,0,283,306,0,"(((Controller_State==Controller_State_Select)&&(Action==Action_Select_Americano)))", 1, 2, 0);
	trans[0][283]	= settr(282,0,284,307,307,"Coffee_Type_cout!Coffee_Type_Americano", 1, 13, 0);
	trans[0][284]	= settr(283,0,319,308,308,"Controller_State_cout!Controller_State_Info", 1, 12, 0);
	trans[0][286]	= settr(285,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][287]	= settr(286,0,288,309,309,"Action_cin?Action_Inc_Milk", 1, 511, 0);
	trans[0][288]	= settr(287,0,293,310,310,"Action = Action_Inc_Milk", 1, 2, 0);
	T = trans[0][293] = settr(292,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(292,0,289,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(292,0,291,0,0,"IF", 0, 2, 0);
	trans[0][289]	= settr(288,0,290,311,0,"((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Milk)))", 1, 2, 0);
	trans[0][290]	= settr(289,0,319,312,312,"Milk_Counter_cout!Milk_Counter_Inc", 1, 15, 0);
	trans[0][294]	= settr(293,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][291]	= settr(290,0,292,313,0,"((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Milk)))", 1, 2, 0);
	trans[0][292]	= settr(291,0,319,314,314,"Milk_Counter_cout!Milk_Counter_Inc", 1, 15, 0);
	trans[0][295]	= settr(294,0,296,315,315,"Action_cin?Action_Dec_Sugar", 1, 511, 0);
	trans[0][296]	= settr(295,0,303,316,316,"Action = Action_Dec_Sugar", 1, 2, 0);
	T = trans[0][303] = settr(302,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(302,0,297,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(302,0,299,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(302,0,301,0,0,"IF", 0, 2, 0);
	trans[0][297]	= settr(296,0,298,317,0,"((((Coffee_Type==Coffee_Type_Americano)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Sugar)))", 1, 2, 0);
	trans[0][298]	= settr(297,0,319,318,318,"Sugar_Counter_cout!Sugar_Counter_Dec", 1, 14, 0);
	trans[0][304]	= settr(303,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][299]	= settr(298,0,300,319,0,"((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Sugar)))", 1, 2, 0);
	trans[0][300]	= settr(299,0,319,320,320,"Sugar_Counter_cout!Sugar_Counter_Dec", 1, 14, 0);
	trans[0][301]	= settr(300,0,302,321,0,"((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Dec_Sugar)))", 1, 2, 0);
	trans[0][302]	= settr(301,0,319,322,322,"Sugar_Counter_cout!Sugar_Counter_Dec", 1, 14, 0);
	trans[0][305]	= settr(304,0,306,323,323,"Action_cin?Action_Inc_Sugar", 1, 511, 0);
	trans[0][306]	= settr(305,0,313,324,324,"Action = Action_Inc_Sugar", 1, 2, 0);
	T = trans[0][313] = settr(312,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(312,0,307,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(312,0,309,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(312,0,311,0,0,"IF", 0, 2, 0);
	trans[0][307]	= settr(306,0,308,325,0,"((((Coffee_Type==Coffee_Type_Americano)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Sugar)))", 1, 2, 0);
	trans[0][308]	= settr(307,0,319,326,326,"Sugar_Counter_cout!Sugar_Counter_Inc", 1, 14, 0);
	trans[0][314]	= settr(313,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][309]	= settr(308,0,310,327,0,"((((Coffee_Type==Coffee_Type_Latte)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Sugar)))", 1, 2, 0);
	trans[0][310]	= settr(309,0,319,328,328,"Sugar_Counter_cout!Sugar_Counter_Inc", 1, 14, 0);
	trans[0][311]	= settr(310,0,312,329,0,"((((Coffee_Type==Coffee_Type_Mocha)&&(Controller_State==Controller_State_Info))&&(Action==Action_Inc_Sugar)))", 1, 2, 0);
	trans[0][312]	= settr(311,0,319,330,330,"Sugar_Counter_cout!Sugar_Counter_Inc", 1, 14, 0);
	T = trans[0][317] = settr(316,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(316,0,315,0,0,"IF", 0, 2, 0);
	trans[0][315]	= settr(314,0,316,331,0,"((Another_Timer==Another_Timer_Running))", 1, 2, 0);
	trans[0][316]	= settr(315,0,319,332,332,"Another_Timer_cout!Another_Timer_Timeout", 1, 17, 0);
	trans[0][318]	= settr(317,0,319,1,0,".(goto)", 0, 2, 0);
	trans[0][321]	= settr(320,0,322,1,0,"break", 0, 2, 0);
	trans[0][322]	= settr(321,0,0,333,333,"-end-", 0, 3500, 0);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(2*sizeof(Trans *));
	T = trans[_NP_][0] = settr(9997,0,1,_T5,0,"(np_)", 1,2,0);
	    T->nxt	  = settr(9998,0,0,_T2,0,"(1)",   0,2,0);
	T = trans[_NP_][1] = settr(9999,0,1,_T5,0,"(np_)", 1,2,0);
}

Trans *
settr(	int t_id, int a, int b, int c, int d,
	char *t, int g, int tpe0, int tpe1)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	tmp->atom  = a&(6|32);	/* only (2|8|32) have meaning */
	if (!g) tmp->atom |= 8;	/* no global references */
	tmp->st    = b;
	tmp->tpe[0] = tpe0;
	tmp->tpe[1] = tpe1;
	tmp->tp    = t;
	tmp->t_id  = t_id;
	tmp->forw  = c;
	tmp->back  = d;
	return tmp;
}

Trans *
cpytr(Trans *a)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	int i;
	tmp->atom  = a->atom;
	tmp->st    = a->st;
#ifdef HAS_UNLESS
	tmp->e_trans = a->e_trans;
	for (i = 0; i < HAS_UNLESS; i++)
		tmp->escp[i] = a->escp[i];
#endif
	tmp->tpe[0] = a->tpe[0];
	tmp->tpe[1] = a->tpe[1];
	for (i = 0; i < 6; i++)
	{	tmp->qu[i] = a->qu[i];
		tmp->ty[i] = a->ty[i];
	}
	tmp->tp    = (char *) emalloc(strlen(a->tp)+1);
	strcpy(tmp->tp, a->tp);
	tmp->t_id  = a->t_id;
	tmp->forw  = a->forw;
	tmp->back  = a->back;
	return tmp;
}

#ifndef NOREDUCE
int
srinc_set(int n)
{	if (n <= 2) return LOCAL;
	if (n <= 2+  DELTA) return Q_FULL_F; /* 's' or nfull  */
	if (n <= 2+2*DELTA) return Q_EMPT_F; /* 'r' or nempty */
	if (n <= 2+3*DELTA) return Q_EMPT_T; /* empty */
	if (n <= 2+4*DELTA) return Q_FULL_T; /* full  */
	if (n ==   5*DELTA) return GLOBAL;
	if (n ==   6*DELTA) return TIMEOUT_F;
	if (n ==   7*DELTA) return ALPHA_F;
	Uerror("cannot happen srinc_class");
	return BAD;
}
int
srunc(int n, int m)
{	switch(m) {
	case Q_FULL_F: return n-2;
	case Q_EMPT_F: return n-2-DELTA;
	case Q_EMPT_T: return n-2-2*DELTA;
	case Q_FULL_T: return n-2-3*DELTA;
	case ALPHA_F:
	case TIMEOUT_F: return 257; /* non-zero, and > MAXQ */
	}
	Uerror("cannot happen srunc");
	return 0;
}
#endif
int cnt;
#ifdef HAS_UNLESS
int
isthere(Trans *a, int b)
{	Trans *t;
	for (t = a; t; t = t->nxt)
		if (t->t_id == b)
			return 1;
	return 0;
}
#endif
#ifndef NOREDUCE
int
mark_safety(Trans *t) /* for conditional safety */
{	int g = 0, i, j, k;

	if (!t) return 0;
	if (t->qu[0])
		return (t->qu[1])?2:1;	/* marked */

	for (i = 0; i < 2; i++)
	{	j = srinc_set(t->tpe[i]);
		if (j >= GLOBAL && j != ALPHA_F)
			return -1;
		if (j != LOCAL)
		{	k = srunc(t->tpe[i], j);
			if (g == 0
			||  t->qu[0] != k
			||  t->ty[0] != j)
			{	t->qu[g] = k;
				t->ty[g] = j;
				g++;
	}	}	}
	return g;
}
#endif
void
retrans(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
	/* process n, with m states, is=initial state */
{	Trans *T0, *T1, *T2, *T3;
	Trans *T4, *T5; /* t_reverse or has_unless */
	int i;
#if defined(HAS_UNLESS) || !defined(NOREDUCE)
	int k;
#endif
#ifndef NOREDUCE
	int g, h, j, aa;
#endif
#ifdef HAS_UNLESS
	int p;
#endif
	if (state_tables >= 4)
	{	printf("STEP 1 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	do {
		for (i = 1, cnt = 0; i < m; i++)
		{	T2 = trans[n][i];
			T1 = T2?T2->nxt:(Trans *)0;
/* prescan: */		for (T0 = T1; T0; T0 = T0->nxt)
/* choice in choice */	{	if (T0->st && trans[n][T0->st]
				&&  trans[n][T0->st]->nxt)
					break;
			}
#if 0
		if (T0)
		printf("\tstate %d / %d: choice in choice\n",
		i, T0->st);
#endif
			if (T0)
			for (T0 = T1; T0; T0 = T0->nxt)
			{	T3 = trans[n][T0->st];
				if (!T3->nxt)
				{	T2->nxt = cpytr(T0);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
					continue;
				}
				do {	T3 = T3->nxt;
					T2->nxt = cpytr(T3);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
				} while (T3->nxt);
				cnt++;
			}
		}
	} while (cnt);
	if (state_tables >= 3)
	{	printf("STEP 2 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	for (i = 1; i < m; i++)
	{	if (trans[n][i] && trans[n][i]->nxt) /* optimize */
		{	T1 = trans[n][i]->nxt;
#if 0
			printf("\t\tpull %d (%d) to %d\n",
			T1->st, T1->forw, i);
#endif
			srcln[i] = srcln[T1->st];	/* Oyvind Teig, 5.2.0 */

			if (!trans[n][T1->st]) continue;
			T0 = cpytr(trans[n][T1->st]);
			trans[n][i] = T0;
			reach[T1->st] = 1;
			imed(T0, T1->st, n, i);
			for (T1 = T1->nxt; T1; T1 = T1->nxt)
			{
#if 0
			printf("\t\tpull %d (%d) to %d\n",
				T1->st, T1->forw, i);
#endif
		/*		srcln[i] = srcln[T1->st];  gh: not useful */
				if (!trans[n][T1->st]) continue;
				T0->nxt = cpytr(trans[n][T1->st]);
				T0 = T0->nxt;
				reach[T1->st] = 1;
				imed(T0, T1->st, n, i);
	}	}	}
	if (state_tables >= 2)
	{	printf("STEP 3 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
#ifdef HAS_UNLESS
	for (i = 1; i < m; i++)
	{	if (!trans[n][i]) continue;
		/* check for each state i if an
		 * escape to some state p is defined
		 * if so, copy and mark p's transitions
		 * and prepend them to the transition-
		 * list of state i
		 */
	 if (!like_java) /* the default */
	 {	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->e_trans = p;
				T2->nxt = trans[n][i];
				trans[n][i] = T2;
		}	}
	 } else /* outermost unless checked first */
	 {	T4 = T3 = (Trans *) 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->nxt = (Trans *) 0;
				T2->e_trans = p;
				if (T3)	T3->nxt = T2;
				else	T4 = T2;
				T3 = T2;
		}	}
		if (T4)
		{	T3->nxt = trans[n][i];
			trans[n][i] = T4;
		}
	 }
	}
#endif
#ifndef NOREDUCE
	for (i = 1; i < m; i++)
	{	if (a_cycles)
		{ /* moves through these states are visible */
	#if PROG_LAB>0 && defined(HAS_NP)
			if (progstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (progstate[n][T1->st])
					goto degrade;
	#endif
			if (accpstate[n][i] || visstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (accpstate[n][T1->st])
					goto degrade;
		}
		T1 = trans[n][i];
		if (!T1) continue;
		g = mark_safety(T1);	/* V3.3.1 */
		if (g < 0) goto degrade; /* global */
		/* check if mixing of guards preserves reduction */
		if (T1->nxt)
		{	k = 0;
			for (T0 = T1; T0; T0 = T0->nxt)
			{	if (!(T0->atom&8))
					goto degrade;
				for (aa = 0; aa < 2; aa++)
				{	j = srinc_set(T0->tpe[aa]);
					if (j >= GLOBAL && j != ALPHA_F)
						goto degrade;
					if (T0->tpe[aa]
					&&  T0->tpe[aa]
					!=  T1->tpe[0])
						k = 1;
			}	}
			/* g = 0;	V3.3.1 */
			if (k)	/* non-uniform selection */
			for (T0 = T1; T0; T0 = T0->nxt)
			for (aa = 0; aa < 2; aa++)
			{	j = srinc_set(T0->tpe[aa]);
				if (j != LOCAL)
				{	k = srunc(T0->tpe[aa], j);
					for (h = 0; h < 6; h++)
						if (T1->qu[h] == k
						&&  T1->ty[h] == j)
							break;
					if (h >= 6)
					{	T1->qu[g%6] = k;
						T1->ty[g%6] = j;
						g++;
			}	}	}
			if (g > 6)
			{	T1->qu[0] = 0;	/* turn it off */
				printf("pan: warning, line %d, ",
					srcln[i]);
			 	printf("too many stmnt types (%d)",
					g);
			  	printf(" in selection\n");
			  goto degrade;
			}
		}
		/* mark all options global if >=1 is global */
		for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			if (!(T1->atom&8)) break;
		if (T1)
degrade:	for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			T1->atom &= ~8;	/* mark as unsafe */
		/* can only mix 'r's or 's's if on same chan */
		/* and not mixed with other local operations */
		T1 = trans[n][i];
		if (!T1 || T1->qu[0]) continue;
		j = T1->tpe[0];
		if (T1->nxt && T1->atom&8)
		{ if (j == 5*DELTA)
		  {	printf("warning: line %d ", srcln[i]);
			printf("mixed condition ");
			printf("(defeats reduction)\n");
			goto degrade;
		  }
		  for (T0 = T1; T0; T0 = T0->nxt)
		  for (aa = 0; aa < 2; aa++)
		  if  (T0->tpe[aa] && T0->tpe[aa] != j)
		  {	printf("warning: line %d ", srcln[i]);
			printf("[%d-%d] mixed %stion ",
				T0->tpe[aa], j, 
				(j==5*DELTA)?"condi":"selec");
			printf("(defeats reduction)\n");
			printf("	'%s' <-> '%s'\n",
				T1->tp, T0->tp);
			goto degrade;
		} }
	}
#endif
	for (i = 1; i < m; i++)
	{	T2 = trans[n][i];
		if (!T2
		||  T2->nxt
		||  strncmp(T2->tp, ".(goto)", 7)
		||  !stopstate[n][i])
			continue;
		stopstate[n][T2->st] = 1;
	}
	if (state_tables && !verbose)
	{	if (dodot)
		{	char buf[256], *q = buf, *p = procname[n];
			while (*p != '\0')
			{	if (*p != ':')
				{	*q++ = *p;
				}
				p++;
			}
			*q = '\0';
			printf("digraph ");
			switch (Btypes[n]) {
			case I_PROC:  printf("init {\n"); break;
			case N_CLAIM: printf("claim_%s {\n", buf); break;
			case E_TRACE: printf("notrace {\n"); break;
			case N_TRACE: printf("trace {\n"); break;
			default:      printf("p_%s {\n", buf); break;
			}
			printf("size=\"8,10\";\n");
			printf("  GT [shape=box,style=dotted,label=\"%s\"];\n", buf);
			printf("  GT -> S%d;\n", is);
		} else
		{	switch (Btypes[n]) {
			case I_PROC:  printf("init\n"); break;
			case N_CLAIM: printf("claim %s\n", procname[n]); break;
			case E_TRACE: printf("notrace assertion\n"); break;
			case N_TRACE: printf("trace assertion\n"); break;
			default:      printf("proctype %s\n", procname[n]); break;
		}	}
		for (i = 1; i < m; i++)
		{	reach[i] = 1;
		}
		tagtable(n, m, is, srcln, reach);
		if (dodot) printf("}\n");
	} else
	for (i = 1; i < m; i++)
	{	int nrelse;
		if (Btypes[n] != N_CLAIM)
		{	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			{	if (T0->st == i
				&& strcmp(T0->tp, "(1)") == 0)
				{	printf("error: proctype '%s' ",
						procname[n]);
		  			printf("line %d, state %d: has un",
						srcln[i], i);
					printf("conditional self-loop\n");
					pan_exit(1);
		}	}	}
		nrelse = 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		{	if (strcmp(T0->tp, "else") == 0)
				nrelse++;
		}
		if (nrelse > 1)
		{	printf("error: proctype '%s' state",
				procname[n]);
		  	printf(" %d, inherits %d", i, nrelse);
		  	printf(" 'else' stmnts\n");
			pan_exit(1);
	}	}
#if !defined(LOOPSTATE) && !defined(BFS_PAR)
	if (state_tables)
#endif
	do_dfs(n, m, is, srcln, reach, lpstate);

	if (!t_reverse)
	{	return;
	}
	/* process n, with m states, is=initial state -- reverse list */
	if (!state_tables && Btypes[n] != N_CLAIM)
	{	for (i = 1; i < m; i++)
		{	Trans *Tx = (Trans *) 0; /* list of escapes */
			Trans *Ty = (Trans *) 0; /* its tail element */
			T1 = (Trans *) 0; /* reversed list */
			T2 = (Trans *) 0; /* its tail */
			T3 = (Trans *) 0; /* remembers possible 'else' */

			/* find unless-escapes, they should go first */
			T4 = T5 = T0 = trans[n][i];
	#ifdef HAS_UNLESS
			while (T4 && T4->e_trans) /* escapes are first in orig list */
			{	T5 = T4;	  /* remember predecessor */
				T4 = T4->nxt;
			}
	#endif
			/* T4 points to first non-escape, T5 to its parent, T0 to original list */
			if (T4 != T0)		 /* there was at least one escape */
			{	T3 = T5->nxt;		 /* start of non-escapes */
				T5->nxt = (Trans *) 0;	 /* separate */
				Tx = T0;		 /* start of the escapes */
				Ty = T5;		 /* its tail */
				T0 = T3;		 /* the rest, to be reversed */
			}
			/* T0 points to first non-escape, Tx to the list of escapes, Ty to its tail */

			/* first tail-add non-escape transitions, reversed */
			T3 = (Trans *) 0;
			for (T5 = T0; T5; T5 = T4)
			{	T4 = T5->nxt;
	#ifdef HAS_UNLESS
				if (T5->e_trans)
				{	printf("error: cannot happen!\n");
					continue;
				}
	#endif
				if (strcmp(T5->tp, "else") == 0)
				{	T3 = T5;
					T5->nxt = (Trans *) 0;
				} else
				{	T5->nxt = T1;
					if (!T1) { T2 = T5; }
					T1 = T5;
			}	}
			/* T3 points to a possible else, which is removed from the list */
			/* T1 points to the reversed list so far (without escapes) */
			/* T2 points to the tail element -- where the else should go */
			if (T2 && T3)
			{	T2->nxt = T3;	/* add else */
			} else
			{	if (T3) /* there was an else, but there's no tail */
				{	if (!T1)	/* and no reversed list */
					{	T1 = T3; /* odd, but possible */
					} else		/* even stranger */
					{	T1->nxt = T3;
			}	}	}

			/* add in the escapes, to that they appear at the front */
			if (Tx && Ty) { Ty->nxt = T1; T1 = Tx; }

			trans[n][i] = T1;
			/* reversed, with escapes first and else last */
	}	}
	if (state_tables && verbose)
	{	printf("FINAL proctype %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
	}
}
void
imed(Trans *T, int v, int n, int j)	/* set intermediate state */
{	progstate[n][T->st] |= progstate[n][v];
	accpstate[n][T->st] |= accpstate[n][v];
	stopstate[n][T->st] |= stopstate[n][v];
	mapstate[n][j] = T->st;
}
void
tagtable(int n, int m, int is, short srcln[], uchar reach[])
{	Trans *z;

	if (is >= m || !trans[n][is]
	||  is <= 0 || reach[is] == 0)
		return;
	reach[is] = 0;
	if (state_tables)
	for (z = trans[n][is]; z; z = z->nxt)
	{	if (dodot)
			dot_crack(n, is, z);
		else
			crack(n, is, z, srcln);
	}

	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		tagtable(n, m, z->st, srcln, reach);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			tagtable(n, m, j, srcln, reach);
		}
#endif
	}
}

extern Trans *t_id_lkup[];

void
dfs_table(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	Trans *z;

	if (is >= m || is <= 0 || !trans[n][is])
		return;
	if ((reach[is] & (4|8|16)) != 0)
	{	if ((reach[is] & (8|16)) == 16)	/* on stack, not yet recorded */
		{	lpstate[is] = 1;
			reach[is] |= 8; /* recorded */
			if (state_tables && verbose)
			{	printf("state %d line %d is a loopstate\n", is, srcln[is]);
		}	}
		return;
	}
	reach[is] |= (4|16);	/* visited | onstack */
	for (z = trans[n][is]; z; z = z->nxt)
	{	t_id_lkup[z->t_id] = z;
#ifdef HAS_UNLESS
		int i, j;
#endif
		dfs_table(n, m, z->st, srcln, reach, lpstate);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			dfs_table(n, m, j, srcln, reach, lpstate);
		}
#endif
	}
	reach[is] &= ~16; /* no longer on stack */
}
void
do_dfs(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	int i;
	dfs_table(n, m, is, srcln, reach, lpstate);
	for (i = 0; i < m; i++)
		reach[i] &= ~(4|8|16);
}
void
crack(int n, int j, Trans *z, short srcln[])
{	int i;

	if (!z) return;
	printf("	state %3d -(tr %3d)-> state %3d  ",
		j, z->forw, z->st);
	printf("[id %3d tp %3d", z->t_id, z->tpe[0]);
	if (z->tpe[1]) printf(",%d", z->tpe[1]);
#ifdef HAS_UNLESS
	if (z->e_trans)
		printf(" org %3d", z->e_trans);
	else if (state_tables >= 2)
	for (i = 0; i < HAS_UNLESS; i++)
	{	if (!z->escp[i]) break;
		printf(" esc %d", z->escp[i]);
	}
#endif
	printf("]");
	printf(" [%s%s%s%s%s] %s:%d => ",
		z->atom&6?"A":z->atom&32?"D":"-",
		accpstate[n][j]?"a" :"-",
		stopstate[n][j]?"e" : "-",
		progstate[n][j]?"p" : "-",
		z->atom & 8 ?"L":"G",
		PanSource, srcln[j]);
	for (i = 0; z->tp[i]; i++)
		if (z->tp[i] == '\n')
			printf("\\n");
		else
			putchar(z->tp[i]);
	if (verbose && z->qu[0])
	{	printf("\t[");
		for (i = 0; i < 6; i++)
			if (z->qu[i])
				printf("(%d,%d)",
				z->qu[i], z->ty[i]);
		printf("]");
	}
	printf("\n");
	fflush(stdout);
}
/* spin -a m.pml; cc -o pan pan.c; ./pan -D | dot -Tps > foo.ps; ps2pdf foo.ps */
void
dot_crack(int n, int j, Trans *z)
{	int i;

	if (!z) return;
	printf("	S%d -> S%d  [color=black", j, z->st);

	if (z->atom&6) printf(",style=dashed");
	else if (z->atom&32) printf(",style=dotted");
	else if (z->atom&8) printf(",style=solid");
	else printf(",style=bold");

	printf(",label=\"");
	for (i = 0; z->tp[i]; i++)
	{	if (z->tp[i] == '\\'
		&&  z->tp[i+1] == 'n')
		{	i++; printf(" ");
		} else
		{	putchar(z->tp[i]);
	}	}
	printf("\"];\n");
	if (accpstate[n][j]) printf("  S%d [color=red,style=bold];\n", j);
	else if (progstate[n][j]) printf("  S%d [color=green,style=bold];\n", j);
	if (stopstate[n][j]) printf("  S%d [color=blue,style=bold,shape=box];\n", j);
}

#ifdef VAR_RANGES
#define BYTESIZE	32	/* 2^8 : 2^3 = 256:8 = 32 */

typedef struct Vr_Ptr {
	char	*nm;
	uchar	vals[BYTESIZE];
	struct Vr_Ptr *nxt;
} Vr_Ptr;
Vr_Ptr *ranges = (Vr_Ptr *) 0;

void
logval(char *s, int v)
{	Vr_Ptr *tmp;

	if (v<0 || v > 255) return;
	for (tmp = ranges; tmp; tmp = tmp->nxt)
		if (!strcmp(tmp->nm, s))
			goto found;
	tmp = (Vr_Ptr *) emalloc(sizeof(Vr_Ptr));
	tmp->nxt = ranges;
	ranges = tmp;
	tmp->nm = s;
found:
	tmp->vals[(v)/8] |= 1<<((v)%8);
}

void
dumpval(uchar X[], int range)
{	int w, x, i, j = -1;

	for (w = i = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
from:		if ((X[w] & (1<<x)))
		{	printf("%d", i);
			j = i;
			goto upto;
	}	}
	return;
	for (w = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
upto:		if (!(X[w] & (1<<x)))
		{	if (i-1 == j)
				printf(", ");
			else
				printf("-%d, ", i-1);
			goto from;
	}	}
	if (j >= 0 && j != 255)
		printf("-255");
}

void
dumpranges(void)
{	Vr_Ptr *tmp;
	printf("\nValues assigned within ");
	printf("interval [0..255]:\n");
	for (tmp = ranges; tmp; tmp = tmp->nxt)
	{	printf("\t%s\t: ", tmp->nm);
		dumpval(tmp->vals, BYTESIZE);
		printf("\n");
	}
}
#endif
