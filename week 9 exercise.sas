LIBNAME ClassEx "/home/u59478853/semester2/Week 9";
DATA XTRFxcovbs;
SET ClassEx.xtrfxcovbs;
RUN;
/* Generate a variable for time from CT scan to End of Study */
DATA XTRFxcovbs;
SET XTRFxcovbs;
cttoend = Intck('month', t_xtrdate, nonewosteofx_enddate);
RUN;
/* Generate a variable for time from CT scan to Fracture (if present) */
DATA XTRFxcovbs;
SET XTRFxcovbs;
newdate = mdy(FirstNewOsteoFx_month, FirstNewOsteoFx_day, FirstNewOsteoFX_year);
FORMAT newdate ddmmyy8;
cttofx = Intck('month', t_xtrdate, newdate);
RUN;
/* Generate a variable for time to event, which takes on the value of #2 (above) if
no fracture, and #3 (above) if fracture present */
DATA XTRFxcovbs;
SET XTRFxcovbs;
IF newosteofx = 0 THEN timetoevent = cttoend;
ELSE IF newosteofx = 1 THEN timetoevent = cttofx;
ELSE timetoevent = timetoevent;
/* Run a Kaplan Meier analysis comparing time to event (with fracture status) between
those who were using osteoporosis medication versus those without - generate the associated
KM plot */
/* Apply a test to evaluate whether there is a difference in these curves */
ODS GRAPHICS ON;
PROC LIFETEST DATA = XTRFxcovbs OUTSURV=KMEST PLOTS=(S(CL));
TIME timetoevent*newosteofx(0);
STRATA osteomed / TEST=ALL;
RUN;
ODS GRAPHICS OFF;
/*ODS GRAPHICS ON;
PROC LIFETEST DATA = XTRFxcovbs OUTSURV=KMEST REDUCEOUT TIMELIST=(3 5) PLOTS=(S(CL));
TIME timetoevent*newosteofx(0);
STRATA osteomed / TEST=ALL;
RUN;
ODS GRAPHICS OFF;
*/
/* Part II:
Run a Cox Proportional Hazard model examining the relationship between t_TbSp
(trabecular bone spacing / separation, in mm) as the exposure and time to event with fracture
status (new osteoporotic fractures, 1/0) as the binary outcome, adjusting for age, height,
weight, prevfx_any (previous fractures), cortico_oral_reg (use of steroids),
osteomed (use of osteoporosis medication)
Make sure to express hazard ratios (HR) with 95% confidence intervals and applying
Efron approximation for resolving ties */
PROC PHREG DATA = XTRFxcovbs;
MODEL timetoevent*newosteofx(0) = t_TbSp age height weight prevfx_any cortico_oral_reg osteomed / RISKLIMIT;
HAZARDRATIO t_TbSp;
RUN; QUIT;
/*Run a diagnostic to determine validity of proportionality and linearity assumptions
(Schoenfeld and Deviance residuals)*/
/*ODS GRAPHICS ON;
PROC LIFETEST DATA=XTRFxcovbs METHOD=KM PLOTS=(S (CL)); *using point wise CL;
TIME timetoevent*newosteofx(0);
STRATA t_TbSp / TEST=ALL;
LABEL timetoevent = 'time to fracture';
LABEL t_TbSp = 'trabecular bone spacing quartiles';
RUN;
ODS GRAPHICS OFF; */
/* Schoenfeld residuals */
PROC PHREG DATA=XTRFxcovbs; /* Covariates According to FRAX */
t_TbSP = -1*t_TbSp;
MODEL timetoevent*newosteofx(0) = t_TbSp age height weight prevfx_any cortico_oral_reg osteomed / RISKLIMIT;
HAZARDRATIO t_TbSp / UNIT = 100;
OUTPUT OUT=XTRSch_Pred WTRESSCH=SchfR;
/* OUTPUT OUT=XTRSch_Covs WTRESSCH=age height weight CENTRE parenthipfx prevfx_any cig_cur nbalc_week rheu_ever cortico_oral_reg SECOP nbfall_pastyr everlost10lbs osteomed;*/
RUN; QUIT;
DATA XTRSch_Pred;
SET XTRSch_Pred;
LOGT = LOG(timetoevent);
RUN;
ODS GRAPHICS ON;
PROC SGPLOT DATA=XTRSch_Pred;
LOESS X = LOGT Y = SchfR /CLM INTERPOLATION=CUBIC SMOOTH=0.7; /* LOESS function usually used to display trend */
RUN;
ODS GRAPHICS OFF;
PROC REG DATA=XTRSch_Pred;
MODEL SchfR = LOGT / CLB;
RUN; QUIT;
/* Repeat the model in #1, this time expressing the exposure contrast per standard deviation
(SD) HIGHER t_TbSp */
/* Alternatively Standardize Dataset */
PROC STDIZE DATA=XTRFxCovBS OUT=XTRFxCovBS_SD;
VAR t_TbSp;
RUN;
/* 1 SD */
PROC PHREG DATA=XTRFxCovbs_SD; /* Covariates According to FRAX */
MODEL timetoevent*newosteofx(0) = t_TbSp age height weight prevfx_any cortico_oral_reg osteomed / RISKLIMIT;
HAZARDRATIO t_TbSp / UNIT = 1;
RUN; QUIT;
/* Re-run model in #3, this time replacing t_TbSp with t_ttBMD (total bone density) and
expressing the exposure contrast per standard deviation (SD) LOWER t_ttBMD */
/* Schoenfeld residuals */
PROC PHREG DATA=XTRFxcovbs; /* Covariates According to FRAX */
t_TtBMD = -1*t_TtBMD;
MODEL timetoevent*newosteofx(0) = t_TtBMD age height weight CENTRE parenthipfx prevfx_any cig_cur nbalc_week rheu_ever cortico_oral_reg SECOP nbfall_pastyr everlost10lbs osteomed / RISKLIMIT;
HAZARDRATIO t_TtBMD / UNIT = 100;
OUTPUT OUT=XTRSch_Pred WTRESSCH=SchfR;
/* OUTPUT OUT=XTRSch_Covs WTRESSCH=age height weight CENTRE parenthipfx prevfx_any cig_cur nbalc_week rheu_ever cortico_oral_reg SECOP nbfall_pastyr everlost10lbs osteomed;*/
RUN; QUIT;
DATA XTRSch_Pred;
SET XTRSch_Pred;
LOGT = LOG(timetoevent);
RUN;
ODS GRAPHICS ON;
PROC SGPLOT DATA=XTRSch_Pred;
LOESS X = LOGT Y = SchfR /CLM INTERPOLATION=CUBIC SMOOTH=0.7; /* LOESS function usually used to display trend */
RUN;
ODS GRAPHICS OFF;
PROC REG DATA=XTRSch_Pred;
MODEL SchfR = LOGT / CLB;
RUN; QUIT;