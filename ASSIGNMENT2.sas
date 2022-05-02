LIBNAME ASN2 "/home/u59478853/ASN2";

* SUBSET ['id', 't_ttbmd', 't_ctth', 'r_ttbmd', 'r_ctth', 't_moart', 'r_moart', 'hicnum', 'centre', 'age', 'osteomed', 'newosteofx', 'prevfx_any'];
DATA SUBSET;
	SET ASN2.xtrfxnd;
	KEEP id t_ctbmd r_ctbmd t_ttbmd t_ctth r_ttbmd r_ctth t_moart r_moart hicnum centre age osteomed newosteofx prevx_any;
RUN;
data SUBSET; 
	set SUBSET; 
	 = UPCASE(state_name); 
6
run;

*Q2. Do a frequency count for 'hicnum' and 'centre' - these are the study sites;
PROC FREQ DATA=SUBSET;
	TABLES hicnum centre;
RUN;

*Q3. Create a new variable called 'sitename' and freq cheq;
DATA SUBSET;
	set SUBSET;
	IF centre = 4.0 THEN sitename = "Toronto - Referant";
	ELSE if centre = 5.0 THEN sitename = "Vancouver";
	ELSE if centre = 3.0 THEN sitename = 'Saskatoon';
	ELSE IF centre = 2.0 OR hicnum = "HA" THEN sitename = "Hamilton";
	ELSE if centre = 1.0 OR hicnum = "CA" THEN sitename = "Calgary";
	ELSE sitename = '.';
RUN;
PROC FREQ DATA=SUBSET;
	TABLES hicnum centre sitename;
RUN;


PROC PRINT DATA=SUBSET NOOBS;
RUN;

DATA SUBSET;
	set SUBSET;
	IF centre = 1 then t_ttbmd_new = (0.97 * t_ttbmd + 19.06);
	IF centre = 1 then t_ctbmd_new = (1.05 * t_ctbmd - 6.82);
	IF centre = 3 then t_ttbmd_new = (1.03 * t_ttbmd - 23.26);
	IF centre = 3 then t_ctbmd_new = (0.99 * t_ctbmd - 0.03);
	IF centre = 4 then t_ttbmd_new = (0.99 * t_ttbmd - 3.93);
	IF centre = 4 then t_ctbmd_new = (1.04 * t_ctbmd - 0.05);

run;