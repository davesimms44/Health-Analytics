LIBNAME class "/home/u59478853/semester2/Week4";
RUN;

proc print data = class.xtrsupmerged; run;

proc reg data=class.xtrsupmerged;
	model bonespacing = age / clb;
run;quit;

proc corr data = class.xtrsupmerged;
	var bonespacing age;
run;

proc glm data=class.xtrsupmerged;
	model bonespacing = age BMI Previousfracture / clparm;
run;quit;

proc means data=class.xtrsupmerged;
	var age;
run;

proc means data=class.xtrsupmerged;
	var bonespacing;
run;
