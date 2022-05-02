LIBNAME class "/home/u59478853/semester2";
RUN;


*DEMO;

DATA supdemoca;
	SET class.supdemoca;
RUN;
proc print data=supdemoca;run;
DATA supdemoha;
	SET class.supdemoha;
RUN;

DATA supdemosk;
	SET class.supdemosk;
RUN;

DATA supdemoto;
	SET class.supdemoto;
RUN;

DATA supdemovr;
	SET class.supdemovr;
RUN;


*FX;

DATA supfxca;
	SET class.supfxca;
RUN;

DATA supfxha;
	SET class.supfxha;
RUN;

DATA supfxsk;
	SET class.supfxsk;
RUN;

DATA supfxto;
	SET class.supfxto;
RUN;

DATA supfxvr;
	SET class.supfxvr;
RUN;



*BONE;

DATA supboneca;
	SET class.supboneca;
RUN;

DATA supboneha;
	SET class.supboneha;
RUN;

DATA supbonesk;
	SET class.supbonesk;
RUN;

DATA supboneto;
	SET class.supboneto;
RUN;

DATA supbonevr;
	SET class.supbonevr;
RUN;



*SORTING;

PROC SORT DATA=supdemoca; BY ID; RUN;
PROC SORT DATA=supdemoha; BY ID; RUN;
PROC SORT DATA=supdemosk; BY ID; RUN;
PROC SORT DATA=supdemoto; BY ID; RUN;
PROC SORT DATA=supdemovr; BY ID; RUN;

PROC SORT DATA=supfxca; BY ID; RUN;
PROC SORT DATA=supfxha; BY ID; RUN;
PROC SORT DATA=supfxsk; BY ID; RUN;
PROC SORT DATA=supfxto; BY ID; RUN;
PROC SORT DATA=supfxvr; BY ID; RUN;

PROC SORT DATA=supboneca; BY ID; RUN;
PROC SORT DATA=supboneha; BY ID; RUN;
PROC SORT DATA=supbonesk; BY ID; RUN;
PROC SORT DATA=supboneto; BY ID; RUN;
PROC SORT DATA=supbonevr; BY ID; RUN;

*APPEND;


DATA LJ;
	MERGE supdemoca(IN=C)supdemoha(IN=H) supdemosk(IN=S) supdemoto(IN=T) supbonevr(IN=V) supboneca(IN=BC)supboneha(IN=BH) supbonesk(IN=BS) supboneto(IN=BT) supbonevr(IN=BV) supfxca(IN=FC)supfxha(IN=FH) supfxsk(IN=FS) supfxto(IN=FT) supfxvr(IN=FV);
	BY ID;
	IF (C+H+S+T+V) then output LJ;
RUN;
proc print data = lj
PROC APPEND BASE=supdemoca  DATA=supdemoha;
RUN;
PROC PRINT DATA=mergedemo1;
	TITLE mergedemo1;
RUN;



*MERGE;

DATA mergedemo;
	MERGE supdemoca supdemoha supdemosk supdemoto supdemovr;
	BY ID;
RUN;

DATA mergefx;
	MERGE supfxca supfxha supfxsk supfxto supfxvr;
	BY ID;
RUN;

DATA mergebone;
	MERGE supboneca supboneha supbonesk supboneto supbonevr;
	BY ID;
RUN;
proc print data=mergebone;run;
DATA mergesup;
	MERGE mergedemo mergefx mergebone;
	BY ID;
RUN;
proc print data=mergesup; run;

*Q4.	Calculate body mass index (BMI) = weight (in kilograms) / height (in meters) squared.;
DATA work.mergesup;
    SET work.mergesup;
BMI= (weight/height)**2;
RUN;
    
    
    

*Calculate the number of months elapsed between CTDate and StudyEndDate. Assign this to a variable called “TimetoStudyEnd”;
DATA work.mergesup;
    SET work.mergesup;  
TimetoStudyEnd = intck('month', CTDate, StudyEndDate);
RUN;


*Q5b.	Calculate the number of months elapsed between CTDate and FractureDate. Assign this to a variable called “TimetoFracture”;

DATA work.mergesup;
    SET work.mergesup;  
TimetoFracture = intck('month', CTDate, FractureDate);
RUN;

*Q5c.	Create a new variable that takes on the value of:
		“TimetoStudyEnd”  IF FractureYN = 0	and
		“TimetoFracture” IF FractureYN = 1
	Assign this to a variable called “TimetoEvent”;

DATA work.mergesup;
    SET work.mergesup;  
		IF FractureYN = 0 Then TimetoEvent =TimetoStudyEnd;
		IF FractureYN = 1 Then TimetoEvent =TimetoFracture;
		ELSE TimetoEvent= TimetoEvent;
RUN;