LIBNAME wk6 "/home/u59478853/semester2/Week6";

proc contents data = wk6.xtrfxcovbs;run;

proc print data = wk6.xtrfxcovbs (obs=10); run;

/*** log reg -  Is bone spacing across the trabeculae associated with an increased odds for fractures? 
  *outcome variable :newosteofx;
	*newoseofx = 1 --> experienced new fracture
	*newosteofx= 0 --> did not exp a new fracture
	
  *exposure variable :  t_tbsp (in mm) ***/

proc logistic data = wk6.xtrfxcovbs; 
	model newosteofx (event='1') = t_tbsp;
run;


data wk6.xtrfxcovbs2;
	set wk6.xtrfxcovbs2;
	bmi = weight / (height / 100) ** 2;
proc print data = wk6.xtrfxcovbs2 (obs=10);
run;



* exposure - t_tbsp , covariates are age bmi;
proc logistic data = wk6.xtrfxcovbs2; 
	model newosteofx (event='1') = t_tbsp age bmi ;
run;
	
	
*Repeat expressing the exposure contrast per SD higher trabecular bone spacing (t_tbsp);
proc logistic data = wk6.xtrfxcovbs2;
	model newosteofx (event='1') = t_tbsp age bmi;
	units t_tbsp = SD;
run;
	
	
	
	
	
*code t_ctth into categories; 
data wk6.xtrfxcovbs3;
set wk6.xtrfxcovbs2;
if t_ctth < 0.77 then t_ctth_cat='1' ;
else if t_ctth <0.96 then t_ctth_cat="2";
else if t_ctth <1.12 then t_ctth_cat="3";
else t_ctth_cat='4';
run;



proc logistic data = wk6.xtrfxcovbs3;
	class t_ctth_cat (REF='1') / PARAM = REF;
	model newosteofx (event='1') = t_ctth_cat age bmi;
run;
*goal : How does the lowest quartile of cortical thickness compare to the highest quartile in 
		its association with fractures, adjusting for age and BMI?
outcome variable - 	*newoseofx = 1 --> experienced new fracture
	                *newosteofx= 0 --> did not exp a new fracture
	                
* exposure variable - t_ctth
	Recode the t_ctth variable into a new variable called t_ctth_cat with 4 categories as defined by: 
	1 if t_ctth < 0.77 
    2 if t_ctth < 0.96
    3 if t_ctth < 1.12  
    4 if t_ctth > 1.12;



covariates : age, bmi