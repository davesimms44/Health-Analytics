=DATA Test;
	a = 1;
run;

DATA Number;
	Var1 = 123;
	Var2 = 356;
	Var3 = 923;
RUN;

DATA Food;
	Restaurant ='Burger King';
	NumEmploy = 5;
	Location = "Toronto";
RUN;

DATA Score;
	INPUT Score1 Score2 Score3;
	DATALINES;
	77 88 35
	93 57 74
	67 85 71
	;
RUN;

DATA Profile;
	INPUT PAT_ID $ ENROL $ BSCORE;
	DATALINES;
	P001 Yes 99
	P002 Yes 101
	P003 No 125
	;
RUN;

DATA Profile;
	LENGTH PAT_ID $10;
	INPUT PAT_ID $ Enrol $ Bscore;
	DATALINES;
	PAT3000001 Yes 99
	PAT3000002 Yes 101
	PAT3000003 No 125
	;
RUN;

DATA new_profile;
	SET profile;
RUN;

DATA Enrol;
	SET Profile;
	IF Enrol = 'Yes';
Run;

DATA JanHol;
	SET SASHELP.HOLIDAY;
	IF month = 1;
Run;

LIBNAME PROJ1 "/home/u59478853/PROJ1";

DATA Income;
	Set PROJ1.Income;
Run;

DATA PROJ1.CP951;
	SET SASHELP.CP951;
Run;

PROC EXPORT DATA = SASHELP.Electric
	Outfile='/home/u59478853/PROJ1/Electric'
	Replace
	DBMS=XLSX;
RUN;

PROC EXPORT Data = SASHELP.Electric
	Outfile='/home/u59478853/PROJ1/Electric.txt'
	Replace
	DBMS=csv;
RUN;

DATA Rate;
	Bank = "Bank of America";
	Rate = 3.23;
	Year = 5;
Run;
	
DATA DEMO;
	Length ID $6 Race $9 Gender $6;
	Input ID $ Race $ Gender $ Age;
	Datalines;
	APP001 Black Male 30
	APP002 Caucasian Female 25
	APP003 Asian Male 24
	APP004 Black Female 32
	APP005 Caucaisan Female 26
	;
RUN;

DATA WORK.PERCH;
	SET SASHELP.FISH;
	IF species = 'Perch';
Run;

proc import datafile='/home/u59478853/PROJ1/kpi.txt'
            out=KPI
            dbms=TAB REPLACE;
            getnames=yes;
RUN;


/* SAS FUNCTIONS COURSE */
Data Numbers;
Input Val1 Val2;
Datalines;
1 26
4 49
17 45
13 32
11 22
34 43
25 25
0 43
19 23
23 33
;
Run;

Data Accounting;
Input EmployeeID $ Base OTHours Rate;
Datalines;
ID0001 6300 4 40
ID0002 4500 8 35
ID0003 8800 5 45
ID0004 8900 4 60
ID0005 5600 3 55
ID0006 6000 9 45
ID0007 7600 2 35
;
Run;

DATA Salary;
	SET Accounting;
	Total = Base + OTHours*Rate;
Run;



Data Sales;
Input StoreID $ Mon Tue Wed Thr Fri;
Datalines;
STR001 890 750 760 950 1150
STR002 650 450 520 760 970
STR003 1420 1250 1300 1425 1890
STR004 830 . 710 810 1040
STR005 760 550 780 980 1230
STR006 430 530 560 . 970
STR007 1010 980 . 890 1230
STR008 440 740 560 640 740
STR009 670 690 730 950 870
STR0010 570 790 820 810 640
;
Run;

DATA TSales;
	SET SALES;
	Total = SUM(of Mon,Tue,Wed,Thr,Fri);
Run;
Data Stat;
Input Player $ Stat $ Current;
Datalines;
L.James Points 28.6
L.James Rebounds 10.3
L.James Assists 6.4
L.James Blocks 0.8
L.James FG 47.7
;
Run;

Data LeStat;
	Set Stat;
	factor = rand('uniform')*0.2 +0.9;
	Pred = Current * factor;
Run;

Data Grocery;
Input Item Price Discount;
Datalines;
1 60.49 10
2 79.99 13
3 47.99 7
4 50.09 0
5 43.99 5
6 81.79 7
7 68.17 3
8 103.49 10
9 121.78 8
10 78.69 8
;
Run;

DATA shit;
	set grocery;
	Price2 = Price * (1-discount/100);
	Price3 = Round(Price2, 0.01);
Run;

Data PhoneList;
Input Tel $20.;
datalines;
416-222-2222
905-222-3333
289-222-4444
604-333-2121
780-444-8989
514-555-5959
902-333-1414
204-999-4646
877-111-1212
800-222-8686
;
Run;

data telly;
	set phonelist;
	Area = substr(tel,1,3);
Run;

Data FirstName;
Input Name $80.;
datalines;
Anna
Christopher
Mary
Jonathan
Tim
Elizabeth
Amy
($##($(#$(#$(#($#($#$#$(#$#$#$#(*$(#
schwarzenegger
Kevin
Porter
;
Run;

DATA BOO;
	Set FirstName;
	len = length(name);
Run;

Data Profile;
input SiteID $ PatientID $;
datalines;
S01 991
S01 992
S01 993
S02 991
S02 992
S02 993
S03 991
S03 992
S03 993
S04 991
;
Run;

Data FirstLast;
Input First $ Last $;
Datalines;
Justin Jeever
Amy Chang
Alex Toby
Andrew Khan
MaryAnn Garabed
Leslie Song
Jeff Barrett
Jeev Daha
Casey Carson
Ann Chen
;
Run;

data combine;
	set firstlast;
	one = trim(First) ||','|| Last;
run;

Data MathExam;
infile datalines dsd;
input Comment $40.;
datalines;
Mary's exam result is 89
Jonathan's exam result is 77
Ann's exam result is 97
Christopher's exam result is 68
Peter's exam result is 90
Jeev's exam result is 55
Tina's exam result is 86
Porter's exam result is 91
MaryAnn's exam result is 69
Tim's exam result is 72
;
Run;
data len;
	set mathexam;
	len1 = length(comment);
run;
data extract;
	set mathexam;
	shit = index(Comment, "is ");
run;

Data MathExam;
infile datalines dsd;
input Comment $40.;
datalines;
Mary's exam result is 89
Jonathan's exam result is 77
Ann's exam result is 97
Christopher's exam result is 68
Peter's exam result is 90
Jeev's exam result is 55
Tina's exam result is 86
Porter's exam result is 91
MaryAnn's exam result is 69
Tim's exam result is 72
;
Run;

data shit;
	set mathexam;
	Ind = Indexc(Comment, '1234567890');
	Result = substr(Comment,ind);
run;

Data Symptoms;
Infile datalines dsd dlm="~";
Length Sickness $15 Symptoms $100;
Input Sickness $ Symptoms $;
Datalines;
Nausea~headache,vomiting,Dizziness,lightheadedness,Diarrhea,abdominal pain
Asthma~Coughing,shortness of breath,Chest Tightness,Wheezing
Diabetes~Weight change,Extreme FATIGUE,Unusual thirst,frequent urination
Hepatitis~fatigue,poor appetite,belly Pain,Mild fever
;
Run;

DATA shit;
	set symptoms;
	Up = Upcase(symptoms);
	Ind=INdex(Up,'FATIGUE');
RUN;

DATA SHIT;
	set SASHELP.MARGARIN;
	KEEP HOUSEID CHOICE BRAND;
	RENAME HOUSEID=ID;
RUN;

DATA SHIT;
	SET SASHELP.CARS;
	If msrp <= 40000 then class = 'economy';
	else class = 'luxury';
run;

Data Phonebill;
Input BillNo $ Minutes Messages Data;
Datalines;
B001 238 15 670
B002 323 39 1300
B003 89 2 230
B004 124 22 890
B005 156 34 1290
B006 122 22 1180
B007 211 26 450
B008 189 28 990
B009 123 23 220
B010 101 7 330
;
Run;

Data PhoneBill2;
Set PhoneBill;
Base = 30;
Add_Min = Max(Minutes-200, 0);
Add_Meg = Max(Messages-25, 0);
Add_Dat = Max(Data-1000, 0);
Amount = 30 + Add_Min*0.1 + Add_Meg*0.5 + Add_Dat*0.05;
Run;

Data Race;
Input Car $ Lap1 Lap2 Lap3 Lap4 Lap5;
Datalines;
CAR001 390.31 410.9 460.8 380.56 470.27
CAR002 410.19 440.99 390.61 400.14 430.62
CAR003 420.86 410.68 400.61 390.29 460.16
CAR004 390.65 380.87 430.19 380.82 470.54
CAR005 420.62 430.82 430.15 400.95 430.33
;
Run;

data shit;
	set race;
	average = mean(lap1,lap2,lap3,lap4,lap5);
run;

Data Expense;
do i = 101 to 200;
Claim = "CLAIM" || put(i, 3.0);
output;
end;
drop i;
Run;


Data Expense2;
Set Expense;
RandInt = Floor(Rand('uniform')*10) + 1;
If RandInt = 5;
Run;

Data Date;
Input ID $ BirthDate MarriageDate;
Format BirthDate MarriageDate yymmdd10.;
Datalines;
ID001 4423 19215
ID002 3234 19216
ID003 3242 19215
ID004 5124 19217
ID005 4921 19216
ID006 2772 19215
ID007 4212 19216
ID008 3821 19215
ID009 2412 19216
ID010 4124 19217
;
Run;


Data Date2;
Set Date;
Age = Floor((MarriageDate - BirthDate)/365.25);
Run;

Data Name;
Infile Datalines dlm=",";
Length Name $30;
Input Name $;
Datalines;
Nancie Strohl
Janee Salvaggio
Annabelle Schwanke
Marybelle Holtsclaw
Art Dahlen
Barrie Bianco
Barbera Deltoro
Launa Gaudreau
Isabelle Tiernan
Annamae Bellin
;
Run;

Data Name2;
Set Name;
Ind_space = index(Name, " ");
First = substr(Name, 1, Ind_Space-1);
Last = substr(Name, Ind_Space);
Run;


	
Data Product;
Input Barcode $12.;
Datalines;
584563449723
584563358735
384563675036
084563154684
084563447166
984563804834
284563674476
884563657341
784563480621
384563604852
;
run;

Data Product2;
Set Product;
Length class $30;

d1 = substr(barcode, 1, 1);
if d1 = 2 then class = "Meat, Fruits, Vegetables";
else if d1 = 3 then class = "Drug";
else if d1 = 4 then class = "Loyalty Card";
else if d1 = 5 or d1 = 9 then class = "Coupon";
else if d1 in (0, 1, 6, 7, 8) then class = "General";

Run;

Data Product3;
Set Product;
ManfNo = substr(barcode, 2, 5);
Run;

Data Product4;
Set Product;
Ind = Index(barcode, "67503");
Run;

Data Product5;
Set Product;

** Last Digit **;
d12 = substr(barcode, 12, 1);

** Check Digit Calculations **;
d1=substr(barcode, 1, 1);
d2=substr(barcode, 2, 1);
d3=substr(barcode, 3, 1);
d4=substr(barcode, 4, 1);
d5=substr(barcode, 5, 1);
d6=substr(barcode, 6, 1);
d7=substr(barcode, 7, 1);
d8=substr(barcode, 8, 1);
d9=substr(barcode, 9, 1);
d10=substr(barcode, 10, 1);
d11=substr(barcode, 11, 1);

odd = sum(of d1, d3, d5, d7, d9, d11)*3;
even = sum(of d2, d4, d6, d8, d10);
check = 10 - mod(odd+even, 10);

** Check if Last Digit is the same as Check Digit **;
if d12 ^= check then flag = 1;

Run;

Proc Format;
value edu 1 = "High School"
		  2 = "Bachelor Degree"
		  3 = "Master Degree"
		  4 = "Doctoral";
Run;

Data Customer;
Infile Datalines dlm = ",";
Length CustID $8. First Last $20. Gender $6. DOB 8. Postal $6. Edu 8. Occup $30. Income 8. Status $10.;
Informat DOB DOS yymmdd10.;
Format DOB DOS yymmdd10. Edu Edu.;
Input CustID $ First $ Last $ Gender $ DOB Postal $ Edu Occup $ Income Status $ NumKids Spend DOS;
Datalines;
80050123,Watson,Walls,Female,1999-01-23,M7V5D8,3,Tax inspector,92000,Single,0,2009,2015-01-01
80050124,Adkins,Dunn,Female,1969-03-01,N8G4F8,3,Publican,111000,Married,1,5272.6,2015-01-01
80050125,Cuevas,Gonzalez,Female,1981-10-01,K6E5E2,3,Crown prosecutor,90000,Divorced,0,5100.4,2015-01-01
80050126,Benson,Henderson,Female,1997-02-14,N2Y7L6,1,Shop assistant,71000,Married,2,1533.4,2015-01-01
80050127,Cuevas,Atkins,Male,1971-11-13,L7Q3H4,2,Minister,69000,Single,0,5502.2,2015-01-01
80050128,Arias,Estes,Male,1978-01-02,N3R3A4,1,Photographer,85000,Single,0,5953.2,2015-01-01
80050129,Hodges,Hatfield,Female,1980-06-07,K7W4Z2,2,Undertaker,54000,Single,0,1139.8,2015-01-01
80050130,Trevino,Liu,Male,1992-01-15,K3S2C4,2,Producer,62000,Married,2,3854,2015-01-01
80050131,Bowman,Rowe,Female,2000-11-03,N7R2D1,1,Pathologist,77000,Single,0,4411.6,2015-01-01
80050132,Delacruz,Reid,Male,1995-12-27,K4M3V1,1,Designer,35000,Married,0,2591.2,2015-01-01
80050133,Farrell,Randolph,Male,1970-02-01,M3O7X3,1,Stockbroker,65000,Married,0,5051.2,2015-01-01
80050134,Gilbert,Carpenter,Male,1984-02-29,N6B1D8,2,Engineer,68000,Single,0,2082.8,2015-01-01
80050135,Mathews,Petersen,Male,1979-08-19,N6R4W4,4,Caretaker,47000,Single,0,3788.4,2015-01-01
80050136,Rocha,Macdonald,Male,1985-12-18,L7D3G1,2,Conservationist,86000,Single,0,2943.8,2015-01-01
80050137,Golden,Evans,Female,1981-05-18,N3I2L1,3,Sailor,44000,Divorced,0,3419.4,2015-01-01
80050138,Calderon,Edwards,Female,1981-11-28,L1D2H5,2,Porter,52000,Single,0,1804,2015-01-01
80050139,Hines,Quinn,Male,1987-06-18,K2T5Y5,3,Surveyor,85000,Single,0,5756.4,2015-01-01
80050140,Valdez,Christian,Male,1983-10-27,L8L3A6,3,Professor,94000,Married,3,6445.2,2015-01-01
80050141,Austin,Bell,Female,1970-11-18,M2D2C2,3,Astrologer,81000,Divorced,3,5945,2015-01-01
80050142,Andersen,Strong,Male,1988-04-05,K2O4N7,1,Priest,81000,Married,0,1057.8,2015-01-01
80050143,Alexander,Butler,Male,1989-07-01,M8V1M7,3,Clerical assistant,95000,Divorced,1,5116.8,2015-01-01
80050144,Stewart,Hill,Female,1990-02-08,M8G4Q7,2,Producer,42000,Single,0,2189.4,2015-01-01
80050145,Hood,Allen,Male,1978-08-04,K8T5C8,4,Antique dealer,113000,Married,2,2255,2015-01-01
80050146,Miranda,Dickerson,Female,1990-07-07,K2R5A6,2,Song writer,91000,Single,0,2107.4,2015-01-01
80050147,Madden,Maddox,Female,1978-01-23,M3P8R5,1,Astrologer,70000,Single,0,3640.8,2015-01-01
80050148,Case,Carey,Male,1977-11-21,K3G4J3,3,Aromatherapist,58000,Single,0,4444.4,2015-01-01
80050149,Mcknight,Hebert,Male,1989-08-18,N6C4I6,3,Printer,89000,Single,0,5330,2015-01-01
80050150,Cain,Byrd,Male,1985-11-04,M4T5T8,2,Tattooist,103000,Single,0,5740,2015-01-01
80050151,Villarreal,Fisher,Female,1996-06-22,L4A4H4,4,Foster parent,79000,Divorced,1,5715.4,2015-01-01
80050152,Blackwell,Murillo,Male,1978-05-10,M4V3B5,3,Clerical assistant,86000,Single,0,4559.2,2015-01-01
80050153,Stewart,Ayers,Male,1972-06-02,L2V1M5,4,Dancer,52000,Single,0,6068,2015-01-01
80050154,Tucker,Galvan,Female,1996-03-11,K6C3G7,2,Builder,53000,Divorced,2,565.8,2015-01-01
80050155,Cantrell,Underwood,Female,1985-01-30,K3F1M7,1,Surgeon,97000,Single,0,1336.6,2015-01-01
80050156,Skinner,Collier,Male,1984-09-20,N7X5P8,1,Kennel worker,75000,Married,3,3968.8,2015-01-01
80050157,Shannon,Rose,Male,1989-04-21,M8K4C5,3,Inventor,111000,Single,0,1090.6,2015-01-01
80050158,Campbell,Hancock,Male,1981-03-28,N2F1W8,2,Baker,35000,Single,0,2681.4,2015-01-01
80050159,Freeman,Alvarado,Female,1990-10-17,K4N3A1,2,Sculptor,41000,Single,0,1902.4,2015-01-01
80050160,Blackwell,Estes,Male,1970-05-19,N5E6W3,1,Management consultant,83000,Divorced,2,4132.8,2015-01-01
80050161,Boyer,Hale,Male,2000-11-18,K8L2A4,4,Chef,37000,Single,0,5830.2,2015-01-01
80050162,Mathis,Fernandez,Female,1986-07-20,N6V1V4,1,Magistrate,92000,Single,0,1033.2,2015-01-01
80050163,Stokes,Carter,Female,1997-05-02,K8Q4S2,2,Interior designer,63000,Married,0,6092.6,2015-01-01
80050164,Travis,Kline,Male,1997-05-06,L6C8X7,2,Miner,77000,Married,2,4362.4,2015-01-01
80050165,Baird,Huerta,Male,1985-05-25,K6T6N2,4,Delivery driver,39000,Married,1,3329.2,2015-01-01
80050166,Martin,Mcgee,Male,2000-06-09,M3N4W2,2,Childminder,34000,Married,2,770.8,2015-01-01
80050167,Leon,Travis,Female,1992-07-12,N4Y8H4,2,Bank manager,48000,Single,0,3362,2015-01-01
80050168,Larson,Prince,Female,2000-11-10,N1H4G7,1,Grave digger,57000,Married,2,787.2,2015-01-01
80050169,Rios,Garcia,Female,1981-08-07,L8R1R7,4,Park ranger,62000,Married,0,5789.2,2015-01-01
80050170,Garner,Hodges,Female,1970-09-27,L2E4Z8,2,Crane driver,107000,Single,0,3772,2015-01-01
80050171,Harrell,Madden,Male,1990-09-14,M8V1M4,3,Television presenter,47000,Divorced,3,5854.8,2015-01-01
80050172,Hamilton,Koch,Female,1996-11-05,L7N2H1,2,Computer analyst,73000,Married,1,2492.8,2015-01-01
80050173,Knapp,Cox,Male,1976-10-13,K2R6C3,1,Croupier,33000,Married,2,1418.6,2015-01-01
80050174,Strickland,Novak,Female,1968-06-10,N6L3C5,4,Horticulturalist,104000,Married,2,4452.6,2015-01-01
80050175,Griffith,Williamson,Female,1982-08-24,N2O5I6,1,Osteopath,35000,Married,0,6412.4,2015-01-01
80050176,Randall,Huerta,Female,1989-05-08,M3N7P5,4,Housekeeper,88000,Married,2,2271.4,2015-01-01
80050177,Pace,Burton,Male,1988-08-04,N6J5P5,1,Miner,41000,Divorced,3,6076.2,2015-01-01
80050178,Davenport,Villa,Female,1982-04-16,K3P4R7,4,Student,76000,Married,3,590.4,2015-01-01
80050179,Benitez,Barton,Male,1977-05-22,L8O8V7,3,Firefighter,90000,Single,0,2189.4,2015-01-01
80050180,Sexton,Houston,Male,1976-06-22,L6R8X5,4,Caretaker,94000,Divorced,2,4149.2,2015-01-01
80050181,Wu,Hoffman,Female,1992-10-18,L1M4Q7,2,Lecturer,66000,Single,0,3944.2,2015-01-01
80050182,Atkins,Arellano,Female,1989-05-28,L3O8X5,4,Lighthouse keeper,45000,Married,0,2361.6,2015-01-01
80050183,Spencer,Dixon,Male,2000-06-26,M5S7Z2,1,Herbalist,89000,Married,3,3107.8,2015-01-01
80050184,Montes,Mayer,Male,1978-01-20,K3M3E3,2,Property developer,94000,Single,0,4239.4,2015-01-01
80050185,Atkins,Warner,Female,1996-06-15,K4H3C8,3,Flower arranger,63000,Single,0,4846.2,2015-01-01
80050186,Fisher,Hoover,Female,1983-01-23,M4U6S2,3,Fork-lift driver,106000,Divorced,0,2189.4,2015-01-01
80050187,Odom,Francis,Female,1976-06-02,K5P8M8,4,Magician,42000,Single,0,5764.6,2015-01-01
80050188,Gilbert,Eaton,Male,1991-09-15,L7G7D8,2,Dental hygienist,77000,Married,1,4034.4,2015-01-01
80050189,Garrett,Knight,Male,1981-11-26,M7N4P7,3,Footballer,51000,Single,0,2492.8,2015-01-01
80050190,Gates,Wilcox,Male,1975-03-14,K7N4O2,1,Advertising executive,82000,Single,0,5305.4,2015-01-01
80050191,Chase,Murray,Male,1977-04-30,M5E1V7,4,Home-worker,53000,Married,2,508.4,2015-01-01
80050192,Crane,Lozano,Male,2001-06-29,M4R6T8,3,Author,70000,Married,0,5207,2015-01-01
80050193,Marquez,Estes,Male,1971-06-23,L2P1G7,3,Chiropractor,51000,Single,0,6199.2,2015-01-01
80050194,Martin,Becker,Female,1998-12-13,K5A5A1,2,Paramedic,59000,Single,0,3640.8,2015-01-01
80050195,Baxter,Reilly,Male,1994-03-13,K3U1T1,2,Events organiser,103000,Married,3,5789.2,2015-01-01
80050196,Padilla,Dunn,Female,1981-05-09,N8P8Y6,1,Pathologist,84000,Single,0,5444.8,2015-01-01
80050197,Meadows,Rojas,Male,1999-05-15,K1Y8M2,2,Cabin crew,77000,Single,0,729.8,2015-01-01
80050198,Roth,Forbes,Female,1976-09-18,L6W1C3,3,Dancer,41000,Single,0,1271,2015-01-01
80050199,Bridges,Randall,Female,1988-02-04,L3C2C3,1,Dental nurse,53000,Married,2,3427.6,2015-01-01
80050200,Spencer,Banks,Female,1990-05-17,K7M2V3,4,Cashier,69000,Single,0,1984.4,2015-01-01
80050201,Dodson,Gilbert,Male,1974-09-01,M4A4A5,2,Economist,90000,Single,0,1910.6,2015-01-01
80050202,Buchanan,Barry,Male,1982-07-04,K6X8V8,3,Machinist,98000,Married,2,3025.8,2015-01-01
80050203,Irwin,Bowers,Female,1975-09-27,M1R7B6,4,Librarian,77000,Single,0,3075,2015-01-01
80050204,Cox,Friedman,Female,1997-07-07,K5V4L3,4,Literary agent,87000,Single,0,811.8,2015-01-01
80050205,Hodges,Travis,Female,1983-09-22,L2R6C1,2,Clairvoyant,75000,Single,0,5305.4,2015-01-01
80050206,Simpson,Eaton,Female,1974-12-02,K8H5P2,1,Racing driver,31000,Divorced,0,2730.6,2015-01-01
80050207,Vasquez,Hanson,Female,1984-07-08,N5N8V1,2,Osteopath,28000,Married,3,5330,2015-01-01
80050208,Owens,Maldonado,Male,1995-01-09,K1O4J8,2,Computer programmer,34000,Married,2,3214.4,2015-01-01
80050209,Mcintyre,Houston,Male,1975-01-03,N5O2O1,2,Career criminal,77000,Single,0,2476.4,2015-01-01
80050210,Ortiz,Haas,Female,1992-03-07,M7T3J2,2,Fairground worker,64000,Married,2,1795.8,2015-01-01
80050211,David,Tanner,Male,1986-09-14,K5K2H7,1,Gas fitter,100000,Single,0,721.6,2015-01-01
80050212,Branch,Francis,Female,1998-05-15,K1G6D4,2,Administrator,82000,Married,3,4772.4,2015-01-01
80050213,Faulkner,Daugherty,Female,1986-09-25,N4B2J7,2,Social worker,84000,Single,0,3952.4,2015-01-01
80050214,Contreras,Crosby,Female,1976-05-10,K8K6U7,3,Accountant,37000,Single,0,1131.6,2015-01-01
80050215,Ayers,Horton,Female,1987-06-11,K4W3H1,1,Make-up artist,65000,Divorced,1,5674.4,2015-01-01
80050216,Clark,Bell,Male,1977-08-01,N7Z2Y8,3,Television presenter,56000,Divorced,1,1312,2015-01-01
80050217,Arroyo,Sharp,Female,1974-08-21,N3J7Z7,1,Crane driver,91000,Single,0,4715,2015-01-01
80050218,Ray,Valentine,Male,1970-10-31,N7O7V5,2,Shop assistant,47000,Married,2,4083.6,2015-01-01
80050219,Rivas,Peters,Female,1978-03-15,L4N7K4,1,Managing director,39000,Single,0,4034.4,2015-01-01
80050220,Ray,Ponce,Female,1972-11-16,K8F2A2,2,Gas fitter,35000,Married,1,4829.8,2015-01-01
80050221,Carroll,Duffy,Male,1985-03-20,N2X8A1,2,Baggage handler,54000,Single,0,4231.2,2015-01-01
80050222,Browning,Skinner,Male,1976-08-24,N1Q7H5,2,Car wash attendant,39000,Married,3,1771.2,2015-01-01
80050223,Keller,Franco,Female,1977-07-21,K3L4F2,2,Computer analyst,92000,Married,1,4936.4,2015-01-01
80050224,Cisneros,Wilkerson,Female,1968-09-10,N5B8A6,1,Lift engineer,59000,Single,0,3960.6,2015-01-01
80050225,Barr,Ford,Female,2003-06-15,K4I5Q5,4,Bank manager,83000,Married,1,3353.8,2015-01-01
80050226,Mayo,Braun,Male,1989-03-08,L5V8A1,3,Medical student,41000,Married,2,4493.6,2015-01-01
80050227,Conner,Sims,Male,1984-12-11,L7W2W3,2,Clockmaker,33000,Divorced,3,6191,2015-01-01
80050228,Macdonald,Alvarado,Male,1980-09-23,L1U3Z1,3,Acupuncturist,91000,Divorced,0,3493.2,2015-01-01
80050229,Ellison,Porter,Male,1989-09-12,K4A2W7,1,Street entertainer,30000,Married,1,3501.4,2015-01-01
80050230,Chaney,Shaffer,Male,1978-01-03,N1U2Q2,3,Broadcaster,58000,Married,1,2993,2015-01-01
80050231,Harvey,Owens,Male,1997-10-20,K7B6S6,3,Cleric,37000,Married,0,4108.2,2015-01-01
80050232,Stanley,Serrano,Female,1982-10-16,N6X5Y7,1,Gardener,44000,Married,3,2468.2,2015-01-01
80050233,Compton,Vargas,Male,1992-01-31,L6Q5I4,1,Astronomer,31000,Single,0,4223,2015-01-01
80050234,Russell,Richardson,Female,1983-02-28,K8G7F8,3,Shop assistant,96000,Married,0,4428,2015-01-01
80050235,Hurst,Henry,Female,1980-02-03,K8X6B7,3,Plumber,86000,Married,3,4378.8,2015-01-01
80050236,Santana,Rodgers,Female,1975-03-23,L5X6K2,2,Secretary,98000,Single,0,1623.6,2015-01-01
80050237,Leon,Clarke,Female,1987-02-08,K6S3G2,2,Street entertainer,69000,Married,2,3419.4,2015-01-01
80050238,Adams,Merritt,Female,1972-04-27,N4H1W5,4,Auctioneer,98000,Single,0,1377.6,2015-01-01
80050239,Burke,Fletcher,Male,1994-03-19,L3Y2S7,1,Butler,89000,Single,0,3657.2,2015-01-01
80050240,Calderon,Mcneil,Male,1997-10-04,N8G3B7,2,Psychologist,70000,Married,1,5412,2015-01-01
80050241,Mcclain,Ritter,Female,1992-02-09,K1O1V3,3,Clockmaker,38000,Single,0,5690.8,2015-01-01
80050242,Mcintosh,Maynard,Male,1983-10-18,N3W2A5,1,Doorman,46000,Married,1,5658,2015-01-01
80050243,Potter,Espinoza,Female,1985-02-22,N7W5K3,4,Diplomat,78000,Single,0,4067.2,2015-01-01
80050244,Cabrera,Golden,Female,1989-12-22,M4A4J2,3,Computer programmer,96000,Single,0,2501,2015-01-01
80050245,Vargas,Mcclure,Female,1982-02-10,L2B5O7,3,Bookmaker,63000,Single,0,3239,2015-01-01
80050246,Hensley,Wyatt,Female,1980-05-18,N7F8N2,4,Meteorologist,102000,Unknown,1,5830.2,2015-01-01
80050247,Francis,Mosley,Female,1993-06-29,K6I3K3,3,Marketing director,76000,Married,3,3567,2015-01-01
80050248,Lambert,Bullock,Male,1990-01-02,L8X8H6,3,Unemployed,63000,Single,0,5748.2,2015-01-01
80050249,Ibarra,Wagner,Female,1977-10-13,M1E2O2,3,Home-worker,73000,Single,0,5436.6,2015-01-01
80050250,Zamora,Sexton,Male,1993-06-20,K4G5Q6,2,Air traffic controller,76000,Single,0,2501,2015-01-01
80050251,Erickson,Keith,Male,1992-01-21,K3S5S6,2,Community worker,53000,Single,0,4370.6,2015-01-01
80050252,Richard,Hogan,Female,1999-12-29,M7J6X3,3,Aircraft engineer,62000,Married,2,4362.4,2015-01-01
80050253,Miller,Maynard,Female,1997-01-28,N3R7N2,2,Receptionist,39000,Married,2,6150,2015-01-01
80050254,Harrison,Owens,Male,1992-12-20,K3B6T3,2,Speech therapist,74000,Divorced,3,2058.2,2015-01-01
80050255,Mcmahon,Carlson,Female,1988-12-12,M7W1P8,2,Interpreter,39000,Married,2,1508.8,2015-01-01
80050256,Velez,Huffman,Male,1996-06-08,M6J2H4,4,Printer,87000,Single,0,2993,2015-01-01
80050257,Fisher,Moyer,Female,1968-08-04,K7D1M1,2,Lecturer,83000,Married,0,1664.6,2015-01-01
80050258,Hunter,Tran,Male,2001-04-05,L1V4J6,3,Medical student,101000,Married,1,6109,2015-01-01
80050259,Rogers,Trevino,Male,1997-02-01,L5W7B4,4,Homemaker,83000,Married,1,2271.4,2015-01-01
80050260,Raymond,Ward,Female,1975-02-05,L6E3W7,3,Librarian,33000,Married,0,3821.2,2015-01-01
80050261,Blevins,Parsons,Female,1976-07-12,K1C6D8,2,Butler,107000,Married,1,3550.6,2015-01-01
80050262,Tyler,Hubbard,Female,1988-02-05,K3N5K1,4,Pathologist,68000,Single,0,3665.4,2015-01-01
80050263,Bruce,Richard,Male,1975-01-11,M2W3C8,2,Author,95000,Married,1,4198.4,2015-01-01
80050264,Perkins,Reilly,Female,1985-10-03,M2L4H4,2,Independent means,65000,Married,0,1443.2,2015-01-01
80050265,Garza,Wolfe,Male,1996-04-02,M5S2Q4,1,Beauty therapist,63000,Single,0,5658,2015-01-01
80050266,Guerra,Davila,Female,2000-01-09,N3M1S1,2,Funeral director,40000,Single,0,1845,2015-01-01
80050267,Rose,Gross,Female,1973-10-30,L6O8D3,3,Camera operator,71000,Divorced,0,5600.6,2015-01-01
80050268,Gay,Stafford,Male,1972-08-25,K1S1R6,1,Psychologist,83000,Divorced,3,4050.8,2015-01-01
80050269,Wise,Long,Female,1991-03-08,M4K1J7,1,Debt collector,51000,Divorced,2,5223.4,2015-01-01
80050270,Braun,Wolfe,Male,1978-02-03,M2J8V7,2,Pathologist,53000,Married,3,5846.6,2015-01-01
80050271,Reid,Downs,Male,1973-11-26,M5X5L8,1,Boat builder,33000,Married,1,4583.8,2015-01-01
80050272,Austin,Marshall,Female,1981-07-09,N3J5E5,9,Cabinet maker,32000,Single,0,2558.4,2015-01-01
80050273,Solomon,Walters,Female,1980-12-12,L5C4D6,2,Researcher,82000,Married,1,1074.2,2015-01-01
80050274,Juarez,Michael,Male,1988-02-16,K8D8W6,4,Garden designer,54000,Married,3,1189,2015-01-01
80050275,Wall,Francis,Female,1990-02-19,M1D4X4,1,Special constable,61000,Married,2,2517.4,2015-01-01
80050276,Stevens,Hardy,Female,1989-11-09,N7O7N4,4,Computer analyst,108000,Married,2,3362,2015-01-01
80050277,Randall,Lara,Male,1980-09-17,N5Y4Z2,1,Solicitor,28000,Single,0,5838.4,2015-01-01
80050278,Cohen,Valdez,Male,1996-01-06,M4Y6F6,3,Crematorium worker,38000,Married,2,3829.4,2015-01-01
80050279,Short,Koch,Male,1974-12-22,L8Q6P1,3,Merchant navy personnel,82000,Married,2,6092.6,2015-01-01
80050280,Ayers,Hawkins,Female,1970-01-27,L8R1Y6,3,Designer,83000,Divorced,3,2435.4,2015-01-01
80050281,Heath,Hunt,Female,1986-06-03,L6B2M3,2,Construction worker,97000,Single,0,5641.6,2015-01-01
80050282,Anderson,Bryan,Female,1975-08-03,M3O2B8,3,Groom,32000,Married,0,1115.2,2015-01-01
80050283,Kim,Mccullough,Male,2002-09-06,M6L3P2,2,Fitness instructor,56000,Single,0,6018.8,2015-01-01
80050284,Kerr,Harrison,Female,1997-03-08,K3B2Z8,2,Roofer,73000,Married,2,4452.6,2015-01-01
80050285,Miles,Campbell,Male,1971-06-12,L7C4G2,1,Crane driver,28000,Married,0,1664.6,2015-01-01
80050286,Atkins,Reyes,Female,1982-07-04,K3T4P7,4,Farm worker,100000,Single,0,5584.2,2015-01-01
80050287,Christian,Hart,Male,1975-04-26,L5V6R2,2,Private investigator,57000,Married,1,1910.6,2015-01-01
80050288,Jordan,Norton,Male,1972-12-11,M4C7Q3,2,Customs officer,58000,Single,0,5420.2,2015-01-01
80050289,Strickland,Weeks,Female,1990-10-28,N5B6D8,2,Baker,59000,Married,0,2919.2,2015-01-01
80050290,Ferrell,Robertson,Female,1999-02-28,K5K7N8,3,Landscape gardener,73000,Single,0,3558.8,2015-01-01
80050291,Barker,Bowman,Female,2003-03-22,N5T7X5,1,Lawyer,84000,Divorced,1,1451.4,2015-01-01
80050292,Meyer,Mckay,Female,1978-03-12,N1E2V8,1,Author,87000,Married,2,4214.8,2015-01-01
80050293,Hudson,Preston,Male,1984-09-25,N4I7E8,3,School crossing warden,61000,Divorced,3,4247.6,2015-01-01
80050294,Oliver,Jacobs,Female,1985-06-11,K8H6F2,2,Gamekeeper,66000,Married,2,3772,2015-01-01
80050295,Nelson,Kaiser,Male,1981-05-10,L7A5I1,3,Childcare worker,69000,Single,0,6010.6,2015-01-01
80050296,Wiggins,Robertson,Male,1997-05-06,M7V7E4,4,Estate agent,36000,Married,3,3755.6,2015-01-01
80050297,Brock,Cantrell,Male,1969-09-01,M3M8Y1,2,Pharmacist,54000,Married,1,4288.6,2015-01-01
80050298,Underwood,Lane,Male,1998-07-07,M1W8U1,1,Business consultant,102000,Married,3,2812.6,2015-01-01
80050299,Lowery,Robbins,Female,1988-12-22,L8J1R8,3,Delivery driver,35000,Single,0,1459.6,2015-01-01
80050300,Cowan,Mcbride,Male,2003-06-11,L2S6G6,4,Independent means,66000,Single,0,4534.6,2015-01-01
80050301,Cannon,Bruce,Female,1971-02-06,N4A3J1,3,Aromatherapist,98000,Married,0,4477.2,2015-01-01
80050302,Weiss,Kaufman,Male,1968-08-08,L5N8G4,1,Meteorologist,100000,Married,2,1812.2,2015-01-01
80050303,Barnett,Fuller,Male,1977-07-14,K6H7Z2,1,Model,32000,Single,0,3796.6,2015-01-01
80050304,Padilla,Marks,Male,1988-02-04,L4Q7S1,2,Pickpocket,93000,Single,0,1525.2,2015-01-01
80050305,Kirby,Walton,Male,2001-04-18,K7N4P7,3,Chef,51000,Single,0,713.4,2015-01-01
80050306,Ali,Braun,Female,1982-03-14,K4V8Q2,4,Dietician,42000,Married,3,5781,2015-01-01
80050307,Abbott,Wu,Female,1990-08-25,L6E5T8,1,Lock keeper,67000,Married,0,5494,2015-01-01
80050308,Klein,Ellison,Female,1981-08-24,K3F2L2,2,Train driver,88000,Married,3,1943.4,2015-01-01
80050309,Zavala,Robinson,Male,1983-12-19,N2O5Y5,4,Undertaker,36000,Married,2,2353.4,2015-01-01
80050310,Barton,Archer,Female,1977-02-27,N6P2Z5,4,Flower arranger,89000,Married,2,4009.8,2015-01-01
80050311,Mccormick,Duran,Male,1990-01-26,L2N1V5,2,Childminder,95000,Married,3,590.4,2015-01-01
80050312,Gordon,Horton,Female,1983-05-19,M8T5U5,3,Art critic,90000,Married,0,3107.8,2015-01-01
80050313,Castaneda,Espinoza,Male,1987-11-04,L5J7K8,1,Handyman,54000,Married,1,6314,2015-01-01
80050314,Franco,Garrett,Male,1991-09-12,K8H7K5,1,Composer,81000,Divorced,2,2558.4,2015-01-01
80050315,Hancock,Atkinson,Male,1982-06-29,M4X6H4,2,Bar staff,61000,Married,1,2878.2,2015-01-01
80050316,Eaton,Ross,Female,1973-03-17,K2L1M8,2,Preacher,64000,Single,0,3567,2015-01-01
80050317,Lambert,Maynard,Female,1987-06-03,K2X5K1,3,Beauty therapist,56000,Divorced,0,5912.2,2015-01-01
80050318,Cross,Anderson,Male,1987-07-11,M6K2X7,3,Landowner,95000,Married,0,3640.8,2015-01-01
80050319,Gates,Morrison,Female,1988-09-29,N2F2S7,1,Anthropologist,52000,Single,0,4190.2,2015-01-01
80050320,Berger,Koch,Male,1977-09-22,N5S4N2,2,Clairvoyant,93000,Single,0,877.4,2015-01-01
80050321,Craig,Parker,Male,1972-09-07,M6C5S8,4,Scaffolder,37000,Single,0,1681,2015-01-01
80050322,Gibbs,Martinez,Male,1972-01-05,N4N3F8,1,Film director,79000,Single,0,697,2015-01-01
80050323,Salinas,Roberts,Male,1976-05-01,L4P1E1,3,Tarot Reader,32000,Single,0,1057.8,2015-01-01
80050324,Herrera,Russell,Female,1990-01-23,M4Z3W4,1,Locksmith,100000,Married,3,1566.2,2015-01-01
80050325,Vaughan,Callahan,Male,1979-09-06,K6J3B2,1,Private investigator,76000,Married,2,4813.4,2015-01-01
80050326,Obrien,Mayo,Male,1999-06-05,L2K7W6,2,Receptionist,63000,Married,1,5330,2015-01-01
80050327,Weber,Bullock,Female,1987-06-09,K6D4L6,1,Home-worker,93000,Married,1,1771.2,2015-01-01
80050328,Newman,Golden,Female,1998-02-09,K7V6H5,3,Cabinet maker,95000,Married,0,508.4,2015-01-01
80050329,Anderson,Owen,Male,1983-06-25,L6Z8F5,2,Childcare worker,65000,Single,0,3288.2,2015-01-01
80050330,Deleon,Carter,Female,1970-05-29,K1A6V3,4,Interior designer,51000,Married,2,1984.4,2015-01-01
80050331,Huang,Blevins,Male,1970-08-08,N8B5E4,2,Private investigator,92000,Single,0,3198,2015-01-01
80050332,Lang,Wang,Male,2002-12-11,N3V5F7,4,Shop assistant,64000,Single,0,1000.4,2015-01-01
80050333,Wolf,Potts,Female,1997-01-13,M4J4N7,1,Illustrator,86000,Single,0,1795.8,2015-01-01
80050334,Humphrey,Fleming,Female,1971-03-24,K1E7K8,4,Surgeon,57000,Single,0,541.2,2015-01-01
80050335,Mclean,Chase,Female,1989-08-09,K3M4N7,2,Fisherman/woman,50000,Married,2,1722,2015-01-01
80050336,Black,Dorsey,Male,1997-03-19,N3Q1L2,2,Factory worker,82000,Single,0,1287.4,2015-01-01
80050337,Christian,Barrett,Female,1983-07-20,M5V6X4,1,Soldier,73000,Married,3,5953.2,2015-01-01
80050338,Manning,Butler,Male,1997-12-31,N4R1K8,1,Homeopath,81000,Married,0,3189.8,2015-01-01
80050339,Mcclain,Mercer,Male,1978-04-29,N7E7B5,2,Cabin crew,28000,Single,0,6494.4,2015-01-01
80050340,Boone,Bonilla,Male,1977-10-30,N4S8O4,4,IT consultant,72000,Divorced,0,3337.4,2015-01-01
80050341,Erickson,Compton,Female,1990-09-20,N2H6F6,1,Artist,73000,Single,0,2706,2015-01-01
80050342,Mann,Griffin,Male,2001-04-07,N1M1O1,3,Soldier,43000,Married,0,4182,2015-01-01
80050343,Matthews,Casey,Female,1974-07-14,M6E4C8,2,Au pair,52000,Single,0,6043.4,2015-01-01
80050344,Haynes,York,Male,2003-07-14,M3E2V1,2,Domestic staff,59000,Divorced,1,1836.8,2015-01-01
80050345,Kramer,Owens,Male,1988-07-25,L2J8C6,1,Mortician,98000,Single,0,2492.8,2015-01-01
80050346,Powell,Esparza,Female,1999-06-13,M8Q7I7,1,Actor,73000,Married,2,5166,2015-01-01
80050347,Rodgers,Silva,Male,1989-12-11,K7Y3E7,3,Costume designer,62000,Married,2,844.6,2015-01-01
80050348,Adams,Sloan,Female,1978-03-14,L5H5B4,3,Librarian,73000,Married,1,2632.2,2015-01-01
80050349,Galloway,Erickson,Male,1989-08-30,L2H2O7,3,Chiropractor,70000,Married,0,5863,2015-01-01
80050350,Douglas,Guerrero,Male,1969-01-21,M5E3O2,4,Herbalist,108000,Single,0,3222.6,2015-01-01
80050351,Roman,Fernandez,Male,1985-11-11,L4X5Z5,3,Producer,62000,Married,1,738,2015-01-01
80050352,Moody,Hicks,Female,1989-10-08,L1Q5M8,1,Baker,82000,Married,2,5067.6,2015-01-01
80050353,Chandler,Cabrera,Female,1979-02-21,M8G8Y1,1,Reporter,46000,Single,0,2337,2015-01-01
80050354,Walters,Frost,Female,1993-08-05,N6T1A3,4,Minister,49000,Married,0,4895.4,2015-01-01
80050355,Holloway,Mann,Male,1976-03-26,L1P2A1,4,Ship builder,109000,Married,3,1795.8,2015-01-01
80050356,York,Cole,Male,1994-08-25,L5U1Y3,1,Student,43000,Married,3,6158.2,2015-01-01
80050357,Mayer,Sawyer,Male,1996-03-30,L3E4W2,3,Sports coach,89000,Single,0,6182.8,2015-01-01
80050358,Patrick,Rios,Female,1981-03-07,L7R5L7,1,Engineer,70000,Single,0,6174.6,2015-01-01
80050359,Martin,Kaufman,Female,1996-06-12,N2M7J1,3,Careers advisor,48000,Married,0,5297.2,2015-01-01
80050360,Bradshaw,Brock,Female,2001-11-18,N2T4P5,3,Sailor,77000,Married,0,2853.6,2015-01-01
80050361,Moyer,Norman,Male,1968-10-07,N6A2T3,1,Heating engineer,96000,Married,3,2369.8,2015-01-01
80050362,Shah,Wiggins,Male,1988-01-05,L5A4P7,1,Designer,64000,Married,3,3862.2,2015-01-01
80050363,Perez,Burnett,Female,1986-10-30,L4A2H5,3,Refuse collector,54000,Married,0,6363.2,2015-01-01
80050364,Harris,Hunter,Female,1970-05-23,L6T8Y2,3,Osteopath,58000,Single,0,5543.2,2015-01-01
80050365,Nicholson,Daniels,Male,1978-06-22,K8D7J5,2,Speech therapist,73000,Single,0,2599.4,2015-01-01
80050366,Miranda,Reeves,Male,2003-04-24,N6M6R5,2,Tour guide,86000,Single,0,1992.6,2015-01-01
80050367,Pacheco,Stein,Female,1979-05-27,M7Y6T2,1,Craftsperson,78000,Single,0,4551,2015-01-01
80050368,Hoover,Haley,Male,1983-01-23,K3G8D7,4,Probation officer,102000,Single,0,6043.4,2015-01-01
80050369,Wiley,Kirby,Female,1986-11-01,N2U2E2,1,Boat builder,89000,Divorced,1,3870.4,2015-01-01
80050370,Daniels,Mckenzie,Male,1969-02-25,N8D7Y3,3,Printer,89000,Married,0,5945,2015-01-01
80050371,Doyle,Villegas,Female,1969-02-25,N5H8O8,3,Porter,58000,Married,3,3575.2,2015-01-01
80050372,Rosario,Dudley,Male,1973-01-31,K1S6E6,3,Bookmaker,94000,Single,0,2722.4,2015-01-01
80050373,Richmond,Williams,Male,1986-10-06,L2S1V6,1,Career criminal,36000,Divorced,1,5321.8,2015-01-01
80050374,Davenport,Oliver,Female,2000-09-27,K7U3S7,3,Construction worker,108000,Married,0,6174.6,2015-01-01
80050375,Santos,Moses,Female,2001-06-30,N4I6U3,3,Road sweeper,64000,Single,0,3034,2015-01-01
80050376,Fitzpatrick,Morrow,Female,1988-08-25,L8V1V1,4,Window cleaner,92000,Single,0,2673.2,2015-01-01
80050377,Wall,Lee,Male,1981-11-28,L5F4F8,3,Delivery driver,89000,Single,0,1599,2015-01-01
80050378,Richardson,Beard,Female,1973-11-05,K6M6J3,1,Art dealer,82000,Single,0,2615.8,2015-01-01
80050379,Horton,1234,Female,1972-07-02,N6V2R5,2,Baggage handler,75000,Married,0,4100,2015-01-01
80050380,Horton,Pace,Male,1979-11-17,K1I3I6,3,Air traffic controller,94000,Single,0,697,2015-01-01
80050381,Villarreal,French,Female,1995-11-28,M1F6E8,1,Farmer,48000,Single,0,992.2,2015-01-01
80050382,Dyer,Harrell,Male,1972-09-22,N3B2S5,2,Clerical assistant,30000,Married,1,4747.8,2015-01-01
80050383,Rosario,Rowland,Female,1992-06-24,N5C1R6,4,Plasterer,38000,Single,0,3378.4,2015-01-01
80050384,Estes,Downs,Female,1981-01-16,N6Q7X8,2,Accountant,65000,Single,0,541.2,2015-01-01
80050385,Moon,Gamble,Male,1995-09-27,L3B4F5,3,Foster parent,32000,Single,0,3255.4,2015-01-01
80050386,Shields,Cain,Female,1986-06-01,K6A5O8,1,Archivist,69000,Single,0,4903.6,2015-01-01
80050387,Powell,Haas,Male,1971-04-02,M3X2M7,4,Animal breeder,92000,Single,0,1631.8,2015-01-01
80050388,Browning,Haas,Female,2003-07-02,K7J5G7,2,Politician,97000,Divorced,1,2870,2015-01-01
80050389,Allen,Price,Male,1999-01-31,L2X1T8,3,Antique dealer,76000,Married,2,1418.6,2015-01-01
80050390,Miles,Mcclure,Male,1982-01-19,L3Z1T7,2,Computer engineer,69000,Single,0,5018.4,2015-01-01
80050391,Wilkins,Brown,Female,1971-02-18,K3L6V1,4,Chauffeur,65000,Single,0,4272.2,2015-01-01
80050392,Frazier,Buck,Male,1983-08-13,K3J5Q1,3,Porter,73000,Single,0,4034.4,2015-01-01
80050393,Mccarty,Rollins,Female,1991-09-26,K2B4X5,4,Film director,76000,Divorced,0,3862.2,2015-01-01
80050394,Barnett,Mendez,Male,1972-05-17,L5O2N5,3,Book-keeper,82000,Single,0,2656.8,2015-01-01
80050395,Berger,Marks,Female,1988-06-14,L3I4U8,4,Estate agent,49000,Single,0,4387,2015-01-01
80050396,Richardson,Kent,Female,1975-10-26,N1I7F5,3,Kennel worker,78000,Single,0,6150,2015-01-01
80050397,Garcia,Harding,Female,1975-11-27,N8X6W2,1,Astrologer,25000,Married,3,2632.2,2015-01-01
80050398,Rollins,Hudson,Male,1972-11-18,M1A1N6,4,Groom,74000,Divorced,3,2747,2015-01-01
80050399,Burns,Nolan,Female,1993-01-03,K7C3G2,2,Security guard,104000,Single,0,6346.8,2015-01-01
80050400,Burgess,Cook,Male,1972-07-13,L5B4W5,3,Courier,109000,Married,2,5813.8,2015-01-01
80050401,Blankenship,Hensley,Female,1985-06-11,K1F3J2,2,Construction worker,42000,Married,2,2615.8,2015-01-01
80050402,Fox,Castillo,Male,1969-01-09,N6Q2O4,3,Tour guide,62000,Single,0,738,2015-01-01
80050403,Rodgers,Lyons,Female,1999-03-21,L7Q4Y7,2,Building labourer,78000,Married,1,5592.4,2015-01-01
80050404,Horton,Hanna,Female,1979-02-21,L6T5P7,4,Brewer,71000,Single,0,2886.4,2015-01-01
80050405,Caldwell,Hatfield,Female,1995-09-14,L1G1G7,2,Bodyguard,81000,Divorced,2,3173.4,2015-01-01
80050406,Dougherty,Rivers,Male,1979-04-05,M1P5D6,2,Beauty therapist,61000,Married,3,672.4,2015-01-01
80050407,Reyes,Campbell,Female,1976-02-27,K6O7S3,1,Driving instructor,48000,Single,0,2853.6,2015-01-01
80050408,Ramirez,Kline,Female,1979-10-14,K7Z4C4,2,Dental hygienist,39000,Divorced,3,6264.8,2015-01-01
80050409,Alexander,Dillon,Female,1994-05-29,M4Q7K2,4,Picture framer,51000,Married,3,2673.2,2015-01-01
80050410,Lewis,Lozano,Male,1983-03-27,L8L5L5,3,Dentist,72000,Single,0,6289.4,2015-01-01
80050411,Newton,Mccormick,Male,1986-10-31,M6Q4R5,2,Professor,61000,Married,2,5157.8,2015-01-01
80050412,Avila,Shaffer,Male,2000-08-03,M3R8Q8,3,Psychiatrist,98000,Married,2,4961,2015-01-01
80050413,Bartlett,Atkinson,Female,1968-09-15,M7H2Y7,2,Boat builder,58000,Divorced,1,1623.6,2015-01-01
80050414,Jennings,Andrews,Female,1976-01-23,M3K7H1,4,Civil servant,100000,Single,0,5649.8,2015-01-01
80050415,Huff,Walls,Female,1991-01-05,N2X4D7,3,Diver,44000,Single,0,1303.8,2015-01-01
80050416,Shannon,Gross,Female,1970-10-12,L3L1J4,3,Curator,81000,Married,2,4264,2015-01-01
80050417,Rosales,Lane,Female,1984-08-14,K2Q2S2,1,Composer,70000,Married,1,3952.4,2015-01-01
80050418,Robertson,Murillo,Female,1989-08-29,N1O7M3,1,Pilot,68000,Single,0,1353,2015-01-01
80050419,Vasquez,Cochran,Male,1982-12-09,N1E2W2,4,Tax inspector,112000,Married,0,3616.2,2015-01-01
80050420,Malone,Blackburn,Male,1974-03-02,K2H3U6,4,Bricklayer,39000,Single,0,3419.4,2015-01-01
80050421,Ali,Sheppard,Male,1990-09-25,M3Z5M3,3,Leaflet distributor,34000,Married,2,6355,2015-01-01
80050422,Bates,Parrish,Male,1980-08-07,K1X6I4,4,Singer,109000,Single,0,4296.8,2015-01-01
80050423,Proctor,Terrell,Female,1990-12-29,L6J1I3,2,Footballer,63000,Single,0,992.2,2015-01-01
80050424,Henderson,Calhoun,Female,1987-01-29,N5G3P6,3,Pawnbroker,49000,Single,0,2640.4,2015-01-01
80050425,Frederick,Graham,Female,1984-11-25,M4X3Q8,1,Dietician,27000,Single,0,1836.8,2015-01-01
80050426,Brady,Mckinney,Male,1999-07-30,K2T8I2,3,Lawyer,75000,Married,2,1492.4,2015-01-01
80050427,Short,Dixon,Male,1990-04-05,M8J7Q8,4,Laboratory technician,95000,Single,0,4083.6,2015-01-01
80050428,Zamora,Roman,Male,1989-04-29,L7P1M5,1,Refuse collector,29000,Divorced,2,2460,2015-01-01
80050429,Cole,Vargas,Female,1979-02-22,M1G8Z8,4,Civil servant,101000,Married,3,6207.4,2015-01-01
80050430,Berger,Atkinson,Female,1998-01-24,N3D6H4,4,Tattooist,36000,Single,0,4911.8,2015-01-01
80050431,Roberson,Reynolds,Male,1993-01-11,N8B7C7,1,Artist,35000,Married,1,4346,2015-01-01
80050432,Rosales,Pugh,Male,1984-01-11,N3N6U6,1,Sportsperson,93000,Single,0,4903.6,2015-01-01
80050433,Newman,Morrow,Female,2003-08-08,N7Z1U2,4,Designer,96000,Single,0,5403.8,2015-01-01
80050434,Pope,Krause,Female,1982-12-18,N6K4S6,1,Administrator,96000,Divorced,2,2451.8,2015-01-01
80050435,Chapman,Fisher,Male,1978-08-13,L8C6E3,1,Bodyguard,82000,Married,0,713.4,2015-01-01
80050436,Mathis,Silva,Male,1983-11-24,K3S1S1,1,Magistrate,36000,Single,0,1344.8,2015-01-01
80050437,Larson,Wheeler,Female,1969-03-20,L8X4G7,2,Customs officer,86000,Single,0,3829.4,2015-01-01
80050438,Vaughan,Lambert,Male,1981-12-09,M1V1A5,1,Foster parent,50000,Married,0,746.2,2015-01-01
80050439,Huang,Hunt,Female,1968-07-19,M4B7T1,1,Acupuncturist,98000,Married,1,1353,2015-01-01
80050440,Phelps,Joyce,Female,2002-03-27,N6F6A2,2,Sports coach,63000,Single,0,2517.4,2015-01-01
80050441,Chambers,Hartman,Female,2001-08-01,L1P3V5,1,Factory worker,89000,Single,0,4378.8,2015-01-01
80050442,Oneal,Hull,Male,1989-04-17,K4V4E5,4,Solicitor,58000,Single,0,4985.6,2015-01-01
80050443,Hurst,Hamilton,Male,1990-09-19,K2E8W2,1,Barrister,59000,Married,2,2107.4,2015-01-01
80050444,Doyle,Hester,Female,1968-10-13,N3Z3I6,2,Computer programmer,65000,Married,2,5494,2015-01-01
80050445,Reeves,Ramos,Male,1994-10-17,M5G2U3,3,Insurance consultant,50000,Married,3,6486.2,2015-01-01
80050446,Greene,Duarte,Female,1980-02-04,N1H7L7,1,Groom,40000,Married,2,2320.6,2015-01-01
80050447,Holder,Perez,Female,2001-09-02,N5P1O5,4,Crane driver,96000,Married,3,3772,2015-01-01
80050448,Huff,Stein,Male,1994-05-22,N2Z1D8,4,Business consultant,83000,Single,0,5395.6,2015-01-01
80050449,Costa,Erickson,Male,1970-10-19,K8V8M7,2,Optician,99000,Married,0,1312,2015-01-01
80050450,Levy,Beard,Female,1993-08-22,L2R7K2,1,Domestic staff,40000,Married,3,1599,2015-01-01
80050451,Parker,Chen,Male,1988-01-21,N8S4Y6,2,Radio presenter,56000,Married,2,5444.8,2015-01-01
80050452,Johnston,Carroll,Female,1994-02-02,N1Q7K7,2,Cabinet maker,76000,Single,0,2771.6,2015-01-01
80050453,Gregory,Phelps,Male,1993-05-07,N5J3C1,4,Unemployed,54000,Divorced,0,2369.8,2015-01-01
80050454,Mann,Singh,Male,1989-11-21,L4L2G4,4,IT consultant,36000,Single,0,943,2015-01-01
80050455,Melton,Day,Female,1993-10-19,M4F7I7,4,Jewellery maker,73000,Married,0,902,2015-01-01
80050456,Hays,Doyle,Female,1997-02-25,L1I8I4,4,Chef,83000,Single,0,959.4,2015-01-01
80050457,Bush,Gutierrez,Male,1989-09-03,M2N2V3,2,Meteorologist,78000,Single,0,6428.8,2015-01-01
80050458,Marsh,Pruitt,Female,1976-02-10,L4N2M3,2,Dressmaker,101000,Single,0,1763,2015-01-01
80050459,Cohen,Barry,Female,1983-06-17,K3E7H4,2,Teacher,35000,Married,2,2665,2015-01-01
80050460,Vaughan,Porter,Male,1984-10-15,N4A8S6,1,Company director,102000,Single,0,2123.8,2015-01-01
80050461,Clayton,Rivera,Female,2002-11-07,M6J7Q1,4,Hypnotherapist,103000,Married,0,3485,2015-01-01
80050462,Dunlap,Bentley,Male,1989-04-24,N7R6S4,2,Illustrator,98000,Married,2,1631.8,2015-01-01
80050463,Mcdonald,Brewer,Male,1994-05-25,K7O1V8,3,Teaching assistant,49000,Married,0,1640,2015-01-01
80050464,Gentry,Giles,Male,1990-02-27,M8T4V7,3,Aromatherapist,36000,Single,0,4534.6,2015-01-01
80050465,Abbott,Villarreal,Female,1994-05-01,L4T5L1,2,Genealogist,72000,Single,0,1877.8,2015-01-01
80050466,Coffey,Lowery,Female,2002-08-07,K5I6U3,3,Tarot Reader,47000,Single,0,5239.8,2015-01-01
80050467,Gallegos,Allen,Male,1985-03-08,N1F6A6,3,Priest,72000,Divorced,2,1935.2,2015-01-01
80050468,Wall,Ayala,Male,2000-12-13,K2L2B6,3,Fork-lift driver,39000,Divorced,2,4870.8,2015-01-01
80050469,Delgado,Hays,Male,1982-10-17,M3B1N2,1,Broadcaster,61000,Divorced,2,3657.2,2015-01-01
80050470,Campbell,Mejia,Male,1989-07-08,K2C5L8,3,Lifeguard,72000,Married,3,2665,2015-01-01
80050471,Harrison,Carrillo,Female,1971-08-08,L2T8P6,3,Estate agent,43000,Single,0,4173.8,2015-01-01
80050472,Cline,Hale,Female,1970-12-02,L8H2S5,4,Labourer,56000,Married,3,5723.6,2015-01-01
80050473,Edwards,Peters,Female,1999-10-25,N3L5A6,4,Heating engineer,40000,Married,1,2517.4,2015-01-01
80050474,Bender,Gardner,Male,1992-11-10,L2E2G4,1,Aircraft engineer,26000,Married,0,2263.2,2015-01-01
80050475,Mcconnell,Gillespie,Male,1981-11-08,L6S8I3,1,Student,103000,Married,2,3706.4,2015-01-01
80050476,Ford,Hoover,Female,1986-06-18,N6C6V4,1,Historian,45000,Single,0,4288.6,2015-01-01
80050477,Sellers,Joyce,Male,1983-01-04,L3W6N8,1,Historian,92000,Divorced,0,2681.4,2015-01-01
80050478,Watkins,Bush,Male,1978-04-21,K1E3U4,3,Auctioneer,75000,Divorced,3,2599.4,2015-01-01
80050479,Petersen,Rogers,Female,1978-07-07,M3T6T5,2,Midwife,54000,Married,0,836.4,2015-01-01
80050480,Kirk,Benson,Male,1972-07-10,K3K7R3,2,Fork-lift driver,105000,Divorced,2,1500.6,2015-01-01
80050481,Diaz,Hogan,Male,1979-10-13,L8E6N4,1,Postal delivery worker,87000,Single,0,1467.8,2015-01-01
80050482,Stanton,Sherman,Male,1975-10-05,N4V6C7,3,Choreographer,87000,Married,0,1172.6,2015-01-01
80050483,Lang,Grant,Female,1974-03-01,K4H5J1,1,Television presenter,78000,Single,0,2263.2,2015-01-01
80050484,Allison,Rodgers,Female,1981-11-25,M7H5M5,1,Typist,53000,Single,0,4141,2015-01-01
80050485,Dyer,Bright,Female,1985-07-22,M3V5J2,2,Aircraft engineer,45000,Divorced,0,3312.8,2015-01-01
80050486,Brandt,Murray,Male,1978-03-13,M7O4T6,2,Counsellor,92000,Married,0,2394.4,2015-01-01
80050487,Gillespie,Clarke,Male,2002-06-07,L4L4C7,3,Landowner,90000,Single,0,2583,2015-01-01
80050488,Carroll,Woodward,Male,1985-09-12,M4J1S6,2,Chauffeur,96000,Single,0,6494.4,2015-01-01
80050489,Alexander,Smith,Male,1971-05-26,L6Y6S6,4,Musician,49000,Single,0,844.6,2015-01-01
80050490,Massey,Ward,Female,1986-05-06,M2S7B2,1,Racing driver,94000,Divorced,2,4616.6,2015-01-01
80050491,Brennan,Boone,Female,1993-05-13,N7U3F2,3,Mathematician,35000,Married,2,2517.4,2015-01-01
80050492,Ballard,Woodward,Female,1984-08-03,M3J2X6,4,Pickpocket,67000,Married,2,5412,2015-01-01
80050493,Christian,Alvarez,Male,1978-04-03,N8T5X2,4,Data processor,74000,Divorced,3,4403.4,2015-01-01
80050494,Hutchinson,Peters,Female,1983-04-28,K7U1P2,4,Surveyor,43000,Single,0,5797.4,2015-01-01
80050495,Kelly,Downs,Male,2002-03-22,L7S1P5,3,Bailiff,99000,Married,0,1443.2,2015-01-01
80050496,Clay,Cowan,Male,1984-06-16,K7Z1I5,3,Ship builder,106000,Divorced,0,1992.6,2015-01-01
80050497,Underwood,Atkinson,Female,1988-07-30,M8R2E1,2,Home-worker,44000,Single,0,4436.2,2015-01-01
80050498,Faulkner,Castro,Male,1996-08-17,N5N6P6,3,Healthcare assistant,50000,Married,3,3230.8,2015-01-01
80050499,Zuniga,Byrd,Female,1983-08-04,K5U6I2,2,Barber,72000,Married,0,2263.2,2015-01-01
80050500,Lambert,Ferrell,Male,1997-10-26,N7Y8X8,3,Taxi driver,86000,Single,0,5092.2,2015-01-01
80050501,Hutchinson,Andrews,Male,1984-04-02,L3M3S2,2,Broadcaster,70000,Married,3,5330,2015-01-01
80050502,Sanford,Huber,Female,1975-03-10,L2Y2T2,1,Independent means,62000,Married,2,2050,2015-01-01
80050503,Harris,Cooke,Female,1992-04-28,L8X8I6,4,Prison officer,42000,Single,0,2902.8,2015-01-01
80050504,Cunningham,Dawson,Male,2001-05-07,N6B3Z3,2,Conservationist,41000,Single,0,4952.8,2015-01-01
80050505,Valenzuela,Proctor,Female,1995-11-17,N1W1J1,1,Architect,83000,Married,0,2533.8,2015-01-01
80050506,Garrett,Howard,Male,1994-05-10,K3S6X6,4,Interior designer,112000,Single,0,5576,2015-01-01
80050507,Gilbert,Berry,Male,1976-05-07,M4E5Z3,3,Disc jockey,92000,Married,3,3739.2,2015-01-01
80050508,Charles,Blake,Male,1980-02-05,N8H3Y5,2,Teaching assistant,105000,Married,2,4698.6,2015-01-01
80050509,Boone,Mays,Female,1983-01-17,M4T7A4,1,Plasterer,100000,Married,3,5510.4,2015-01-01
80050510,Lloyd,Robbins,Male,1984-05-07,K4E5R6,1,Researcher,31000,Married,2,3690,2015-01-01
80050511,Kirk,Bradford,Female,1979-10-07,L7S1R7,3,Landowner,111000,Single,0,4231.2,2015-01-01
80050512,Potts,Key,Female,1971-08-07,L4E7E1,3,Landscape gardener,110000,Divorced,3,2681.4,2015-01-01
80050513,Powers,Michael,Female,1992-01-04,L2A8U2,2,Lift engineer,47000,Single,0,3558.8,2015-01-01
80050514,Mathews,Wang,Male,1990-07-19,K2W6H7,3,Advertising executive,69000,Single,0,3796.6,2015-01-01
80050515,Alvarez,Figueroa,Female,1983-05-19,L1D1E5,1,Dancer,26000,Single,0,2140.2,2015-01-01
80050516,Snyder,Harrell,Male,1993-11-26,L5H5Y2,4,Chiropodist,96000,Married,2,3337.4,2015-01-01
80050517,Gay,Vincent,Male,1979-06-12,K5G3B3,2,Legal secretary,93000,Divorced,0,4788.8,2015-01-01
80050518,Boone,Miles,Female,1983-06-20,M1W5F6,1,Nun,89000,Married,3,1582.6,2015-01-01
80050519,Riddle,Scott,Female,1978-12-14,L4N4Y7,3,Cashier,108000,Single,0,5567.8,2015-01-01
80050520,Branch,Morgan,Female,1980-03-07,K6J6Y5,2,Customs officer,75000,Single,0,5887.6,2015-01-01
80050521,Griffin,Banks,Male,1998-10-20,L8Q5Y8,3,Stockbroker,87000,Married,2,2763.4,2015-01-01
80050522,Wiley,Shaw,Female,1978-09-29,L4O1X3,2,Butcher,95000,Married,3,5420.2,2015-01-01
80050523,Stanley,Horton,Female,1992-03-18,K6U4B6,2,Telephonist,71000,Single,0,4231.2,2015-01-01
80050524,Kline,Norman,Female,1984-09-15,M7F4D3,1,Doctor,43000,Married,1,3657.2,2015-01-01
80050525,Tyler,Olsen,Female,1999-11-25,M2D8Y7,4,Jockey,94000,Married,1,3608,2015-01-01
80050526,Frye,Jones,Female,1995-02-17,M1P6Z2,2,Minister,81000,Single,0,3485,2015-01-01
80050527,Frank,Mcknight,Male,1977-01-15,K7I4L8,3,Oil rig crew,90000,Married,1,5895.8,2015-01-01
80050528,Santana,****,Female,1975-10-04,K1C3W8,3,Editor,81000,Single,0,3017.6,2015-01-01
80050529,Williamson,Barr,Female,1969-12-02,K6F5T3,1,Telephonist,86000,Single,0,6281.2,2015-01-01
80050530,Dougherty,Love,Male,1987-02-24,M8Z5S7,3,Dental hygienist,79000,Married,0,4616.6,2015-01-01
80050531,Walters,Huerta,Female,1983-04-05,K8M8T3,4,Engineer,40000,Married,2,3353.8,2015-01-01
80050532,Graves,Graham,Female,1982-01-02,N7W1M2,3,Security guard,100000,Married,0,5502.2,2015-01-01
80050533,Reynolds,Gill,Male,2002-03-01,L2E5N8,4,Chimney sweep,40000,Single,0,1927,2015-01-01
80050534,Simpson,Mooney,Male,1976-10-09,L4D1Z4,4,Researcher,108000,Married,0,3977,2015-01-01
80050535,Nolan,Bean,Male,1997-12-01,L7B4Z2,4,Reporter,36000,Married,3,5682.6,2015-01-01
80050536,Lee,Montgomery,Female,1985-09-10,M3X2C1,3,Dietician,39000,Single,0,4239.4,2015-01-01
80050537,Short,Carlson,Female,2000-04-09,N3F5F8,3,Company director,101000,Married,0,3567,2015-01-01
80050538,Santiago,Donaldson,Female,1983-09-23,L2B6H6,1,Business consultant,81000,Divorced,1,5510.4,2015-01-01
80050539,Potter,Roth,Female,2003-03-16,K5H8G1,3,Archivist,67000,Divorced,1,2960.2,2015-01-01
80050540,Henson,Lang,Male,1983-02-09,L7V8V7,2,Software consultant,101000,Married,0,2271.4,2015-01-01
80050541,Roberson,Mccall,Male,1970-12-14,N1Q1R7,4,Hairdresser,65000,Married,2,4583.8,2015-01-01
80050542,Zuniga,Griffin,Female,1998-05-08,M7G8A3,4,Bodyguard,88000,Married,1,5084,2015-01-01
80050543,Powell,Stevenson,Male,1979-05-22,L4K6N2,2,Sportsperson,58000,Single,0,4559.2,2015-01-01
80050544,Walters,Leonard,Female,1981-02-05,K5U6I4,1,Administrator,37000,Married,2,5740,2015-01-01
80050545,Boyd,Montgomery,Male,1972-05-21,L1E6G3,4,Scientist,88000,Married,2,1771.2,2015-01-01
80050546,Patton,Fletcher,Male,1974-11-28,L3Y4O4,2,Musician,88000,Single,0,5362.8,2015-01-01
80050547,Gilbert,Webb,Female,1997-03-24,L4J6E5,4,Actor,74000,Married,2,2238.6,2015-01-01
80050548,Wade,Scott,Female,1977-09-10,M4W5L5,1,Retired,60000,Single,0,6428.8,2015-01-01
80050549,Harvey,Miller,Female,1995-09-20,N1A4U7,4,Antique dealer,69000,Divorced,3,5190.6,2015-01-01
80050550,Valentine,Liu,Female,1992-10-08,K4V4A6,1,Market trader,39000,Married,3,647.8,2015-01-01
80050551,Simmons,Hays,Male,1970-05-02,N6B2N8,1,Bank manager,44000,Divorced,1,3591.6,2015-01-01
80050552,Winters,Prince,Male,1979-07-04,K1J6C4,2,Accountant,65000,Divorced,1,1328.4,2015-01-01
80050553,Thomas,Nunez,Female,1978-02-27,L2C5M3,2,Herbalist,52000,Single,0,5879.4,2015-01-01
80050554,Mercer,Randolph,Female,1980-09-09,M8W8O6,3,Occupational therapist,82000,Single,0,2525.6,2015-01-01
80050555,Tucker,Herrera,Female,1968-11-25,N6B4P8,3,Catering staff,41000,Married,1,6461.6,2015-01-01
80050556,Macdonald,Buchanan,Female,2002-08-09,L2H6O2,3,Interpreter,103000,Divorced,1,4928.2,2015-01-01
80050557,Atkins,Wade,Female,1983-03-09,K1X3P8,2,Clerical assistant,66000,Single,0,3698.2,2015-01-01
80050558,Webb,Brady,Female,1989-04-19,M6I8W4,3,Clockmaker,92000,Single,0,6322.2,2015-01-01
80050559,Francis,Kidd,Male,2000-05-27,L8Z2P7,3,Aromatherapist,70000,Married,1,3575.2,2015-01-01
80050560,Jefferson,Sherman,Male,1976-09-14,K3P5N6,3,Data processor,77000,Single,0,4264,2015-01-01
80050561,Blackwell,Munoz,Female,1973-09-14,L2Q8W3,2,Prostitute,69000,Married,1,5961.4,2015-01-01
80050562,Odom,Cummings,Female,1982-07-03,M4R6M6,3,Au pair,50000,Married,0,6387.8,2015-01-01
80050563,Jennings,Shepard,Male,1991-12-05,K1P6S5,4,Social worker,64000,Married,3,738,2015-01-01
80050564,Vaughn,Matthews,Female,1988-03-11,M5F6T4,3,Butler,96000,Married,3,4034.4,2015-01-01
80050565,Rice,Henry,Female,2001-11-21,K3B3C8,3,Financial advisor,108000,Single,0,5371,2015-01-01
80050566,Horn,Wilkins,Female,2001-12-28,N6D5V8,2,Architect,42000,Married,0,1943.4,2015-01-01
80050567,Solomon,Ross,Male,1985-02-10,K8H2D5,1,Garden designer,102000,Single,0,2214,2015-01-01
80050568,Farley,Rice,Male,1972-02-21,L5D4M2,4,Electrician,36000,Married,2,6478,2015-01-01
80050569,Cunningham,Kennedy,Female,1998-03-27,M4O7H7,1,Hairdresser,82000,Single,0,4592,2015-01-01
80050570,Lawson,Whitney,Female,1978-10-26,K1O8W8,1,Occupational therapist,82000,Single,0,3050.4,2015-01-01
80050571,Aguirre,Noble,Female,1970-06-28,K4C8P2,1,Landowner,42000,Single,0,5412,2015-01-01
80050572,Skinner,Houston,Female,1986-05-29,K5V3L5,4,Animal breeder,80000,Married,2,6133.6,2015-01-01
80050573,Farmer,Carr,Female,1973-11-01,K6Q2H7,4,Dancer,64000,Single,0,1328.4,2015-01-01
80050574,Collier,Buchanan,Female,1990-01-30,M7D1L3,1,Building labourer,33000,Married,0,3993.4,2015-01-01
80050575,Harrington,Rodgers,Female,1988-12-29,M6X5X2,1,Au pair,103000,Single,0,4100,2015-01-01
80050576,Stone,Li,Male,1994-09-30,K8Q7A5,2,Physiotherapist,97000,Single,0,3821.2,2015-01-01
80050577,Valdez,Wilkinson,Female,1986-11-28,N3Y8P3,4,Farm worker,99000,Married,1,6289.4,2015-01-01
80050578,Griffin,Sanford,Female,1968-08-06,L3Y1Z3,1,Road sweeper,89000,Single,0,3386.6,2015-01-01
80050579,Durham,Richmond,Male,1983-03-06,L6N5J8,3,Veterinary surgeon,53000,Single,0,5379.2,2015-01-01
80050580,Hurst,Villegas,Male,1986-11-01,L2L1K2,4,Psychiatrist,96000,Divorced,1,5444.8,2015-01-01
80050581,Neal,Blevins,Male,1976-11-10,N7D5Q6,4,Lorry driver,83000,Single,0,2730.6,2015-01-01
80050582,Lawrence,Richard,Female,1986-07-17,N5U5N2,1,Journalist,49000,Married,3,4633,2015-01-01
80050583,Trujillo,Velasquez,Male,1994-12-14,K5H1V3,1,Lock keeper,84000,Single,0,3977,2015-01-01
80050584,Oconnor,Pittman,Female,1997-12-07,N4J6G1,4,Flying instructor,83000,Married,0,2902.8,2015-01-01
80050585,Mcpherson,Carter,Male,2003-09-30,N7I8U4,3,School crossing warden,77000,Married,2,3362,2015-01-01
80050586,Willis,Chambers,Male,1973-01-23,N5B5B2,2,Social worker,29000,Married,1,5198.8,2015-01-01
80050587,Washington,Duke,Male,1974-11-26,L2D1M4,1,Homemaker,29000,Single,0,4001.6,2015-01-01
80050588,Landry,Randolph,Female,1989-09-03,K8R5P3,3,Solicitor,81000,Married,3,1558,2015-01-01
80050589,Camacho,Mayer,Male,1988-11-13,N3J7R4,3,Artist,38000,Single,0,3804.8,2015-01-01
80050590,Booth,Cochran,Male,2003-09-18,L1V2W1,3,Pop star,95000,Married,0,4895.4,2015-01-01
80050591,Briggs,Kirby,Male,1975-10-02,M3C4Q8,4,Cartoonist,37000,Single,0,1541.6,2015-01-01
80050592,Snow,Ward,Female,1998-12-10,K2B8G4,3,Air traffic controller,70000,Single,0,3640.8,2015-01-01
80050593,Lane,Hartman,Male,1995-02-18,M7F5B4,3,Fisherman/woman,46000,Married,3,6174.6,2015-01-01
80050594,Roth,Christensen,Female,1970-11-02,N2T4S2,4,Cleaner,99000,Divorced,2,5067.6,2015-01-01
80050595,Kent,Horton,Male,1999-08-06,M5T6F8,3,Miner,99000,Married,3,4706.8,2015-01-01
80050596,Valencia,Bautista,Female,1975-05-03,N7B8F7,1,Pop star,48000,Married,0,5444.8,2015-01-01
80050597,Delacruz,Bradley,Male,1995-06-10,M2Y2S2,4,Surgeon,98000,Divorced,3,820,2015-01-01
80050598,Larsen,Ellis,Male,1988-12-03,L4T3T5,4,Blacksmith,50000,Single,0,3558.8,2015-01-01
80050599,Grant,Mcdaniel,Female,1988-03-03,N4L8I5,2,Lap dancer,77000,Single,0,3157,2015-01-01
80050600,Tate,Pierce,Male,1986-04-28,M1L1E4,2,Cleric,100000,Married,3,3534.2,2015-01-01
80050601,Valencia,Riddle,Male,2002-10-13,M4P1Q7,2,Cabinet maker,80000,Married,0,5576,2015-01-01
80050602,Crawford,Huber,Female,1997-06-20,M3O4G5,2,Archivist,105000,Married,3,4567.4,2015-01-01
80050603,Guerra,Scott,Female,1985-04-06,K6U1W7,2,Astronomer,65000,Single,0,5018.4,2015-01-01
80050604,Hess,Brady,Male,1976-01-06,L5E7C3,2,Butcher,74000,Married,1,1869.6,2015-01-01
80050605,Charles,Tyler,Male,1978-07-16,K8D8R2,4,Doorman,112000,Single,0,2697.8,2015-01-01
80050606,Conley,Obrien,Male,1991-09-30,K3I5N2,1,Special constable,87000,Married,0,2050,2015-01-01
80050607,Giles,Blair,Male,1986-07-15,L2W8Q6,4,Genealogist,55000,Single,0,4501.8,2015-01-01
80050608,Cox,Middleton,Male,1996-03-28,L1F5B5,2,Chiropodist,77000,Single,0,3919.6,2015-01-01
80050609,Bird,Gillespie,Male,1973-06-06,K7L5H7,3,Nun,95000,Married,2,6338.6,2015-01-01
80050610,Berger,Vega,Male,1969-01-07,M1D8C8,1,Childcare worker,76000,Divorced,3,4469,2015-01-01
80050611,Bryant,Lang,Male,2001-11-29,M5U7O1,2,Bailiff,73000,Divorced,1,4428,2015-01-01
80050612,Miller,Walter,Male,1977-12-13,M1T2N7,3,Chemist,102000,Single,0,1754.8,2015-01-01
80050613,Velasquez,Mayer,Female,1996-08-24,M2H5D1,4,Editor,72000,Single,0,4206.6,2015-01-01
80050614,Tran,Caldwell,Male,2002-04-19,N5P7Z4,1,Leaflet distributor,27000,Married,0,4518.2,2015-01-01
80050615,Cain,Pennington,Male,1983-08-13,K5I7T5,4,Butcher,112000,Single,0,6363.2,2015-01-01
80050616,Villa,Esparza,Male,1976-12-26,M5X2M5,3,Teacher,101000,Single,0,5822,2015-01-01
80050617,Sawyer,Burch,Male,2001-07-05,N6Q7F3,4,Butcher,93000,Married,0,3845.8,2015-01-01
80050618,Crane,Casey,Female,1995-09-30,K6G8T3,3,Childcare worker,111000,Divorced,1,2369.8,2015-01-01
80050619,Fritz,Bentley,Female,1996-04-17,K5Y3C8,3,Advertising executive,39000,Single,0,2820.8,2015-01-01
80050620,Fitzpatrick,Wolfe,Male,1987-03-10,M7R8A3,2,Roofer,28000,Single,0,6207.4,2015-01-01
80050621,Liu,Holmes,Female,1986-04-23,N6K6R2,1,Road sweeper,29000,Single,0,5731.8,2015-01-01
80050622,Mcguire,Huerta,Male,2002-11-20,L3T3N4,1,Soldier,61000,Single,0,1402.2,2015-01-01
80050623,Richards,Wells,Male,1972-10-19,M4P6S8,4,Book-keeper,105000,Married,3,2509.2,2015-01-01
80050624,Scott,Hatfield,Female,1994-04-16,L1Y4M3,1,Financial advisor,95000,Married,1,3583.4,2015-01-01
80050625,Mcguire,Serrano,Male,1987-04-08,N4M6G3,2,Heating engineer,54000,Single,0,6051.6,2015-01-01
80050626,Yates,Acevedo,Female,1977-08-26,N2B2Z8,2,Telesales person,48000,Single,0,1771.2,2015-01-01
80050627,Dunn,Boone,Male,1990-04-12,K4M4C2,4,Broadcaster,41000,Single,0,5953.2,2015-01-01
80050628,Church,Lawson,Male,1971-12-26,L3B7Y8,3,Sports coach,43000,Married,0,3083.2,2015-01-01
80050629,Hale,Moreno,Male,1990-11-15,N5O2H2,2,Travel agent,64000,Married,1,2902.8,2015-01-01
80050630,Cooper,Reynolds,Male,1990-10-06,M5X4C2,1,Delivery driver,56000,Single,0,2550.2,2015-01-01
80050631,Lewis,Cox,Male,1982-06-29,M8V5V8,1,Pest controller,27000,Single,0,1156.2,2015-01-01
80050632,Huerta,Herrera,Male,1990-08-31,N8Q4L4,1,Refuse collector,99000,Married,3,2591.2,2015-01-01
80050633,Castro,Woodard,Female,1985-07-09,K8F1I1,2,Pilot,79000,Single,0,4239.4,2015-01-01
80050634,Pacheco,Vance,Female,1976-12-14,K3Z7W3,3,Bricklayer,110000,Single,0,6174.6,2015-01-01
80050635,Hess,Wilkinson,Male,1987-08-23,N4O1C5,2,Plasterer,73000,Divorced,0,951.2,2015-01-01
80050636,Schmidt,Terry,Male,1969-02-07,L8B2Y3,4,Unemployed,99000,Married,3,1804,2015-01-01
80050637,Lamb,Dominguez,Male,1997-08-16,M1D5T1,2,Architect,101000,Married,0,2656.8,2015-01-01
80050638,Meyers,Pearson,Female,1989-08-06,L7R7A6,2,Property developer,63000,Single,0,1779.4,2015-01-01
80050639,Schroeder,Mccarthy,Male,1981-11-14,K4P1D1,2,Acupuncturist,88000,Single,0,4961,2015-01-01
80050640,Case,Montgomery,Female,1984-07-22,N6R8Y7,2,Brewer,76000,Single,0,1000.4,2015-01-01
80050641,Velasquez,Valentine,Male,1982-05-18,N6D2I2,3,Librarian,46000,Married,2,1508.8,2015-01-01
80050642,Charles,Powers,Female,1977-04-30,N3F6O6,3,Local govt worker,33000,Married,1,5034.8,2015-01-01
80050643,Fox,Baldwin,Female,1999-12-23,L8A6K6,2,Architect,106000,Married,0,2337,2015-01-01
80050644,Hudson,Gutierrez,Female,1985-11-12,N5D2F6,2,Carpet fitter,96000,Single,0,2263.2,2015-01-01
80050645,Mosley,Marshall,Male,1995-08-11,L3W1B4,1,Osteopath,74000,Married,3,4526.4,2015-01-01
80050646,Salazar,Serrano,Male,1974-06-28,N3T6W1,3,Plasterer,71000,Married,1,1246.4,2015-01-01
80050647,Logan,Boyer,Female,1979-02-27,K3S2M2,1,Building labourer,29000,Divorced,3,5543.2,2015-01-01
80050648,Newton,Poole,Male,1988-04-27,L7H1H3,3,Song writer,98000,Single,0,5280.8,2015-01-01
80050649,Bailey,Proctor,Male,1986-01-06,K3Z8E5,1,Auctioneer,62000,Single,0,3558.8,2015-01-01
80050650,Castillo,Montes,Female,2000-12-12,M5Q1P1,3,Events organiser,93000,Married,0,1672.8,2015-01-01
80050651,Sutton,Herman,Male,1978-07-10,L6A7S7,2,Croupier,31000,Married,3,762.6,2015-01-01
80050652,Nguyen,????,Male,1984-07-23,M7C5X3,3,Circus worker,35000,Single,0,1279.2,2015-01-01
80050653,Sutton,Spears,Female,1995-07-23,N6H8K6,3,Photographer,100000,Married,3,5059.4,2015-01-01
80050654,Wilkins,Saunders,Female,1971-03-21,N7G6N7,3,Croupier,70000,Married,0,3362,2015-01-01
80050655,Gregory,Solomon,Female,1973-10-19,L7Z6M6,2,Genealogist,78000,Married,0,3747.4,2015-01-01
80050656,Willis,Anderson,Female,1977-03-09,K2A5R5,4,Events organiser,69000,Single,0,5190.6,2015-01-01
80050657,Hardy,Macias,Female,1968-11-26,M4L3S4,3,Bar staff,101000,Married,2,5666.2,2015-01-01
80050658,Lara,Lucero,Female,1970-10-30,K7I1F4,2,Electrician,106000,Married,2,5305.4,2015-01-01
80050659,Holmes,West,Female,1985-03-28,K7J6S6,1,Coroner,98000,Married,0,1656.4,2015-01-01
80050660,Bautista,Juarez,Male,1992-12-19,M2P3C1,1,Mathematician,82000,Married,3,6150,2015-01-01
80050661,Singh,Haynes,Male,1980-01-14,K7F8Q2,3,Chiropodist,73000,Single,0,2837.2,2015-01-01
80050662,Ramos,Anthony,Female,1988-09-03,L4X6E5,3,Veterinary surgeon,57000,Married,0,2615.8,2015-01-01
80050663,Chen,Hardy,Female,1970-01-26,K5Y4J7,4,Cook,76000,Divorced,3,2714.2,2015-01-01
80050664,Gordon,Liu,Female,1972-03-24,M4Q7O3,1,Management consultant,84000,Married,3,4608.4,2015-01-01
80050665,Hawkins,Oconnell,Male,1983-11-15,L4I5O5,2,Architect,62000,Single,0,6191,2015-01-01
80050666,Pugh,Burgess,Female,1997-11-03,L7W8D6,3,Fitness instructor,88000,Married,0,1894.2,2015-01-01
80050667,Allen,Gregory,Female,1978-05-15,M3R6U1,4,Singer,40000,Single,0,664.2,2015-01-01
80050668,Dodson,Gibbs,Male,1990-06-18,K2D3X2,2,Childminder,54000,Single,0,975.8,2015-01-01
80050669,Weaver,Sweeney,Female,2002-02-22,L8T4Y5,4,Clockmaker,94000,Married,1,2287.8,2015-01-01
80050670,Christensen,Ramsey,Male,1972-09-16,L5R4T8,1,Pawnbroker,95000,Single,0,6133.6,2015-01-01
80050671,Watson,Peck,Female,1984-02-25,L1M8I7,3,Dentist,61000,Single,0,5789.2,2015-01-01
80050672,Mendoza,Nixon,Female,1985-07-15,N4U5R8,4,Interior designer,101000,Married,3,3944.2,2015-01-01
80050673,Pruitt,Powers,Male,1978-12-27,K4Z5M3,3,Nun,73000,Single,0,5707.2,2015-01-01
80050674,Contreras,Mercado,Male,1982-04-02,K6E5A3,3,Oil rig crew,52000,Married,2,5567.8,2015-01-01
80050675,Buckley,Clarke,Male,1991-08-08,K3V3D2,4,Baggage handler,61000,Married,0,4698.6,2015-01-01
80050676,Knight,Daugherty,Male,1990-03-03,M1E2E4,3,Interpreter,36000,Married,1,4026.2,2015-01-01
80050677,Hancock,Bautista,Male,1975-04-15,M2O6Z5,1,Aromatherapist,66000,Single,0,4116.4,2015-01-01
80050678,Crane,Kennedy,Female,1999-05-03,N6P5G4,1,Factory worker,44000,Married,0,6346.8,2015-01-01
80050679,Mueller,Mcmillan,Female,1996-02-07,L4E3V2,3,Clergyman,65000,Single,0,3485,2015-01-01
80050680,Chaney,Stafford,Male,1992-11-24,L5B3R5,3,Traffic warden,57000,Single,0,2640.4,2015-01-01
80050681,Wang,Moses,Male,1999-09-28,N3K1W4,3,Paramedic,75000,Married,0,729.8,2015-01-01
80050682,Hester,Bennett,Male,1994-01-31,M5U4E7,2,Locksmith,32000,Married,3,2304.2,2015-01-01
80050683,Moon,Duke,Male,1993-02-16,L7J5N4,2,Childrens entertainer,30000,Single,0,3091.4,2015-01-01
80050684,Wilson,Waller,Female,1979-09-06,K2V4L1,3,Economist,41000,Single,0,1303.8,2015-01-01
80050Z85,Solomon,Reynolds,Male,2003-08-16,K6E5E8,2,Antique dealer,72000,Single,0,1221.8,2015-01-01
80050686,Washington,Mccormick,Male,1999-12-21,M8I5C5,2,Musician,75000,Married,2,2435.4,2015-01-01
80050687,Ortega,Pacheco,Male,1994-04-01,M4U1D1,1,Oil rig crew,25000,Married,3,893.8,2015-01-01
80050688,Conrad,Fritz,Female,2000-12-13,N4O7C3,3,Scaffolder,68000,Single,0,4042.6,2015-01-01
80050689,Bradley,Wagner,Female,1969-04-27,N6E4W6,4,Window cleaner,46000,Divorced,3,5789.2,2015-01-01
80050690,Hobbs,Sweeney,Female,1990-06-09,M1X8G8,1,Bank manager,89000,Single,0,2271.4,2015-01-01
80050691,Carson,Francis,Female,1970-10-01,M5W5X5,1,Crown prosecutor,27000,Married,1,1877.8,2015-01-01
80050692,Reynolds,Lindsey,Male,1992-05-02,M7E2D3,1,Career criminal,60000,Single,0,3665.4,2015-01-01
80050693,Rollins,Riggs,Female,2001-06-09,M7I4T3,1,Architect,53000,Divorced,3,3435.8,2015-01-01
80050694,Knight,Norris,Male,1975-09-21,K7A2M2,2,Clairvoyant,40000,Married,0,6084.4,2015-01-01
80050695,Figueroa,Hunt,Female,1986-02-03,K6T8O2,4,Magician,37000,Married,2,5756.4,2015-01-01
80050696,Camacho,Booker,Female,1994-08-29,K2L8S5,1,Historian,83000,Married,3,3936,2015-01-01
80050697,Petersen,Kline,Male,1984-01-01,N6J1A5,2,Producer,28000,Single,0,3747.4,2015-01-01
80050698,Murray,Gilbert,Male,2001-11-03,M5C1W3,1,School crossing warden,37000,Married,3,4756,2015-01-01
80050699,Rich,Adkins,Male,1980-05-30,M3H5H1,2,Decorator,99000,Married,2,6084.4,2015-01-01
80050P00,Hanson,Grant,Female,1981-03-11,K2N2M1,1,Boat builder,100000,Married,0,3099.6,2015-01-01
80050701,Bauer,Floyd,Female,1996-03-27,K1D6Z2,3,Literary agent,87000,Married,2,4362.4,2015-01-01
80050702,Henson,Moran,Female,1990-08-10,L7I1G5,3,Clergyman,74000,Single,0,5674.4,2015-01-01
80050703,Cooper,Walker,Male,1977-01-24,K6B3X6,4,Immigration officer,85000,Single,0,1377.6,2015-01-01
80050704,Herman,Vaughan,Male,1982-05-03,M4Q7X7,4,Postal delivery worker,66000,Single,0,6264.8,2015-01-01
80050705,Richard,Glover,Male,1982-05-06,N3Y1A8,1,Brewer,79000,Single,0,2246.8,2015-01-01
80050706,Woodard,Kaufman,Female,1970-11-12,L4H5C3,1,Psychologist,48000,Single,0,4411.6,2015-01-01
80050707,Conway,Villa,Male,1989-12-21,N7B1K1,1,Chiropractor,79000,Divorced,3,3329.2,2015-01-01
80050708,Walter,Ali,Male,1998-01-20,L4B4F5,3,Osteopath,61000,Single,0,4977.4,2015-01-01
80050709,Hart,Tanner,Male,1987-05-29,N6G8H6,3,Tailor,49000,Single,0,3845.8,2015-01-01
80050710,Stone,Clements,Male,1988-07-06,N8B6G8,4,Fundraiser,57000,Married,2,6264.8,2015-01-01
80050711,Guerra,Moore,Male,1991-04-16,M1C3E3,2,Domestic staff,95000,Single,0,2181.2,2015-01-01
80050712,Newton,Phillips,Male,1985-09-08,K1A3Y2,3,Assembly line worker,76000,Married,0,6396,2015-01-01
80050713,Mclean,Mata,Female,1978-08-17,M1Q8S3,4,Traffic warden,93000,Single,0,5649.8,2015-01-01
80050714,Logan,Pineda,Male,1978-04-09,L8Q3A3,4,Physiotherapist,101000,Married,0,1828.6,2015-01-01
80050715,Li,Moyer,Male,1989-12-17,N1T7J5,2,Nurse,71000,Single,0,5715.4,2015-01-01
80050716,Roberson,Baldwin,Male,1999-10-07,M2K3E1,4,Jockey,112000,Divorced,3,844.6,2015-01-01
80050717,Dorsey,Odonnell,Male,1989-01-27,K4H2G7,2,Astrologer,54000,Single,0,1689.2,2015-01-01
80050718,Parsons,Hayden,Male,1995-10-01,L7S4U6,2,School meals supervisor,107000,Married,0,5043,2015-01-01
80050719,Crane,Rasmussen,Male,1970-12-20,L3O7L8,2,Typist,91000,Married,0,1172.6,2015-01-01
80050720,Campos,Bullock,Female,1989-02-01,M4U1K6,3,Immigration officer,73000,Married,3,2788,2015-01-01
80050721,Garza,Wells,Male,1995-09-08,L4H7I1,1,Hairdresser,25000,Married,3,1754.8,2015-01-01
80050722,Morris,Weeks,Female,2001-02-16,N6W1F1,2,Healthcare assistant,61000,Married,0,2681.4,2015-01-01
80050723,Noble,Bradford,Female,1984-08-19,L3D1A5,1,Missionary,63000,Married,1,1139.8,2015-01-01
80050724,Schmitt,Dennis,Male,1975-08-13,K5B2F8,3,Car wash attendant,74000,Single,0,697,2015-01-01
80050725,Norton,Wood,Female,1974-03-28,K1G8T8,4,Community worker,80000,Single,0,1713.8,2015-01-01
80050726,Edwards,Warner,Female,2001-01-21,N7X8D8,4,Miner,115000,Single,0,5338.2,2015-01-01
80050727,Santos,Garcia,Female,1976-09-17,K5L2S5,4,Legal secretary,57000,Married,3,5592.4,2015-01-01
80050728,Maxwell,Johnson,Male,1992-01-25,M5T8R1,3,Business consultant,38000,Married,1,3591.6,2015-01-01
80050729,Mcdowell,Stanley,Female,1991-08-02,N3U3N5,3,Scaffolder,110000,Single,0,5666.2,2015-01-01
80050730,Gibbs,Keith,Female,1998-02-14,N8N3W5,2,Nun,106000,Single,0,541.2,2015-01-01
80050731,Morrison,Marsh,Male,1990-08-02,L3J8T7,4,Insurance consultant,51000,Married,1,2558.4,2015-01-01
80050732,Gamble,Kirk,Male,1985-04-07,N3J5I6,1,Fashion designer,75000,Married,2,3649,2015-01-01
80050733,Bowers,Wiley,Male,1998-10-17,K5P3M6,4,Lorry driver,114000,Married,0,1336.6,2015-01-01
80050734,James,Levy,Male,1990-12-21,N2N2F4,3,Computer engineer,50000,Single,0,1115.2,2015-01-01
80050735,Sanchez,Daniels,Male,1972-09-25,N4Y2Q4,1,Window cleaner,57000,Married,3,3821.2,2015-01-01
80050736,David,Davis,Female,1971-04-23,N7C7U8,1,Prostitute,31000,Divorced,3,4255.8,2015-01-01
80050737,Ali,Wade,Female,1990-09-13,L7R6O7,2,Radio presenter,104000,Divorced,3,1221.8,2015-01-01
80050738,Waller,Farmer,Female,2003-10-01,L5W1H2,2,Anaesthetist,65000,Single,0,1303.8,2015-01-01
80050739,James,Chase,Male,1991-11-13,N2N5E1,3,Fork-lift driver,60000,Single,0,3198,2015-01-01
80050740,Bautista,Williamson,Male,1993-12-13,N1I4J3,2,Assembly line worker,80000,Single,0,2107.4,2015-01-01
80050741,Moody,Hahn,Male,1983-11-26,K2J2O3,4,Song writer,101000,Married,1,5567.8,2015-01-01
80050742,Thompson,Murphy,Male,1980-08-17,M2R7V8,4,Flying instructor,87000,Single,0,967.6,2015-01-01
80050743,Sutton,Sandoval,Female,1982-09-08,N1O1Y1,1,Publican,32000,Married,1,590.4,2015-01-01
80050744,Guerra,Dodson,Female,1975-11-26,L7J8C4,4,Bus driver,79000,Single,0,2517.4,2015-01-01
80050745,Matthews,Garrett,Female,1987-08-13,L2R7N7,2,Printer,30000,Married,0,4091.8,2015-01-01
80050746,Wise,Guerra,Female,1996-04-02,L1C5L8,3,Anaesthetist,105000,Married,2,3288.2,2015-01-01
80050747,Hammond,Flores,Female,1989-08-05,M5M8P7,4,Careers advisor,104000,Divorced,3,5469.4,2015-01-01
80050748,Zimmerman,Moore,Female,1995-06-02,L1O3L2,3,Camera operator,101000,Married,3,4231.2,2015-01-01
80050749,Wong,Frank,Female,1968-10-07,L2P8Q4,2,Artist,104000,Divorced,3,1008.6,2015-01-01
80050750,Johnson,Gill,Male,1969-03-13,L8N3Z1,1,Auditor,100000,Divorced,3,6363.2,2015-01-01
80050751,Forbes,Douglas,Male,1986-11-22,K1B2U4,1,Tailor,64000,Single,0,6314,2015-01-01
80050752,Vaughan,Sanford,Female,1984-09-17,L3K5R3,3,Air traffic controller,44000,Single,0,3485,2015-01-01
80050753,Walker,Terrell,Male,1983-02-23,L5Q2U3,3,Dentist,84000,Single,0,1025,2015-01-01
80050754,Leblanc,Mckay,Male,1984-03-23,N2K1Y3,1,Courier,31000,Single,0,3681.8,2015-01-01
80050755,Chan,Leblanc,Male,1975-10-17,K3C6D4,2,Councillor,35000,Single,0,1057.8,2015-01-01
80050756,Lawrence,Mcneil,Male,1983-06-29,L1M7Z6,3,Sailor,87000,Married,3,5633.4,2015-01-01
80050757,Lynch,Compton,Female,1993-10-27,L8Q3B7,4,Computer engineer,90000,Single,0,3977,2015-01-01
80050758,Hurley,Watson,Male,1991-06-26,N4B3F6,1,Interpreter,52000,Single,0,2943.8,2015-01-01
80050759,Solomon,Schaefer,Female,1985-07-23,K4T1A8,4,Unemployed,47000,Married,1,2943.8,2015-01-01
80050760,Goodwin,Jenkins,Male,1996-06-08,L1M7C4,3,Fundraiser,82000,Single,0,508.4,2015-01-01
80050761,Costa,Pennington,Female,1996-12-14,L3E8B3,4,Sculptor,55000,Married,2,1271,2015-01-01
80050762,Mcdonald,Ortiz,Male,1997-10-08,L2Y4W1,1,Clergyman,72000,Single,0,4477.2,2015-01-01
80050763,Fuller,Ferguson,Male,1973-06-27,L7C8C1,3,Butler,77000,Married,2,1959.8,2015-01-01
80050764,Ho,Sheppard,Female,1986-08-29,L2O5V3,1,Soldier,81000,Single,0,1656.4,2015-01-01
80050765,Finley,Kaiser,Male,1988-05-28,K7O4H5,1,Broadcaster,89000,Married,0,2402.6,2015-01-01
80050766,Mason,Krueger,Female,1980-01-04,K7T7I4,1,Catering staff,46000,Married,2,4182,2015-01-01
80050767,Moss,Newton,Female,1988-07-07,K8G1H6,4,Groom,78000,Married,3,1820.4,2015-01-01
80050768,Bryan,Frost,Female,1983-11-11,L3H5L7,4,Medical student,61000,Divorced,1,3337.4,2015-01-01
80050769,Ortega,Reid,Female,1998-06-30,L3R3D1,4,Gamekeeper,71000,Married,1,3124.2,2015-01-01
80050770,Glass,Pineda,Female,1997-11-30,L3Z1Y7,3,Manicurist,104000,Single,0,3075,2015-01-01
80050771,Reynolds,Stein,Male,1998-05-03,K1H2Z6,3,Chauffeur,39000,Single,0,2927.4,2015-01-01
80050772,Galvan,Meyer,Male,1975-05-16,M4V7M6,4,Cartoonist,44000,Single,0,2468.2,2015-01-01
80050773,Mcneil,Jordan,Female,2002-03-18,K4J8T8,1,Shoemaker,87000,Single,0,2796.2,2015-01-01
80050774,Higgins,Terry,Male,1997-05-13,M2W7Y4,4,Paramedic,57000,Married,3,1443.2,2015-01-01
80050775,Dudley,Frank,Male,1970-08-03,L6F8D2,1,Paramedic,39000,Married,1,2558.4,2015-01-01
80050776,George,Flynn,Male,2003-09-02,M4R7M6,1,Domestic staff,75000,Single,0,5830.2,2015-01-01
80050777,Skinner,Olsen,Female,1998-06-02,M8V7T6,2,Waiting staff,59000,Married,1,721.6,2015-01-01
80050778,Delacruz,Adams,Female,1997-01-16,M2L5C8,3,Councillor,32000,Single,0,2041.8,2015-01-01
80050779,Mathews,Maxwell,Male,1978-11-27,K6Y7Q2,4,Bodyguard,83000,Married,0,4969.2,2015-01-01
80050780,Lopez,Rodriguez,Female,1985-10-19,K6F7M7,4,Bank clerk,55000,Divorced,1,4231.2,2015-01-01
80050781,Moyer,Vega,Male,1985-02-17,N3K3Q7,4,Chiropodist,105000,Single,0,2714.2,2015-01-01
80050782,Pittman,Mayo,Male,1997-05-08,L4N7L3,1,Actor,92000,Single,0,1533.4,2015-01-01
80050783,West,Combs,Male,2000-06-08,N3I3Y4,3,Delivery driver,107000,Married,2,4649.4,2015-01-01
80050784,Frank,Mitchell,Male,1976-06-15,K8I7N2,4,Moneylender,56000,Single,0,1984.4,2015-01-01
80050785,Carlson,Nicholson,Female,1981-02-03,N4E7V3,2,Genealogist,31000,Single,0,4034.4,2015-01-01
80050786,Davis,Rosales,Male,1974-02-20,N5U3D4,3,Lorry driver,32000,Single,0,4870.8,2015-01-01
80050787,Travis,Molina,Male,2000-09-18,M6I1Q6,2,Bailiff,39000,Single,0,4649.4,2015-01-01
80050788,Cox,Kirby,Female,1977-09-25,K4D7L7,1,Printer,101000,Single,0,3813,2015-01-01
80050789,Kennedy,Glover,Male,1985-01-10,N4Z7Y6,3,Heating engineer,54000,Single,0,3567,2015-01-01
80050790,Hines,Rodriguez,Male,1968-04-04,K3I6B1,1,Fitness instructor,97000,Single,0,1508.8,2015-01-01
80050791,Sanford,Bowman,Female,1995-10-03,L5Q5L4,1,Beauty therapist,41000,Single,0,795.4,2015-01-01
80050792,Crosby,Carson,Female,1997-01-02,M7G2K6,2,Gardener,102000,Divorced,0,2599.4,2015-01-01
80050793,Chase,Galloway,Female,1980-12-06,K3U7L3,2,Secretary,48000,Single,0,4944.6,2015-01-01
80050794,Schaefer,Jensen,Male,1976-06-09,K8L5Q8,1,Telesales person,48000,Divorced,0,943,2015-01-01
80050795,Whitney,Hodge,Male,1988-04-10,L7W3U4,3,Midwife,110000,Married,0,582.2,2015-01-01
80050796,Mcneil,Parsons,Female,1989-02-02,M2O8R5,3,Barrister,110000,Single,0,1156.2,2015-01-01
80050797,Anthony,Bridges,Male,1994-06-06,N7G7Y7,2,Legal secretary,31000,Divorced,2,4165.6,2015-01-01
80050798,Dyer,Newman,Male,1993-03-10,N6T5O5,2,Art critic,61000,Married,0,3075,2015-01-01
80050799,Lozano,Chen,Female,1999-01-24,L3D7N1,1,Tour guide,54000,Married,3,3009.4,2015-01-01
80050800,Chan,Atkins,Female,2000-11-07,K4P1W2,3,Teacher,39000,Divorced,1,2542,2015-01-01
80050801,Salinas,Frey,Female,1997-06-03,L2Q7G2,1,Prostitute,38000,Married,0,5223.4,2015-01-01
80050802,Jensen,Levine,Male,1992-08-27,M1G2H1,3,Salesperson,83000,Married,0,2845.4,2015-01-01
80050803,Harrington,Good,Female,1975-04-01,M8O4B6,4,Casual worker,100000,Single,0,664.2,2015-01-01
80050804,Farley,Franklin,Male,1993-02-28,L5V5Y1,1,Management consultant,24000,Single,0,3444,2015-01-01
80050805,Chambers,Barnes,Male,1993-02-18,L8Z7T6,3,Baker,100000,Divorced,0,1172.6,2015-01-01
80050806,Vargas,Silva,Female,1989-04-14,L5S4R8,4,Baker,74000,Married,3,4961,2015-01-01
80050807,Cannon,Henderson,Female,1976-02-08,L5F1F7,2,Blacksmith,92000,Single,0,6248.4,2015-01-01
80050808,Castro,Parks,Male,1991-05-08,L7L3P1,4,Counsellor,40000,Married,2,516.6,2015-01-01
80050809,Richards,Lang,Male,1993-12-19,N2B6J3,1,Model,100000,Married,1,3206.2,2015-01-01
80050810,Flowers,Kirby,Female,1980-11-10,V4D5M1,1,????,48000,Married,1,1787.6,2015-01-01
80050811,Brandt,Schneider,Male,1977-05-02,M5K8Q6,1,Party planner,78000,Married,2,3673.6,2015-01-01
80050812,Booker,Zimmerman,Female,1980-03-26,M2S7O5,2,Butler,44000,Married,2,1295.6,2015-01-01
80050813,Buchanan,Oneill,Female,1969-09-22,K5Y2A5,2,Lift engineer,31000,Married,1,4723.2,2015-01-01
80050814,Buckley,Brooks,Female,1996-08-02,M7R4C6,3,Comedian,94000,Married,3,5469.4,2015-01-01
80050815,Avila,Chase,Female,1974-02-10,K8N8O8,4,Childminder,93000,Divorced,2,984,2015-01-01
80050816,Crosby,Ochoa,Male,2002-06-07,K2K6C8,3,Fisherman/woman,43000,Single,0,820,2015-01-01
80050817,Turner,Espinoza,Male,1973-01-10,M6C4S8,3,Salesperson,38000,Married,1,3960.6,2015-01-01
80050818,Rodgers,Rich,Male,1973-01-06,K1I7B2,3,Massage therapist,49000,Single,0,1336.6,2015-01-01
80050819,Holland,Robbins,Male,1977-09-25,L5V2J3,2,Community worker,79000,Single,0,5945,2015-01-01
80050820,Jordan,Wilkerson,Male,1987-07-21,K2L8H2,2,Curator,40000,Married,2,4419.8,2015-01-01
80050821,Jefferson,Snow,Male,1988-01-11,M1N2Z5,4,Chiropractor,58000,Divorced,2,1451.4,2015-01-01
80050822,Glover,Hampton,Male,2002-10-12,N1G5F7,3,Care assistant,59000,Married,1,5887.6,2015-01-01
80050823,Simpson,Reid,Male,1991-10-06,N5A3G6,2,Housekeeper,55000,Married,0,3337.4,2015-01-01
80050824,Romero,Carey,Male,1987-11-28,L8U4X1,4,Conservationist,111000,Married,2,3649,2015-01-01
80050825,Castillo,Duncan,Female,1981-04-02,K5L2P1,4,Publisher,109000,Married,0,5658,2015-01-01
80050826,Hood,Love,Female,1999-01-23,M5P2X3,3,Police officer,62000,Single,0,1927,2015-01-01
80050827,Murphy,Zavala,Female,1976-07-27,L6T3Y7,1,Chemist,31000,Married,3,4993.8,2015-01-01
80050828,Lindsey,Booker,Male,1976-12-05,N3P6C4,4,Bar staff,59000,Single,0,5928.6,2015-01-01
80050829,Michael,Morgan,Female,1997-03-24,K7I6E2,2,Astrologer,56000,Married,1,672.4,2015-01-01
80050830,Randall,Nelson,Female,2003-02-07,L6P6N5,1,Career criminal,62000,Single,0,6125.4,2015-01-01
80050831,Mayer,Marsh,Male,1985-02-18,L7X1S6,4,Car wash attendant,82000,Divorced,2,3550.6,2015-01-01
80050832,Francis,Valentine,Male,1992-09-01,K5P2J3,1,Landscape gardener,55000,Married,1,1631.8,2015-01-01
80050833,Benitez,Glover,Female,1991-03-18,N4Q7G7,1,Taxi driver,87000,Divorced,1,4551,2015-01-01
80050834,Roach,Friedman,Female,1968-07-24,L7J7T1,2,Window cleaner,62000,Single,0,598.6,2015-01-01
80050835,Norton,Bernard,Male,1990-12-14,N7K5T7,2,Nurse,35000,Married,2,4961,2015-01-01
80050836,Garrett,Barber,Male,2000-03-23,N3I4W6,3,Physiotherapist,91000,Single,0,844.6,2015-01-01
80050837,Walls,Wise,Male,1973-07-04,K3W4J5,1,Diplomat,59000,Married,0,3714.6,2015-01-01
80050838,Brooks,Nunez,Female,1984-10-20,L8D3S1,2,Health visitor,70000,Divorced,1,4600.2,2015-01-01
80050839,Acosta,Ward,Female,1986-07-10,M7C2S8,2,Pickpocket,72000,Married,2,5453,2015-01-01
80050840,Aguirre,Choi,Male,1990-07-27,M6H3W7,1,Historian,80000,Single,0,4961,2015-01-01
80050841,Pruitt,Durham,Male,1991-12-07,K1L6R1,3,Pilot,37000,Single,0,5239.8,2015-01-01
80050842,Small,Dominguez,Male,1994-07-20,M4N7V1,2,Healthcare assistant,100000,Married,1,3747.4,2015-01-01
80050843,Wells,Cowan,Female,1994-08-07,N6P4S4,1,Psychiatrist,33000,Single,0,1787.6,2015-01-01
80050844,Odom,Rivas,Female,1999-10-20,K3G4J6,1,Pawnbroker,37000,Single,0,1057.8,2015-01-01
80050845,Walker,Rasmussen,Female,1983-11-26,M1X3A5,2,Cashier,33000,Married,3,1451.4,2015-01-01
80050846,Calderon,Castillo,Male,1991-01-15,M8O5Y3,3,Farm worker,95000,Married,2,5740,2015-01-01
80050847,Garrison,Marsh,Female,1976-11-30,L7C8W5,1,Traffic warden,70000,Married,3,6264.8,2015-01-01
80050848,Mcintyre,Holmes,Male,1971-07-03,N3S5H6,1,Pop star,72000,Married,0,4173.8,2015-01-01
80050849,Jacobs,Wall,Male,1981-07-18,K4T1J2,2,Chemist,54000,Married,3,3657.2,2015-01-01
80050850,Bolton,Schroeder,Female,1995-03-11,K4R8S4,2,Marketing director,83000,Single,0,4534.6,2015-01-01
80050851,Winters,Chapman,Male,1978-03-30,M4Z2B1,3,Book-keeper,109000,Married,1,5805.6,2015-01-01
80050852,Pearson,Shaffer,Male,1981-08-14,N6X8A3,2,Coastguard,44000,Married,1,2927.4,2015-01-01
80050853,Newton,Garza,Male,1990-03-21,M7J5H4,2,Coroner,97000,Married,3,1787.6,2015-01-01
80050854,Dunn,Dawson,Female,1997-10-31,K5O8C2,2,Meter reader,101000,Single,0,5666.2,2015-01-01
80050855,Austin,Sims,Female,1997-04-23,N3W7T2,1,Police officer,66000,Married,2,4780.6,2015-01-01
80050856,Mcdowell,Bush,Female,1968-11-23,L5U5P7,4,Firefighter,89000,Single,0,5641.6,2015-01-01
80050857,Hayes,Bush,Female,1994-05-28,K6K3U5,2,Lock keeper,71000,Married,2,6240.2,2015-01-01
80050858,Garrison,Frost,Male,1988-07-08,N1A1I8,2,Managing director,47000,Married,2,984,2015-01-01
80050859,Barnes,Ellis,Male,1982-04-24,N7Z7U8,3,Horticulturalist,73000,Married,3,1918.8,2015-01-01
80050860,Coffey,Daniel,Male,1982-06-24,N3E4F6,2,Diver,28000,Single,0,1435,2015-01-01
80050861,Livingston,Harvey,Male,1986-08-03,N2V1W3,4,Diplomat,106000,Married,1,3690,2015-01-01
80050862,Peters,Solomon,Male,1972-04-18,L7R4T4,1,Financial advisor,37000,Single,0,918.4,2015-01-01
80050863,Newton,Powers,Male,1997-09-21,N3B8W2,3,Probation officer,54000,Married,3,2542,2015-01-01
80050864,Powell,Guzman,Female,1989-05-28,K2N4U2,1,Probation officer,48000,Single,0,5485.8,2015-01-01
80050865,Mejia,Flores,Male,1987-06-29,N8Y4A7,3,Physiotherapist,68000,Married,3,2173,2015-01-01
80050866,Ford,Jones,Female,1975-11-26,N3Z7J4,2,Mortician,33000,Married,3,2107.4,2015-01-01
80050867,Wallace,Levine,Female,1976-07-18,N2D1M2,1,Anthropologist,40000,Married,2,1918.8,2015-01-01
80050868,West,Spears,Male,1988-10-28,L8N4L8,4,Driving instructor,45000,Single,0,1369.4,2015-01-01
80050869,Cline,Petersen,Male,1970-07-12,K4X7P1,4,Tattooist,103000,Single,0,4977.4,2015-01-01
80050870,Wyatt,Stephenson,Male,1983-12-21,L4A7B8,1,Literary agent,58000,Married,0,8000000,2015-01-01
80050871,Morgan,Peck,Female,1988-01-19,L6Y3Z8,4,Electrician,59000,Single,0,516.6,2015-01-01
80050872,Alexander,Murphy,Female,1989-12-05,M8Z3D8,1,Lawyer,101000,Single,0,2952,2015-01-01
80050873,Duran,Wilkins,Female,2001-05-04,L6E2F2,1,Archaeologist,42000,Single,0,3714.6,2015-01-01
80050874,Bray,Hammond,Male,1975-09-29,N4D4Y4,4,Clairvoyant,65000,Divorced,0,5207,2015-01-01
80050875,Greer,Acevedo,Male,1992-11-23,M6A7R3,4,Sports coach,52000,Single,0,1205.4,2015-01-01
80050876,Villa,Irwin,Female,1977-12-09,N3N8C2,1,Midwife,78000,Single,0,4592,2015-01-01
80050877,Waller,Shelton,Male,1979-02-03,M1T8O6,4,Typist,41000,Married,0,3985.2,2015-01-01
80050878,Saunders,Huerta,Male,1987-02-03,M8M1S6,2,Builder,44000,Single,0,4001.6,2015-01-01
80050879,Best,Cantrell,Male,1993-12-18,N5U3M7,3,Minister,94000,Married,1,1435,2015-01-01
80050880,Bernard,Mercer,Male,1985-04-07,M1G6V7,2,Astronomer,86000,Single,0,1107,2015-01-01
80050881,Horne,Wright,Female,1969-12-08,K2Q4G4,1,Auditor,87000,Single,0,5690.8,2015-01-01
80050882,Thornton,Pitts,Female,1977-05-25,L4Y3A5,3,Moneylender,52000,Single,0,2878.2,2015-01-01
80050883,Johnson,Welch,Female,1996-04-01,N1S7H2,2,Civil servant,107000,Single,0,3042.2,2015-01-01
80050884,Price,Shea,Male,1994-07-02,K8J8X1,2,Jockey,58000,Divorced,0,3255.4,2015-01-01
80050885,Davis,Salinas,Male,1992-12-28,N5S5E6,3,Preacher,48000,Married,2,5584.2,2015-01-01
80050886,Barber,Crawford,Female,1995-01-28,M3Z8S2,3,Administrator,51000,Married,1,5805.6,2015-01-01
80050887,Armstrong,Orr,Female,1983-01-06,K5R6Q2,1,Porter,50000,Married,0,1492.4,2015-01-01
80050888,Finley,Figueroa,Female,1984-11-09,N5U4T3,1,@#$%,70000,Divorced,2,3214.4,2015-01-01
80050889,Rojas,Serrano,Female,1998-01-13,M3V2E5,4,Builder,39000,Single,0,5436.6,2015-01-01
80050890,Kline,Hoffman,Female,1978-07-20,M5O5U4,3,Roofer,76000,Single,0,2845.4,2015-01-01
80050891,Ruiz,Rivers,Female,1979-05-03,N4Z1C4,3,Scientist,83000,Single,0,4346,2015-01-01
80050892,Li,Weaver,Female,1997-01-29,N2Q5V4,1,Fairground worker,101000,Divorced,2,4034.4,2015-01-01
80050893,Gray,Briggs,Male,1985-06-02,M8Y8H7,3,Traffic warden,59000,Married,3,844.6,2015-01-01
80050894,Mcintyre,Doyle,Male,1989-06-09,L5S8I1,2,Barber,75000,Single,0,6215.6,2015-01-01
80050895,Oneal,Hogan,Female,1992-06-26,K7I5V4,2,Diver,47000,Single,0,3460.4,2015-01-01
80050896,Bryan,Willis,Male,1968-08-14,N3E5V7,3,Inventor,40000,Single,0,3591.6,2015-01-01
80050897,Santiago,Richardson,Female,1986-01-11,L4X4L1,2,Disc jockey,44000,Single,0,3886.8,2015-01-01
80050898,Mayo,Allison,Female,2000-07-19,M8Z7U2,2,Carpet fitter,69000,Married,2,3370.2,2015-01-01
80050899,Bishop,Wagner,Male,1979-12-18,N2K3N6,1,Archaeologist,28000,Single,0,6092.6,2015-01-01
80050900,Jacobson,Hawkins,Female,1983-10-05,N1M1M2,1,Librarian,70000,Married,2,2296,2015-01-01
80050901,Grant,Freeman,Male,1990-11-24,M2I8G7,1,Publisher,42000,Single,0,3632.6,2015-01-01
80050902,Floyd,Hernandez,Male,1981-05-10,K2C4D7,1,Firefighter,77000,Single,0,2509.2,2015-01-01
80050903,Walters,Patel,Male,1990-07-26,N5K8Y7,2,Magician,60000,Married,0,5403.8,2015-01-01
80050904,Spencer,Cross,Male,1991-03-24,N3W2A5,3,Managing director,109000,Single,0,844.6,2015-01-01
80050905,Patterson,Phelps,Female,1992-12-14,L7E2V5,3,Cleaner,37000,Single,0,1402.2,2015-01-01
80050906,Washington,Bates,Male,1973-06-17,L7N7Y2,1,Pilot,64000,Single,0,3247.2,2015-01-01
80050907,Middleton,Martinez,Male,1986-07-14,M8L2D2,3,Firefighter,72000,Single,0,2993,2015-01-01
80050908,Avila,Martinez,Male,1989-09-21,K5Y2K7,1,Gamekeeper,47000,Married,3,1984.4,2015-01-01
80050909,Wall,Cannon,Male,1980-09-09,M2W2R6,4,Toilet attendant,40000,Married,0,5895.8,2015-01-01
80050910,Roberts,Holden,Female,1989-08-18,L4T3G4,2,Archaeologist,34000,Married,0,2238.6,2015-01-01
80050911,Gilbert,Compton,Male,1973-11-13,M2T2Y5,2,Managing director,87000,Single,0,598.6,2015-01-01
80050912,Wright,Lutz,Female,1995-05-01,L1N2W8,4,Aircraft engineer,61000,Single,0,5526.8,2015-01-01
80050913,Atkins,Mack,Female,2002-10-06,M4H7F2,4,Air traffic controller,115000,Married,1,4813.4,2015-01-01
80050914,Webb,Herman,Male,1975-02-23,L1E2W1,4,Landscape gardener,37000,Single,0,6043.4,2015-01-01
80050915,Wells,Mora,Female,1996-09-16,L5S1Q1,1,Lighthouse keeper,69000,Married,1,2468.2,2015-01-01
80050916,Brown,Esparza,Male,1994-12-07,N8X5H5,1,Park-keeper,81000,Single,0,5764.6,2015-01-01
80050917,Mccann,Casey,Female,1988-03-04,K6P7T3,4,Director,36000,Single,0,2476.4,2015-01-01
80050918,Suarez,Estes,Male,1976-07-06,N7U4M1,2,Taxi driver,70000,Single,0,6445.2,2015-01-01
80050919,Lewis,Garcia,Female,2000-05-24,N7E4S2,2,Councillor,39000,Married,1,508.4,2015-01-01
80050920,Sexton,Solomon,Male,1996-08-19,N4H6K2,4,Film director,85000,Married,2,5813.8,2015-01-01
80050921,Cruz,Henry,Female,1975-06-28,L8Y7P5,3,Footballer,44000,Married,0,4633,2015-01-01
80050922,Spence,Stewart,Female,1979-12-12,K7Y2K3,2,Park ranger,98000,Single,0,1754.8,2015-01-01
80050923,Yang,Hester,Male,1988-08-06,M3D4X2,2,Local govt worker,63000,Single,0,1894.2,2015-01-01
80050924,Clements,Cummings,Male,1982-05-03,K1X3Z4,2,Teacher,36000,Married,0,5010.2,2015-01-01
80050925,Rhodes,Benton,Female,1987-12-20,M4E6W5,3,Lock keeper,107000,Single,0,3140.6,2015-01-01
80050926,Sosa,Austin,Male,1997-01-21,N6N4R7,1,Foster parent,86000,Married,0,5207,2015-01-01
80050927,Huber,West,Female,1997-11-21,K1A2E5,4,Postal delivery worker,88000,Married,3,2394.4,2015-01-01
80050928,Brock,Bauer,Male,1998-09-24,K7S6S7,1,Police officer,30000,Single,0,861,2015-01-01
80050929,Newton,Cook,Female,1979-08-03,N5N2M6,3,Cook,35000,Single,0,6437,2015-01-01
80050930,Esparza,Sanchez,Female,1978-09-01,N4H3B3,1,Teaching assistant,91000,Married,0,6166.4,2015-01-01
80050931,Davies,Haynes,Male,1982-12-02,K8Y4R8,4,Meteorologist,57000,Single,0,4132.8,2015-01-01
80050932,Mcdaniel,Clarke,Female,1971-04-24,M7P3W4,1,Labourer,100000,Married,1,5026.6,2015-01-01
80050933,Yu,Benitez,Female,1991-08-28,K7P2P3,3,Composer,67000,Divorced,0,3886.8,2015-01-01
80050934,Reyes,Escobar,Female,1993-03-12,K8U5X5,3,Chauffeur,61000,Single,0,1303.8,2015-01-01
80050935,Burke,Blair,Female,1976-08-12,K1A4G8,4,Curator,108000,Single,0,2747,2015-01-01
80050936,Bruce,Espinoza,Male,1974-10-16,K8C4X6,1,Administrator,47000,Divorced,2,5207,2015-01-01
80050937,Orozco,Spears,Male,2000-02-18,N1A3O3,2,Cabin crew,52000,Married,0,5625.2,2015-01-01
80050938,Wade,Petty,Male,1992-10-28,K2X7J1,1,Probation officer,72000,Single,0,5346.4,2015-01-01
80050939,Herman,Reilly,Female,2003-08-17,N2V2B1,1,Financial advisor,73000,Married,1,1787.6,2015-01-01
80050940,Mcclure,Allen,Male,1988-12-08,M2R6C7,4,Bailiff,87000,Divorced,0,5986,2015-01-01
80050941,Cross,Potts,Female,1995-08-29,N4V5W5,2,Picture framer,44000,Divorced,0,926.6,2015-01-01
80050942,Boone,Collins,Male,1974-02-03,N8O4O2,1,Lecturer,84000,Single,0,902,2015-01-01
80050943,Macdonald,Herman,Female,1999-12-17,K4I5S7,2,Software consultant,50000,Single,0,1877.8,2015-01-01
80050944,Mcintyre,Madden,Female,1986-12-05,K3X1P1,1,Dressmaker,89000,Divorced,2,5535,2015-01-01
80050945,Richardson,Hendricks,Female,1993-09-18,N7X2T4,2,Gardener,31000,Married,3,762.6,2015-01-01
80050946,Mccall,Lopez,Female,1976-01-06,M7H5F8,3,Magistrate,81000,Divorced,2,6191,2015-01-01
80050947,Smith,Logan,Female,1980-11-04,K1B4U4,22,Shoemaker,41000,Single,0,2238.6,2015-01-01
80050948,Valencia,Lowe,Male,1977-10-26,N3P3R8,3,Builder,74000,Single,0,3878.6,2015-01-01
80050949,Hall,Oliver,Male,1976-06-11,L7H2I8,4,Toilet attendant,66000,Divorced,3,754.4,2015-01-01
80050950,Wheeler,Lloyd,Male,1991-04-13,L3S2X3,4,Porter,74000,Married,3,5395.6,2015-01-01
80050951,Owen,Dennis,Female,1979-03-11,M4T5H4,3,Aircraft engineer,101000,Single,0,3624.4,2015-01-01
80050952,Kennedy,Riddle,Female,1972-01-02,L5Y6B5,3,Economist,36000,Single,0,3271.8,2015-01-01
80050953,Park,Short,Male,2001-11-10,M6A8S5,3,Director,110000,Single,0,4542.8,2015-01-01
80050954,Case,Norton,Female,1983-04-11,M5I2F4,2,Farmer,72000,Married,3,1886,2015-01-01
80050955,Marks,Daniels,Male,1977-01-24,M3F1V1,2,Economist,98000,Married,1,4444.4,2015-01-01
80050956,Mueller,Cabrera,Female,1987-11-27,M8C4D2,3,Sculptor,43000,Married,3,4280.4,2015-01-01
80050957,Larson,Kaiser,Male,1970-12-29,K5R3E2,4,Prostitute,63000,Married,1,6084.4,2015-01-01
80050958,Duffy,Hess,Male,2000-11-10,N8O2O5,3,Courier,94000,Married,3,4879,2015-01-01
80050959,Cole,Weiss,Male,1985-07-13,L8R2B1,2,Health visitor,106000,Single,0,1935.2,2015-01-01
80050960,Mcintosh,Lopez,Female,1978-01-07,M6W1X8,1,Cleric,55000,Married,3,4756,2015-01-01
80050961,Hamilton,Fletcher,Male,1985-03-02,N8H5M1,4,Building labourer,46000,Married,3,3271.8,2015-01-01
80050962,Calderon,Tyler,Male,1970-07-27,L5G8H7,2,Delivery driver,69000,Married,0,6240.2,2015-01-01
80050963,Irwin,Fitzpatrick,Male,1997-02-15,M8F2Z3,4,Priest,54000,Married,2,5256.2,2015-01-01
80050964,Boone,Thomas,Female,2003-07-27,M2M7S8,2,Optician,59000,Married,0,4764.2,2015-01-01
80050965,Keller,Hensley,Female,1976-02-09,M1N5F3,1,Optician,44000,Married,0,6486.2,2015-01-01
80050966,Walsh,Warner,Male,1995-05-13,K4N5X3,3,Estate agent,36000,Divorced,1,4583.8,2015-01-01
80050967,Beltran,Valentine,Female,1997-11-19,M5W2B4,3,Magistrate,45000,Single,0,5945,2015-01-01
80050968,Villegas,Maxwell,Male,1995-05-22,N1G5M7,1,Events organiser,27000,Single,0,2566.6,2015-01-01
80050969,Frederick,Blankenship,Female,1974-11-27,M4M6E7,4,Car dealer,92000,Single,0,1410.4,2015-01-01
80050970,Compton,Torres,Male,1989-08-25,M3L6M3,2,Art critic,45000,Single,0,3271.8,2015-01-01
80050971,Graham,Smith,Female,1997-06-30,M3Q8X6,4,Security guard,70000,Married,0,1738.4,2015-01-01
80050972,Callahan,Fitzgerald,Female,1993-10-26,M8W2U3,3,Conservationist,40000,Single,0,2935.6,2015-01-01
80050973,Fitzpatrick,Garcia,Male,1971-02-14,K7M3J7,2,School crossing warden,65000,Single,0,3157,2015-01-01
80050974,Rowland,Colon,Female,1995-03-08,K8M6J4,3,Administrator,49000,Single,0,3772,2015-01-01
80050975,Harding,Mckenzie,Male,1993-09-02,N1R7P2,2,Missionary,102000,Single,0,2550.2,2015-01-01
80050976,Camacho,Erickson,Female,1979-01-08,M8M7X8,2,Occupational therapist,92000,Married,2,6461.6,2015-01-01
80050977,Bradford,Freeman,Female,1986-05-14,K5S2J2,1,Chef,66000,Married,1,918.4,2015-01-01
80050978,Woodard,Morton,Female,1996-09-12,K1G8J6,4,Croupier,54000,Married,2,5600.6,2015-01-01
80050979,Lucas,Clark,Male,1993-10-28,K4E2P7,2,Carpet fitter,93000,Divorced,0,4551,2015-01-01
80050980,Hunter,Roth,Female,1987-07-04,M2I2J2,2,Caretaker,66000,Single,0,1139.8,2015-01-01
80050981,Hines,Johnston,Female,1992-08-08,N4S8Z8,3,Pharmacist,42000,Married,0,1508.8,2015-01-01
80050982,Vargas,Morgan,Female,1991-03-26,M5U7S8,4,Car wash attendant,82000,Married,1,6428.8,2015-01-01
80050983,Oliver,Walker,Female,2001-04-01,K3Y5J5,3,Model,58000,Divorced,1,4821.6,2015-01-01
80050984,Floyd,Nixon,Female,1998-05-28,K5F8S8,3,Drug dealer,41000,Married,3,3165.2,2015-01-01
80050985,Merritt,Bird,Female,1970-02-20,N4M3E8,1,Foster parent,75000,Married,2,2353.4,2015-01-01
80050986,Barber,Walsh,Male,1974-11-20,K5Q2G7,1,Archaeologist,47000,Married,1,1607.2,2015-01-01
80050987,Marks,Hess,Male,1983-11-10,N2Y7E7,2,Fundraiser,64000,Divorced,2,4165.6,2015-01-01
80050988,Stevenson,Luna,Male,1998-09-20,N1R8P3,2,Manicurist,72000,Single,0,6379.6,2015-01-01
80050989,Donovan,Rodriguez,Male,1983-05-22,M6C3L5,4,Refuse collector,101000,Single,0,1090.6,2015-01-01
80050990,Mercer,Parks,Male,1994-03-27,L3O6L6,2,Stockbroker,93000,Married,2,6437,2015-01-01
80050991,Arellano,Harding,Male,1993-08-14,L4I8A3,3,Au pair,59000,Married,3,4665.8,2015-01-01
80050992,Stuart,Rubio,Female,1980-02-27,K1F2S4,1,Costume designer,59000,Single,0,1172.6,2015-01-01
80050993,Mcintosh,Romero,Male,2000-06-13,L7R5H5,1,Hypnotherapist,54000,Married,3,4518.2,2015-01-01
80050994,Phelps,Greene,Male,1978-02-23,M8O1F3,3,Counsellor,84000,Married,2,2189.4,2015-01-01
80050995,Jordan,Porter,Female,1989-01-12,L4F7X2,2,Catering staff,60000,Single,0,2763.4,2015-01-01
80050996,Moses,Krueger,Male,1997-06-20,K1H6K8,3,Camera operator,62000,Married,0,2984.8,2015-01-01
80050997,Clements,Castro,Female,1968-06-18,M5I1F1,4,Book-keeper,92000,Married,2,3132.4,2015-01-01
80050998,Mack,Alvarez,Female,1987-07-05,K2R8H6,1,Coastguard,91000,Married,0,4797,2015-01-01
80050999,Palmer,Tanner,Male,2002-03-10,K3I6M8,3,Magician,63000,Married,3,3739.2,2015-01-01
80051000,Jefferson,Barry,Male,1990-07-11,M1J6S6,4,Tour guide,72000,Divorced,1,984,2015-01-01
80051001,Ryan,Hughes,Female,1983-12-20,L1F2L6,4,Comedian,88000,Single,0,2804.4,2015-01-01
80051002,Mcknight,Sutton,Male,1986-05-02,N7X6W4,4,Art dealer,110000,Married,2,1385.8,2015-01-01
80051003,Ward,Jensen,Male,1974-10-04,N8I4K8,2,Leaflet distributor,68000,Married,2,1672.8,2015-01-01
80051004,Villanueva,Stone,Male,1986-08-21,K6Y5B8,4,Party planner,66000,Single,0,5461.2,2015-01-01
80051005,Stanton,Powell,Male,1969-10-15,M6X8I2,4,Archivist,63000,Married,1,1435,2015-01-01
80051006,Donovan,Adkins,Male,1983-03-07,N5E7M8,4,Carpenter,50000,Single,0,2255,2015-01-01
80051007,Mcclure,Pratt,Female,1981-10-04,K7C2P3,4,Lawyer,45000,Married,2,5010.2,2015-01-01
80051008,Mcclure,Farmer,Male,1995-11-07,K7Z5M7,1,Typist,83000,Single,0,5043,2015-01-01
80051009,Walton,Espinoza,Female,1974-10-05,N4I3H1,3,Picture framer,40000,Divorced,2,4362.4,2015-01-01
80051010,Pineda,Nixon,Male,1993-11-28,K1E5U6,4,Marketing director,65000,Married,3,5403.8,2015-01-01
80051011,Fields,Gaines,Female,1985-01-05,N4F4S6,4,Grave digger,53000,Single,0,6404.2,2015-01-01
80051012,Kemp,Armstrong,Female,1994-03-09,M1O1U3,2,Massage therapist,60000,Single,0,4764.2,2015-01-01
80051013,Jenkins,Harmon,Male,1988-06-03,M2Z2G4,4,Dental nurse,89000,Single,0,861,2015-01-01
80051014,Buck,Underwood,Female,2001-10-13,K7J8E5,1,Events organiser,27000,Single,0,861,2015-01-01
80051015,Faulkner,Acevedo,Female,1972-04-08,K4R6A5,3,Brewer,48000,Married,3,2927.4,2015-01-01
80051016,Garcia,Dennis,Female,1997-07-07,N6I6U4,3,Teacher,110000,Married,3,2517.4,2015-01-01
80051017,Greene,Casey,Male,1969-04-05,N4P6Y5,1,Researcher,71000,Married,3,6018.8,2015-01-01
80051018,Bauer,Clayton,Female,1989-02-22,L6J5W4,4,Funeral director,60000,Married,1,2443.6,2015-01-01
80051019,Sandoval,Ferrell,Male,1977-12-12,K3U6G3,3,Laboratory technician,42000,Married,1,2796.2,2015-01-01
80051020,Fry,Medina,Female,1973-04-24,L3Y6O2,3,Pathologist,104000,Single,0,5617,2015-01-01
80051021,Lindsey,Chaney,Female,1979-09-02,L3H5P5,3,Police officer,57000,Married,0,4542.8,2015-01-01
80051022,Barr,Whitney,Male,1973-11-23,M1E2Y6,4,Cabin crew,109000,Married,2,4633,2015-01-01
80051023,Robbins,Osborn,Female,1973-01-17,M5G8I5,4,Police officer,49000,Single,0,5297.2,2015-01-01
80051024,Flynn,Walters,Male,1986-02-17,M6B4N3,1,Coastguard,59000,Single,0,2320.6,2015-01-01
80051025,Cisneros,Baird,Female,2003-07-10,N4H1K7,1,Labourer,62000,Single,0,4419.8,2015-01-01
80051026,Copeland,Hunter,Male,1986-08-15,M4W1N1,2,Cook,61000,Single,0,795.4,2015-01-01
80051027,Medina,Heath,Male,1988-06-21,L7H8W4,3,Construction worker,86000,Single,0,3591.6,2015-01-01
80051028,Perkins,Santiago,Female,1993-09-25,K4Q3X7,1,Archivist,34000,Married,1,2058.2,2015-01-01
80051029,Gamble,Patrick,Female,1994-02-24,K3S2T5,1,Party planner,57000,Divorced,3,5116.8,2015-01-01
80051030,Patrick,Giles,Male,1987-09-03,M3X6G4,1,Chemist,92000,Divorced,2,4567.4,2015-01-01
80051031,Burns,Huerta,Male,1984-08-10,N1L5J3,2,Actor,87000,Single,0,2353.4,2015-01-01
80051032,Dixon,Duncan,Female,1993-02-17,K8D4G4,3,Retired,48000,Married,0,4026.2,2015-01-01
80051033,Murillo,Stout,Female,2002-11-04,M7Q5M1,2,Architect,107000,Single,0,3944.2,2015-01-01
80051034,Larson,Prince,Female,1976-03-07,N3R2I1,2,Blacksmith,65000,Single,0,5846.6,2015-01-01
80051035,Escobar,Mendez,Female,1988-05-13,L2T4C5,1,Historian,96000,Single,0,4337.8,2015-01-01
80051036,Wolf,Cordova,Male,1979-05-16,L2F7O3,3,Street entertainer,102000,Married,1,1754.8,2015-01-01
80051037,Bird,Johnson,Male,1987-04-29,M3T2D6,4,Mortician,73000,Married,3,2779.8,2015-01-01
80051038,Robbins,Cooley,Female,1968-12-24,M7J1W8,2,Street entertainer,87000,Single,0,2041.8,2015-01-01
8005103B,Mckenzie,Rose,Female,2002-07-03,N6E8T3,1,Locksmith,76000,Divorced,1,6035.2,2015-01-01
80051040,Miller,Berger,Female,2002-03-14,N2I4I8,3,Midwife,102000,Single,0,5297.2,2015-01-01
80051041,Sutton,Hogan,Male,1983-04-18,M8R8T3,1,Sailor,92000,Single,0,2960.2,2015-01-01
80051042,Ewing,Calderon,Female,1981-01-05,L5K7G1,3,Pest controller,69000,Single,0,1418.6,2015-01-01
80051043,Richardson,Lowe,Male,1992-06-10,L2W6F7,1,Park ranger,46000,Single,0,3649,2015-01-01
80051044,Rollins,Larson,Male,1972-06-05,N4I4V3,3,Pawnbroker,64000,Married,3,1713.8,2015-01-01
80051045,Orr,Krause,Male,1975-08-31,L7P6Y7,2,Journalist,82000,Single,0,5018.4,2015-01-01
80051046,Baker,Harrell,Female,1982-12-14,M3E5Q4,1,Councillor,34000,Married,3,4124.6,2015-01-01
80051047,Knapp,Cline,Female,1975-11-21,N3T1J8,4,Kennel worker,36000,Single,0,5494,2015-01-01
80051048,Anthony,Cohen,Male,1972-01-24,K8E4I3,4,Civil servant,80000,Married,3,1828.6,2015-01-01
80051049,Cortez,Madden,Female,1973-06-08,M6L3W8,1,Events organiser,40000,Divorced,3,4657.6,2015-01-01
80051050,Larsen,Dougherty,Female,1990-09-05,L3C7S1,2,Lock keeper,91000,Married,2,5690.8,2015-01-01
80051051,Cox,Todd,Female,1975-10-20,L1S1B2,4,Courier,78000,Married,2,2484.6,2015-01-01
80051052,Hardin,Rubio,Female,1991-01-13,N1R1D3,2,Postal delivery worker,79000,Single,0,2369.8,2015-01-01
80051053,Keller,Murray,Female,1970-12-31,K4E3B4,1,Insurance consultant,101000,Single,0,984,2015-01-01
80051054,Richmond,Warren,Female,1988-09-17,L2R3J1,4,Garden designer,39000,Married,1,5075.8,2015-01-01
80051055,Craig,Hoffman,Female,1981-07-15,K4S4Q5,1,Horticulturalist,57000,Divorced,0,3230.8,2015-01-01
80051056,Mcclure,Johnson,Female,1975-07-23,M1I8U6,2,Fisherman/woman,97000,Single,0,1049.6,2015-01-01
80051057,Goodwin,Dickson,Male,1978-04-04,K1O8Q7,3,Producer,69000,Divorced,0,4288.6,2015-01-01
80051058,Osborne,Montoya,Male,2002-06-20,K7F3Y5,2,Interior designer,84000,Single,0,4395.2,2015-01-01
80051059,Singleton,Patel,Female,1990-04-15,L8O3W6,1,Fairground worker,101000,Married,3,6379.6,2015-01-01
80051060,Green,Christian,Female,1973-09-13,L6Y2Z1,2,Actor,44000,Married,3,3009.4,2015-01-01
80051061,Martinez,Morris,Female,1998-09-08,L6W6C8,1,Editor,26000,Married,3,2943.8,2015-01-01
80051062,Branch,Duran,Male,1985-09-03,L4A7T7,2,Manicurist,38000,Divorced,2,2566.6,2015-01-01
80051063,Haney,Whitaker,Female,1986-06-21,M4C1A3,3,Waiting staff,61000,Single,0,2558.4,2015-01-01
80051064,Booker,Andrews,Male,2003-01-22,M4G1K5,1,Paramedic,63000,Divorced,1,1623.6,2015-01-01
80051065,Mendez,Roberson,Female,1968-06-25,K2J4P4,3,Secretary,75000,Married,2,2255,2015-01-01
80051066,Chen,Henderson,Male,1980-05-22,M8O6M2,3,Preacher,52000,Single,0,6363.2,2015-01-01
80051067,Walton,Glover,Female,1984-01-01,N6A1B6,4,Cleaner,95000,Married,2,2812.6,2015-01-01
80051068,Saunders,Waters,Female,1981-12-09,K8L8X5,4,Scaffolder,71000,Married,0,4018,2015-01-01
80051069,Liu,Berry,Male,1996-07-04,K6M2X3,2,Domestic staff,89000,Married,0,5731.8,2015-01-01
80051070,Mathis,Booker,Male,1982-01-04,K6E6O2,4,Racing driver,66000,Married,1,4518.2,2015-01-01
80051071,Rowland,Hurley,Female,1968-10-23,M6S5G6,4,Astrologer,63000,Married,1,6289.4,2015-01-01
80051072,Klein,Kirk,Male,1985-02-05,M2U7H6,4,Unemployed,96000,Married,1,2558.4,2015-01-01
80051073,Patterson,Holden,Female,1977-09-03,K8Q1U5,2,Window cleaner,101000,Single,0,4879,2015-01-01
80051074,Morrow,Rollins,Female,2002-09-11,M3S7K2,4,Secretary,65000,Single,0,5174.2,2015-01-01
80051075,Molina,Costa,Male,1995-02-11,K8V4T4,3,Refuse collector,81000,Single,0,4280.4,2015-01-01
80051076,Dickson,Davila,Male,1982-02-24,M2I4I5,2,Market trader,52000,Married,0,3599.8,2015-01-01
80051077,Heath,Padilla,Male,1988-03-11,M4X6X4,4,Park-keeper,103000,Single,0,2566.6,2015-01-01
80051078,Holden,Contreras,Female,1978-04-07,K1W6S8,3,Make-up artist,69000,Single,0,1213.6,2015-01-01
80051079,Kane,Gaines,Female,1974-12-16,N7L8C4,2,Debt collector,53000,Single,0,3788.4,2015-01-01
80051080,Sanders,Duarte,Female,1993-03-23,K1Z1E8,1,Bricklayer,74000,Single,0,3780.2,2015-01-01
80051081,Robles,Grimes,Male,1994-09-23,K1I7N4,1,Advertising executive,81000,????,0,779,2015-01-01
80051082,Savage,House,Female,1981-11-23,M5I6Y5,2,Auditor,94000,Married,3,3714.6,2015-01-01
80051083,Villegas,Barajas,Male,1988-06-30,L4K4I4,1,Auctioneer,50000,Married,2,3386.6,2015-01-01
80051084,May,Armstrong,Male,1990-11-02,K2Q4T3,4,Choreographer,94000,Married,1,1558,2015-01-01
80051085,Beasley,Moon,Female,1979-08-13,L6W2E7,4,Careers advisor,98000,Single,0,4321.4,2015-01-01
80051086,Stewart,Baird,Male,1970-02-04,L8F3M7,4,Bailiff,71000,Single,0,1361.2,2015-01-01
80051087,Mullins,Myers,Female,1996-10-31,N2W4E7,4,Company director,78000,Divorced,0,4190.2,2015-01-01
80051088,Porter,Brooks,Female,1977-12-31,K7R1X4,3,Garden designer,93000,Single,0,4419.8,2015-01-01
80051089,Nicholson,Reynolds,Female,2003-06-20,M7E7H2,1,Circus worker,48000,Divorced,3,2976.6,2015-01-01
80051090,Stevens,Schmitt,Male,1972-06-15,L2W3F4,3,Toilet attendant,102000,Married,2,2665,2015-01-01
80051091,Bryan,Tyler,Male,1999-05-22,K5Q8C8,1,Gardener,39000,Single,0,5822,2015-01-01
80051092,Schaefer,Duarte,Female,1987-08-07,M8K3Y2,1,Craftsperson,40000,Married,3,4223,2015-01-01
80051093,Mcgrath,Reese,Female,1986-12-02,K2C4R6,3,Priest,101000,Single,0,3706.4,2015-01-01
80051094,Collins,Smith,Female,2001-03-02,N8R3L3,3,Art historian,60000,Married,0,5157.8,2015-01-01
80051095,Parker,Lyons,Female,1981-12-04,M4A6O3,3,Barber,41000,Single,0,4731.4,2015-01-01
80051096,Merritt,Brewer,Male,1999-04-06,N7A4S2,2,Bank manager,41000,Divorced,1,3124.2,2015-01-01
80051097,Walton,Lucero,Male,1994-01-13,N6Z1S5,2,Shoemaker,45000,Single,0,5403.8,2015-01-01
80051098,Myers,Lara,Male,1996-07-27,M6X4D5,3,Tax inspector,73000,Single,0,1254.6,2015-01-01
80051099,Anthony,Chen,Female,2002-03-11,L4D6K1,2,Jewellery maker,85000,Single,0,6461.6,2015-01-01
80051100,Gordon,Hanna,Male,1990-02-28,K7J8P7,4,Chiropodist,78000,Married,1,5740,2015-01-01
80051101,Wilkinson,Dennis,Female,2000-03-09,N7C2D1,3,Boat builder,91000,Married,3,688.8,2015-01-01
80051102,Barry,Hunt,Female,1987-05-15,L6C6M3,1,Lecturer,97000,Single,0,3919.6,2015-01-01
80051103,Valdez,Mercer,Male,1976-09-17,K3Q5J5,2,Doctor,85000,Single,0,6207.4,2015-01-01
80051104,Peterson,Eaton,Male,1977-08-28,L7V1S5,2,Surveyor,98000,Single,0,3575.2,2015-01-01
80051105,Rivers,Vega,Male,1986-11-17,M7A2M2,1,Ship builder,88000,Single,0,6338.6,2015-01-01
80051106,Bowen,Bender,Female,1999-01-27,L4Z3Y8,1,Shoemaker,80000,Single,0,2410.8,2015-01-01
80051107,Pham,Oliver,Male,1992-07-22,K5Q2H8,3,Sports coach,94000,Single,0,5182.4,2015-01-01
80051108,Bradford,Hatfield,Male,2002-01-10,K2P3F5,1,School meals supervisor,52000,Married,1,2952,2015-01-01
80051109,Huber,Melton,Male,1973-05-06,K5H2C1,3,Advertising executive,77000,Married,2,5453,2015-01-01
80051110,Wagner,Weaver,Female,1980-11-23,L5B6M4,2,Fundraiser,54000,Married,2,4255.8,2015-01-01
80051111,Conley,Shah,Female,2003-02-27,K2P4F7,3,Baker,105000,Divorced,3,3050.4,2015-01-01
80051112,Walters,Bass,Female,1992-04-30,K3K8Z4,4,Auctioneer,97000,Single,0,3837.6,2015-01-01
80051113,Austin,Mercado,Female,1968-11-15,L3Q8W1,3,Healthcare assistant,37000,Single,0,2419,2015-01-01
80051114,Gay,Richardson,Female,1975-08-06,M2Y6P8,3,Literary agent,87000,Married,3,4034.4,2015-01-01
80051115,Ramirez,Cobb,Female,1986-04-02,N7V3I1,3,Nurse,54000,Single,0,4411.6,2015-01-01
80051116,Davis,Chandler,Male,1969-09-04,L3F7B3,2,Auctioneer,30000,Married,2,5551.4,2015-01-01
80051117,Leach,Maynard,Female,1980-03-01,M1R6N2,3,Councillor,84000,Divorced,2,4100,2015-01-01
80051118,Duarte,Williamson,Male,1974-07-02,L1I6Y4,4,Broadcaster,94000,Single,0,4698.6,2015-01-01
80051119,Rice,Wolf,Male,1968-12-13,N3K5I6,2,Butler,43000,Married,1,3058.6,2015-01-01
80051120,Page,Richmond,Male,1987-03-31,M6A2P3,1,Crane driver,80000,Single,0,2812.6,2015-01-01
80051121,Arroyo,Stephenson,Female,1973-02-03,L4A7A1,4,Auditor,76000,Single,0,5018.4,2015-01-01
80051122,Dean,Shelton,Female,1996-08-11,K1U6C3,2,Model,29000,Single,0,729.8,2015-01-01
80051123,Mcintosh,Riley,Female,2003-06-18,K1Y6A4,1,Plumber,53000,Single,0,5346.4,2015-01-01
80051124,Mosley,Tyler,Female,1984-03-17,K2X1G2,3,Funeral director,37000,Married,1,3321,2015-01-01
80051125,Ford,Mcintosh,Female,1968-11-06,M8V8V4,2,Construction worker,32000,Married,2,5748.2,2015-01-01
80051126,Good,Stout,Male,1977-05-02,N4B1H6,3,Fairground worker,94000,Single,0,2238.6,2015-01-01
80051127,Barajas,Morse,Male,2000-04-14,L3R1P5,2,Jewellery maker,105000,Divorced,3,1787.6,2015-01-01
80051128,Moyer,Zavala,Female,1984-05-26,N6M6V6,4,Business owner,43000,Married,2,992.2,2015-01-01
80051129,Sanders,Lowe,Female,1985-07-09,M7B3D6,1,Factory worker,27000,Single,0,5010.2,2015-01-01
80051130,Gates,House,Female,1995-06-08,K2C6L3,2,Flying instructor,104000,Single,0,2755.2,2015-01-01
80051131,Joseph,Norris,Male,1995-03-29,N1F8P6,3,Lorry driver,55000,Single,0,5625.2,2015-01-01
80051132,Atkinson,Norton,Female,2000-09-08,N3A1U1,4,Meter reader,40000,Single,0,574,2015-01-01
80051133,Ware,Chang,Female,1969-10-21,K1Z3T4,4,Childrens entertainer,74000,Married,2,869.2,2015-01-01
80051134,Stephens,Wilkinson,Female,1977-10-02,K8Q4M7,1,Missionary,90000,Married,2,828.2,2015-01-01
80051135,Walker,Peterson,Male,1973-07-09,L7H1A8,3,Tax inspector,37000,Single,0,4821.6,2015-01-01
80051136,Hinton,Goodman,Male,1969-12-18,L5P4E7,1,Builder,101000,Single,0,3435.8,2015-01-01
80051137,Osborn,Rowland,Female,1997-08-22,L5U1M5,1,Coastguard,47000,Single,0,836.4,2015-01-01
80051138,Shannon,Wolfe,Female,2003-03-09,M8G1D4,1,Anthropologist,29000,Divorced,3,6322.2,2015-01-01
80051139,Wolfe,Baldwin,Female,1992-04-16,K4H5T8,1,Building labourer,57000,Single,0,926.6,2015-01-01
80051140,Schaefer,Nguyen,Male,1970-11-30,N1Y6W2,4,Au pair,86000,Single,0,2558.4,2015-01-01
80051141,Cain,Beasley,Male,1977-03-02,K3U7V2,2,Immigration officer,71000,Divorced,3,1115.2,2015-01-01
80051142,Mcknight,Lewis,Female,1992-08-14,K4N1V8,2,Animal breeder,81000,Single,0,3009.4,2015-01-01
80051143,Cowan,Nolan,Male,1996-02-09,K1I2K3,4,Fairground worker,86000,Married,0,2878.2,2015-01-01
80051144,Frost,Abbott,Female,1983-01-27,L7Y1G5,2,School meals supervisor,52000,Married,1,4501.8,2015-01-01
80051145,Wheeler,Mcguire,Male,1973-03-14,L5V7T6,2,Heating engineer,90000,Single,0,2017.2,2015-01-01
80051146,Walls,Cummings,Male,2002-03-24,N7J7F4,2,Traffic warden,90000,Divorced,0,910.2,2015-01-01
80051147,Parks,Wu,Male,1970-11-20,N3D8Q1,4,Meteorologist,96000,Divorced,0,3444,2015-01-01
80051148,Willis,Casey,Female,1995-02-14,M4D3X6,2,Astronomer,103000,Single,0,508.4,2015-01-01
80051149,Harmon,Krause,Female,2000-04-01,K6B6E7,2,Grave digger,49000,Married,0,2845.4,2015-01-01
80051150,Webb,Wyatt,Female,2003-07-10,N4K5W3,2,Dental nurse,92000,Married,3,2443.6,2015-01-01
80051151,Jacobson,Sweeney,Male,1976-09-22,K2X6P4,2,Surgeon,61000,Single,0,3526,2015-01-01
80051152,Barajas,Lambert,Male,1985-07-27,L8G5T4,3,Travel agent,60000,Single,0,5715.4,2015-01-01
80051153,Reese,Oconnor,Male,1973-12-02,L1C8N8,3,Doctor,39000,Single,0,2378,2015-01-01
80051154,Russo,Mcknight,Male,1985-02-03,L4A3O1,1,Dental nurse,72000,Married,2,4600.2,2015-01-01
80051155,Burgess,Blackwell,Male,1987-05-13,K3Y7M3,2,Astronomer,95000,Divorced,3,5453,2015-01-01
80051156,Chung,Mathews,Female,2002-09-25,L8O2U2,2,Lap dancer,85000,Single,0,3083.2,2015-01-01
80051157,Combs,Brandt,Female,1985-05-08,M1O5W8,1,Street entertainer,58000,Single,0,4296.8,2015-01-01
80051158,Charles,Vaughan,Male,1985-08-14,N1L7Y7,4,Dressmaker,43000,Married,2,2984.8,2015-01-01
80051159,Wells,Gay,Female,1992-10-22,N5P2B5,1,Drug dealer,31000,Married,1,1902.4,2015-01-01
80051160,Reilly,Nunez,Female,1997-09-27,L4L6S3,3,Au pair,99000,Single,0,2017.2,2015-01-01
80051161,Marquez,Matthews,Female,1975-10-01,M5P7B7,4,Company director,111000,Single,0,6297.6,2015-01-01
80051162,Nash,Mckay,Female,1972-03-11,K3C3H8,2,Handyman,74000,Single,0,6478,2015-01-01
80051163,Holmes,Lindsey,Female,1989-03-31,L5X8V8,3,Catering staff,90000,Married,3,3739.2,2015-01-01
80051164,Lester,Pham,Male,1997-05-22,M5Z8F6,3,Circus worker,66000,Married,3,2747,2015-01-01
80051165,Montes,Everett,Female,2003-05-17,L7M5B6,3,Teacher,68000,Single,0,5280.8,2015-01-01
80051166,Mooney,Huerta,Female,1994-10-29,N2G5B8,1,Pawnbroker,96000,Married,3,3829.4,2015-01-01
80051167,Tanner,Dunn,Male,1991-01-17,K8Z2W8,4,Street entertainer,108000,Married,0,1722,2015-01-01
80051168,Mcintyre,Villarreal,Male,2001-04-26,L8U2U2,2,Salesperson,29000,Married,2,5682.6,2015-01-01
80051169,Gibson,Odom,Male,1970-05-06,N1W5W1,1,Cabin crew,54000,Single,0,5133.2,2015-01-01
80051170,Mckinney,Moody,Female,1993-10-24,M2L5N2,2,Flower arranger,90000,Married,3,5518.6,2015-01-01
80051171,Bishop,Brock,Female,1999-09-02,M3Q1G1,4,Machinist,81000,Single,0,1771.2,2015-01-01
80051172,Hull,Strong,Male,1968-12-01,K8S8S3,2,Tailor,68000,Single,0,3698.2,2015-01-01
80051173,Tucker,Grant,Female,1982-11-10,M4B4B7,4,Clockmaker,37000,Divorced,2,5166,2015-01-01
80051174,Keith,Benton,Female,1984-09-12,M5T1X7,4,Gas fitter,38000,Married,3,1541.6,2015-01-01
80051175,Garza,Huynh,Female,1975-05-24,K2C8Q6,3,Postal delivery worker,84000,Single,0,615,2015-01-01
80051176,Smith,Nicholson,Male,1986-04-11,L4P8J2,2,Conservationist,37000,Single,0,6199.2,2015-01-01
80051177,Weeks,Bird,Male,1980-09-20,N6U5Y8,2,Property developer,79000,Married,2,5715.4,2015-01-01
80051178,Frank,Ewing,Male,1968-10-09,K1Q2G7,2,Fitness instructor,102000,Married,3,4428,2015-01-01
80051179,Maynard,Carey,Male,2003-09-30,M1H7R3,4,Sports coach,75000,Divorced,3,4280.4,2015-01-01
80051180,Mclaughlin,Lin,Female,1968-05-05,M6H6J3,2,Machinist,105000,Single,0,2222.2,2015-01-01
80051181,Solis,Austin,Male,1975-09-21,K6S5A8,1,Optician,34000,Married,3,5723.6,2015-01-01
80051182,Burton,Calderon,Male,1982-04-28,M1Z1K7,4,Antique dealer,87000,Divorced,0,3312.8,2015-01-01
80051183,Duarte,Strong,Female,2002-08-30,M2X2H1,2,Receptionist,106000,Single,0,4838,2015-01-01
80051184,Jenkins,Benton,Female,1974-10-27,L8S7Z6,2,Veterinary surgeon,94000,Divorced,2,3050.4,2015-01-01
80051185,Rocha,Lamb,Female,1999-04-21,K5X7G4,1,Computer engineer,61000,Married,3,2115.6,2015-01-01
80051186,Lozano,Graves,Female,1979-06-23,M5P2V1,4,Home-worker,74000,Single,0,1377.6,2015-01-01
80051187,Kaiser,Campbell,Male,1986-12-24,M8N7E1,3,Lock keeper,66000,Married,3,5403.8,2015-01-01
80051188,Rowland,Hendrix,Female,2002-01-05,K3C4U7,2,Herbalist,57000,Married,0,2943.8,2015-01-01
80051189,Howell,Buchanan,Female,1980-06-29,K4D2A2,3,Occupational therapist,91000,Single,0,4370.6,2015-01-01
80051190,Horn,Davenport,Female,1975-10-23,L3P8T2,3,Electrician,32000,Single,0,2517.4,2015-01-01
80051191,Mitchell,Bernard,Female,2000-02-16,L5W4S7,2,Baggage handler,96000,Married,0,2607.6,2015-01-01
80051192,Yang,Hartman,Female,1977-05-21,N5Y3A2,3,Homeopath,100000,Single,0,5633.4,2015-01-01
80051193,Walls,Lambert,Male,1992-03-24,N1P6X7,1,Professor,65000,Single,0,5239.8,2015-01-01
80051194,Mills,Gibbs,Male,1976-11-03,K3Q6X8,3,Carpet fitter,108000,Married,3,4477.2,2015-01-01
80051195,Petersen,Orozco,Male,1978-11-17,K7Q3Q7,1,Tarot Reader,25000,Single,0,4247.6,2015-01-01
80051196,Shepard,Cuevas,Female,1984-03-13,N4R6A1,4,Costume designer,38000,Divorced,0,4477.2,2015-01-01
80051197,Russell,Schultz,Male,1995-02-21,M1V3R1,2,Car dealer,105000,Single,0,4198.4,2015-01-01
80051198,Francis,Sims,Male,1987-10-03,N8U6S8,4,Scaffolder,61000,Divorced,0,1246.4,2015-01-01
80051199,Johnston,Rowe,Male,2001-11-18,K4P1V7,3,Fisherman/woman,37000,Single,0,2386.2,2015-01-01
80051200,Simmons,Chang,Male,1979-11-23,K7I8F8,3,Chiropodist,46000,Married,2,1951.6,2015-01-01
80051201,Sheppard,Rice,Female,1990-01-30,N1H8F7,3,Footballer,62000,Single,0,2943.8,2015-01-01
80051202,Kirk,Donovan,Female,1997-03-01,K4I4A6,3,Secretary,47000,Married,2,4698.6,2015-01-01
80051203,Patrick,Fox,Male,1991-07-06,K2S5P3,3,Car dealer,32000,Married,3,1951.6,2015-01-01
80051204,Collins,Welch,Female,1990-11-10,M1A5G1,2,Author,64000,Single,0,3681.8,2015-01-01
80051205,Horton,Macias,Female,1997-07-13,K1Z8W3,4,Accountant,91000,Married,2,4321.4,2015-01-01
80051206,Gill,Carson,Male,1976-07-01,N5U4C8,3,Aromatherapist,52000,Married,2,1713.8,2015-01-01
80051207,Mcfarland,Carr,Female,2003-04-08,L7S5H1,1,Pickpocket,100000,Married,0,3353.8,2015-01-01
80051208,Sellers,Welch,Female,1973-02-02,M8Z2O2,3,Counsellor,76000,Single,0,1738.4,2015-01-01
80051209,French,Lambert,Male,1997-07-03,K5X8B5,4,Medical student,71000,Single,0,1861.4,2015-01-01
80051210,Solis,Moon,Female,2003-06-19,L2O4I4,3,Carpenter,92000,Married,1,5166,2015-01-01
80051211,Walker,Colon,Male,2002-10-15,K6W5P6,3,Clergyman,96000,Single,0,1927,2015-01-01
80051212,Turner,Schaefer,Female,1988-05-04,L8Z8Y1,4,Tailor,48000,Married,3,5494,2015-01-01
80051213,Hurst,Kemp,Female,2000-08-19,M2J8H7,3,Train driver,32000,Single,0,3567,2015-01-01
80051214,Todd,Reed,Female,1972-12-20,M8H3B1,2,Auctioneer,54000,Single,0,6199.2,2015-01-01
80051215,Watson,Forbes,Male,1997-11-08,N5M5W8,3,Bricklayer,67000,Single,0,2902.8,2015-01-01
80051216,Beltran,Kennedy,Male,1970-06-27,N4D3C8,3,Bank clerk,60000,Married,2,3091.4,2015-01-01
80051217,Bright,Tyler,Female,1997-06-07,M5B4T8,2,Baggage handler,82000,Married,1,6191,2015-01-01
80051218,Singleton,Garrison,Male,1985-05-08,M4C2K7,4,Politician,55000,Single,0,4698.6,2015-01-01
80051219,Rodriguez,York,Female,1978-08-18,K4V1H1,4,Politician,48000,Married,2,1246.4,2015-01-01
80051220,Dickerson,Fox,Male,1991-09-14,L1F7Y2,1,Legal secretary,98000,Single,0,5567.8,2015-01-01
80051221,Daugherty,Fuller,Male,1990-06-12,M8P5G2,1,Crematorium worker,97000,Married,1,3337.4,2015-01-01
80051222,Robles,Baker,Male,1982-10-29,M3H8N8,1,Mortician,24000,Divorced,0,4296.8,2015-01-01
80051223,Robles,Bautista,Male,1971-01-17,L5T6S6,3,Bodyguard,104000,Single,0,5313.6,2015-01-01
80051224,Hartman,Taylor,Male,1996-10-06,M2B7R8,2,Casual worker,41000,Divorced,3,4551,2015-01-01
80051225,Good,Nash,Male,1985-06-19,L3X6S3,3,Road sweeper,101000,Divorced,2,2353.4,2015-01-01
80051226,Snow,Lawrence,Female,1988-05-25,K1W2D2,2,Jockey,79000,Married,3,3526,2015-01-01
80051227,Hurst,Mckay,Male,2000-10-26,L2P7I1,3,Flower arranger,110000,Married,3,2960.2,2015-01-01
80051228,Jefferson,Buck,Male,1996-12-11,N3V8B8,1,School meals supervisor,93000,Married,1,5067.6,2015-01-01
80051229,Clark,Pena,Female,1992-12-26,K4H6S4,1,Auditor,79000,Married,3,6248.4,2015-01-01
80051230,Ashley,Hicks,Female,1997-09-08,M3K3A4,3,Cook,102000,Single,0,5264.4,2015-01-01
80051231,Howe,Knight,Female,1989-12-29,N1P6F6,4,Choreographer,96000,Married,0,3042.2,2015-01-01
80051232,Ortega,Waters,Female,1982-02-09,M1D8A7,2,Tour guide,86000,Single,0,6125.4,2015-01-01
80051233,Hines,Nguyen,Male,1982-04-01,M4C5C1,2,Psychologist,63000,Single,0,5207,2015-01-01
80051234,Cochran,Johnson,Male,1985-07-21,K4W6D4,4,Care assistant,38000,Single,0,1861.4,2015-01-01
80051235,Poole,Wolf,Male,1992-01-28,K3I8D2,3,Care assistant,79000,Married,2,3673.6,2015-01-01
80051236,Douglas,Vasquez,Male,1979-09-23,M4H2Q2,4,Health visitor,50000,Married,1,2132,2015-01-01
80051237,Coffey,Rollins,Male,1980-12-30,L4E8V8,2,Craftsperson,62000,Single,0,5321.8,2015-01-01
80051238,Ward,Blair,Male,1995-09-01,L3F3W7,3,Courier,76000,Married,0,6109,2015-01-01
80051239,Dillon,Henry,Male,1969-12-03,M2R3U2,2,Art dealer,98000,Single,0,4034.4,2015-01-01
80051240,Huynh,Mcguire,Female,1995-09-27,L1O7G1,3,Bookmaker,52000,Married,2,3386.6,2015-01-01
80051241,Harmon,Mcdowell,Male,1982-05-01,M1N1U5,2,Toilet attendant,33000,Single,0,4280.4,2015-01-01
80051242,Briggs,Preston,Female,1981-12-13,L8P4Q2,4,Publican,109000,Single,0,729.8,2015-01-01
80051243,Newman,Kramer,Female,1989-12-05,N5N1N3,3,Immigration officer,110000,Married,2,6297.6,2015-01-01
80051244,Baldwin,Wilson,Male,1992-06-30,K1J5Z1,1,Inventor,85000,Single,0,3198,2015-01-01
80051245,Berger,Eaton,Male,1984-12-04,K2P7T5,1,Drug dealer,51000,Married,3,2550.2,2015-01-01
80051246,Graves,Saunders,Male,1977-01-20,M7T6C8,1,Salesperson,93000,Single,0,3394.8,2015-01-01
80051247,Wolf,Barton,Male,1995-12-16,L1N3Q3,2,Barber,76000,Single,0,1959.8,2015-01-01
80051248,Ferrell,Petersen,Female,1995-12-06,K5C6H1,3,Lap dancer,42000,Divorced,2,2222.2,2015-01-01
80051249,Dickson,Jimenez,Female,1971-04-30,K3D7F6,1,Crown prosecutor,69000,Single,0,1394,2015-01-01
80051250,Newton,Brady,Female,1988-07-26,L8Q6U3,3,Miner,37000,Married,0,4821.6,2015-01-01
80051251,Mcclain,Beltran,Male,1974-03-21,K2B5Q4,4,Immigration officer,57000,Divorced,3,680.6,2015-01-01
80051252,Murphy,Cardenas,Female,1986-03-17,M4K8D6,4,Chauffeur,81000,Single,0,4854.4,2015-01-01
80051253,Burton,Conway,Male,1983-05-23,L1R4O8,1,Administrator,83000,Single,0,3099.6,2015-01-01
80051254,Shields,Luna,Female,1983-11-25,M3V1J8,3,Flower arranger,47000,Married,3,2107.4,2015-01-01
80051255,Fletcher,Murillo,Female,1975-01-23,N4R8G1,2,Archivist,42000,Single,0,2796.2,2015-01-01
80051256,Rodgers,Pitts,Female,1988-10-06,M5C5Z2,4,Costume designer,43000,Married,2,6469.8,2015-01-01
80051257,Frye,Mckinney,Male,1984-08-11,K1R1G7,1,Foster parent,94000,Married,0,2222.2,2015-01-01
80051258,Steele,Murphy,Female,1976-07-02,N3O5L6,3,Park-keeper,95000,Single,0,3837.6,2015-01-01
80051259,Pham,Lynch,Female,1973-05-12,K6N8Y6,1,Researcher,56000,Married,3,4805.2,2015-01-01
80051260,Brewer,Fry,Male,1970-12-27,M8I5J6,3,Boat builder,48000,Single,0,2443.6,2015-01-01
80051261,Beltran,Holt,Female,1969-10-29,L1O4E3,3,Decorator,86000,Married,2,1025,2015-01-01
80051262,Castro,Nolan,Male,1987-08-15,N7A3D1,3,Fundraiser,44000,Divorced,3,1057.8,2015-01-01
80051263,Malone,Rice,Female,1994-03-31,K8X4B5,1,Community worker,46000,Married,1,3362,2015-01-01
80051264,Huerta,Acevedo,Female,1992-12-23,M4R2J4,4,Cook,47000,Married,1,2025.4,2015-01-01
80051265,Best,Perez,Female,1997-02-14,N8F5Y2,2,Cashier,70000,Single,0,1451.4,2015-01-01
80051266,Reilly,Bender,Male,1987-03-09,N2T6I3,1,Park ranger,88000,Married,3,1057.8,2015-01-01
80051267,Booth,Andrade,Female,1984-11-24,K1I6Q1,2,Comedian,91000,Married,3,4190.2,2015-01-01
80051268,Barr,Long,Female,1989-03-17,M4A2X1,2,Councillor,54000,Married,1,6174.6,2015-01-01
80051269,Ballard,Simon,Male,1987-10-03,N5F2X4,1,Police officer,36000,Single,0,3501.4,2015-01-01
80051270,Benton,Woods,Female,1981-08-05,M3C3O8,2,Sculptor,31000,Divorced,1,2279.6,2015-01-01
80051271,Velez,Powell,Female,1985-10-10,N4D4F6,4,Tarot Reader,55000,Single,0,3977,2015-01-01
80051272,Garcia,Shields,Female,1982-05-16,K2Q4Q3,1,Antique dealer,97000,Single,0,2763.4,2015-01-01
80051273,Browning,Friedman,Male,1993-01-01,L5O8N5,3,Car wash attendant,60000,Single,0,1681,2015-01-01
80051274,Case,Graham,Male,1998-10-21,M3I8X2,3,Film director,48000,Married,0,4173.8,2015-01-01
80051275,Vazquez,Hayden,Female,1993-11-21,K5L6U1,4,Speech therapist,52000,Single,0,2607.6,2015-01-01
80051276,Zavala,Randall,Male,1975-03-28,L3P6L6,1,Bricklayer,92000,Married,3,6141.8,2015-01-01
80051277,Peterson,Ochoa,Female,1977-05-09,N1B5E2,3,Security guard,42000,Single,0,1992.6,2015-01-01
80051278,Hicks,Cross,Female,1989-07-12,K7S4T7,2,Television presenter,83000,Single,0,4190.2,2015-01-01
80051279,Gentry,Cobb,Male,1973-08-10,N2Z7T1,2,Preacher,61000,Divorced,0,1804,2015-01-01
80051280,Contreras,Olson,Male,1972-11-04,K3N5Z2,4,Telephonist,89000,Married,2,1271,2015-01-01
80051281,Roy,Baker,Male,1983-09-28,L6Z2S5,1,Carpenter,91000,Single,0,6314,2015-01-01
80051282,Joyce,Woodard,Male,1985-06-12,K5Y5J7,4,Party planner,61000,Divorced,2,3632.6,2015-01-01
80051283,Stark,Pratt,Female,1998-06-06,M2X7R2,2,Circus worker,61000,Single,0,2074.6,2015-01-01
80051284,Lynch,Forbes,Female,1982-02-10,M3E3G2,2,Social worker,106000,Single,0,959.4,2015-01-01
80051285,Delgado,Johns,Male,2000-05-26,K5O2N7,2,Disc jockey,78000,Married,3,926.6,2015-01-01
80051286,Dougherty,Lucas,Male,2000-03-09,K5I2M3,1,Chef,89000,Single,0,1107,2015-01-01
80051287,Esparza,Melendez,Male,1969-04-18,K6S4N6,3,Landowner,46000,Married,0,2369.8,2015-01-01
80051288,Madden,Garner,Male,1976-11-29,N3T6L4,3,Car dealer,58000,Single,0,2230.4,2015-01-01
80051289,Osborne,Macias,Male,1975-10-27,L2K2Z3,2,Anaesthetist,66000,Married,2,1697.4,2015-01-01
80051290,Mcdonald,Odom,Male,1998-09-21,K5X1O1,3,Speech therapist,73000,Married,0,590.4,2015-01-01
80051291,Harrington,Chapman,Male,1974-06-12,L5W5W5,3,Drug dealer,40000,Divorced,0,4460.8,2015-01-01
80051292,Sullivan,Salas,Male,1976-12-03,M5U8P5,2,Soldier,52000,Married,1,5338.2,2015-01-01
80051293,Torres,Moyer,Male,1998-10-10,L1J8B8,4,Scaffolder,59000,Single,0,1459.6,2015-01-01
80051294,Sellers,Burns,Female,1971-01-15,N7Z2T1,4,Disc jockey,78000,Single,0,3747.4,2015-01-01
80051295,Mcdowell,Quinn,Male,1980-03-18,E6H1F5,1,Driving instructor,25000,Single,0,4903.6,2015-01-01
80051296,Mccoy,Austin,Male,1987-05-18,K2G1Z6,4,Camera operator,73000,Single,0,3837.6,2015-01-01
80051297,Zhang,Foster,Male,1991-06-03,K3L6I2,1,Television presenter,100000,Married,0,2427.2,2015-01-01
80051298,Moses,Hancock,Female,1971-04-19,N3O3Z3,2,Data processor,103000,Single,0,590.4,2015-01-01
80051299,Alvarez,Woodard,Female,1974-06-21,M6W2F1,4,Tarot Reader,48000,Single,0,5986,2015-01-01
80051300,Mathews,Rivers,Male,1994-03-12,L3I3S2,2,Osteopath,52000,Married,2,5526.8,2015-01-01
80051301,Villarreal,Tapia,Female,1968-08-05,M7G8T7,4,Tailor,83000,Single,0,5863,2015-01-01
80051302,Benton,Norman,Male,1979-05-24,M7W3U3,4,Teaching assistant,40000,Single,0,1369.4,2015-01-01
80051303,Gross,Klein,Male,1978-03-09,L3X5G1,4,Clergyman,46000,Single,0,1763,2015-01-01
80051304,Marsh,Shaffer,Male,1994-06-28,L3D2U5,3,Interior designer,86000,Single,0,5887.6,2015-01-01
80051305,Hoover,Morgan,Female,1990-08-05,N4Q8C8,4,Car wash attendant,107000,Married,2,1033.2,2015-01-01
80051306,Contreras,Palmer,Male,1969-05-31,K7D2B3,3,Physiotherapist,102000,Divorced,3,606.8,2015-01-01
80051307,Moran,Frederick,Male,1980-06-26,K1E4D6,1,Bricklayer,84000,Married,2,4583.8,2015-01-01
80051A08,Valdez,Barnett,Male,1997-02-27,K1W7I8,3,Business owner,72000,Single,0,6445.2,2015-01-01
80051309,Choi,Miles,Female,1981-05-24,M5B5L5,2,Pop star,75000,Divorced,1,2533.8,2015-01-01
80051310,Cline,Vang,Male,1976-12-07,M7I5D5,1,Judge,70000,Single,0,2976.6,2015-01-01
80051311,Baird,Parsons,Female,1997-04-12,L3M7G5,2,Chef,70000,Single,0,2296,2015-01-01
80051312,Mcdaniel,Norton,Male,1987-04-04,M1G7J7,2,Photographer,51000,Single,0,3148.8,2015-01-01
80051313,Marquez,Stanton,Male,1978-04-18,L4A4G2,2,Insurance consultant,36000,Single,0,3632.6,2015-01-01
80051314,Vaughn,Meza,Male,1999-02-13,K5U6E5,2,Local govt worker,91000,Divorced,3,2525.6,2015-01-01
80051315,Cline,Melendez,Female,1975-07-26,N2D1T4,1,Fundraiser,89000,Married,0,4501.8,2015-01-01
80051316,Pierce,Zamora,Female,1976-02-23,N5J3F3,3,Picture framer,58000,Single,0,1344.8,2015-01-01
80051317,Sandoval,Mccarthy,Female,1968-08-15,M8T4C7,3,Grave digger,71000,Divorced,1,4165.6,2015-01-01
80051318,Stark,Perez,Male,1990-12-24,L3P1L3,1,Train driver,81000,Single,0,4780.6,2015-01-01
80051319,Goodman,Cannon,Female,1988-07-30,N8F5A2,4,Farmer,94000,Married,0,5822,2015-01-01
80051320,Mcpherson,Wilkerson,Female,1971-02-23,N6F1G3,3,Composer,68000,Divorced,3,1918.8,2015-01-01
80051321,Kemp,Hatfield,Female,1983-07-28,L8N8H1,4,Pickpocket,37000,Single,0,4009.8,2015-01-01
80051322,Morris,Benjamin,Male,1983-09-01,N8L6G8,4,Train driver,89000,Divorced,2,4616.6,2015-01-01
80051323,Abbott,Odonnell,Female,1984-03-31,M7U4H7,1,Career criminal,62000,Single,0,6289.4,2015-01-01
80051324,Woods,Mclean,Female,1981-09-12,N6H4Q1,1,Chiropractor,66000,Married,3,3591.6,2015-01-01
80051325,Ochoa,Byrd,Female,1968-07-30,L8Q6U1,1,Boat builder,62000,Married,1,4969.2,2015-01-01
80051326,Farmer,Figueroa,Male,1987-02-19,N4Q4I8,3,Editor,51000,Single,0,754.4,2015-01-01
80051327,Mcgrath,Palmer,Male,1978-09-05,M4K4Y2,3,Doctor,111000,Married,1,5108.6,2015-01-01
80051328,Allen,Klein,Male,1973-01-20,N2C2M4,3,Tour guide,60000,Married,0,5682.6,2015-01-01
80051329,Parker,White,Male,1972-01-30,L3V4Z2,2,Special constable,78000,Married,2,3936,2015-01-01
80051330,Roberts,Rowland,Male,1992-11-30,L5B1K2,1,Archaeologist,60000,Single,0,5280.8,2015-01-01
80051331,Wolf,Bridges,Female,1997-04-08,M6Q4F3,1,Lawyer,61000,Divorced,1,4018,2015-01-01
80051332,Blankenship,Mcdowell,Male,1991-08-03,K8Z7E5,2,Doorman,99000,Single,0,951.2,2015-01-01
80051333,York,Sanders,Male,1999-02-09,N5M8A6,2,Editor,46000,Divorced,2,1000.4,2015-01-01
80051334,Kerr,Burch,Female,1993-04-13,N7J2W4,3,Careers advisor,51000,Single,0,4887.2,2015-01-01
80051335,Calderon,Miles,Female,1974-12-19,K5O2O6,2,Literary agent,48000,Married,1,3042.2,2015-01-01
80051336,Kirby,Simpson,Female,2001-09-10,N7K5Q4,2,Waiting staff,93000,Divorced,2,2697.8,2015-01-01
80051337,Gill,Spencer,Female,1969-02-26,L6L6G7,1,Anaesthetist,64000,Divorced,3,2673.2,2015-01-01
80051338,Frost,Barker,Male,1990-05-03,K4K7D5,4,Housekeeper,-104000,Single,0,2738.8,2015-01-01
80051339,Cherry,Jefferson,Female,1996-09-23,L6H3C6,3,Art historian,82000,Married,0,6166.4,2015-01-01
80051340,Carr,Hunter,Female,1970-02-07,L6H1A5,4,Handyman,43000,Single,0,4747.8,2015-01-01
80051341,Mcmahon,Levine,Male,2002-02-08,N1K2I5,3,Camera operator,96000,Single,0,2181.2,2015-01-01
80051342,Chen,Chaney,Male,1974-01-05,M5C5I4,4,School meals supervisor,70000,Married,2,2476.4,2015-01-01
80051343,Solomon,Bell,Male,1995-05-20,L7O7W2,2,Meter reader,78000,Single,0,5305.4,2015-01-01
80051344,Wu,Briggs,Female,1997-12-13,N5F5L7,2,Bus driver,82000,Single,0,3542.4,2015-01-01
80051345,Meyer,Dillon,Female,1975-01-09,M3N3F6,3,Coastguard,102000,Married,2,967.6,2015-01-01
80051346,Wolf,Klein,Male,1999-03-12,N6X6Q3,4,Judge,104000,Divorced,1,3050.4,2015-01-01
80051347,Rogers,Howe,Female,1992-05-01,N6D2Y6,4,Telesales person,60000,Married,0,516.6,2015-01-01
80051348,Gay,Petty,Female,1997-12-29,K2P6J5,2,Marketing director,93000,Married,3,4641.2,2015-01-01
80051349,Bryan,Stark,Female,1994-04-30,K4M6X1,4,Lawyer,75000,Married,0,2943.8,2015-01-01
80051350,Sandoval,Gregory,Female,1975-11-11,M4M1S4,2,Waiting staff,34000,Married,0,2747,2015-01-01
80051351,Duffy,Watts,Female,1974-02-04,N8T4P7,3,Advertising executive,80000,Single,0,1139.8,2015-01-01
80051352,Barajas,Coffey,Female,1978-10-18,N5L5A2,3,Disc jockey,72000,Married,3,5797.4,2015-01-01
80051353,Bryan,Shaffer,Male,1983-02-09,M6N1H3,2,Student,37000,Married,2,3222.6,2015-01-01
80051354,Baldwin,Conner,Female,1968-04-26,L5Q6D8,4,Park ranger,111000,Single,0,5699,2015-01-01
80051355,Ayers,Dixon,Female,1989-10-27,K2U4E3,3,Diplomat,110000,Single,0,1082.4,2015-01-01
80051356,Mullen,Mullins,Male,1992-11-04,M8P5M7,3,Funeral director,83000,Married,2,2624,2015-01-01
80051357,Chen,Harmon,Female,1979-05-13,K8P1N8,3,Computer programmer,56000,Single,0,3312.8,2015-01-01
80051358,Rush,Reed,Female,1972-12-16,N4W6J4,3,Anthropologist,49000,Single,0,5904,2015-01-01
80051359,Joyce,Rowland,Female,1978-02-22,M3D7K6,1,Housekeeper,92000,Single,0,2435.4,2015-01-01
80051360,Reyes,Bell,Male,2000-06-29,L8I2Y8,3,Costume designer,44000,Divorced,0,3452.2,2015-01-01
80051361,Mann,Spencer,Male,1992-02-09,L5B3Y8,1,Author,38000,Single,0,4920,2015-01-01
80051362,Bradley,Kidd,Male,1993-11-16,N4B8L1,4,Carpet fitter,78000,Single,0,5723.6,2015-01-01
80051363,Mcclain,Osborne,Female,1971-08-12,M1U5P5,2,Legal secretary,68000,Single,0,4173.8,2015-01-01
80051364,Wolf,Wilkerson,Male,1978-09-26,M7Y7P4,1,Archaeologist,32000,Divorced,0,6281.2,2015-01-01
80051365,Hall,David,Female,1995-04-01,K6G4R8,2,Diplomat,49000,Married,2,4715,2015-01-01
80051366,Massey,Davidson,Male,2003-07-29,M1Z3Q3,3,Coastguard,62000,Married,1,3821.2,2015-01-01
80051367,Kelly,Massey,Female,1995-10-05,L7K3B3,2,Mortician,30000,Divorced,1,516.6,2015-01-01
80051368,Mckinney,Curry,Male,2001-11-05,N7Y1R3,1,Veterinary surgeon,42000,Single,0,5838.4,2015-01-01
80051369,Contreras,Bolton,Female,1988-04-17,L6Y1P6,3,Sculptor,63000,Single,0,4829.8,2015-01-01
80051370,Tucker,Robbins,Female,1995-09-30,L5K6X8,4,Croupier,40000,Married,0,5133.2,2015-01-01
80051371,Richmond,Whitaker,Male,1987-10-25,M7O8U6,4,Chiropractor,102000,Married,3,6141.8,2015-01-01
80051372,Baker,Oconnell,Female,1998-03-22,M3V2E1,2,Debt collector,105000,Married,3,4280.4,2015-01-01
80051373,Mcgee,Strickland,Female,1975-06-19,L6A8C8,2,Racing driver,32000,Married,3,2123.8,2015-01-01
80051374,Kaiser,Maynard,Female,1992-04-09,L2R2F1,1,Stockbroker,98000,Married,1,2763.4,2015-01-01
80051375,Weaver,Robles,Male,1978-06-06,N3I1X8,4,Barrister,69000,Single,0,918.4,2015-01-01
80051376,Kerr,Beasley,Male,2002-09-29,K8A6N2,4,Cabin crew,114000,Single,0,3583.4,2015-01-01
80051377,Sanchez,Lawrence,Female,1985-12-26,N4F7G2,2,Jewellery maker,68000,Married,2,4280.4,2015-01-01
80051378,Grimes,Hahn,Male,1988-06-22,L4L3R2,3,Prison officer,47000,Divorced,1,721.6,2015-01-01
80051379,Taylor,Ali,Female,2000-05-12,N6Z4K6,4,Software consultant,71000,Single,0,1722,2015-01-01
80051380,Campbell,Werner,Male,1977-05-12,M2M3W6,2,Private investigator,57000,Single,0,3263.6,2015-01-01
80051381,Zimmerman,Pacheco,Male,1997-07-16,K4S7B1,2,Footballer,68000,Married,2,5116.8,2015-01-01
80051382,Middleton,Powell,Female,1976-03-08,M1B4S3,2,Laboratory technician,58000,Single,0,1943.4,2015-01-01
80051383,Barnes,Shaffer,Male,1968-06-24,N5P8I5,1,Missionary,42000,Single,0,4575.6,2015-01-01
80051384,Anderson,Craig,Female,1983-06-02,L6V8V1,2,Interpreter,101000,Single,0,1394,2015-01-01
80051385,Patrick,Hammond,Male,1978-03-27,N2V6D4,4,Radio presenter,44000,Married,0,5707.2,2015-01-01
80051386,Evans,Morse,Female,2003-08-21,N1Q2B7,1,Crane driver,100000,Single,0,4928.2,2015-01-01
80051387,Collier,Weiss,Female,1982-08-10,L3W5X3,3,Accountant,50000,Single,0,4362.4,2015-01-01
80051388,Mendoza,Griffin,Male,1979-03-13,K1U5T5,2,Choreographer,38000,Married,2,3690,2015-01-01
80051389,Franco,Baird,Male,2003-02-17,L6T2T4,2,Car dealer,35000,Married,1,1615.4,2015-01-01
80051390,Mccarthy,Goodman,Female,1972-12-04,L1L4U6,1,Magistrate,53000,Married,2,5338.2,2015-01-01
80051391,Pratt,Hodge,Female,1999-07-17,N6O8I7,1,Inventor,43000,Single,0,4018,2015-01-01
80051392,Mcgrath,Clements,Female,1974-12-24,M5Y6B3,3,Bailiff,61000,Married,3,5920.4,2015-01-01
80051393,Kaiser,Russell,Male,1975-12-22,L2J5H3,3,Factory worker,69000,Single,0,3009.4,2015-01-01
80051394,Blevins,Potter,Male,1981-10-29,N5B6K8,1,Mathematician,99000,Married,1,984,2015-01-01
80051395,Howell,Taylor,Male,1998-12-18,L5I4L7,1,Beauty therapist,47000,Single,0,1828.6,2015-01-01
80051396,Boyer,Webb,Female,1991-04-28,M8Q3F3,2,Dentist,74000,Married,1,2656.8,2015-01-01
80051397,Griffin,Fischer,Male,2002-03-16,N2F8O6,4,Lap dancer,50000,Married,3,2640.4,2015-01-01
80051398,Hobbs,Burns,Female,1981-06-22,M4D8L8,3,Sailor,108000,Married,1,4132.8,2015-01-01
80051399,Jacobs,Foster,Male,1970-08-05,N6E7G5,2,Roofer,88000,Single,0,926.6,2015-01-01
80051400,Watts,Fitzpatrick,Male,1994-11-04,M5S4Y1,2,Groom,50000,Married,0,4739.6,2015-01-01
80051401,Collins,Walker,Female,1976-07-26,M6P8I5,3,Inventor,70000,Married,3,1057.8,2015-01-01
80051402,Fernandez,Santos,Male,1974-04-24,L6L8J1,1,Chemist,65000,Married,2,3247.2,2015-01-01
80051403,Bishop,Erickson,Female,1988-07-13,N7V5S4,4,Accountant,45000,Married,0,1262.8,2015-01-01
80051404,Ryan,Patrick,Male,1986-04-04,N4H2K8,1,Care assistant,96000,Single,0,1771.2,2015-01-01
80051405,Berry,Meyer,Male,1970-10-22,N1U5N8,1,Laboratory technician,65000,Single,0,4239.4,2015-01-01
80051406,Nunez,Page,Male,1992-02-03,K6B4Z5,3,Pickpocket,97000,Single,0,1385.8,2015-01-01
80051407,Stout,Pennington,Female,1968-12-16,M3O4Y5,4,Horticulturalist,81000,Divorced,1,2804.4,2015-01-01
80051408,Anthony,Carr,Male,1968-06-07,K3E4E7,2,Film director,53000,Married,1,4206.6,2015-01-01
80051409,Camacho,Walker,Male,1978-09-05,L2U3F7,2,Actor,103000,Single,0,3903.2,2015-01-01
80051410,Mccann,Holder,Male,1990-07-10,L6Q4H8,2,Business consultant,72000,Single,0,1640,2015-01-01
80051411,Munoz,Zhang,Male,1975-02-16,M5G1Y3,3,Travel agent,101000,Married,1,1590.8,2015-01-01
80051412,Frye,Forbes,Male,1997-04-08,K7N3J5,4,Lecturer,101000,Married,1,1320.2,2015-01-01
80051413,Perkins,Lester,Female,1997-11-19,L6W8V7,4,Bank manager,82000,Single,0,2681.4,2015-01-01
80051414,Gutierrez,Pineda,Female,1969-02-10,L4O2W6,4,Historian,111000,Divorced,1,2624,2015-01-01
80051415,Lozano,Stafford,Female,2001-07-11,K2L7A2,2,Lap dancer,66000,Single,0,647.8,2015-01-01
80051416,Jordan,Gates,Male,1974-02-20,K7B2Z3,4,Chimney sweep,96000,Married,1,943,2015-01-01
80051417,Howard,Duncan,Male,1983-05-15,K3L7J1,4,Butler,74000,Single,0,2583,2015-01-01
80051418,Mccarty,Brown,Male,1990-05-03,N7R6F4,1,Composer,91000,Divorced,0,2378,2015-01-01
80051419,Frye,Wilson,Male,1976-09-04,M6I1G3,3,Coroner,41000,Single,0,6125.4,2015-01-01
80051420,Morse,Schneider,Male,1998-04-24,L8C5L3,3,Business owner,96000,Married,3,3107.8,2015-01-01
80051421,Wade,Branch,Female,1992-09-13,L1K3Q8,3,Park ranger,71000,Single,0,1894.2,2015-01-01
80051422,Villarreal,Warner,Male,1968-09-11,L3F7I2,4,Toilet attendant,50000,Single,0,500.2,2015-01-01
80051423,Deleon,Duke,Female,2001-03-04,N3R3G1,1,Camera operator,94000,Married,2,1935.2,2015-01-01
80051424,Johnston,Wolf,Female,1994-01-07,M3A4F6,3,Computer programmer,35000,Married,3,1672.8,2015-01-01
80051425,Gay,Reilly,Female,1968-11-11,K5V2D6,1,Tattooist,64000,Single,0,656,2015-01-01
80051426,Mathews,Andrade,Male,1975-06-10,K8P6Z5,2,Party planner,50000,Divorced,2,3427.6,2015-01-01
80051427,Mckenzie,Cherry,Female,1997-05-01,N6I6U3,4,Merchant navy personnel,45000,Divorced,0,3755.6,2015-01-01
80051428,Mcdaniel,Rhodes,Female,1992-12-02,N5D2W3,4,Oil rig crew,59000,Married,1,3140.6,2015-01-01
80051429,Murray,Fuller,Male,1972-07-10,L2F6Z8,1,Pop star,66000,Single,0,1271,2015-01-01
80051430,Herman,Mccarty,Male,1971-06-28,K7A5F2,2,Preacher,77000,Married,3,5305.4,2015-01-01
80051431,Garrett,Miranda,Male,1975-03-11,M4Z2V6,2,Blacksmith,92000,Single,0,729.8,2015-01-01
80051432,Ayala,Chan,Female,1971-11-25,K3L6Y8,1,Barber,97000,Single,0,4510,2015-01-01
80051433,Hall,Rivers,Female,1991-05-14,M2A7Q6,2,Gas fitter,94000,Single,0,5453,2015-01-01
80051434,Glass,Estes,Female,1978-08-29,K6Y8O1,2,Sportsperson,64000,Divorced,1,2763.4,2015-01-01
80051435,Mcguire,Daniels,Female,1995-03-08,L8R1E8,4,Legal secretary,66000,Married,2,3091.4,2015-01-01
80051436,Knox,Pace,Female,1986-01-04,K3E8H2,3,Veterinary surgeon,89000,Single,0,738,2015-01-01
80051437,Dawson,Hoover,Male,1993-05-18,L8S2U1,1,Insurance consultant,84000,Married,3,4756,2015-01-01
80051438,Stanley,Wilkins,Female,1996-09-11,K3Q6S6,4,Bar staff,40000,Divorced,3,4378.8,2015-01-01
80051439,Pacheco,Murillo,Male,1985-09-19,L7N1O1,2,Pest controller,37000,Married,1,4993.8,2015-01-01
80051440,Barajas,Benitez,Male,1991-01-18,L6C8F2,2,Farmer,84000,Married,0,606.8,2015-01-01
80051441,Munoz,Petersen,Male,1995-12-15,K6N3D2,4,Sportsperson,76000,Married,0,3386.6,2015-01-01
80051442,Chan,Kane,Female,1987-10-15,K3E6N8,3,Garden designer,105000,Married,3,6412.4,2015-01-01
80051443,Boyer,Richard,Female,1971-06-07,K2E7Z8,3,Magistrate,34000,Divorced,1,4009.8,2015-01-01
80051444,Hanson,Keller,Male,1969-03-31,L4M5V6,3,Student,52000,Single,0,1435,2015-01-01
80051445,Parks,Carpenter,Female,1998-09-12,K2T8S8,3,Cleric,79000,Married,2,5740,2015-01-01
80051446,Lyons,Weber,Male,1981-07-29,L3U4S2,2,Publisher,58000,Married,1,6256.6,2015-01-01
80051447,Navarro,Stevens,Female,2001-10-28,L2Q1S6,2,Chimney sweep,48000,Married,1,4788.8,2015-01-01
80051448,Osborn,Cox,Female,1971-02-09,L7C3Z2,4,Dancer,75000,Single,0,959.4,2015-01-01
80051449,Dorsey,Cooke,Female,1973-04-06,YYYYYY,3,Prison officer,56000,Married,3,5075.8,2015-01-01
80051450,Thomas,Rasmussen,Male,1979-02-15,K4V6G8,1,Tarot Reader,45000,Divorced,3,3698.2,2015-01-01
80051451,Shepard,Olson,Male,1985-10-17,L7K4M2,1,Mathematician,87000,Single,0,5444.8,2015-01-01
80051452,Valencia,Hudson,Female,1984-01-20,M3E1U8,2,Security guard,60000,Single,0,721.6,2015-01-01
80051453,Herrera,Fowler,Female,1996-10-31,N5J4O8,2,Dentist,37000,Single,0,5723.6,2015-01-01
80051454,Ayala,Mccoy,Male,1977-11-05,N5D6U7,2,Cabin crew,55000,Single,0,5658,2015-01-01
80051455,Kerr,Ho,Male,1969-02-17,M3N3Z3,3,Craftsperson,35000,Married,1,3075,2015-01-01
80051456,Mata,Oneal,Female,1997-12-28,M8Z7D2,3,Herbalist,105000,Married,0,3886.8,2015-01-01
80051457,Morse,Castaneda,Female,1970-12-01,M6B3P1,1,Archaeologist,87000,Single,0,3050.4,2015-01-01
80051458,Hobbs,Sullivan,Male,1971-11-27,L7C4R6,1,Career criminal,46000,Single,0,3698.2,2015-01-01
80051459,Vance,Stanton,Female,1997-07-12,M1X2F6,2,Pharmacist,72000,Married,3,2837.2,2015-01-01
80051460,Hester,Pineda,Male,1984-12-11,M4F6T2,4,Director,86000,Divorced,0,2492.8,2015-01-01
80051461,Figueroa,York,Male,1986-08-23,K4Y8C3,1,Machinist,91000,Single,0,5641.6,2015-01-01
80051462,Moyer,Newman,Male,1977-11-27,K6K1J5,3,Artist,67000,Single,0,2304.2,2015-01-01
80051463,Collins,Galvan,Male,1973-03-29,L6N5S8,2,Preacher,74000,Single,0,2771.6,2015-01-01
80051464,Aguirre,Kaufman,Female,1997-10-06,M2U6B3,4,Clerical assistant,46000,Married,3,1115.2,2015-01-01
80051465,Bird,Morse,Female,1982-12-06,K6O5Z6,3,Circus worker,62000,Married,1,6174.6,2015-01-01
80051466,Hickman,Mckee,Male,1985-08-14,M2U5X8,2,Bank clerk,78000,Single,0,5567.8,2015-01-01
80051467,Arellano,Daniel,Female,1975-08-15,L8O6J4,1,Director,29000,Divorced,0,3542.4,2015-01-01
80051468,Horn,Tran,Female,1979-04-03,L4G1R5,3,Psychiatrist,34000,Single,0,1369.4,2015-01-01
80051469,Hendricks,Waters,Female,1982-05-31,L1T7Y5,2,Moneylender,50000,Married,0,918.4,2015-01-01
80051470,Dickerson,Werner,Female,1986-05-06,K6N6G1,1,Paramedic,89000,Married,1,3821.2,2015-01-01
80051471,Harris,Cisneros,Male,1985-08-09,N2V2M8,2,Clairvoyant,66000,Married,3,1221.8,2015-01-01
80051472,Donaldson,Robbins,Female,1984-09-14,K1K5V3,2,Model,75000,Married,1,4018,2015-01-01
80051473,Ponce,Acevedo,Female,1999-03-06,N6Q8L2,1,Cartoonist,32000,Divorced,3,738,2015-01-01
80051474,Richardson,Lamb,Male,2002-04-28,N5W4P5,2,Radio presenter,100000,Married,3,3157,2015-01-01
80051475,Holder,Wilkins,Male,1968-10-08,M7G2J4,1,School crossing warden,67000,Divorced,3,738,2015-01-01
80051476,Pratt,Saunders,Female,1991-03-11,L2R8P6,3,Home-worker,88000,Divorced,2,1959.8,2015-01-01
80051477,Mcclain,Leonard,Male,1974-08-10,K8M3S7,3,Minister,64000,Single,0,3091.4,2015-01-01
80051478,Orr,Jordan,Male,2001-03-28,N6J8M4,3,Artist,107000,Single,0,6445.2,2015-01-01
80051479,Gibson,Johns,Female,1985-06-28,M2S1I2,1,Designer,101000,Married,3,2148.4,2015-01-01
80051480,Prince,Woods,Male,1981-03-26,N4F1R5,1,Fork-lift driver,100000,Single,0,3517.8,2015-01-01
80051481,Watkins,Reed,Male,2001-11-15,L2H6Y4,4,Meter reader,44000,Single,0,2287.8,2015-01-01
80051482,Patterson,Gray,Female,1976-06-01,L3L5U4,3,Grave digger,61000,Divorced,0,5420.2,2015-01-01
80051483,Briggs,Holden,Female,1980-01-23,L7K6Y1,1,Professor,58000,Married,1,5330,2015-01-01
80051484,Sawyer,Lawson,Female,1984-03-05,M2M2U1,3,Racing driver,99000,Single,0,3936,2015-01-01
80051485,Porter,Bryan,Female,1969-01-18,M7Z4T8,4,Psychiatrist,108000,Married,1,688.8,2015-01-01
80051486,Bean,Melton,Male,1996-07-05,L5F1N1,4,Travel agent,97000,Single,0,1623.6,2015-01-01
80051487,Gilbert,Charles,Female,1975-11-07,K2H2T4,3,Clerical assistant,98000,Married,1,2197.6,2015-01-01
80051488,Blackburn,Lee,Male,1977-07-11,L2H4H7,3,Judge,99000,Married,1,4173.8,2015-01-01
80051489,Higgins,Erickson,Female,1982-12-28,N2P3K3,4,Catering staff,58000,Single,0,2927.4,2015-01-01
80051490,Cummings,Ritter,Male,1998-01-25,K7A6U5,1,Plasterer,55000,Married,1,1853.2,2015-01-01
80051491,Collins,Massey,Female,1990-03-29,K5E8F3,3,Pest controller,60000,Married,1,3091.4,2015-01-01
80051492,Horne,Roman,Male,1978-01-14,L4E5K6,3,Locksmith,78000,Single,0,1082.4,2015-01-01
80051493,Salas,Delgado,Male,1968-04-28,M3M7J7,2,Landscape gardener,62000,Married,0,5969.6,2015-01-01
80051494,Roth,Dougherty,Female,1987-01-31,L6S7B7,1,Animal breeder,90000,Married,2,4075.4,2015-01-01
80051495,Lowery,Olsen,Female,1984-07-09,K6X6T1,1,Jewellery maker,53000,Married,3,852.8,2015-01-01
80051496,Rhodes,Robertson,Female,1975-05-21,K7J6N2,3,Retired,90000,Single,0,2861.8,2015-01-01
80051497,Lozano,Cobb,Male,1996-08-11,M7E6V2,2,Catering staff,62000,Married,2,697,2015-01-01
80051498,Maynard,Barber,Female,1983-12-18,M4A5M5,3,Childcare worker,102000,Single,0,1271,2015-01-01
80051499,Willis,Olson,Male,1972-11-04,M2J7M6,4,Refuse collector,104000,Divorced,3,5346.4,2015-01-01
80051500,Best,Bruce,Male,1978-08-09,M6Y3F5,2,Civil servant,49000,Single,0,6240.2,2015-01-01
80051501,Vaughn,Bates,Male,1981-04-21,M2H1H8,1,Meteorologist,25000,Divorced,1,1656.4,2015-01-01
80051502,Rush,Zamora,Female,1984-10-31,K3L3L8,3,Film director,50000,Divorced,2,2648.6,2015-01-01
80051503,Salinas,Madden,Female,1988-03-20,K6U3C4,1,Crematorium worker,35000,Single,0,5084,2015-01-01
80051504,Brock,Oneal,Male,1993-12-09,L7V2A4,3,Farm worker,70000,Single,0,2706,2015-01-01
80051505,Haley,Mooney,Female,1987-01-12,K5P7Y4,4,Porter,50000,Married,2,3255.4,2015-01-01
80051506,Mendez,Townsend,Male,1983-11-21,N3M4I6,1,Anthropologist,39000,Married,0,4009.8,2015-01-01
80051507,Esparza,Scott,Male,1972-07-25,K2T4L8,2,Career criminal,100000,Married,3,3616.2,2015-01-01
80051508,Cohen,Jenkins,Male,1989-05-28,M1P6F7,3,Fisherman/woman,52000,Divorced,1,3722.8,2015-01-01
80051509,Watkins,Clay,Male,1979-03-12,L4Q3U8,3,Casual worker,35000,Married,1,3772,2015-01-01
80051510,Ochoa,Berger,Male,1985-12-13,L1E2X8,4,Telesales person,60000,Divorced,1,4870.8,2015-01-01
80051511,Gould,Wagner,Male,1969-01-23,K1H1S7,2,IT consultant,53000,Married,3,2435.4,2015-01-01
80051512,Glover,Middleton,Unknown,1973-04-12,K8Q4H2,4,Tax inspector,106000,Married,0,1976.2,2015-01-01
80051513,Pollard,Mcconnell,Female,1994-08-14,K6D6Y3,3,Factory worker,110000,Divorced,0,6445.2,2015-01-01
80051514,Rojas,Rubio,Female,1994-03-30,L7U4C5,4,Landscape gardener,92000,Divorced,3,6158.2,2015-01-01
80051515,Clements,Ellis,Female,1979-05-11,M2I5J4,1,Software consultant,49000,Divorced,2,5731.8,2015-01-01
80051516,Church,Wells,Female,1989-06-15,L4C1A3,1,Pharmacist,39000,Divorced,3,3403,2015-01-01
80051517,Jefferson,Horne,Female,1977-01-06,N5X3C6,3,Brewer,75000,Divorced,3,3747.4,2015-01-01
80051518,Armstrong,Glass,Female,1999-10-20,K3H4K7,1,Racing driver,85000,Single,0,1385.8,2015-01-01
80051519,Mays,Leach,Female,1996-04-20,K2F7F3,1,Tattooist,82000,Divorced,3,5838.4,2015-01-01
80051520,Castaneda,Peterson,Female,2001-10-12,L4F1G6,2,Decorator,95000,Married,0,3673.6,2015-01-01
80051521,Edwards,Harvey,Male,1983-07-22,M6C3R5,2,Doctor,88000,Single,0,2443.6,2015-01-01
80051522,Rubio,Morrow,Female,1991-11-02,M3Y7L6,1,Bar staff,82000,Married,0,869.2,2015-01-01
80051523,Mccann,Montes,Female,1998-05-01,L3F4I7,3,Magician,94000,Single,0,2607.6,2015-01-01
80051524,Sutton,Murillo,Male,1994-10-19,L5R3P2,1,Software consultant,97000,Married,2,2952,2015-01-01
80051525,Simpson,Johns,Female,1974-10-25,M5W2B2,3,Art dealer,49000,Married,1,5067.6,2015-01-01
80051526,Carson,Lowe,Female,1981-12-27,L8S1F3,4,Speech therapist,115000,Divorced,1,598.6,2015-01-01
80051527,Dalton,Buckley,Male,1980-05-08,L1O1V5,3,Private investigator,81000,Single,0,5625.2,2015-01-01
80051528,Dyer,Solomon,Female,1991-03-09,N8E7L1,2,Astrologer,60000,Married,0,672.4,2015-01-01
80051529,Spencer,Norris,Male,1998-09-23,N4Z5N4,2,Crematorium worker,56000,Single,0,6223.8,2015-01-01
80051530,Durham,Santiago,Female,1990-02-28,K7G2M5,1,Art historian,28000,Married,0,2812.6,2015-01-01
80051531,Castaneda,Harrison,Female,1969-06-15,L2X2E5,2,Builder,69000,Divorced,2,3624.4,2015-01-01
80051532,Forbes,Chaney,Male,1976-02-10,L7B7U8,3,Market trader,61000,Single,0,2205.8,2015-01-01
80051533,Jacobs,Li,Female,1971-02-17,L4C1A7,3,Journalist,36000,Married,2,5986,2015-01-01
80051534,Villegas,Hogan,Female,1969-03-25,K6H5P5,2,Care assistant,60000,Single,0,5789.2,2015-01-01
80051535,James,Bryant,Male,1994-08-14,M8T4C7,3,Computer analyst,62000,Married,0,861,2015-01-01
80051536,Conner,Clements,Female,1972-10-26,L1G4Z4,2,Judge,68000,Married,1,3944.2,2015-01-01
80051537,Villegas,Brandt,Female,1993-01-05,L5Y1A2,1,Crematorium worker,84000,Divorced,1,787.2,2015-01-01
80051538,Nichols,Walls,Female,1986-03-07,L6H1T3,3,Coroner,38000,Married,3,5518.6,2015-01-01
80051539,Dyer,Pratt,Female,1981-02-25,L1R1C2,2,Surveyor,88000,Married,2,2665,2015-01-01
80051540,Khan,Bentley,Male,1979-05-10,L3B8T3,2,Publisher,72000,Single,0,4649.4,2015-01-01
80051541,Harrell,Moyer,Female,1998-08-19,L7Z2H2,4,Bus driver,77000,Married,1,4411.6,2015-01-01
80051542,Bautista,Glover,Male,1973-11-11,K1C2M6,4,Cleaner,70000,Single,0,1197.2,2015-01-01
80051543,Chandler,Conway,Male,1989-06-21,L4X6P1,1,Health visitor,57000,Single,0,2132,2015-01-01
80051544,Payne,Osborn,Male,1999-09-03,L5N8Z3,2,School meals supervisor,93000,Single,0,2123.8,2015-01-01
80051545,Beck,Farley,Male,1998-01-19,N6D6B6,4,Dentist,64000,Divorced,1,2574.8,2015-01-01
80051546,Lindsey,Moreno,Male,1985-12-22,K6X3A6,3,Salesperson,68000,Married,3,6043.4,2015-01-01
80051547,Jensen,Bradley,Male,1971-12-01,N7F4P4,1,Homemaker,80000,Divorced,1,1927,2015-01-01
80051548,Lamb,Callahan,Male,1986-06-26,K6S5O7,1,Circus worker,37000,Married,2,3165.2,2015-01-01
80051549,Marks,Bishop,Male,1972-09-19,M5S6E3,3,Retired,109000,Divorced,3,2935.6,2015-01-01
80051550,Steele,Tyler,Female,1996-10-14,M2T3V4,2,Lifeguard,50000,Married,0,4583.8,2015-01-01
80051551,Randolph,Schultz,Male,1990-03-28,K6O8L2,1,Dietician,89000,Single,0,3714.6,2015-01-01
80051552,Suarez,Ray,Female,1981-07-20,K5G3T1,1,Carpet fitter,69000,Married,0,6002.4,2015-01-01
80051553,Burch,Mccormick,Female,1990-07-02,N2J8O3,4,Carpenter,37000,Single,0,2394.4,2015-01-01
80051554,Woodward,Myers,Male,1987-02-03,M1O3B6,4,Soldier,39000,Single,0,3927.8,2015-01-01
80051555,Mendez,House,Female,1975-10-18,M2P1H3,3,Managing director,90000,Married,2,2935.6,2015-01-01
80051556,Collins,Durham,Male,1980-01-16,K6Z7B7,2,Business owner,81000,Married,1,5772.8,2015-01-01
80051557,Maddox,Gilmore,Female,1991-09-24,K2L2I6,2,Bar staff,39000,Single,0,3058.6,2015-01-01
80051558,Acevedo,Herrera,Female,1989-10-31,L4D8M7,3,Editor,98000,Single,0,6494.4,2015-01-01
80051559,Rios,Black,Female,1979-10-10,M7X8Y2,2,Plumber,98000,Married,0,4698.6,2015-01-01
80051560,Carson,Archer,Female,1992-10-07,L5P3D3,1,Surveyor,27000,Divorced,1,2845.4,2015-01-01
80051561,Cruz,Jenkins,Female,1999-05-14,K3C2N6,2,Engineer,76000,Single,0,5485.8,2015-01-01
80051562,Callahan,Wilkins,Male,1988-06-05,K5Y8D4,4,Bookmaker,65000,Single,0,1467.8,2015-01-01
80051563,Young,Mercer,Male,1974-01-09,L6X8M3,1,Gas fitter,66000,Married,0,6478,2015-01-01
80051564,Kirby,Archer,Female,1980-04-27,K8X6L7,1,Driving instructor,62000,Married,2,4050.8,2015-01-01
80051565,Sandoval,Guerrero, ,12093-08-03,K1G5C8,4,Local govt worker,59000,Single,0,5510.4,2015-01-01
80051566,Cochran,Mahoney,Male,1999-12-19,M7B3E3,3,Croupier,56000,Married,1,3649,2015-01-01
80051567,Fuller,Marks,Female,1974-04-10,N2F4O5,2,Local govt worker,47000,Married,0,2033.6,2015-01-01
80051568,Joseph,Whitney,Female,1982-04-05,N3W6T6,3,Data processor,44000,Married,0,3444,2015-01-01
80051569,Crawford,Fitzpatrick,Male,1968-12-11,N5V4N6,4,Financial advisor,48000,Single,0,1312,2015-01-01
80051570,Stewart,Houston,Male,2002-12-29,M6R1K4,1,Decorator,39000,Single,0,1287.4,2015-01-01
80051571,Singh,Andrade,Female,2003-07-19,K7M3R6,1,Crown prosecutor,54000,Married,3,4190.2,2015-01-01
80051572,Phillips,Wilson,Male,1989-05-27,K4O1Z4,1,Engineer,84000,Single,0,5018.4,2015-01-01
80051573,Mills,Bonilla,Male,1978-12-28,K6I3K5,4,Moneylender,62000,Single,0,1877.8,2015-01-01
80051574,Shepherd,Barron,Female,1998-08-16,N2P2G7,4,Hypnotherapist,73000,Single,0,3763.8,2015-01-01
80051575,Mckinney,Velez,Female,1982-12-06,N6X6Q3,4,Comedian,109000,Single,0,4821.6,2015-01-01
80051576,Harris,Hoover,Male,1998-08-22,K3P7G8,1,Machinist,64000,Married,3,2747,2015-01-01
80051577,Norris,Cortez,Female,1998-03-24,L8L8D4,4,Photographer,110000,Married,1,5854.8,2015-01-01
80051578,Lane,Norton,Female,1979-05-22,N7B6X1,4,Blacksmith,62000,Single,0,6166.4,2015-01-01
80051579,Lin,Suarez,Male,1992-03-05,L7P8G6,4,Diver,104000,Single,0,6371.4,2015-01-01
80051580,Yang,Perez,Male,1970-01-04,N4A8Y2,4,Taxi driver,79000,Divorced,0,2443.6,2015-01-01
80051581,Whitaker,Randall,Male,1987-10-13,L8U5W1,4,Optician,66000,Single,0,3870.4,2015-01-01
80051582,Riggs,Mendez,Female,1984-12-26,N1H3M4,3,Song writer,34000,Married,0,2164.8,2015-01-01
80051583,Mccormick,Snyder,Female,1997-12-19,K8O1Y3,3,Chiropractor,103000,Divorced,2,4288.6,2015-01-01
80051584,Rodgers,Guerra,Female,1995-05-25,N8A3L5,3,Childminder,108000,Divorced,1,3624.4,2015-01-01
80051585,Ward,Kidd,Female,1973-01-17,L1L8D6,4,Politician,75000,Married,3,3698.2,2015-01-01
80051586,Bailey,Schultz,Male,1974-02-08,L5H7S5,2,Nun,40000,Married,1,5690.8,2015-01-01
80051587,Nielsen,Schwartz,Female,1971-10-19,L3T4K1,2,Cleaner,36000,Divorced,1,2337,2015-01-01
80051588,Ho,Holland,Male,1968-08-19,L1N3R5,1,Cabinet maker,35000,Married,2,3198,2015-01-01
80051589,Dyer,Soto,Male,1996-05-10,M4N7W6,3,Plumber,108000,Married,0,4936.4,2015-01-01
80051590,Moses,Simmons,Female,2001-02-17,M4Z6G8,1,Road sweeper,61000,Single,0,4633,2015-01-01
80051591,Lara,Kaiser,Male,2002-04-09,N7X8R3,4,Undertaker,79000,Married,2,3452.2,2015-01-01
80051592,Fowler,Madden,Female,2000-05-16,M7F6H5,1,Social worker,83000,Divorced,3,1599,2015-01-01
80051593,Summers,Mccoy,Female,1993-11-14,M5J2O5,2,Singer,38000,Divorced,0,2566.6,2015-01-01
80051594,Francis,Abbott,Female,1987-02-06,L7K6X3,2,Anaesthetist,76000,Single,0,2345.2,2015-01-01
80051595,Woods,Thomas,Male,1997-12-18,K6T4D1,3,Tax inspector,78000,Divorced,2,828.2,2015-01-01
80051596,Cherry,Rasmussen,Female,1988-02-15,N1X8Y2,2,Cashier,50000,Divorced,2,5420.2,2015-01-01
80051597,Mcmahon,Freeman,Male,1977-02-14,K8H5O6,2,Curator,37000,Single,0,2181.2,2015-01-01
80051598,Acevedo,Dillon,Male,1978-06-19,N2R2F8,2,Homeopath,62000,Married,2,5543.2,2015-01-01
80051599,Sanchez,Nicholson,Male,2002-10-12,L3F2B3,4,Carpenter,93000,Married,3,1623.6,2015-01-01
80051600,Hudson,Mckay,Female,1974-04-21,M4W8E5,4,Make-up artist,79000,Single,0,5838.4,2015-01-01
80051601,Warner,Barnes,Male,1990-11-24,M3A6D3,3,Air traffic controller,87000,Married,3,3411.2,2015-01-01
80051602,Martin,Parrish,Female,1993-09-04,N3O8B4,4,Business consultant,58000,Married,1,2517.4,2015-01-01
80051603,Bryant,Drake,Male,1983-03-29,M8Q5Z4,1,Massage therapist,40000,Married,2,3271.8,2015-01-01
80051604,Frye,Bishop,Female,1998-08-15,N3T8C2,1,Book-keeper,68000,Married,1,6371.4,2015-01-01
80051605,Gibbs,Salas,Female,1983-04-05,L8Y3U1,1,Garden designer,82000,Married,1,2845.4,2015-01-01
80051606,Berger,Beck,Male,1970-05-05,L6O1D2,4,Bodyguard,38000,Married,1,4944.6,2015-01-01
80051607,Murray,Morales,Male,1796-03-05,M6J2I5,3,Nun,78000,Single,0,3755.6,2015-01-01
80051608,Shaffer,Short,Female,1993-06-20,M5X4O5,1,Politician,86000,Married,1,2673.2,2015-01-01
80051609,Donaldson,Olsen,Female,1989-02-25,N6Z3M5,3,Solicitor,35000,Married,0,2853.6,2015-01-01
80051610,Watson,Hatfield,Male,1992-06-30,L6T8F1,4,Car dealer,78000,Single,0,4993.8,2015-01-01
80051611,Alvarado,Moses,Male,1982-12-07,M1P2P3,1,Meter reader,37000,Married,0,2968.4,2015-01-01
80051612,Acevedo,Odonnell,Male,1979-12-06,K4J7X2,3,Childcare worker,101000,Single,0,4042.6,2015-01-01
80051613,Lindsey,Bell,Male,1982-10-18,K3F6U5,2,Undertaker,30000,Divorced,3,2296,2015-01-01
80051614,King,Farmer,Male,1997-04-07,N7P1B4,4,Optician,83000,Single,0,4157.4,2015-01-01
80051615,Gordon,Mckee,Male,1987-03-09,L1Q6I4,4,Au pair,104000,Married,2,2058.2,2015-01-01
80051616,Steele,Hill,Female,1974-11-07,M2L1R4,3,Casual worker,42000,Single,0,6428.8,2015-01-01
80051617,Dean,Holt,Female,1986-01-28,M2B2L3,3,Journalist,70000,Single,0,5625.2,2015-01-01
80051618,Meyer,Wilson,Female,1998-04-19,K1J7Q5,3,Surgeon,98000,Single,0,5043,2015-01-01
80051619,Giles,Zamora,Male,1987-09-18,L2A2F4,2,Tailor,47000,Divorced,2,4231.2,2015-01-01
80051620,Frye,Walls,Male,1982-05-20,M6F5V7,1,Horticulturalist,48000,Single,0,5297.2,2015-01-01
80051621,Dyer,Todd,Female,1993-04-25,M4U1G5,2,Locksmith,40000,Single,0,2501,2015-01-01
80051622,Cook,Marquez,Female,1997-10-04,N1L5A5,2,Anaesthetist,54000,Married,1,5092.2,2015-01-01
80051623,Logan,Stevens,Female,1969-05-15,K5N2F2,2,Chef,81000,Single,0,2943.8,2015-01-01
80051624,Carey,Fisher,Male,1978-10-09,N5W6G2,2,Plasterer,43000,Single,0,3124.2,2015-01-01
80051625,Burgess,Stephenson,Male,1982-11-23,M7G2O4,1,Lighthouse keeper,74000,NA,0,5912.2,2015-01-01
80051626,Berg,Watson,Male,1973-01-23,L4R3Z8,3,Handyman,50000,Married,1,2788,2015-01-01
80051627,Odonnell,Garrison,Male,1988-10-22,L7J3U2,3,Receptionist,43000,Single,0,1180.8,2015-01-01
80051628,Lambert,Huber,Male,1974-04-04,L1K7B6,1,Gardener,93000,Married,1,3025.8,2015-01-01
80051629,Owens,Aguirre,Male,1974-09-06,K6C3N8,4,Doorman,115000,Single,0,770.8,2015-01-01
80051630,Rogers,Simpson,Female,1969-11-27,N8L3N5,1,Debt collector,66000,Married,3,5289,2015-01-01
80051631,Cohen,Macdonald,Male,1996-02-19,L5P5U1,2,Engineer,31000,Divorced,2,2697.8,2015-01-01
80051632,Molina,Bernard,Male,1989-08-07,N7H8B7,1,Market trader,58000,Married,0,4387,2015-01-01
80051633,Parsons,Giles,Male,1978-04-07,L7V3P1,4,Dental hygienist,79000,Married,3,3780.2,2015-01-01
80051634,Greer,Booker,Female,1983-05-19,M3A1K4,4,Assembly line worker,53000,Single,0,1869.6,2015-01-01
80051635,Snyder,Liu,Male,1982-11-26,K7B7H1,4,Veterinary surgeon,81000,Divorced,3,5936.8,2015-01-01
80051636,Durham,Munoz,Female,1998-12-18,K2P4S6,2,Property developer,45000,Single,0,3263.6,2015-01-01
80051637,Kane,Cochran,Male,1999-12-05,L5L4D8,2,Childminder,85000,Single,0,2271.4,2015-01-01
80051638,Stephens,Silva,Female,1991-03-20,N4W2L7,1,Massage therapist,24000,Divorced,1,4477.2,2015-01-01
80051639,Barnes,Becker,Female,2001-01-02,N1H2O5,3,Fashion designer,101000,Single,0,5125,2015-01-01
80051640,Stevenson,Parsons,Male,2000-08-09,M6X3P6,4,Pest controller,104000,Single,0,4050.8,2015-01-01
80051641,Ryan,Hancock,Female,1988-03-06,L5E2L1,2,Computer analyst,83000,Married,2,2427.2,2015-01-01
80051642,Clarke,Cohen,Male,1979-04-24,K2G8B6,1,Dancer,92000,Married,2,1361.2,2015-01-01
80051643,Ramos,Levine,Female,1993-03-24,K1N2H3,3,Fitness instructor,99000,Married,1,6068,2015-01-01
80051644,Miller,Jimenez,Male,1997-11-23,M6Z3U4,3,Curator,38000,Married,3,1951.6,2015-01-01
80051645,Vaughn,Cuevas,Female,1988-12-15,L8W6Q1,4,Curator,59000,Married,3,6330.4,2015-01-01
80051646,Best,Cross,Female,1995-11-17,N7C8N1,2,Producer,96000,Single,0,1172.6,2015-01-01
80051647,Maxwell,Pratt,Female,2002-10-15,N4R6X6,23,Grave digger,94000,Single,0,4977.4,2015-01-01
80051648,Dominguez,Gray,Male,1975-06-19,K8H3G8,2,Art historian,52000,Divorced,3,5067.6,2015-01-01
80051649,Houston,Sandoval,Female,1983-10-31,L3N4T5,3,Literary agent,69000,Married,2,4961,2015-01-01
80051650,Carrillo,Duarte,Male,1994-04-18,L1U3Y5,4,Lift engineer,43000,Single,0,2509.2,2015-01-01
80051651,Ellis,Galloway,Female,2000-06-02,K4J3A7,1,Lifeguard,30000,Single,0,2353.4,2015-01-01
80051652,Pitts,Porter,Male,1990-08-14,K4Z6M8,3,Bank clerk,104000,Single,0,1336.6,2015-01-01
80051653,Holmes,Young,Female,1970-08-31,N7D8A4,4,Bookmaker,67000,Single,0,2812.6,2015-01-01
80051654,Jenkins,Combs,Female,1998-09-09,M2P2K5,1,Special constable,68000,Divorced,3,2788,2015-01-01
80051655,Oconnell,Oconnor,Male,1994-08-08,N6X4W5,2,Astronomer,42000,Single,0,5830.2,2015-01-01
80051656,Holt,Blackburn,Male,1996-11-20,K4C3W5,1,Business owner,103000,Single,0,2656.8,2015-01-01
80051657,Haas,Schwartz,Female,2001-01-24,L1I2I2,3,Independent means,56000,Single,0,2747,2015-01-01
80051658,Hubbard,Kennedy,Male,1978-02-20,M2H7A7,2,Lighthouse keeper,92000,Single,0,664.2,2015-01-01
80051659,Cochran,Pham,Female,1996-06-30,K1U8G2,2,Train driver,55000,Married,2,3124.2,2015-01-01
80051660,Solis,Cortez,Male,1998-03-07,N1T1K7,4,Inventor,39000,Single,0,2747,2015-01-01
80051661,Cortez,Ortega,Female,1991-11-02,K8Y3V7,2,Care assistant,31000,Married,2,2648.6,2015-01-01
80051662,Caldwell,French,Female,1975-03-21,M3M3K1,3,Civil servant,104000,Single,0,6174.6,2015-01-01
80051663,Pace,Cabrera,Male,1970-01-03,M7K3U4,4,Photographer,114000,Married,0,3862.2,2015-01-01
80051664,Ross,Benitez,Female,1999-07-04,K4G1V6,2,Craftsperson,102000,Single,0,2911,2015-01-01
80051665,Stanley,Horn,Male,1983-02-11,M8W1R4,2,Driving instructor,75000,Married,2,4280.4,2015-01-01
80051666,Mendez,Dorsey,Male,1975-01-24,L5Q2X8,4,Travel agent,101000,Married,1,5174.2,2015-01-01
80051667,Burch,Carpenter,Male,1992-06-23,L4P5N1,3,Nurse,42000,Married,2,1090.6,2015-01-01
80051668,Davies,Osborne,Male,1970-11-17,N1I8R5,2,Physiotherapist,98000,Married,3,3370.2,2015-01-01
80051669,Donovan,Caldwell,Male,1981-08-22,N2X6E6,3,Designer,33000,Married,3,3526,2015-01-01
80051670,Church,Wu,Male,1991-12-19,L6S4O4,1,Jockey,34000,Married,2,1877.8,2015-01-01
80051671,Hayden,Diaz,Male,1982-05-25,L6F7K7,2,Software consultant,38000,Divorced,2,1139.8,2015-01-01
80051672,Bowers,Galvan,Male,1989-03-31,N3I6B5,1,Data processor,79000,Single,0,934.8,2015-01-01
80051673,Bennett,Mccullough,Male,1975-10-07,K3M8W4,4,Economist,103000,Married,0,1828.6,2015-01-01
80051674,Cuevas,Osborn,Female,1997-10-30,L3J1W3,2,Picture framer,76000,Divorced,3,2214,2015-01-01
80051675,Davies,Rocha,Male,1994-10-15,L4I6H2,4,Business owner,105000,Single,0,5207,2015-01-01
80051676,Coleman,Leonard,Male,2002-08-02,M4X1C1,4,Machinist,85000,Single,0,1763,2015-01-01
80051677,Benjamin,Keller,Female,1998-04-02,L6R4W8,3,Careers advisor,107000,Single,0,951.2,2015-01-01
80051678,Clements,Rodriguez,Male,1972-01-16,L3W8Z5,3,Childminder,107000,Married,3,3378.4,2015-01-01
80051679,Potter,Hammond,Female,1990-08-23,L3O8R6,1,Roofer,79000,Single,0,4780.6,2015-01-01
80051680,Sloan,Joseph,Female,1987-05-28,N1I4O7,4,Crematorium worker,50000,Married,3,844.6,2015-01-01
80051681,Conrad,Kirby,Male,2003-02-01,N4D6Q8,1,Drug dealer,49000,Divorced,3,5125,2015-01-01
80051682,Daugherty,Wu,Male,1976-10-31,L6S7V7,2,Animal breeder,68000,Married,0,2255,2015-01-01
80051683,Durham,Ponce,Female,1988-06-25,M3E3J4,4,Mathematician,87000,Single,0,6322.2,2015-01-01
80051684,Howe,Copeland,Female,1986-10-09,M4A5T5,2,Chimney sweep,53000,Divorced,3,3419.4,2015-01-01
80051685,Li,Winters,Male,1969-05-05,M3R8A5,1,Traffic warden,28000,Single,0,2033.6,2015-01-01
80051686,Lara,Thomas,Male,1984-04-23,M6H5P2,1,Firefighter,39000,Single,0,6461.6,2015-01-01
80051687,Mann,Erickson,Female,1982-03-29,N8S7D2,4,Choreographer,88000,Married,3,3534.2,2015-01-01
80051688,Klein,Lindsey,Female,1976-08-27,L4L4X2,2,Beauty therapist,30000,Married,1,3493.2,2015-01-01
80051689,Griffith,Carney,Male,1992-02-04,M5P5B7,2,Estate agent,68000,Single,0,2607.6,2015-01-01
80051690,Lambert,Douglas,Male,2993-12-21,M4I3V3,3,Labourer,43000,Married,0,3476.8,2015-01-01
80051691,Lang,Love,Female,2001-07-21,L8R2B8,2,Doorman,30000,Married,1,1590.8,2015-01-01
80051692,Kline,Knapp,Male,1982-06-29,N7C4Y2,3,Television presenter,47000,Single,0,6289.4,2015-01-01
80051693,Klein,Cunningham,Female,1982-12-20,N6H3D7,3,Art dealer,111000,Divorced,2,6109,2015-01-01
80051694,Burnett,Thomas,Female,1996-07-06,L3L8H2,4,Car dealer,37000,Single,0,5518.6,2015-01-01
80051695,Howe,Hatfield,Male,1977-06-29,L1A7D3,2,Handyman,79000,Single,0,6027,2015-01-01
80051696,Ali,Henry,Male,1987-04-30,K4U5R5,2,Construction worker,79000,Single,0,2156.6,2015-01-01
80051697,Le,Valenzuela,Male,1976-03-22,K7M8M1,3,Circus worker,68000,Married,0,5928.6,2015-01-01
80051698,Pace,Deleon,Female,1999-04-15,K7I3E6,4,Acupuncturist,41000,Married,0,3804.8,2015-01-01
80051699,Walker,Ball,Male,1969-09-02,M3J4V2,2,Publisher,100000,Single,0,5731.8,2015-01-01
80051700,Suarez,Walker,Female,2003-09-03,K5E4U2,3,Bus driver,87000,Married,1,1607.2,2015-01-01
80051701,Richmond,Hughes,Male,2002-09-01,K3X6C7,2,Flying instructor,91000,Single,0,3198,2015-01-01
80051702,Gill,Ellison,Male,1996-06-04,K6H8P7,1,Telephonist,46000,Married,1,3755.6,2015-01-01
80051703,Wall,Bell,Male,1978-11-15,L2K5K2,2,Bricklayer,106000,Single,0,1722,2015-01-01
80051704,Kelly,Higgins,Male,1970-04-14,L1O8O5,4,Art critic,97000,Single,0,1492.4,2015-01-01
80051705,Tyler,Gregory,Male,1997-10-02,M2Q8P3,4,Pawnbroker,36000,Married,0,1271,2015-01-01
80051706,Griffin,Kline,Female,1972-04-28,L7B5W2,1,Animal breeder,70000,Married,1,1459.6,2015-01-01
80051707,Cole,Burke,Male,1974-05-04,K4L8G3,3,Cook,79000,Single,0,705.2,2015-01-01
80051708,Case,Edwards,Male,1980-07-19,N8M5P2,1,Customs officer,90000,Married,3,3140.6,2015-01-01
80051709,Wyatt,Oconnell,Female,1998-04-09,M3J5T5,4,Prostitute,85000,Divorced,3,1943.4,2015-01-01
80051710,Valdez,Shannon,Female,1968-11-15,L3P5I2,3,Judge,83000,Married,2,2788,2015-01-01
80051711,Houston,Koch,Female,2002-09-13,L2P6I6,2,Merchant navy personnel,87000,Single,0,6240.2,2015-01-01
80051712,Barron,Whitaker,Male,1974-05-09,L7Z8Z4,2,Oil rig crew,83000,Single,0,2771.6,2015-01-01
80051713,Downs,Burnett,Female,1994-04-04,M5C7W8,1,School crossing warden,86000,Married,3,5239.8,2015-01-01
80051714,Becker,Wolf,Male,1989-08-17,M2A7U1,2,Telephonist,45000,Single,0,5264.4,2015-01-01
80051715,Trujillo,Hanna,Female,1971-03-07,N5M3G6,1,Jewellery maker,58000,Married,2,3034,2015-01-01
80051716,Hooper,Calhoun,Male,2000-05-22,M6N5O3,2,Art critic,72000,Single,0,4444.4,2015-01-01
80051717,Cervantes,Cobb,Male,2001-08-18,L5B5F8,2,Care assistant,47000,Single,0,5904,2015-01-01
80051718,Kim,Wilcox,Male,1982-08-28,L7G3I4,4,Clairvoyant,101000,Single,0,3862.2,2015-01-01
80051719,Hart,Ramsey,Male,1992-02-23,L2O8N8,2,Driving instructor,31000,Single,0,1959.8,2015-01-01
80051720,Mahoney,Calhoun,Female,1997-09-30,L1Z2P3,2,Local govt worker,101000,Single,0,1672.8,2015-01-01
80051721,Savage,Chase,Male,1995-11-04,K6L5C1,1,Decorator,55000,Married,0,4329.6,2015-01-01
80051722,Watson,Davenport,Male,1985-02-17,N7F8U4,2,Gardener,78000,Married,1,3821.2,2015-01-01
80051723,Stevens,Weiss,Female,2000-03-20,N6B7Q5,2,Barrister,54000,Single,0,1525.2,2015-01-01
80051724,Moon,Leonard,Male,1982-07-22,M5Y3H8,2,Baggage handler,60000,Married,2,4911.8,2015-01-01
80051725,Freeman,Payne,Male,1980-11-12,K1W1S5,1,Lifeguard,64000,Single,0,4337.8,2015-01-01
80051726,Andrade,Schmidt,Male,1994-05-20,N3I8D6,1,Craftsperson,44000,Divorced,1,3862.2,2015-01-01
80051727,Kelly,Haley,Male,1995-09-18,N7D2Y6,4,Genealogist,44000,Single,0,5895.8,2015-01-01
80051728,George,Olsen,Male,2000-05-11,N5H8O1,4,Shop assistant,39000,Married,1,2845.4,2015-01-01
80051729,Keller,Horne,Female,2001-07-19,K5N7K3,4,Caretaker,-73000,Divorced,0,5510.4,2015-01-01
80051730,Everett,Stark,Female,1991-10-28,L8X6Z3,3,Manicurist,57000,Married,3,1066,2015-01-01
80051731,Pineda,Hess,Female,1983-06-23,N6H5D2,1,Student,26000,Married,0,2320.6,2015-01-01
80051732,Ochoa,Nielsen,Male,1993-06-02,L3P8R4,4,Debt collector,60000,Married,1,3181.6,2015-01-01
80051733,Barry,Cordova,Female,2001-08-07,M1S4I4,1,Dietician,76000,Married,0,2468.2,2015-01-01
80051734,Meyer,Burnett,Female,1995-09-16,K7B3P4,4,Singer,110000,Divorced,1,3747.4,2015-01-01
80051735,Mcdonald,Bryant,Male,1985-08-12,M6H8R3,1,Journalist,78000,Single,0,5100.4,2015-01-01
80051736,Rios,Guerra,Male,1987-03-18,K3E8C8,4,Clairvoyant,97000,Divorced,0,3452.2,2015-01-01
80051737,Gay,Nelson,Female,1994-01-13,L4E1D1,4,Prostitute,88000,Married,1,1877.8,2015-01-01
80051738,Miller,Manning,Female,1977-12-16,L2P8V8,3,Sailor,58000,Single,0,3198,2015-01-01
80051739,Franklin,Pierce,Female,1980-02-21,N1O4E7,3,Occupational therapist,80000,Single,0,1558,2015-01-01
80051740,Molina,Salas,Female,1972-03-28,N7U5W8,4,Gamekeeper,115000,Single,0,5075.8,2015-01-01
80051741,Joseph,Meza,Male,1974-11-18,N5F6T8,3,Brewer,59000,Married,2,1894.2,2015-01-01
80051742,Heath,Diaz,Female,1999-06-23,L3Y5R6,4,Chimney sweep,61000,Single,0,5395.6,2015-01-01
80051743,Baird,Gallagher,Female,1996-10-13,N5K7A2,1,Doctor,47000,Divorced,0,5928.6,2015-01-01
80051744,Haley,Hoover,Male,1997-05-01,M8F6Q2,1,Cabinet maker,84000,Divorced,3,3608,2015-01-01
80051745,Hodge,Sanchez,Female,1995-08-03,L5D6Z4,3,Computer programmer,45000,Divorced,2,2763.4,2015-01-01
80051746,Rojas,Snyder,Female,1998-09-04,N3J1L4,3,Counsellor,89000,Married,3,6010.6,2015-01-01
80051747,Rollins,Braun,Female,1988-04-06,L8Q6A4,1,Clergyman,90000,Single,0,5346.4,2015-01-01
80051748,Shields,Juarez,Female,1990-09-27,L5F3S3,4,Stockbroker,79000,Single,0,5723.6,2015-01-01
80051749,Bell,Santiago,Female,2001-11-22,K4R8Q6,2,Landowner,52000,Married,0,3378.4,2015-01-01
80051750,Page,Garcia,Female,2003-09-25,N4U4E2,1,Barber,49000,Married,0,3468.6,2015-01-01
80051751,Wu,Ball,Female,2001-01-06,K6A5D3,2,Prison officer,45000,Married,0,877.4,2015-01-01
80051752,King,Hoover,Female,1969-03-12,M2J3W5,3,Barrister,62000,Single,0,2214,2015-01-01
80051753,House,Strong,Female,1981-02-24,K6B8P3,4,Speech therapist,48000,Single,0,3001.2,2015-01-01
80051754,Johnson,Key,Male,1991-09-13,K2G6O3,2,Butcher,99000,Single,0,5920.4,2015-01-01
80051755,Cobb,Hanna,Male,1993-01-07,M5I3V7,2,Casual worker,75000,Single,0,3944.2,2015-01-01
80051756,Palmer,Fields,Female,1996-03-16,N1E3Z7,3,Aromatherapist,48000,Married,0,5436.6,2015-01-01
80051757,Berry,Phillips,Female,1976-05-03,K5V6B1,2,Nurse,39000,Single,0,1254.6,2015-01-01
80051758,Mcclure,Flores,Male,2001-02-20,L8O6J8,4,Immigration officer,77000,Divorced,0,2919.2,2015-01-01
80051759,Norman,Skinner,Female,2000-05-01,K1V5F2,2,Acupuncturist,90000,Married,2,3878.6,2015-01-01
80051760,Kirk,Cardenas,Male,1981-12-15,L7A6X2,4,Shoemaker,47000,Married,1,2140.2,2015-01-01
80051761,Farley,Figueroa,Female,2003-04-30,K4Z7X3,4,Journalist,42000,Single,0,3542.4,2015-01-01
80051762,Wilson,Clements,Male,1998-12-10,K1F2D8,1,Reporter,31000,Divorced,2,2312.4,2015-01-01
80051763,Suarez,Beard,Female,1998-04-13,L3Z6Q2,4,Gas fitter,78000,Married,0,1082.4,2015-01-01
80051764,Dyer,Burns,Female,1970-03-21,N3S3J5,1,Stockbroker,41000,Single,0,2665,2015-01-01
80051765,Blair,Villanueva,Female,1975-10-22,K4Q2Z4,4,Blacksmith,93000,Married,1,1025,2015-01-01
80051766,Mack,Bridges,Male,1977-01-02,L5N7M7,2,Doorman,58000,Divorced,2,2845.4,2015-01-01
80051767,Bautista,Rose,Female,1980-08-16,M3M4F6,4,Typist,90000,Single,0,6346.8,2015-01-01
80051768,Donaldson,Gamble,Male,1997-03-20,M5E3X1,3,Lifeguard,106000,Divorced,0,6273,2015-01-01
80051769,Campbell,Schmitt,Female,1978-10-29,M2N8X3,1,Probation officer,82000,Married,1,6478,2015-01-01
80051770,Vega,Molina,Male,1975-03-04,K5L5K6,1,Baker,77000,Single,0,6445.2,2015-01-01
80051771,Ho,Olson,Female,1984-08-31,M1K5M3,3,Party planner,55000,Single,0,1008.6,2015-01-01
80051772,Golden,Lawrence,Female,1985-10-15,M8H7A1,2,Reporter,28000,Single,0,5010.2,2015-01-01
80051773,Reid,Todd,Male,1969-07-08,N1P3S3,3,Surveyor,74000,Single,0,6035.2,2015-01-01
80051774,Huang,Mosley,Male,1975-12-06,M2D3S8,3,Song writer,69000,Married,1,2361.6,2015-01-01
80051775,Hess,Phelps,Male,1974-09-25,K5V3P2,2,Scientist,46000,Divorced,0,680.6,2015-01-01
80051776,Cordova,Valentine,Male,1969-11-28,L8P3O6,3,Cartoonist,67000,Married,2,6207.4,2015-01-01
80051777,Santos,Dickerson,Female,1978-10-07,L7R4Q1,4,Management consultant,108000,Single,0,3722.8,2015-01-01
80051778,Sanford,Schroeder,Male,1976-10-01,K6M1M5,3,Pharmacist,42000,Single,0,3304.6,2015-01-01
80051779,Cobb,Sellers,Female,1992-05-09,N5N1B3,4,Lift engineer,72000,Married,3,3796.6,2015-01-01
80051780,Johns,Daniels,Female,1992-07-05,K3H4I3,1,Carpenter,39000,Married,1,5453,2015-01-01
80051781,Hodge,Clarke,Female,1993-06-18,K5U1N6,3,Healthcare assistant,106000,Divorced,0,4879,2015-01-01
80051782,Green,Fry,Male,1979-12-23,N6Z4B1,4,Publisher,76000,Married,0,2017.2,2015-01-01
80051783,Pittman,Escobar,Male,2002-04-15,M3O5C8,1,Fashion designer,98000,Single,0,4378.8,2015-01-01
80051784,Aguilar,Beck,Female,2002-08-04,L3A8D4,4,Professor,75000,Married,0,5403.8,2015-01-01
80051785,Clarke,Perkins,Male,1987-01-05,K1U2S8,4,Kennel worker,49000,Divorced,3,2402.6,2015-01-01
80051786,Cervantes,Cuevas,Male,1990-03-16,N8X5K7,1,Cleric,88000,Divorced,1,1976.2,2015-01-01
80051787,Stark,Mejia,Male,1975-07-12,M8I8D3,2,Manicurist,63000,Married,3,4829.8,2015-01-01
80051788,Schneider,Gallegos,Male,1981-10-01,L6S4G6,4,Bookmaker,51000,Single,0,4592,2015-01-01
80051789,Blackwell,Martinez,Male,1980-12-31,N5T7K3,1,Prison officer,46000,Married,1,5248,2015-01-01
80051790,Foster,Yoder,Female,1973-10-11,L2S7I4,1,Illustrator,48000,Single,0,3296.4,2015-01-01
80051791,Richards,Horne,Female,1986-12-16,N6D3A8,4,Homeopath,49000,Single,0,3763.8,2015-01-01
80051792,Joseph,Kidd,Male,1984-07-30,L7D4B4,1,Massage therapist,65000,Single,0,5756.4,2015-01-01
80051793,Arroyo,Porter,Male,1977-03-16,M1F1X7,2,Radio presenter,96000,Married,2,3435.8,2015-01-01
80051794,Ruiz,Mitchell,Male,1976-05-01,L6H2B6,1,Kennel worker,87000,Single,0,3575.2,2015-01-01
80051795,Rivas,Mooney,Female,2002-12-23,L4C4L8,4,Groom,86000,Married,2,1172.6,2015-01-01
80051796,Myers,Mcmahon,Male,2002-01-26,M2H7W7,4,Herbalist,88000,Single,0,5756.4,2015-01-01
80051797,Cox,Abbott,Male,1977-05-26,K5U4Y3,3,Pop star,34000,Married,1,1902.4,2015-01-01
80051798,Russo,Velazquez,Male,1973-08-11,M7B2X2,4,Community worker,52000,Single,0,680.6,2015-01-01
80051799,Briggs,Walls,Male,1976-02-22,L8C2C4,1,IT consultant,66000,Single,0,664.2,2015-01-01
80051800,Buck,Walker,Female,1989-09-17,N3D8D8,1,Lorry driver,41000,Married,0,3632.6,2015-01-01
80051801,Ritter,Stephens,Male,1974-09-01,N3J1O6,1,Fairground worker,25000,Single,0,2255,2015-01-01
80051802,York,Harrison,Female,1995-04-30,N7I4T1,2,Cabinet maker,95000,Divorced,2,6232,2015-01-01
80051803,Little,Mullen,Male,1997-12-04,M5D7M2,1,Bank clerk,74000,Married,2,5330,2015-01-01
80051804,Cruz,Randolph,Female,1995-01-08,K7T3H6,4,Acupuncturist,88000,Divorced,3,1631.8,2015-01-01
80051805,Allison,Johnston,Female,1978-11-23,L2C5Q8,3,Window cleaner,44000,Single,0,2993,2015-01-01
80051806,Mckay,Jarvis,Female,2000-07-25,N6S2I7,2,Cashier,74000,Single,0,4091.8,2015-01-01
80051807,Bright,Mcintyre,Female,1970-07-03,M8Q4T4,2,Lighthouse keeper,71000,Single,0,1541.6,2015-01-01
80051808,Larsen,Campbell,Male,1971-02-19,N6U5Z2,3,Publican,59000,Married,3,1631.8,2015-01-01
80051809,Wiggins,Bond,Female,1992-08-31,N4F3U3,1,Domestic staff,83000,Single,0,3772,2015-01-01
80051810,Bridges,Roberson,Male,1968-06-14,M3N2K2,3,Sculptor,47000,Single,0,2550.2,2015-01-01
80051811,Stevenson,Wolfe,Female,1985-01-16,K6I8K7,2,Childrens entertainer,94000,Divorced,2,3206.2,2015-01-01
80051812,Kent,Bradford,Male,1988-07-10,M3W8Y6,2,Funeral director,31000,Single,0,3075,2015-01-01
80051813,Ferguson,Stephenson,Female,1996-04-15,N6L6V2,4,Meter reader,104000,Married,0,3230.8,2015-01-01
80051814,Frazier,Brady,Male,1980-11-24,M1Y7E5,4,Special constable,100000,Single,0,5699,2015-01-01
80051815,Delacruz,Cardenas,Female,1997-07-25,L2M2Q7,3,Taxi driver,73000,Married,0,5567.8,2015-01-01
80051816,Blanchard,Vaughn,Male,1978-09-01,N2I8R2,4,Pest controller,88000,Single,0,6207.4,2015-01-01
80051817,Juarez,Harper,Male,1983-09-13,M6Q7J2,3,Hairdresser,106000,Divorced,2,4813.4,2015-01-01
80051818,Cobb,Ali,Male,1979-03-26,N4B8P5,3,Economist,60000,Married,2,1041.4,2015-01-01
80051819,Farrell,Atkinson,Male,1987-03-02,L6L8Q2,3,Civil servant,108000,Single,0,4272.2,2015-01-01
80051820,Rich,Washington,Male,1973-03-01,K5Y8T4,1,Bus driver,77000,Single,0,5412,2015-01-01
80051821,Hubbard,Duran,Female,1983-05-23,M4X1X4,2,Camera operator,66000,Single,1000,4616.6,2015-01-01
80051822,Beasley,Dennis,Male,1995-02-14,N3R8M3,3,Solicitor,86000,Married,2,4100,2015-01-01
80051823,Best,Perkins,Male,1976-07-21,N4L1X4,4,Crown prosecutor,100000,Divorced,1,3763.8,2015-01-01
80051824,Gray,Huynh,Male,1983-11-06,M2A1Z3,2,Astronomer,32000,Divorced,0,2919.2,2015-01-01
80051825,Dougherty,Payne,Male,1970-10-31,N5G6T8,4,Hairdresser,90000,Single,0,4518.2,2015-01-01
80051826,Bryant,Wall,Male,1969-09-01,N1O8B2,2,Dental hygienist,79000,Married,2,3526,2015-01-01
80051827,Holloway,Mckay,Male,1985-10-22,K3O8V1,1,Musician,59000,Single,0,2886.4,2015-01-01
80051828,Reilly,Hurley,Female,1979-10-14,M5H7K8,1,Customs officer,36000,Married,2,5658,2015-01-01
80051829,Hutchinson,Velasquez,Female,1968-08-19,L4H6U7,1,Customs officer,44000,Single,0,1476,2015-01-01
80051830,Carrillo,Mathews,Male,2001-09-01,N8H8O5,3,Reporter,110000,Single,0,3444,2015-01-01
80051831,Jarvis,Roy,Male,1969-07-29,L6O4C2,2,Make-up artist,77000,Divorced,0,4870.8,2015-01-01
80051832,Chase,Cook,Male,1979-12-19,N3K4W3,2,Auditor,76000,Married,2,705.2,2015-01-01
80051833,Payne,Castaneda,Male,1977-05-24,N5X4L3,4,Financial advisor,100000,Divorced,2,6207.4,2015-01-01
80051834,Steele,Padilla,Male,1975-09-27,M6Q6Z1,2,Diver,69000,Married,2,1730.2,2015-01-01
80051835,Willis,Mccoy,Female,2001-09-08,K1X2W6,2,Barrister,96000,Divorced,2,5551.4,2015-01-01
80051836,George,Gay,Female,1995-03-10,K8R5V1,2,Builder,76000,Married,0,5846.6,2015-01-01
80051837,Dougherty,Ortiz,Male,1996-07-29,L4O2V4,3,Waiting staff,73000,Single,0,2312.4,2015-01-01
80051838,Hebert,Preston,Female,1996-03-15,N4M3J3,1,Community worker,37000,Single,0,4739.6,2015-01-01
80051839,Bauer,Barker,Female,1986-03-06,L1J2J7,4,Road sweeper,56000,Single,0,1730.2,2015-01-01
80051840,Cole,Bautista,Female,1999-02-04,N8O8I2,2,Caretaker,67000,Single,0,3903.2,2015-01-01
80051841,Villarreal,Peck,Female,1994-09-23,M7Y8I1,4,Singer,105000,Single,0,1910.6,2015-01-01
80051842,Houston,Harvey,Female,1992-08-05,K7G6Y5,2,Homemaker,88000,Single,0,6215.6,2015-01-01
80051843,Sloan,Khan,Female,2000-09-28,N1A5U8,3,Labourer,106000,Married,1,4854.4,2015-01-01
80051844,Jacobson,Combs,Female,1969-08-21,K7I3F3,3,Lighthouse keeper,73000,Single,0,746.2,2015-01-01
80051845,Cannon,Mccoy,Male,1998-03-22,L7N4G3,2,Bookmaker,28000,Single,0,5895.8,2015-01-01
80051846,Estrada,Wolfe,Male,1971-07-17,K2B8D3,1,Assembly line worker,28000,Divorced,3,4608.4,2015-01-01
80051847,Vang,Reese,Male,1996-03-13,K7N8G2,3,Coroner,77000,Single,0,1845,2015-01-01
80051848,Brennan,Fields,Male,1992-08-14,L4N5L4,4,Artist,93000,Single,0,2984.8,2015-01-01
80051849,Gibson,English,Female,1998-01-09,L6Y6U1,2,Cartoonist,39000,Divorced,0,5928.6,2015-01-01
80051850,Weiss,Juarez,Male,1981-01-26,M3J4D1,2,Debt collector,104000,Single,0,5830.2,2015-01-01
80051851,Mclaughlin,Harris,Male,1975-02-08,N3R1F8,3,Oil rig crew,96000,Single,0,5108.6,2015-01-01
80051852,Crawford,Hester,Female,1984-08-25,N2G4F2,3,Salesperson,48000,Divorced,3,590.4,2015-01-01
80051853,Savage,Case,Male,1985-06-15,M6Q5D7,4,Nurse,112000,Married,0,1869.6,2015-01-01
80051854,Spence,Hebert,Male,1985-08-31,N2S4R7,1,Bar staff,81000,Single,0,4108.2,2015-01-01
80051855,Mcdonald,Hurley,Male,1992-10-02,N5Y8B2,1,Beauty therapist,94000,Married,3,6051.6,2015-01-01
80051856,Haas,Cisneros,Female,1981-12-31,L8D8Z5,1,Receptionist,34000,Single,0,3722.8,2015-01-01
80051857,Mcfarland,Luna,Male,1975-01-28,K8W5U2,2,Tattooist,77000,Married,1,6256.6,2015-01-01
80051858,Moreno,Daniels,Female,1992-01-03,K6Q6G3,1,Telesales person,47000,Single,0,6437,2015-01-01
80051859,Parrish,Haynes,Female,2001-06-14,N3K2P3,4,Mortician,64000,Single,0,5116.8,2015-01-01
80051860,Lawrence,Austin,Female,1985-09-12,M3W6H7,2,Medical student,75000,Married,3,2017.2,2015-01-01
80051861,Brady,Baxter,Female,1993-09-30,K2O7Q3,2,Researcher,37000,Married,1,1590.8,2015-01-01
80051862,Kent,Romero,Female,1979-11-12,N6O4R2,1,Medical student,45000,Married,3,4813.4,2015-01-01
80051863,Simmons,Burnett,Male,1988-03-18,K7O3U7,2,Lap dancer,46000,Divorced,3,2714.2,2015-01-01
80051864,Singleton,Stevenson,Male,1989-01-13,M7M1I2,1,Baggage handler,27000,Single,0,4378.8,2015-01-01
80051865,Thomas,Ball,Female,1980-08-09,M5J6G8,1,Clergyman,36000,Single,0,1107,2015-01-01
80051866,Pope,Richards,Female,1980-04-16,M3A3Z4,4,Archivist,45000,Married,1,5707.2,2015-01-01
80051867,Maldonado,Melton,Female,1998-05-20,N3F6V1,2,Art dealer,47000,Divorced,0,3091.4,2015-01-01
80051868,Dennis,Olsen,Male,1983-10-09,L7E4S3,2,Pharmacist,106000,Single,0,6150,2015-01-01
80051869,Meadows,George,Female,1997-02-15,N2C3R1,4,Priest,105000,Divorced,3,3025.8,2015-01-01
80051870,Holden,Brennan,Male,1994-03-01,N5W8Z7,2,Pilot,93000,Single,0,2722.4,2015-01-01
80051871,Washington,Keith,Female,2000-03-12,K4O5J3,3,Toilet attendant,45000,Married,3,4346,2015-01-01
80051872,Garner,Stone,Female,1992-03-27,L2O3N3,3,Missionary,40000,Married,0,1041.4,2015-01-01
80051873,Porter,Rios,Female,1996-06-02,L5D7Q8,3,Drug dealer,76000,Single,0,5010.2,2015-01-01
80051874,Nolan,Nicholson,Female,2002-01-02,M1Z2H7,2,Disc jockey,65000,Married,0,1139.8,2015-01-01
80051875,Duarte,Myers,Male,2002-03-31,M7F5Y2,3,Scientist,109000,Married,1,5133.2,2015-01-01
80051876,Valencia,Haas,Female,1985-04-14,K3P1Z6,4,Caretaker,43000,Divorced,0,5420.2,2015-01-01
80051877,Kennedy,Cuevas,Female,1970-09-24,M5M5R3,2,Housekeeper,67000,Married,2,2730.6,2015-01-01
80051878,Robinson,Marshall,Female,1980-02-11,N4Q6B1,3,Undertaker,57000,Single,0,1115.2,2015-01-01
80051879,Lane,Randolph,Female,1989-03-25,M7J8C6,2,Fork-lift driver,43000,Divorced,3,541.2,2015-01-01
80051880,Sutton,Frey,Female,1989-04-09,N2Z5P1,1,Childrens entertainer,57000,Single,0,1582.6,2015-01-01
80051881,Banks,Vazquez,Male,1972-03-17,K7X8F8,1,Conservationist,97000,Married,2,1713.8,2015-01-01
80051882,Carlson,Guzman,Female,1981-07-06,N6Z2F6,3,Model,94000,Single,0,1295.6,2015-01-01
80051883,Bruce,Brady,Male,1970-06-13,N3E4L6,1,Interpreter,77000,Single,0,2501,2015-01-01
80051884,Tate,Mcmillan,Male,1988-04-07,L1X5G5,2,Art dealer,80000,Single,0,3960.6,2015-01-01
80051885,Escobar,Peters,Female,1986-08-01,N6O8C4,3,Receptionist,59000,Married,2,5887.6,2015-01-01
80051886,Sheppard,Dickson,Female,1977-11-05,N5G1A1,3,Director,63000,Single,0,4993.8,2015-01-01
80051887,Frost,Dean,Male,2000-02-07,L4Q2T4,2,Dressmaker,89000,Divorced,1,2788,2015-01-01
80051888,Evans,Wood,Male,1974-11-23,N4J4N6,2,Shop assistant,42000,Married,2,5723.6,2015-01-01
80051889,Shields,Pruitt,Male,1980-09-21,N3C8D3,4,Bailiff,99000,Single,0,1115.2,2015-01-01
80051890,Cantrell,Kent,Male,1990-06-23,L2M4D2,3,Dental nurse,48000,Single,0,5961.4,2015-01-01
80051891,Mcfarland,Brennan,Female,1985-06-18,M6M7Y4,1,Flying instructor,65000,Single,0,1713.8,2015-01-01
80051892,Benjamin,Shaffer,Male,1970-12-20,K7O3H1,4,Housekeeper,70000,Married,2,4641.2,2015-01-01
80051893,Cruz,Rush,Male,1992-04-25,K4D8F3,3,Chimney sweep,105000,Married,0,2238.6,2015-01-01
80051894,Beard,Duran,Male,1992-09-17,K5U8F3,2,Caretaker,76000,Married,2,2665,2015-01-01
80051895,Wu,Walter,Male,1981-03-29,M7T6J5,3,Teaching assistant,111000,Divorced,3,893.8,2015-01-01
80051896,Schneider,Summers,Male,1991-12-18,K3W8V1,3,Data processor,33000,Married,0,2197.6,2015-01-01
80051897,Hurst,Wilson,Male,1969-03-14,N1W4Y5,3,Make-up artist,82000,Single,0,1164.4,2015-01-01
80051898,Singleton,Bird,Female,1968-05-17,L7P3X5,4,Comedian,109000,Married,2,1689.2,2015-01-01
80051899,Preston,Serrano,Male,1983-06-05,M8E1O1,3,Missionary,75000,Divorced,2,6248.4,2015-01-01
80051900,Pearson,Gallegos,Female,1968-06-19,M8E4R1,1,Actor,25000,Married,0,2066.4,2015-01-01
80051901,Mullen,Osborne,Female,2001-01-29,M3T4L2,3,Hypnotherapist,84000,Single,0,5264.4,2015-01-01
80051902,Love,Russell,Male,1992-01-21,L2A2G4,2,Courier,46000,Single,0,2681.4,2015-01-01
80051903,Dunlap,Wyatt,Female,1979-01-12,M4S7E8,1,Bus driver,87000,Married,3,3157,2015-01-01
80051904,Castaneda,Quinn,Female,1970-05-02,M5V4B3,1,Health visitor,57000,Married,3,2271.4,2015-01-01
80051905,Lamb,Randall,Female,1998-02-11,L2B3U7,4,Property developer,83000,Divorced,0,3550.6,2015-01-01
80051906,Grant,Cortez,Male,2002-09-30,L1H2J3,4,Anaesthetist,81000,Single,0,754.4,2015-01-01
80051907,Bowen,Dickson,Female,1994-10-21,K6J3X8,2,Computer engineer,74000,Divorced,2,5116.8,2015-01-01
80051908,Taylor,Walker,Female,1972-04-06,N1W3L8,4,Company director,68000,Married,0,5059.4,2015-01-01
80051909,Townsend,Bishop,Female,1993-09-15,K1A5L3,2,Farm worker,86000,Single,0,2304.2,2015-01-01
80051910,Joyce,Austin,Female,1990-04-13,N2T2Q3,1,Merchant navy personnel,28000,Single,0,1057.8,2015-01-01
80051911,Mejia,Matthews,Male,1980-03-01,M3B5S2,4,Midwife,83000,Single,0,3837.6,2015-01-01
80051912,Hernandez,Welch,Male,1976-05-24,L4U3L1,2,Book-keeper,42000,Single,0,787.2,2015-01-01
80051913,Holmes,Mason,Female,1970-05-29,L6X2Z2,3,Scientist,57000,Divorced,0,5338.2,2015-01-01
80051914,French,Hendricks,Female,1990-11-29,M4G1S8,3,Psychiatrist,80000,Single,0,1943.4,2015-01-01
80051915,Sanford,Best,Male,2001-10-10,L4N1L4,2,Marketing director,58000,Single,0,5699,2015-01-01
80051916,Mcgee,Walls,Male,2001-07-01,M2P6A6,2,Lift engineer,76000,Divorced,0,5223.4,2015-01-01
80051917,Meza,Russo,Female,1979-08-26,K5U1W3,2,Unemployed,73000,Single,0,3624.4,2015-01-01
80051918,Banks,Sweeney,Female,1990-06-23,L1Y5L4,3,Book-keeper,72000,Single,0,672.4,2015-01-01
80051919,Taylor,Arnold,Female,1979-12-07,L1O4M6,4,Private investigator,94000,Single,0,5904,2015-01-01
80051920,Stevens,Allen,Male,1992-03-24,M6D8K7,2,Solicitor,99000,Divorced,0,2714.2,2015-01-01
80051921,Prince,Mckee,Male,1996-04-07,L8N8U3,2,Assembly line worker,42000,Married,0,4846.2,2015-01-01
80051922,Yu,Levine,Female,1987-08-25,L1B7W8,1,Insurance consultant,37000,Single,0,6297.6,2015-01-01
80051923,Chaney,Zamora,Female,1975-11-12,M3O5P2,4,Publican,91000,Married,2,5387.4,2015-01-01
80051924,Weaver,Smith,Female,1984-10-03,N4R3S8,2,Gamekeeper,68000,Divorced,1,6387.8,2015-01-01
80051925,Calderon,Rubio,Female,1969-01-23,M5B4V2,2,Musician,98000,Married,1,6297.6,2015-01-01
80051926,Grimes,Woodward,Female,1985-11-07,L2U3M1,1,Kennel worker,36000,Married,0,1172.6,2015-01-01
80051927,Potts,Singleton,Male,1969-07-12,K5S8Y8,1,Farmer,46000,Married,2,5477.6,2015-01-01
80051928,Petersen,Fernandez,Male,1987-10-28,L7G2B7,2,Aircraft engineer,89000,Married,2,549.4,2015-01-01
80051929,Meyers,Knapp,Female,1989-05-23,K8J4X7,1,Leaflet distributor,46000,Single,0,3091.4,2015-01-01
80051930,Benitez,Bowen,Male,1985-11-01,L7Q4I7,1,Ship builder,40000,Married,1,3772,2015-01-01
80051931,Harrington,Gilbert,Male,1993-04-21,K4T2M4,2,Radio presenter,62000,Married,0,4797,2015-01-01
80051932,Clayton,Williamson,Female,1998-04-08,M3R3V4,3,Travel agent,77000,Single,0,1877.8,2015-01-01
80051933,Walters,Hampton,Female,1972-06-24,L3U4K1,3,Dietician,51000,Married,0,6396,2015-01-01
80051934,Copeland,Mckenzie,Female,1996-08-28,K7O8P8,4,Author,72000,Married,3,5256.2,2015-01-01
80051935,Rodriguez,Villanueva,Female,1991-09-10,N1M5A7,4,Dental nurse,68000,Divorced,3,3911.4,2015-01-01
80051936,Schmitt,Winters,Female,1998-01-16,N8G8L1,1,Miner,35000,Single,0,6437,2015-01-01
80051937,Roy,Todd,Male,1999-11-07,N7K6J1,3,Sportsperson,68000,Married,3,1238.2,2015-01-01
80051938,Ayers,Mccoy,Female,1977-03-14,M3X2Q5,2,Management consultant,41000,Divorced,2,6059.8,2015-01-01
80051939,Foster,Sexton,Female,1986-03-30,L5C5Z6,1,Reporter,72000,Divorced,3,3312.8,2015-01-01
80051940,Mcfarland,Molina,Male,1978-03-02,K1W6H5,3,Careers advisor,61000,Married,0,3895,2015-01-01
80051941,Reid,Bolton,Female,1991-02-10,K7Q7U7,3,Air traffic controller,72000,Married,2,4444.4,2015-01-01
80051942,Hanna,Cochran,Male,1983-09-01,M2B1O5,2,Professor,62000,Married,0,4501.8,2015-01-01
80051943,Olson,Donovan,Male,1986-11-26,M6F1A6,1,Costume designer,87000,Single,0,5108.6,2015-01-01
80051944,Todd,Casey,Female,1973-09-12,K1R5O2,3,Childrens entertainer,71000,Divorced,1,2927.4,2015-01-01
80051945,White,Davis,Male,2000-10-05,L4A3Z5,1,Merchant navy personnel,88000,Single,0,4370.6,2015-01-01
80051946,Gilbert,Wilkinson,Female,1976-10-05,L7L3S7,2,Illustrator,36000,Single,0,1738.4,2015-01-01
80051947,Ashley,Mcconnell,Male,1995-09-20,M3Q4B3,1,Manicurist,40000,Single,0,1336.6,2015-01-01
80051948,Holden,Castillo,Female,1982-11-07,L6I4W3,3,Retired,76000,Divorced,3,2230.4,2015-01-01
80051949,Nash,Pugh,Female,1981-12-18,K7Q7L1,3,Make-up artist,38000,Divorced,1,2468.2,2015-01-01
80051950,Villa,Lopez,Male,1991-04-27,M5X5P2,1,Clockmaker,47000,Married,2,1197.2,2015-01-01
80051951,Williamson,Lawson,Female,1978-05-12,N2B6N3,2,Scientist,71000,Married,1,5994.2,2015-01-01
80051952,Reynolds,Meza,Male,1978-03-06,N6P2S1,1,Bank clerk,39000,Married,3,1320.2,2015-01-01
80051953,Cohen,Blanchard,Female,1996-12-02,L8D5X1,2,Auditor,60000,Divorced,1,6314,2015-01-01
80051954,Robertson,Copeland,Male,1984-12-14,L4S7M1,1,Hypnotherapist,60000,Single,0,1484.2,2015-01-01
80051955,Molina,Cordova,Female,1989-10-23,L1G8K5,1,Telephonist,25000,Single,0,4526.4,2015-01-01
80051956,Stephens,Horn,Female,1992-09-22,M7G5R6,1,Shoemaker,27000,Single,0,5715.4,2015-01-01
80051957,Velazquez,Montes,Female,1982-07-04,K3B5X7,3,Pathologist,55000,Single,0,2312.4,2015-01-01
80051958,Gutierrez,Gould,Female,1976-10-31,M8Z8Z6,2,Firefighter,71000,Married,0,1049.6,2015-01-01
80051959,Park,Fischer,Male,1971-07-26,N7H3S3,4,Art historian,90000,Single,0,1369.4,2015-01-01
80051960,Bautista,Barajas,Female,1980-03-28,M1W2J7,4,Publican,69000,Single,0,2402.6,2015-01-01
80051961,Mercado,Hudson,Male,2000-02-23,K6I2B2,4,Market trader,82000,Divorced,1,6428.8,2015-01-01
80051962,Whitehead,Blevins,Female,1990-07-08,K5L2H4,4,Comedian,42000,Single,0,4583.8,2015-01-01
80051963,Whitney,Ellison,Female,1981-07-05,N8Z3K8,1,Chemist,85000,Married,3,4944.6,2015-01-01
80051964,Buckley,Calderon,Female,1980-05-08,M1K6B8,3,Choreographer,45000,Married,3,5838.4,2015-01-01
80051965,Russo,Harrington,Female,1995-09-21,L5Z6A3,2,Blacksmith,54000,Married,0,3542.4,2015-01-01
80051966,Hickman,Graham,Female,1980-02-15,L3J6N1,3,Computer engineer,59000,Married,0,4198.4,2015-01-01
80051967,Duncan,Cherry,Female,1983-12-24,L1K5N6,3,Coroner,34000,Married,2,5510.4,2015-01-01
80051968,Nguyen,Curry,Male,1987-03-30,M4F4Z7,2,Postal delivery worker,70000,Single,0,5707.2,2015-01-01
80051969,Krueger,Martin,Male,1974-03-30,K7B5R8,3,Jockey,89000,Married,1,2000.8,2015-01-01
80051970,Schmitt,Guerrero,Female,1973-05-04,K7J4Z1,4,Secretary,67000,Married,3,4272.2,2015-01-01
80051971,Brady,Keith,Female,1978-07-12,M4O8Y1,4,Marketing director,88000,Married,1,5346.4,2015-01-01
80051972,Morales,Freeman,Male,1980-01-29,L1U4M5,3,Crown prosecutor,103000,Single,0,4198.4,2015-01-01
80051973,Orozco,Mayo,Female,1980-12-03,L5X2X2,3,Politician,51000,Single,0,5075.8,2015-01-01
80051974,Burch,Montgomery,Female,1992-08-26,M6W4I8,1,Assembly line worker,75000,Single,0,1476,2015-01-01
80051975,Maynard,Conner,Male,1971-11-29,M7X8Q1,1,Priest,59000,Single,0,877.4,2015-01-01
80051976,Carney,Morse,Male,2002-11-16,M4F7J7,3,Hairdresser,58000,Married,2,5863,2015-01-01
80051977,Sloan,Haley,Female,2003-08-18,L1W4G3,2,Security guard,29000,Divorced,3,2451.8,2015-01-01
80051978,Dudley,Hodge,Female,2000-06-23,L1T8A4,4,Chemist,86000,Married,2,2919.2,2015-01-01
80051979,Sellers,Lutz,Female,1973-06-01,M8E6B6,4,Healthcare assistant,115000,Single,0,3476.8,2015-01-01
80051980,Leonard,Sellers,Female,1976-11-15,L5Z2R6,1,Animal breeder,62000,Married,3,2722.4,2015-01-01
80051981,Grant,Dudley,Male,1982-06-06,M1D2B3,1,Horticulturalist,79000,Single,0,1738.4,2015-01-01
80051982,Goodwin,Obrien,Female,2000-07-20,N3W2P4,4,Genealogist,103000,Single,0,6051.6,2015-01-01
80051983,Velez,Mcdowell,Female,2002-03-22,K7C3R6,2,Special constable,75000,Married,1,1599,2015-01-01
80051984,Mays,Russell,Female,2001-08-11,K5P1P1,3,Cleaner,74000,Single,0,4870.8,2015-01-01
80051985,Esparza,Leonard,Female,1989-06-06,L8F4E7,3,Telesales person,69000,Single,789,3206.2,2015-01-01
80051986,Phelps,Hill,Male,2002-04-27,N4Q3I5,2,Fitness instructor,66000,Married,1,1000.4,2015-01-01
80051987,Lynch,Matthews,Female,1973-01-27,N2U4G6,4,Director,53000,Married,2,5436.6,2015-01-01
80051988,Forbes,Kennedy,Male,1985-07-08,N1D8K3,3,Assembly line worker,54000,Married,3,1090.6,2015-01-01
80051989,Zamora,Martin,Female,1970-12-19,L1N3R8,3,Anthropologist,92000,Divorced,3,2451.8,2015-01-01
80051990,Charles,Moran,Female,1979-08-01,M4N6I7,1,Chimney sweep,48000,Single,0,2697.8,2015-01-01
80051991,Trevino,Waller,Male,1998-03-22,M8Y1W4,2,Locksmith,80000,Single,0,2984.8,2015-01-01
80051992,Conley,Bates,Male,1985-07-11,N5D8Q8,4,Pilot,65000,Divorced,1,3157,2015-01-01
80051993,Bonilla,Ortega,Male,1990-11-11,L4G2S5,2,IT consultant,66000,Single,0,4559.2,2015-01-01
80051994,Lucas,Best,Female,1984-11-01,L7M4J4,3,Building labourer,111000,Married,1,820,2015-01-01
80051995,Pacheco,Ochoa,Female,1998-11-26,L7W7P6,3,Illustrator,62000,Divorced,0,5715.4,2015-01-01
80051996,Walsh,Flowers,Male,1995-05-20,M4X1F4,1,Bus driver,73000,Married,1,6027,2015-01-01
80051997,Mercado,Estrada,Female,1976-10-04,K2U6X8,2,Illustrator,100000,Divorced,0,3304.6,2015-01-01
80051998,Hernandez,Gross,Female,1977-09-18,N3Q4Z8,2,Plumber,-30000,Married,3,3435.8,2015-01-01
80051999,Lutz,Roy,Female,1997-05-19,K3N7D4,1,Teaching assistant,93000,Single,0,6322.2,2015-01-01
80052000,Cantu,Rowland,Female,2000-07-20,K2V5W5,2,Catering staff,43000,Married,3,877.4,2015-01-01
80052001,Rocha,Huang,Male,1997-06-30,L1P5M8,3,Broadcaster,95000,Married,3,1582.6,2015-01-01
80052002,George,Lucero,Female,1987-04-09,N8I5A3,1,Advertising executive,47000,Married,2,2164.8,2015-01-01
80052003,Walter,Proctor,Female,1999-01-18,M2O4N7,3,Homemaker,70000,Married,3,4100,2015-01-01
80052004,Whitaker,Gonzales,Female,1993-07-23,L7S5A7,1,Car wash attendant,73000,Married,3,2025.4,2015-01-01
80052005,Reed,Olson,Male,1982-04-21,M4S8X2,3,Managing director,86000,Divorced,0,3116,2015-01-01
80052006,Franco,Singleton,Female,1970-01-11,N1L4I7,2,Cartoonist,101000,Divorced,3,844.6,2015-01-01
80052007,Cross,Hancock,Female,1993-11-17,N4M1Z5,3,Lecturer,98000,Divorced,2,1836.8,2015-01-01
80052008,Berry,Hodge,Female,2001-11-30,M7Z1K5,3,Park-keeper,80000,Single,0,5682.6,2015-01-01
80052009,Blanchard,Odonnell,Male,1981-07-29,K1C8O8,3,Psychologist,89000,Divorced,3,5231.6,2015-01-01
80052010,Gentry,Conway,Male,1990-05-13,M6T8V1,1,Dressmaker,64000,Married,0,2419,2015-01-01
80052011,Mills,Brady,Female,1968-10-17,K4D3L2,3,Fashion designer,43000,Single,0,4846.2,2015-01-01
80052012,Gill,Peck,Female,1998-02-21,M3T6K4,4,Leaflet distributor,70000,Divorced,3,5526.8,2015-01-01
80052013,Meyer,Meza,Female,1998-08-11,M4N8I1,2,Roofer,39000,Married,0,1525.2,2015-01-01
80052014,Rich,Mays,Female,1988-07-09,M7J1L5,1,Plumber,102000,Divorced,0,2287.8,2015-01-01
80052015,Carson,Hudson,Female,1994-01-16,K1L1X2,1,Massage therapist,81000,Married,3,2074.6,2015-01-01
80052016,Bass,Merritt,Male,1978-03-07,K3N3S2,4,Childrens entertainer,68000,Married,3,5289,2015-01-01
80052017,Vega,Werner,Male,1976-10-24,M3Y8S5,2,Flower arranger,98000,Single,0,2763.4,2015-01-01
80052018,Dunlap,Hammond,Male,1990-01-26,K4O3W4,2,Bodyguard,40000,Divorced,3,6305.8,2015-01-01
80052019,Lyons,Short,Female,1986-04-01,L2C5I5,1,Childrens entertainer,55000,Single,0,2394.4,2015-01-01
80052020,Montes,Hess,Female,1998-01-16,K2D2I8,4,Train driver,109000,Married,2,4132.8,2015-01-01
80052021,Mccall,Moody,Female,1989-11-18,M5F6Z7,4,Acupuncturist,42000,Single,0,1148,2015-01-01
80052022,Beasley,Rowe,Male,1977-10-01,L8D4C2,4,IT consultant,49000,Married,0,3214.4,2015-01-01
80052023,Patton,Arias,Female,1989-07-22,M5L1L1,1,Printer,52000,Married,2,5764.6,2015-01-01
80052024,Cooley,Dougherty,Male,1970-02-01,K2X2Q1,4,Park-keeper,58000,Single,0,3714.6,2015-01-01
80052025,Floyd,Wolfe,Male,1997-12-12,L1R1D8,2,Prison officer,38000,Married,0,3435.8,2015-01-01
80052026,Macdonald,Underwood,Male,1980-05-16,M1W5J1,3,Singer,111000,Single,0,4075.4,2015-01-01
80052027,Maddox,Kim,Female,1993-07-30,M8C8R7,1,Casual worker,92000,Single,0,2000.8,2015-01-01
80052028,Tapia,Atkins,Female,1990-08-14,L4L3M1,1,Librarian,68000,Single,0,1115.2,2015-01-01
80052029,Crawford,Rodriguez,Female,1984-09-24,K1F7X4,1,Song writer,90000,Single,0,3804.8,2015-01-01
80052030,Knapp,Blanchard,Male,1991-05-12,M4G3H8,3,Occupational therapist,79000,Married,1,5133.2,2015-01-01
80052031,Wiggins,Carpenter,Male,1989-06-05,M7V3H3,2,Typist,104000,Single,0,5149.6,2015-01-01
80052032,Greer,Sandoval,Female,1974-08-27,N6R6O1,3,Leaflet distributor,92000,Single,0,1640,2015-01-01
80052033,Shea,Conley,Male,1990-04-04,K1K3G3,3,Laboratory technician,108000,Married,3,1000000,2015-01-01
80052034,Franco,Castro,Male,1990-12-24,N6A5W4,4,Farm worker,59000,Married,2,1139.8,2015-01-01
80052035,Petty,Dean,Female,1983-10-14,M5V2J1,2,Cartoonist,90000,Single,0,664.2,2015-01-01
80052036,Massey,Diaz,Male,1973-04-23,M1B5T7,3,Farmer,45000,Single,0,4452.6,2015-01-01
80052037,Todd,Jacobson,Male,1991-05-28,N8Z6J5,1,Footballer,38000,Single,0,6207.4,2015-01-01
80052038,Goodwin,Nash,Female,1974-10-23,M7O7E8,1,Midwife,58000,Married,0,6084.4,2015-01-01
80052039,Silva,Ho,Female,1998-08-22,M3V5Z8,1,Photographer,57000,Single,0,2779.8,2015-01-01
80052040,Mathis,Cobb,Male,1975-03-09,L8W8P3,1,Diplomat,38000,Divorced,3,3247.2,2015-01-01
80052041,Gallegos,Henderson,Female,1984-12-06,K1K4I4,4,Carpet fitter,101000,Single,0,2656.8,2015-01-01
80052042,Snyder,Cobb,Male,1985-08-31,N7E1I7,1,Management consultant,88000,Divorced,1,5190.6,2015-01-01
80052043,Jennings,Patrick,Female,1977-05-02,K8R2F7,1,Chauffeur,102000,Married,2,3731,2015-01-01
80052044,Raymond,Sims,Male,2002-08-30,K5C3F1,4,Park-keeper,75000,Divorced,2,5715.4,2015-01-01
80052045,Gibbs,Russell,Male,1993-01-28,K3G1V8,4,Fashion designer,77000,Single,0,4305,2015-01-01
80052046,Odonnell,Kidd,Male,1987-08-24,M8Y3H3,3,Fashion designer,99000,Single,0,2255,2015-01-01
80052047,Wilson,Lam,Male,1991-05-30,M2T6A2,3,Surgeon,57000,Divorced,1,705.2,2015-01-01
80052048,Liu,Forbes,Male,1974-08-25,L6O1B2,4,Lifeguard,108000,Divorced,1,4731.4,2015-01-01
80052049,Bates,Harrell,Female,1978-10-24,L2M8Z2,1,Judge,33000,Divorced,3,779,2015-01-01
80052050,Swanson,Petersen,Female,1995-02-13,K3K1Q3,1,Chiropodist,28000,Single,0,3657.2,2015-01-01
80052051,Wolf,Jennings,Female,1976-10-07,K1P3J1,2,Taxi driver,82000,Married,1,4296.8,2015-01-01
80052052,Salas,Barr,Female,1986-03-05,K6Y4A5,2,Waiting staff,101000,Married,0,2132,2015-01-01
80052053,Bray,Conway,Female,1974-05-28,L7U6G2,1,Art historian,76000,Single,0,5469.4,2015-01-01
80052054,Dodson,Garrison,Male,2001-03-08,L7E2F7,2,Undertaker,65000,Married,2,1525.2,2015-01-01
80052055,Gutierrez,Dominguez,Male,1984-08-17,M3X5O1,2,Mathematician,75000,Married,3,3788.4,2015-01-01
80052056,Blanchard,Fuller,Male,1989-11-29,K4U1Q8,4,Electrician,41000,Single,0,3263.6,2015-01-01
80052057,Soto,Welch,Male,1982-04-10,K7N7A8,4,Building labourer,51000,Married,0,2484.6,2015-01-01
80052058,Duran,Delgado,Male,1979-07-23,N4E7T5,4,Computer analyst,85000,Divorced,2,2378,2015-01-01
80052059,Keller,Pena,Male,1998-09-29,M3C4D4,2,Independent means,99000,Married,3,4460.8,2015-01-01
80052060,Wade,Simon,Female,1989-01-02,L4H8U4,4,Chauffeur,83000,Single,0,3296.4,2015-01-01
80052061,Hamilton,Ayers,Male,1992-06-01,L1P4R7,1,Dressmaker,42000,Single,0,5403.8,2015-01-01
80052062,Mckenzie,Henderson,Female,1971-05-29,K8U7I4,3,Homeopath,42000,Single,0,2952,2015-01-01
80052063,Spencer,Duran,Male,1982-03-01,M5D7G7,4,Lorry driver,54000,Married,1,4452.6,2015-01-01
80052064,Cook,Newton,Male,1998-01-06,K4L3M2,4,Merchant navy personnel,106000,Married,3,6420.6,2015-01-01
80052065,Stark,Mccullough,Male,2003-05-03,M5A3A4,2,Barrister,73000,Married,2,861,2015-01-01
80052066,Barton,Herring,Female,1978-07-04,M6D1O1,1,Art critic,46000,Single,0,5682.6,2015-01-01
80052067,Duke,James,Female,1971-06-27,L8H8Y5,4,Choreographer,41000,Divorced,3,2533.8,2015-01-01
80052068,Pennington,Patton,Female,1982-01-17,L3H7F1,1,Aircraft engineer,81000,Single,0,2017.2,2015-01-01
80052069,Prince,Cuevas,Female,1996-03-22,K8X4X6,4,Casual worker,105000,Single,0,2648.6,2015-01-01
80052070,Maynard,Middleton,Male,1969-04-12,N7M3D5,1,Counsellor,37000,Married,0,2960.2,2015-01-01
80052071,Alexander,Edwards,Male,1998-08-07,L5J1L5,1,Market trader,63000,Single,0,1697.4,2015-01-01
80052072,Mcfarland,Silva,Female,1998-07-31,M6O5P5,3,Sportsperson,82000,Single,0,5330,2015-01-01
80052073,Townsend,Spencer,Female,1997-12-28,N2A7A1,4,Business owner,60000,Married,3,2583,2015-01-01
80052074,Lyons,Walsh,Female,1977-09-19,M4H1C3,2,Cleric,46000,Married,3,1467.8,2015-01-01
80052075,Hoffman,Valencia,Male,1993-05-06,N4N6I7,1,Property developer,24000,Single,0,3780.2,2015-01-01
80052076,Rosales,Kramer,Female,1982-07-24,M7G2E4,4,Bank manager,108000,Married,3,5321.8,2015-01-01
80052077,Larsen,Gibson,Male,1981-07-17,N2R7L4,4,Handyman,74000,Single,0,2681.4,2015-01-01
80052078,Marquez,Delacruz,Female,1993-12-16,M4R2F2,1,Flying instructor,47000,Single,0,6469.8,2015-01-01
80052079,Vargas,Gillespie,Female,1979-06-07,M8W5E3,3,Homeopath,108000,Married,1,2205.8,2015-01-01
80052080,Cobb,Cooley,Male,2002-09-25,N2Q2U2,2,Moneylender,68000,Single,0,2312.4,2015-01-01
80052081,Bird,Larsen,Male,1977-09-19,M5T3W1,1,Butcher,38000,Married,0,500.2,2015-01-01
80052082,Larsen,Khan,Male,2003-08-14,M4F7I1,4,Composer,49000,Divorced,3,3780.2,2015-01-01
80052083,Brown,Payne,Female,1990-09-11,L1S7D1,3,Carpenter,33000,Married,2,631.4,2015-01-01
80052084,Blankenship,Combs,Male,1997-05-17,N3A3X2,1,Diver,93000,Married,2,2435.4,2015-01-01
80052085,Good,Dixon,Male,1986-11-27,M4Z7P5,2,Antique dealer,67000,Single,0,4272.2,2015-01-01
80052086,Cannon,Tucker,Male,1983-11-22,M5B1Z7,1,Laboratory technician,34000,Married,0,6084.4,2015-01-01
80052087,Grant,Larsen,Female,1980-08-28,N8M1P2,3,Business consultant,41000,Single,0,1344.8,2015-01-01
80052088,Delacruz,Lozano,Female,1991-08-18,L3C2W8,2,Barber,86000,Divorced,1,2993,2015-01-01
80052089,Neal,Castillo,Male,1987-03-25,M6X5Q7,2,Heating engineer,63000,Married,0,2640.4,2015-01-01
80052090,Moody,Manning,Male,1998-05-07,N7G2E7,1,Homemaker,84000,Single,0,5846.6,2015-01-01
80052091,Santos,Gentry,Male,1983-01-14,K4B3R4,1,Bank clerk,74000,Married,1,2476.4,2015-01-01
80052092,Hardy,Travis,Female,1994-07-21,L5X5C4,4,Anthropologist,64000,Married,0,2246.8,2015-01-01
80052093,Monroe,Kidd,Female,1998-07-01,N3U6F6,3,Brewer,38000,Married,3,6289.4,2015-01-01
80052094,Collier,Contreras,Male,2000-01-22,N4N2R2,3,Psychologist,43000,Married,2,3829.4,2015-01-01
80052095,Reyes,Avery,Female,1984-01-28,N8B8S1,2,Cleaner,99000,Married,0,5371,2015-01-01
80052096,Meyer,Peterson,Male,1979-12-22,L6V6E8,4,Health visitor,109000,Single,0,6248.4,2015-01-01
80052097,Mata,Myers,Male,1970-10-09,K8Y2V6,3,Butcher,107000,Single,0,4141,2015-01-01
80052098,Oconnell,Sosa,Female,1975-10-28,N1Z1A2,2,Minister,87000,Married,1,5772.8,2015-01-01
80052099,Wong,Mcclure,Female,1981-11-07,N7M4S2,1,Magician,56000,Married,0,1976.2,2015-01-01
80052100,Pham,Shannon,Male,1985-04-27,K8I8T7,1,Estate agent,29000,Single,0,4534.6,2015-01-01
80052101,Flowers,Howell,Male,1982-10-29,L3O7Q7,1,Accountant,89000,Single,0,2697.8,2015-01-01
80052102,Cantu,Munoz,Male,1992-05-08,L6P5G1,2,Independent means,107000,Married,3,1533.4,2015-01-01
80052103,Kirby,Harrison,Male,1979-10-18,L8G6Y5,1,Moneylender,70000,Single,0,4854.4,2015-01-01
80052104,Meyers,Long,Female,1978-05-14,M4B2L2,3,Gamekeeper,71000,Married,0,4059,2015-01-01
80052105,Mckee,Berg,Female,1973-03-21,N3W7L5,2,Funeral director,102000,Single,0,5403.8,2015-01-01
80052106,Rose,Patrick,Female,1976-12-02,L8K8S6,1,Art critic,71000,Single,0,844.6,2015-01-01
80052107,Garza,Tapia,Female,1970-03-20,M3Z4Z2,1,Social worker,42000,Married,1,885.6,2015-01-01
80052108,Rush,Dominguez,Male,2000-02-20,M1U5P7,2,Cashier,38000,Single,0,4887.2,2015-01-01
80052109,Fuentes,Floyd,Male,1994-06-29,K8G8A8,2,Dental hygienist,66000,Married,3,3977,2015-01-01
80052110,Gates,Owens,Male,1998-07-10,M7I7Q8,3,Company director,70000,Married,1,2443.6,2015-01-01
80052111,Trujillo,Underwood,Male,1979-01-01,L8W7D5,4,Retired,55000,Single,0,6314,2015-01-01
80052112,Gentry,White,Male,1995-11-19,M2R1H4,4,Musician,61000,Single,0,1451.4,2015-01-01
80052113,Thomas,Fitzpatrick,Female,1982-12-04,L2C4Q8,3,Careers advisor,103000,Single,0,5420.2,2015-01-01
80052114,Beard,Palmer,Female,1992-06-09,K7J6Y3,2,Ship builder,80000,Single,0,5838.4,2015-01-01
80052115,Bowman,Mckee,Female,2000-04-24,L7E1N7,3,Labourer,68000,Married,2,705.2,2015-01-01
80052116,Carson,Mcpherson,Female,1979-07-09,K6K4A8,2,Art historian,94000,Single,0,574,2015-01-01
80052117,Kramer,Duran,Male,1993-04-30,M5B2O2,4,Childcare worker,60000,Married,3,3517.8,2015-01-01
80052118,Blake,Rice,Male,1971-02-22,L1C4U8,4,Decorator,94000,Married,0,2066.4,2015-01-01
80052119,Roach,Moody,Female,1976-12-30,N5A8C8,2,Hypnotherapist,104000,Single,0,3903.2,2015-01-01
80052120,Boyd,Potts,Male,1972-05-06,K7U8C4,4,Author,91000,Single,0,4567.4,2015-01-01
80052121,Sanders,Manning,Male,1985-12-23,M3U6S3,1,Probation officer,97000,Married,1,6264.8,2015-01-01
80052122,Dunn,Maddox,Female,1999-01-29,K8Q2R6,2,Electrician,72000,Single,0,3796.6,2015-01-01
;
Run;

Data Error;
Set Customer;
Length Variable Value $30 Comment $500; 

** Range Check: Income **;
If Income<0 or Income>500000 then do;
Variable = "Income";
Value = put(Income, best.);
Comment = "The Income (" || compress(put(Income, best.)) || ") is out of the logical range.";
Output;
End;

** Range Check: Spend **;
If Spend<0 or Spend>3*Income then do;
Variable = "Spend";
Value = put(Spend, best.);
Comment = "The total spending (" || compress(put(Spend, best.)) || ") is out of the logical range.";
Output;
End;

** Range Check: Age **;
Age = floor((DOS-DOB)/365.25);
If Age<0 or Age>140 then do;
Variable = "Age";
Value = put(Age, best.);
Comment = "The age (" || compress(put(age, best.)) || ") is out of the logical range.";
Output;
End;

** Invalid Character Check: CustID **;
If length(custid)^=8 then do;
Variable = "CustID";
Value = CustID;
Comment = "The CustID (" || compress(CustID) || ") is not 8-character long.";
Output;
End;

If indexc(lowcase(custid), "!@#$%^&*()<>?{}:abcdefghijklmnopqrstuvwxyz")^=0 then do;
Variable = "CustID";
Value = CustID;
Comment = "The CustID (" || compress(CustID) || ") contains invalid character(s).";
Output;
End;

** Invalid Character Check: FIRST/LAST **;
If indexc(first, "!@#$%^&*()<>?{}:1234567890")^=0 then do;
Variable = "First";
Value = First;
Comment = "The First Name (" || compress(First) || ") contains invalid character(s).";
Output;
End;

** Invalid Character Check: FIRST/LAST **;
If indexc(last, "!@#$%^&*()<>?{}:1234567890")^=0 then do;
Variable = "Last";
Value = Last;
Comment = "The Last Name (" || compress(Last) || ") contains invalid character(s).";
Output;
End;

** Invalid Character Check: Occup **;
If indexc(Occup, "!@#$%^&*()<>?{}:1234567890")^=0 then do;
Variable = "Occup";
Value = Occup;
Comment = "The Occup (" || compress(Occup) || ") contains invalid character(s).";
Output;
End;

** Category Value Check: Gender **;
If Gender not in ("Male" "Female") then do;
Variable = "Gender";
Value = Gender;
Comment = "The Gender (" || compress(Gender) || ") can only be Male or Female.";
Output;
End;

** Category Value Check: EDU **;
If Edu not in (1, 2, 3, 4) then do;
Variable = "Edu";
Value = Edu;
Comment = "The Edu (" || compress(put(edu, edu.)) || ") contains invalid results.";
Output;
End;

** Category Value Check: Status **;
If Status not in ("Married" "Single" "Divorced") then do;
Variable = "Status";
Value = Status;
Comment = "The Status (" || compress(status) || ") can only be 'Married', 'Single' or 'Divorced'.";
Output;
End;

Keep CustID Variable Value Comment;
Run;

Proc Export Data=Error
OutFile='/home/u59478853/PROJ1/Error Report.xls'
Replace
Dbms=xls;
Run;

LIBNAME proj1 "/home/u59478853/PROJ1";
RUN;

PROC CONTENTS DATA = SASHELP.FISH;
RUN;

Data Cars;
Set SASHelp.cars;
Label EngineSize = "This is a modified label!";
Run;

Data Admission;
Input Applicant $ Crit1 $ Crit2 $ Crit3 $;
Datalines;
P00851 Met Met Met
P00852 Met NotMet Met
P00853 Met Met Met
P00854 NotMet NotMet NotMet
P00855 Met Met NotMet
P00856 Met Met Met
P00857 NotMet Met Met
P00858 Met NotMet Met
P00859 Met Met Met
P00860 Met Met Met
;
Run;

DATA Admission2;
	SET Admission;
	Label 
	Crit1 = "Applicant's GPA above 3.5"
	Crit2 = "Applicant's did not fail more than 4 courses"
	Crit3 = "Applicant's has a Bachelor of Science degree";
Run;

DATA prof;
	Length PhoneNo $12;
	Input Name $ PhoneNo $ Gender $;
	Datalines;
	Jason 213-456-7890 Male
	Benjamin 987-654-3210 Female
	;
Run;
	
Data Transac;
Input Order $ Date Time Total;
Datalines;
BA00001 19000 40143 1432
BA00002 19000 51865 1455
BA00003 19000 68954 2435
BA00004 19000 49865 894
BA00005 19000 53214 1745
BA00006 19000 64521 997
BA00007 19000 74521 562
BA00008 19000 56321 132
BA00009 19000 51236 987
BA00010 19000 45698 562
;
Run;

Data Transac2;
Set Transac;
Format Date yymmdd10. Time time5. Total dollar10.;
Run;

2012-01-08

Data RNumber;
Input Num1;
Dataline

s;
23483.8492342
432.2348934
5489345.23423
432.53242
98349.2343
45893495.2343
45489.3454
6845984.234
58498349.543
25484.23545
;
Run;

Data Transac;
Input Order $ Date Time Total;
Datalines;
BA00001 19000 40143 1432
BA00002 19000 51865 1455
BA00003 19000 68954 2435
BA00004 19000 49865 894
BA00005 19000 53214 1745
BA00006 19000 64521 997
BA00007 19000 74521 562
BA00008 19000 56321 132
BA00009 19000 51236 987
BA00010 19000 45698 562
;
Run;

DATA transac2;
set transac;
format total2 dollar9.2;
Total2 = total * 1.1475;
Run;

Data DenAppt;
Input Date Time NumDays;
Format Date yymmdd10. time time5.;
Datalines;
20100 30000 30
20110 40000 60
20115 46000 14
20103 36000 90
20120 42000 60
20117 44000 30
20111 38000 14
20109 37000 21
20102 33000 28
;
Run;


Data DenAppt2;
Set DenAppt;
Format NextAppt YYMMDD10.;
NextAppt = Date + NumDays;
Run;

Data Attendance;
Input EmpID $ Date In Out;
Datalines;
ID501 20010 28800 61200
ID502 20010 30400 63200
ID503 20010 29800 61800
ID504 20010 33600 61700
ID505 20010 27800 60200
ID506 20010 29400 61900
ID507 20010 29300 61850
ID508 20010 31600 62930
ID509 20010 32400 62300
ID510 20010 31200 61590
;
Run;

DATA attendnace2;
	set attendance;
	format date yymmdd10. In Out
	Time8.;
	
	If in > 32400 then Late = "yes";
	run;
	
Data Profile;
Length ID Gender Race $20.;
Input ID Gender $ Race $;
Datalines;
ID001 Male Caucasian
ID002 Female Asian
ID003 Female Black
ID004 Male Asian
ID005 Male Caucasian
ID006 Female Caucasian
ID007 Male Black
ID008 Female Black
ID009 Male Caucasian
ID010 Male Caucasian
;
Run;

Proc Format;
Value Gender 1 = "Male"
2 = "Female";
Value Race 1 = "Caucasian"
2 = "Black"
3 = "Asian";
Run;

Data Profile2;
Set Profile;

Format Gender2 Gender. Race2 Race.;

If Gender = "Male" then Gender2 = 1;
else if Gender = "Female" then Gender2 = 2;

If Race = "Caucasian" then Race2 = 1;
else if Race = "Black" then Race2 = 2;
else if Race = "Asian" then Race2 = 3;

Drop Gender Race;

Run;

Proc Format;
Value Ques
1 = "Strongly Disagree"
2 = "Disagree"
3 = "Neutral"
4 = "Agree"
5 = "Strongly Agree";
Run;

Data Survey;
Input Q1 Q2 Q3 Q4;
Format Q1 Q2 Q3 Q4 Ques.;
Datalines;
3 1 2 4 5
1 1 1 1 1
5 3 5 5 5
4 5 3 2 2
1 3 5 4 5
2 3 5 4 5
3 4 5 2 3
2 4 1 3 5
5 4 4 4 4
1 1 2 5 4
;
Run;

Data Survey2;
Set Survey;
Format Q1 Q2 Q3 Q4 Best.;
Run;

Data Trtment;
Input PATID $Infdt TrtDt;
Format Infdt Trtdt Date9.;
Datalines;
PAT1001 20100 20102
PAT1002 20101 20102
PAT1003 20103 20102
PAT1004 20102 20102
PAT1005 20100 20102
PAT1006 20101 20102
PAT1007 20103 20102
PAT1008 20100 20102
PAT1009 20102 20102
PAT1010 20100 20102
;
Run;

Data Vio;
Set Trtment;
If Infdt > TrtDt then do;
Comment = "Patient " || Compress(PATID) || " received his/her first treatment on " || Put(TrtDt, MMDDYY10.) || ". However, the treatment is received prior to the date of informed consent (" || put(Infdt, MMDDYY10.) || ").";
Output;
End;

Keep Patid comment;
Run;

Data Conv;
Input Date $10.;
Datalines;
2015-01-01
2015-02-01
2015-03-01
2015-04-01
2015-05-01
2015-06-01
2015-07-01
2015-
2015-01-01
2015-10-01
2015-11-01
2015-12-01
;
Run;

Data Survey;
Input Q1 Q2 Q3;
Datalines;
1 3 5
2 4 3
1 2 1
5 5 5
4 5 3
4 3 3
2 3 1
1 5 5
2 4 5
4 3 5
;
Run;

Proc Format;
Value Ques 
1= "Strongly Disagree"
2= "Somewhat Disagree"
3= "Neither Agree nor Disagree"
4= "Somewhat Agree"
5= "Strongly Agree";
Run;

Data Survey2;
Set Survey;
Format Q1 Q2 Q3 Ques.;
Label
Q1 = "Customer service representatives (CSRs) are well supervised."
Q2 = "Customer service representatives (CSRs) adhere to professional standards of conduct."
Q3 = "Customer service representatives (CSRs) act in my best interest.";
Run;




Data Listing;
Length Adv_ID DateList NumMth Price $15;
Input Adv_ID $ DateList $ NumMth $ Price $;
Datalines;
K9933-00019 01MAR2015 3 $650,000
K9933-00020 15FEB2015 2 $380,000
K9933-00021 12APR2015 4 $890,000
K9933-00022 09MAY2015 3 $890,000
K9933-00023 22FEB2015 2 $450,000
K9933-00024 08APR2015 2 $360,000
K9933-00025 03MAR2015 5 $440,000
K9933-00026 28FEB2015 3 $860,000
K9933-00027 19JAN2015 4 $740,000
K9933-00028 01JAN2015 1 $980,000
;
Run;

Data Listing2;
Set Listing;

Format DateList2 Date9. NumMth2 Best. Price2 dollar8.;

DateList2 = input(DateList, date9.);
NumMth2 = input(NumMth, best.);
Price2 = input(Price, dollar8.);

Drop DateList NumMth Price;
Run;

​

proc contents data = sashelp.jac;run; 



data temp;
input hour temp;
datalines;
1 19.3
2 18.1
3 19.6
4 20.7
5 22.3
6 21.4
7 19.8
8 18.1
9 16.8
10 17.1
11 17.2
12 15.6
;
run;

data temp2;
set temp;
format fah 4.1;
Fah = temp * 9/5 + 32;
run;

Data Drinks;
Infile Datalines dsd;
Input Type $ Name:$50. Calories Fat;
Datalines;
Cold,Caramel Frappuccino® Light Blended Beverage,100,0
Cold,Coffee Frappuccino® Blended Beverage,180,2.5
Cold,Teavana® Shaken Iced Passion Tango™ Tea,0,0
Cold,Shaken Tazo® Iced Black Tea Lemonade,100,0
Cold,Nonfat Iced Vanilla Latte,120,0
Cold,Nonfat Iced Caramel Macchiato,140,1
Cold,Iced Coffee (with classic syrup),60,0
Cold,Iced Skinny Latte,70,0
Hot,Brewed Coffee,5,0
Hot,Brewed Tea,0,0
Hot,Nonfat Green Tea Latte,210,0
Hot,Nonfat Cappuccino,60,0
Hot,Nonfat Caffè Latte,100,0
Hot,Nonfat Caramel Macchiato,140,1
Hot,Soy Chai Tea Latte,180,2
Hot,Nonfat Caffè Mocha – hold the whip,170,2
Hot,Skinny Vanilla Latte,100,0
Hot,Steamed Apple Juice,170,0
Hot,Caffè Americano,10,0
;
Run;

PROC SORT DATA=drinks;
BY Type DESCENDING FAT;
run;

PROC SORT DATA=SASHELP.CARS OUT=Carz;
By descending MSRP;
WHERE Make in ("BMW" "Audi" "Lexus" "Mercedes-Benz" "Porsche");
RUN;

Data Supermarket;
Infile datalines dsd;
Input Product : $20. Price DemandPerWeek ;
Datalines;
Campbell Soup,3.99,150
Lay's Chip,2.99,300
Kinder Chocolate,5.99,50
Nestle Ice cream,6.99,80
Maxwell Coffee,5.99,90
Coca cola,5.99,300
Pringles,2.99,200
Pringles,2.99,200
Lipton Milk Tea,3.99,150
Flamingo Fried Chicken,8.99,60
Dempster's Bread,1.99,450
;
Run;

Data Income;
Input HouseholdID $ NumMembers HomeOwner $ Income $;
Datalines;
HID1001 4 Yes >120000
HID1002 3 No <120000 hid1003 2 yes>120000
HID1004 6 Yes >120000
HID1004 6 Yes >120000
HID1005 6 No <120000 hid1006 4 yes>120000
HID1007 5 Yes <120000 hid1008 3 yes>120000
HID1009 5 Yes <120000 hid1010 4 no>120000
;
Run;

proc sort  data = income out = income2
NODUPKEY;
BY Househould id nummembers homeowner income;
run;

Proc Sort Data=SASHelp.Fish Out=Fish;
By Species Weight;
Run;

Data Fish2;
Set Fish;
By Species Weight;
if last.species then i=2;
Run;

Proc Sort Data=SASHelp.Cars Out=Cars;
By Make Horsepower;
Run;

Data Cars2;
Set Cars;
By Make Horsepower;
if first.make then i=1;
else if last.make then i=2;
if i in (1, 2);
Run;

data prsdsale;
set sashelp.prdsal2 sashelp.prdsal3;
run;

data desks1;
infile datalines dsd;
length Brand $10 category $12;
input Brand $ Category $ Price Width Depth Height;
datalines;
MICKE,Desk,59.99,73,50,75
BEKANT,Desk,179.00,140,60,65
MICKE,Work station,149.00,105,50,140
VITTSJÖ,Laptop table,39.99,100,36,74
BESTÅ BURS,Desk,199.00,120,40,74
;
Run;

data desks2;
infile datalines dsd;
length Product $12 Type $28;
input Product $ Type $ Price WGT DPT HGT;
datalines;
HEMNES,Desk with add-on unit,449.00,155,65,137
MALM,Desk with pull-out panele,179.00,151,65,73
IKEA PS 2014,Standing laptop station,69.99,45,34,96
VITTSJÖ,Laptop stand,24.99,55,65,35
MICKE,Desk with integrated storage,99.00,120,50,75
;
Run;

Data Desks;
Length Brand $12 Category $30;
Set Desks1 Desks2 (rename=(Product=Brand Type=Category WGT=width DPT=depth HGT=height));
Run;

Data Cust;
Input ID Zip ;
Datalines;
9000135 14304
9000133 14300
9000134 14301
9000138 14308
9000136 14308
9000137 14304
9000142 14304
9000139 14300
9000140 14301
9000141 14308
;
Run;

Data Purchase;
Input ID Purchase : dollar5.0;
Datalines;
9000135 720
9000133 1002
9000134 569
9000140 890
9000141 780
9000136 109
9000137 30
9000138 4566
9000139 50
9000142 325
;
Run;

proc sort data=cust;
by ID;
run;

proc sort data=purchase;
by ID;
run;

data cust2;
merge cust purchase;
by id;
run;

Data Population;
Input Country $ City: $30. Population;
Datalines;
Canada Toronto 6000000
Canada Montreal 4000000
Canada Vancouver 2400000
US Chicago 2700000
US New_York 8400000
US Los_Angeles 3800000
Mexico Mexico_City 8500000
Mexico Cancun 620000
;
Run;

Data Uber;
Input Country $ Cities: $30. NumDriver;
Datalines;
US Chicago 20000
US New_York 14000
US Los_Angeles 16000
Canada Toronto 13000
Canada Montreal 5000
Mexico Mexico_City 20000
Mexico Cancun 11000
Canada Vancouver 7000
;
Run;

proc sort data=population;
by country city;
run;

proc sort data=uber;
by country cities;
run;

data ratio;
merge population uber (rename=(cities=city));
by country city;
ratio = NumDriver/population;
run;
Data Transac;
Input Order $ Province : $30. Total;
Datalines;
BA00001 Ontario 1432
BA00002 Ontario 1455
BA00003 Ontario 2435
BA00004 Quebec 894
BA00005 Quebec 1745
BA00006 Quebec 997
BA00007 Alberta 562
BA00008 Alberta 132
BA00009 Alberta 987
BA00010 Manitoba 562
;
Run;

Data Tax;
Input Province : $30. Tax;
Datalines;
Ontario 13
Quebec 14.975
Alberta 5
Manitoba 5
;
Run;


proc sort data=transac;
by province;
run;

proc sort data=tax;
by province;
run;

data transac2;
merge transac (in=a) tax (in=b);
by province;
if a and b then i=1;
else if a then i=2;
else if b then i=3;

Total2 = Total * (1 + tax/100);

run;

Data TEMP;
Input Hours $ Temperature;
Datalines;
H0 15
H1 13
H2 13
H3 14
H4 14
H5 14
H6 13
H7 14
H8 14
H9 14
H10 14
H11 15
H12 16
H13 17
H14 16
H15 16
H16 16
H17 15
H18 15
H19 14
H20 14
H21 14
H22 14
H23 15
;
run;

Proc Transpose Data=Temp Out=Temp2;
Id Hours;
Var Temperature;
Run;

Data Temp3;
Set Temp2;
Format Before12 After12 3.0;
Before12 = mean(of H0-H11);
After12 = mean(of H12-H23);
Run;

Data Food;
Input Restaurant : $30. Coffee Muffin Cookies;
Datalines;
McDonald's 1.75 1.5 1.3
;
Run;

Data t_q2;
Input Store $ name $ april may june;
Datalines;
Store1 profit 169000 104000 178000
Store2 profit 105000 130000 145000
;
Run;

PROC TRANSPOSE DATA =t_q2
Out = shit;
var april may june;
by store;
run;

PROC sort data=sashelp.cars
out=cars;
by descending horsepower;
run;

data cars2;
set cars;
if _n_ >=3;
Run;

Data Inventory;
Infile datalines dsd;
Input Product : $30. Store : $10. Qty;
Datalines;
Billy's Bookshelf,Store 1, 150
Billy's Bookshelf,Store 2, 200
Billy's Bookshelf,Store 3, 230
Billy's Bookshelf,Store 4, 160
Billy's Bookshelf,Store 5, 180
Billy's Bookshelf,Store 6, 220
Billy's Bookshelf,Store 7, 130
Billy's Bookshelf,Store 8, 450
Billy's Bookshelf,Store 9, 260
Billy's Bookshelf,Store 10, 300
;
Run;

DATA inventory2;
set inventory;
retain total;
if _n_ = 1 then Total = 0;
Total = sum(QTY,total);
Run;

DATA inventory2;
set inventory;
retain total;
total = sum(QTY,total);
RUN;

Data Inventory;
Infile datalines dsd;
Input Product : $30. Store : $10. Qty;
Datalines;
Billy's Bookshelf,Store 1, 150
Billy's Bookshelf,Store 2, 200
Billy's Bookshelf,Store 3, 230
Billy's Bookshelf,Store 4, 160
Billy's Bookshelf,Store 5, 180
Billy's Bookshelf,Store 6, 220
Billy's Bookshelf,Store 7, 130
Billy's Bookshelf,Store 8, 450
Billy's Bookshelf,Store 9, 260
Billy's Bookshelf,Store 10, 300
;
Run;

/* POPULAR SAS BASE EXAM QUESITON */

DATA inventory2;
set inventory;
retain total 1500;
total = sum(qty, total);
run;

Data Inventory;
Infile datalines dsd;
Input Product : $30. Store : $10. Qty;
Datalines;
Billy's Bookshelf,Store 1, 150
Billy's Bookshelf,Store 2, 200
Billy's Bookshelf,Store 3, 230
Billy's Bookshelf,Store 4, 160
Billy's Bookshelf,Store 5, 180
Billy's Bookshelf,Store 6, 220
Billy's Bookshelf,Store 7, 130
Billy's Bookshelf,Store 8, 450
Billy's Bookshelf,Store 9, 260
Billy's Bookshelf,Store 10, 300
;
Run;

data shit;
set inventory;
total+qty;
run;

/* end popular sas base question */

Data Shoes;
Set sashelp.shoes;
rate = returns / sales;
Run;

Proc Sort Data=Shoes;
by region rate;
Run;

Data shoes3;
set shoes;
by region rate;
if last.region;
Run;
Data Demo;
Input Index $ Age Income;
Datalines;
ID5001 28 56000
ID5002 42 60000
ID5003 34 35000
ID5004 35 44000
ID5005 60 87500
ID5006 44 69000
ID5007 18 45000
ID5008 22 54000
ID5009 47 46000
ID5010 36 73000
;
Run;

Proc Univariate Data=Demo;
Var Age;
Run;

proc univariate data =demo;
var income;
run;

proc univariate data= sashelp.cars
normal plots;
Var MSRP;
histrogram;
Run;

Proc Univariate Data=SASHelp.cars;
Class Make;
Var Horsepower;
Where Make in ("Audi" "BMW");
Run;

proc univariate data=sashelp.fish
noprint;
var weight;
class species;
output out=fish2 max=maxweight;
run;

libname proj1 '/home/u59478853/PROJ1';RUN;


Data Pharma;
Infile datalines dsd;
Input Rank Company :$30. Rev2014 Rev2013 GrowthR GrowthPer;
Datalines;
1,Novartis,47101,47468,-367,-1
2,Pfizer,45708,47878,-2170,-5
3,Roche,39120,39163,-43,0
4,Sanofi,36437,37124,-687,-2
5,Merck & Co.,36042,37437,-1395,-4
6,Johnson & Johnson,32313,28125,4188,15
7,GlaxoSmithKline,29580,33330,-3750,-11
8,AstraZeneca,26095,25711,384,1
9,Gilead Sciences,24474,10804,13670,127
10,Takeda,20446,19158,1288,7
;
Run;

PROC MEANS DATA=phrama;
var revenue;
run;

proc means data=pharma mean std stderr clm;
var rev2013;
run;

Data Cotton;
Input ID Materials $ Origin $ Price;
Datalines;
6501 Cotton China 7
6502 Cotton China 6.5
6503 Cotton China 17
6504 Cotton China 10
6505 Cotton China 8
6506 Cotton China 5.5
6507 Cotton China 3
6508 Cotton China 4.8
6509 Cotton China 9
6510 Cotton China 13
6511 Cotton Pakistan 21
6512 Cotton Pakistan 23
6513 Cotton Pakistan 27
6514 Cotton Pakistan 32
6515 Cotton Pakistan 12
6516 Cotton Pakistan 16
6517 Cotton Pakistan 14
6518 Cotton Pakistan 13.5
6519 Cotton Pakistan 17
6510 Cotton Pakistan 16.5
;
Run;

proc means data=cotton range q1 median q3;
var price;
class origin;
run;

Data Stocks;
Infile datalines dlm='~';
Input Date Open High Low Close;
Format Date yymmdd10.;
datalines;
20384~52.30~54.07~52.25~52.87
20383~47.53~48.95~47.09~48.03
20382~47.92~47.99~47.11~47.20
20381~47.44~47.81~47.02~47.77
20380~47.42~47.88~47.02~47.62
20377~47.02~47.54~46.90~47.51
20376~47.01~47.03~46.53~47.01
20375~46.65~47.10~46.53~46.68
20374~46.56~47.13~46.56~46.89
20373~46.98~47.07~46.50~47.00
;
Run;

proc means data = stocks;
var open high low close;
run;

Data Num;
Input RNumber;
Datalines;
56
78
44
33
59
89
105
85
45
66
;
Run;



Data Num2;
Set Num;
i = 1; *Create an arbitrary variable for merging purpose;
Run;

proc means data=num2 noprint;
Var Rnumber;
By i;
Output out=stat mean=mean std=std;
run;

Data Zscore;
Merge Num2 Stat;
By i;
Zscore = (Rnumber - Mean)/std;
Run;

Proc Means Data=SASHelp.cars noprint;
Var Horsepower;
Class Make Type;
Output Out = Cars2 Mean=Mean STD=STD;
Run;

Data Cars3;
Set Cars2;
if _Type_ = 3;
Run;



Proc Means Data=SASHelp.cars nway noprint;
Var Horsepower;
Class Make Type;
Output Out = Cars2 Mean=Mean STD=STD;
Run;

Data GUMSALES;
Input ReceiptID : $20. Brand $ Price;
Datalines;
ORD-01012015-001 Brand_A 0.99
ORD-01012015-002 Brand_B 0.89
ORD-01012015-003 Brand_B 0.89
ORD-01012015-004 Brand_C 1.29
ORD-01012015-005 Brand_C 1.29
ORD-01012015-006 Brand_C 1.29
ORD-01012015-007 Brand_C 1.29
ORD-01012015-008 Brand_A 0.99
ORD-01012015-009 Brand_A 0.99
ORD-01012015-010 Brand_C 1.29
ORD-01012015-011 Brand_B 0.89
ORD-01012015-012 Brand_B 0.89
ORD-01012015-013 Brand_A 0.99
ORD-01012015-014 Brand_A 0.99
ORD-01012015-015 Brand_B 0.89
ORD-01012015-016 Brand_C 1.29
ORD-01012015-017 Brand_A 0.99
ORD-01012015-018 Brand_C 1.29
ORD-01012015-019 Brand_A 0.99
ORD-01012015-020 Brand_B 0.89
;
Run;

proc freq data = gumsales;
	table brand;
run;

proc freq data=sashelp.cars;
table make / plots = freqplot;
run;

Data Library;
Infile Datalines dsd;
Input Book :$30. Library :$30. N;
Datalines;
SAS For Dummies,Markham,3
SAS For Dummies,Toronto,5
SAS For Dummies,North York,10
SAS Base Prep Guide,Markham,2
SAS Base Prep Guide,Toronto,2
SAS Base Prep Guide,North York,8
SASCrunch Training,Markham,20
SASCrunch Training,Toronto,40
SASCrunch Training,Toronto,50
;
Run;

proc freq data = library;
table book;
weight N;
Run;

Data Trtmt;
Infile Datalines dsd;
Input PSID $ Trt :$20. Days;
Datalines;
ID251,Real Treatment,2
ID252,Placebo,1
ID253,Real Treatment,3
ID254,Real Treatment,2
ID255,Placebo,2
ID256,Placebo,4
ID257,Placebo,2
ID258,Placebo,5
ID259,Real Treatment,4
ID260,Real Treatment,2
ID261,Real Treatment,3
ID262,Placebo,2
ID263,Real Treatment,1
ID264,Real Treatment,2
ID265,Placebo,3
ID266,Real Treatment,1
ID267,Placebo,0
ID268,Placebo,2
ID269,Real Treatment,0
ID270,Placebo,2
;
Run;

proc freq data = trtmt;
table trt * days;
run;

proc freq sashelp.class noprint;
table sex * age/ out = shit;
run;

Data AQI;
Input City $ Test $ Year Month Day Hour AQI Unit $;
Datalines;
Beijing PM2.5 2014 9 1 0 188 µg/m³
Beijing PM2.5 2014 9 1 1 206 µg/m³
Beijing PM2.5 2014 9 1 2 210 µg/m³
Beijing PM2.5 2014 9 1 3 180 µg/m³
Beijing PM2.5 2014 9 1 4 181 µg/m³
Beijing PM2.5 2014 9 1 5 149 µg/m³
Beijing PM2.5 2014 9 1 6 100 µg/m³
Beijing PM2.5 2014 9 1 7 83 µg/m³
Beijing PM2.5 2014 9 1 8 45 µg/m³
Beijing PM2.5 2014 9 1 9 29 µg/m³
Beijing PM2.5 2014 9 1 10 15 µg/m³
Beijing PM2.5 2014 9 1 11 14 µg/m³
Beijing PM2.5 2014 9 1 12 17 µg/m³
Beijing PM2.5 2014 9 1 13 12 µg/m³
Beijing PM2.5 2014 9 1 14 10 µg/m³
Beijing PM2.5 2014 9 1 15 10 µg/m³
Beijing PM2.5 2014 9 1 16 14 µg/m³
Beijing PM2.5 2014 9 1 17 29 µg/m³
Beijing PM2.5 2014 9 1 18 51 µg/m³
Beijing PM2.5 2014 9 1 19 48 µg/m³
Beijing PM2.5 2014 9 1 20 74 µg/m³
Beijing PM2.5 2014 9 1 21 93 µg/m³
Beijing PM2.5 2014 9 1 22 112 µg/m³
Beijing PM2.5 2014 9 1 23 125 µg/m³
Beijing PM2.5 2014 9 2 0 133 µg/m³
Beijing PM2.5 2014 9 2 1 150 µg/m³
Beijing PM2.5 2014 9 2 2 124 µg/m³
Beijing PM2.5 2014 9 2 3 135 µg/m³
Beijing PM2.5 2014 9 2 4 143 µg/m³
Beijing PM2.5 2014 9 2 5 139 µg/m³
Beijing PM2.5 2014 9 2 6 128 µg/m³
Beijing PM2.5 2014 9 2 7 134 µg/m³
Beijing PM2.5 2014 9 2 8 146 µg/m³
Beijing PM2.5 2014 9 2 9 154 µg/m³
Beijing PM2.5 2014 9 2 10 157 µg/m³
Beijing PM2.5 2014 9 2 11 174 µg/m³
Beijing PM2.5 2014 9 2 12 158 µg/m³
Beijing PM2.5 2014 9 2 13 151 µg/m³
Beijing PM2.5 2014 9 2 14 141 µg/m³
Beijing PM2.5 2014 9 2 15 137 µg/m³
Beijing PM2.5 2014 9 2 16 144 µg/m³
Beijing PM2.5 2014 9 2 17 144 µg/m³
Beijing PM2.5 2014 9 2 18 159 µg/m³
Beijing PM2.5 2014 9 2 19 166 µg/m³
Beijing PM2.5 2014 9 2 20 183 µg/m³
Beijing PM2.5 2014 9 2 21 228 µg/m³
Beijing PM2.5 2014 9 2 22 257 µg/m³
Beijing PM2.5 2014 9 2 23 306 µg/m³
Beijing PM2.5 2014 9 3 0 222 µg/m³
Beijing PM2.5 2014 9 3 1 193 µg/m³
Beijing PM2.5 2014 9 3 2 188 µg/m³
Beijing PM2.5 2014 9 3 3 182 µg/m³
Beijing PM2.5 2014 9 3 4 184 µg/m³
Beijing PM2.5 2014 9 3 5 209 µg/m³
Beijing PM2.5 2014 9 3 6 225 µg/m³
Beijing PM2.5 2014 9 3 7 238 µg/m³
Beijing PM2.5 2014 9 3 8 246 µg/m³
Beijing PM2.5 2014 9 3 9 269 µg/m³
Beijing PM2.5 2014 9 3 10 284 µg/m³
Beijing PM2.5 2014 9 3 11 260 µg/m³
Beijing PM2.5 2014 9 3 12 295 µg/m³
Beijing PM2.5 2014 9 3 13 322 µg/m³
Beijing PM2.5 2014 9 3 14 308 µg/m³
Beijing PM2.5 2014 9 3 15 271 µg/m³
Beijing PM2.5 2014 9 3 16 240 µg/m³
Beijing PM2.5 2014 9 3 17 230 µg/m³
Beijing PM2.5 2014 9 3 18 237 µg/m³
Beijing PM2.5 2014 9 3 19 242 µg/m³
Beijing PM2.5 2014 9 3 20 241 µg/m³
Beijing PM2.5 2014 9 3 21 238 µg/m³
Beijing PM2.5 2014 9 3 22 255 µg/m³
Beijing PM2.5 2014 9 3 23 266 µg/m³
Beijing PM2.5 2014 9 4 0 255 µg/m³
Beijing PM2.5 2014 9 4 1 232 µg/m³
Beijing PM2.5 2014 9 4 2 226 µg/m³
Beijing PM2.5 2014 9 4 3 215 µg/m³
Beijing PM2.5 2014 9 4 4 75 µg/m³
Beijing PM2.5 2014 9 4 5 3 µg/m³
Beijing PM2.5 2014 9 4 6 4 µg/m³
Beijing PM2.5 2014 9 4 7 7 µg/m³
Beijing PM2.5 2014 9 4 8 6 µg/m³
Beijing PM2.5 2014 9 4 9 14 µg/m³
Beijing PM2.5 2014 9 4 10 13 µg/m³
Beijing PM2.5 2014 9 4 11 8 µg/m³
Beijing PM2.5 2014 9 4 12 11 µg/m³
Beijing PM2.5 2014 9 4 13 13 µg/m³
Beijing PM2.5 2014 9 4 14 11 µg/m³
Beijing PM2.5 2014 9 4 15 7 µg/m³
Beijing PM2.5 2014 9 4 16 8 µg/m³
Beijing PM2.5 2014 9 4 17 11 µg/m³
Beijing PM2.5 2014 9 4 18 12 µg/m³
Beijing PM2.5 2014 9 4 19 13 µg/m³
Beijing PM2.5 2014 9 4 20 9 µg/m³
Beijing PM2.5 2014 9 4 21 9 µg/m³
Beijing PM2.5 2014 9 4 22 7 µg/m³
Beijing PM2.5 2014 9 4 23 14 µg/m³
Beijing PM2.5 2014 9 5 0 10 µg/m³
Beijing PM2.5 2014 9 5 1 9 µg/m³
Beijing PM2.5 2014 9 5 2 18 µg/m³
Beijing PM2.5 2014 9 5 3 14 µg/m³
Beijing PM2.5 2014 9 5 4 12 µg/m³
Beijing PM2.5 2014 9 5 5 26 µg/m³
Beijing PM2.5 2014 9 5 6 30 µg/m³
Beijing PM2.5 2014 9 5 7 35 µg/m³
Beijing PM2.5 2014 9 5 8 27 µg/m³
Beijing PM2.5 2014 9 5 9 13 µg/m³
Beijing PM2.5 2014 9 5 10 18 µg/m³
Beijing PM2.5 2014 9 5 11 27 µg/m³
Beijing PM2.5 2014 9 5 12 23 µg/m³
Beijing PM2.5 2014 9 5 13 25 µg/m³
Beijing PM2.5 2014 9 5 14 27 µg/m³
Beijing PM2.5 2014 9 5 15 26 µg/m³
Beijing PM2.5 2014 9 5 16 32 µg/m³
Beijing PM2.5 2014 9 5 17 39 µg/m³
Beijing PM2.5 2014 9 5 18 49 µg/m³
Beijing PM2.5 2014 9 5 19 48 µg/m³
Beijing PM2.5 2014 9 5 20 49 µg/m³
Beijing PM2.5 2014 9 5 21 16 µg/m³
Beijing PM2.5 2014 9 5 22 12 µg/m³
Beijing PM2.5 2014 9 5 23 12 µg/m³
Beijing PM2.5 2014 9 6 0 11 µg/m³
Beijing PM2.5 2014 9 6 1 8 µg/m³
Beijing PM2.5 2014 9 6 2 11 µg/m³
Beijing PM2.5 2014 9 6 3 9 µg/m³
Beijing PM2.5 2014 9 6 4 9 µg/m³
Beijing PM2.5 2014 9 6 5 12 µg/m³
Beijing PM2.5 2014 9 6 6 16 µg/m³
Beijing PM2.5 2014 9 6 7 14 µg/m³
Beijing PM2.5 2014 9 6 8 23 µg/m³
Beijing PM2.5 2014 9 6 9 16 µg/m³
Beijing PM2.5 2014 9 6 10 10 µg/m³
Beijing PM2.5 2014 9 6 11 13 µg/m³
Beijing PM2.5 2014 9 6 12 15 µg/m³
Beijing PM2.5 2014 9 6 13 12 µg/m³
Beijing PM2.5 2014 9 6 14 11 µg/m³
Beijing PM2.5 2014 9 6 15 12 µg/m³
Beijing PM2.5 2014 9 6 16 12 µg/m³
Beijing PM2.5 2014 9 6 17 17 µg/m³
Beijing PM2.5 2014 9 6 18 27 µg/m³
Beijing PM2.5 2014 9 6 19 29 µg/m³
Beijing PM2.5 2014 9 6 20 41 µg/m³
Beijing PM2.5 2014 9 6 21 41 µg/m³
Beijing PM2.5 2014 9 6 22 53 µg/m³
Beijing PM2.5 2014 9 6 23 67 µg/m³
Beijing PM2.5 2014 9 7 0 70 µg/m³
Beijing PM2.5 2014 9 7 1 84 µg/m³
Beijing PM2.5 2014 9 7 2 91 µg/m³
Beijing PM2.5 2014 9 7 3 99 µg/m³
Beijing PM2.5 2014 9 7 4 97 µg/m³
Beijing PM2.5 2014 9 7 5 100 µg/m³
Beijing PM2.5 2014 9 7 6 97 µg/m³
Beijing PM2.5 2014 9 7 7 86 µg/m³
Beijing PM2.5 2014 9 7 8 92 µg/m³
Beijing PM2.5 2014 9 7 9 64 µg/m³
Beijing PM2.5 2014 9 7 10 40 µg/m³
Beijing PM2.5 2014 9 7 11 26 µg/m³
Beijing PM2.5 2014 9 7 12 21 µg/m³
Beijing PM2.5 2014 9 7 13 14 µg/m³
Beijing PM2.5 2014 9 7 14 17 µg/m³
Beijing PM2.5 2014 9 7 15 20 µg/m³
Beijing PM2.5 2014 9 7 16 31 µg/m³
Beijing PM2.5 2014 9 7 17 40 µg/m³
Beijing PM2.5 2014 9 7 18 38 µg/m³
Beijing PM2.5 2014 9 7 19 41 µg/m³
Beijing PM2.5 2014 9 7 20 51 µg/m³
Beijing PM2.5 2014 9 7 21 69 µg/m³
Beijing PM2.5 2014 9 7 22 77 µg/m³
Beijing PM2.5 2014 9 7 23 111 µg/m³
Beijing PM2.5 2014 9 8 0 144 µg/m³
Beijing PM2.5 2014 9 8 1 133 µg/m³
Beijing PM2.5 2014 9 8 2 110 µg/m³
Beijing PM2.5 2014 9 8 3 143 µg/m³
Beijing PM2.5 2014 9 8 4 136 µg/m³
Beijing PM2.5 2014 9 8 5 141 µg/m³
Beijing PM2.5 2014 9 8 6 160 µg/m³
Beijing PM2.5 2014 9 8 7 159 µg/m³
Beijing PM2.5 2014 9 8 8 167 µg/m³
Beijing PM2.5 2014 9 8 9 188 µg/m³
Beijing PM2.5 2014 9 8 10 196 µg/m³
Beijing PM2.5 2014 9 8 11 205 µg/m³
Beijing PM2.5 2014 9 8 12 201 µg/m³
Beijing PM2.5 2014 9 8 13 201 µg/m³
Beijing PM2.5 2014 9 8 14 202 µg/m³
Beijing PM2.5 2014 9 8 15 201 µg/m³
Beijing PM2.5 2014 9 8 16 187 µg/m³
Beijing PM2.5 2014 9 8 17 187 µg/m³
Beijing PM2.5 2014 9 8 18 199 µg/m³
Beijing PM2.5 2014 9 8 19 206 µg/m³
Beijing PM2.5 2014 9 8 20 213 µg/m³
Beijing PM2.5 2014 9 8 21 187 µg/m³
Beijing PM2.5 2014 9 8 22 218 µg/m³
Beijing PM2.5 2014 9 8 23 134 µg/m³
Beijing PM2.5 2014 9 9 0 131 µg/m³
Beijing PM2.5 2014 9 9 1 154 µg/m³
Beijing PM2.5 2014 9 9 3 112 µg/m³
Beijing PM2.5 2014 9 9 3 55 µg/m³
Beijing PM2.5 2014 9 9 4 172 µg/m³
Beijing PM2.5 2014 9 9 5 143 µg/m³
Beijing PM2.5 2014 9 9 6 122 µg/m³
Beijing PM2.5 2014 9 9 7 114 µg/m³
Beijing PM2.5 2014 9 9 8 100 µg/m³
Beijing PM2.5 2014 9 9 9 119 µg/m³
Beijing PM2.5 2014 9 9 10 130 µg/m³
Beijing PM2.5 2014 9 9 11 145 µg/m³
Beijing PM2.5 2014 9 9 12 149 µg/m³
Beijing PM2.5 2014 9 9 13 163 µg/m³
Beijing PM2.5 2014 9 9 14 147 µg/m³
Beijing PM2.5 2014 9 9 15 133 µg/m³
Beijing PM2.5 2014 9 9 16 126 µg/m³
Beijing PM2.5 2014 9 9 17 124 µg/m³
Beijing PM2.5 2014 9 9 18 122 µg/m³
Beijing PM2.5 2014 9 9 19 91 µg/m³
Beijing PM2.5 2014 9 9 20 98 µg/m³
Beijing PM2.5 2014 9 9 21 91 µg/m³
Beijing PM2.5 2014 9 9 22 78 µg/m³
Beijing PM2.5 2014 9 9 23 55 µg/m³
Beijing PM2.5 2014 9 10 0 40 µg/m³
Beijing PM2.5 2014 9 10 1 36 µg/m³
Beijing PM2.5 2014 9 10 2 48 µg/m³
Beijing PM2.5 2014 9 10 3 54 µg/m³
Beijing PM2.5 2014 9 10 4 63 µg/m³
Beijing PM2.5 2014 9 10 5 78 µg/m³
Beijing PM2.5 2014 9 10 6 74 µg/m³
Beijing PM2.5 2014 9 10 7 76 µg/m³
Beijing PM2.5 2014 9 10 8 81 µg/m³
Beijing PM2.5 2014 9 10 9 86 µg/m³
Beijing PM2.5 2014 9 10 10 89 µg/m³
Beijing PM2.5 2014 9 10 11 96 µg/m³
Beijing PM2.5 2014 9 10 12 99 µg/m³
Beijing PM2.5 2014 9 10 13 102 µg/m³
Beijing PM2.5 2014 9 10 14 111 µg/m³
Beijing PM2.5 2014 9 10 15 121 µg/m³
Beijing PM2.5 2014 9 10 16 122 µg/m³
Beijing PM2.5 2014 9 10 17 135 µg/m³
Beijing PM2.5 2014 9 10 18 145 µg/m³
Beijing PM2.5 2014 9 10 19 159 µg/m³
Beijing PM2.5 2014 9 10 20 183 µg/m³
Beijing PM2.5 2014 9 10 21 187 µg/m³
Beijing PM2.5 2014 9 10 22 195 µg/m³
Beijing PM2.5 2014 9 10 23 224 µg/m³
Beijing PM2.5 2014 9 11 0 259 µg/m³
Beijing PM2.5 2014 9 11 1 260 µg/m³
Beijing PM2.5 2014 9 11 2 257 µg/m³
Beijing PM2.5 2014 9 11 3 267 µg/m³
Beijing PM2.5 2014 9 11 4 260 µg/m³
Beijing PM2.5 2014 9 11 5 259 µg/m³
Beijing PM2.5 2014 9 11 6 270 µg/m³
Beijing PM2.5 2014 9 11 7 234 µg/m³
Beijing PM2.5 2014 9 11 8 245 µg/m³
Beijing PM2.5 2014 9 11 9 269 µg/m³
Beijing PM2.5 2014 9 11 10 303 µg/m³
Beijing PM2.5 2014 9 11 11 272 µg/m³
Beijing PM2.5 2014 9 11 12 234 µg/m³
Beijing PM2.5 2014 9 11 13 214 µg/m³
Beijing PM2.5 2014 9 11 14 225 µg/m³
Beijing PM2.5 2014 9 11 15 220 µg/m³
Beijing PM2.5 2014 9 11 16 209 µg/m³
Beijing PM2.5 2014 9 11 17 202 µg/m³
Beijing PM2.5 2014 9 11 18 168 µg/m³
Beijing PM2.5 2014 9 11 19 13 µg/m³
Beijing PM2.5 2014 9 11 20 18 µg/m³
Beijing PM2.5 2014 9 11 21 18 µg/m³
Beijing PM2.5 2014 9 11 22 13 µg/m³
Beijing PM2.5 2014 9 11 23 10 µg/m³
Beijing PM2.5 2014 9 12 0 11 µg/m³
Beijing PM2.5 2014 9 12 1 14 µg/m³
Beijing PM2.5 2014 9 12 2 13 µg/m³
Beijing PM2.5 2014 9 12 3 10 µg/m³
Beijing PM2.5 2014 9 12 4 10 µg/m³
Beijing PM2.5 2014 9 12 5 10 µg/m³
Beijing PM2.5 2014 9 12 6 11 µg/m³
Beijing PM2.5 2014 9 12 7 11 µg/m³
Beijing PM2.5 2014 9 12 8 11 µg/m³
Beijing PM2.5 2014 9 12 9 12 µg/m³
Beijing PM2.5 2014 9 12 10 13 µg/m³
Beijing PM2.5 2014 9 12 11 11 µg/m³
Beijing PM2.5 2014 9 12 12 10 µg/m³
Beijing PM2.5 2014 9 12 13 9 µg/m³
Beijing PM2.5 2014 9 12 14 13 µg/m³
Beijing PM2.5 2014 9 12 15 13 µg/m³
Beijing PM2.5 2014 9 12 16 13 µg/m³
Beijing PM2.5 2014 9 12 17 15 µg/m³
Beijing PM2.5 2014 9 12 18 20 µg/m³
Beijing PM2.5 2014 9 12 19 41 µg/m³
Beijing PM2.5 2014 9 12 20 35 µg/m³
Beijing PM2.5 2014 9 12 21 52 µg/m³
Beijing PM2.5 2014 9 12 22 66 µg/m³
Beijing PM2.5 2014 9 12 23 36 µg/m³
Beijing PM2.5 2014 9 13 0 18 µg/m³
Beijing PM2.5 2014 9 13 1 20 µg/m³
Beijing PM2.5 2014 9 13 2 20 µg/m³
Beijing PM2.5 2014 9 13 3 14 µg/m³
Beijing PM2.5 2014 9 13 4 15 µg/m³
Beijing PM2.5 2014 9 13 5 18 µg/m³
Beijing PM2.5 2014 9 13 6 21 µg/m³
Beijing PM2.5 2014 9 13 7 32 µg/m³
Beijing PM2.5 2014 9 13 8 21 µg/m³
Beijing PM2.5 2014 9 13 9 19 µg/m³
Beijing PM2.5 2014 9 13 10 12 µg/m³
Beijing PM2.5 2014 9 13 11 15 µg/m³
Beijing PM2.5 2014 9 13 12 16 µg/m³
Beijing PM2.5 2014 9 13 13 14 µg/m³
Beijing PM2.5 2014 9 13 14 18 µg/m³
Beijing PM2.5 2014 9 13 15 20 µg/m³
Beijing PM2.5 2014 9 13 16 19 µg/m³
Beijing PM2.5 2014 9 13 17 28 µg/m³
Beijing PM2.5 2014 9 13 18 32 µg/m³
Beijing PM2.5 2014 9 13 19 40 µg/m³
Beijing PM2.5 2014 9 13 20 39 µg/m³
Beijing PM2.5 2014 9 13 21 22 µg/m³
Beijing PM2.5 2014 9 13 22 37 µg/m³
Beijing PM2.5 2014 9 13 23 24 µg/m³
Beijing PM2.5 2014 9 14 0 19 µg/m³
Beijing PM2.5 2014 9 14 1 11 µg/m³
Beijing PM2.5 2014 9 14 2 13 µg/m³
Beijing PM2.5 2014 9 14 3 11 µg/m³
Beijing PM2.5 2014 9 14 4 10 µg/m³
Beijing PM2.5 2014 9 14 5 7 µg/m³
Beijing PM2.5 2014 9 14 6 12 µg/m³
Beijing PM2.5 2014 9 14 7 15 µg/m³
Beijing PM2.5 2014 9 14 8 12 µg/m³
Beijing PM2.5 2014 9 14 9 16 µg/m³
Beijing PM2.5 2014 9 14 10 7 µg/m³
Beijing PM2.5 2014 9 14 11 12 µg/m³
Beijing PM2.5 2014 9 14 12 19 µg/m³
Beijing PM2.5 2014 9 14 13 22 µg/m³
Beijing PM2.5 2014 9 14 14 22 µg/m³
Beijing PM2.5 2014 9 14 15 16 µg/m³
Beijing PM2.5 2014 9 14 16 20 µg/m³
Beijing PM2.5 2014 9 14 17 30 µg/m³
Beijing PM2.5 2014 9 14 18 32 µg/m³
Beijing PM2.5 2014 9 14 19 38 µg/m³
Beijing PM2.5 2014 9 14 20 52 µg/m³
Beijing PM2.5 2014 9 14 21 63 µg/m³
Beijing PM2.5 2014 9 14 22 66 µg/m³
Beijing PM2.5 2014 9 14 23 72 µg/m³
Beijing PM2.5 2014 9 15 0 63 µg/m³
Beijing PM2.5 2014 9 15 1 69 µg/m³
Beijing PM2.5 2014 9 15 2 78 µg/m³
Beijing PM2.5 2014 9 15 3 85 µg/m³
Beijing PM2.5 2014 9 15 4 82 µg/m³
Beijing PM2.5 2014 9 15 5 87 µg/m³
Beijing PM2.5 2014 9 15 6 93 µg/m³
Beijing PM2.5 2014 9 15 7 116 µg/m³
Beijing PM2.5 2014 9 15 8 99 µg/m³
Beijing PM2.5 2014 9 15 9 88 µg/m³
Beijing PM2.5 2014 9 15 10 91 µg/m³
Beijing PM2.5 2014 9 15 11 109 µg/m³
Beijing PM2.5 2014 9 15 12 110 µg/m³
Beijing PM2.5 2014 9 15 13 109 µg/m³
Beijing PM2.5 2014 9 15 14 123 µg/m³
Beijing PM2.5 2014 9 15 15 136 µg/m³
Beijing PM2.5 2014 9 15 16 119 µg/m³
Beijing PM2.5 2014 9 15 17 116 µg/m³
Beijing PM2.5 2014 9 15 18 101 µg/m³
Beijing PM2.5 2014 9 15 19 131 µg/m³
Beijing PM2.5 2014 9 15 20 168 µg/m³
Beijing PM2.5 2014 9 15 21 189 µg/m³
Beijing PM2.5 2014 9 15 22 183 µg/m³
Beijing PM2.5 2014 9 15 23 205 µg/m³
Beijing PM2.5 2014 9 16 0 188 µg/m³
Beijing PM2.5 2014 9 16 1 148 µg/m³
Beijing PM2.5 2014 9 16 2 137 µg/m³
Beijing PM2.5 2014 9 16 3 140 µg/m³
Beijing PM2.5 2014 9 16 4 141 µg/m³
Beijing PM2.5 2014 9 16 5 121 µg/m³
Beijing PM2.5 2014 9 16 6 109 µg/m³
Beijing PM2.5 2014 9 16 7 83 µg/m³
Beijing PM2.5 2014 9 16 8 78 µg/m³
Beijing PM2.5 2014 9 16 9 77 µg/m³
Beijing PM2.5 2014 9 16 10 79 µg/m³
Beijing PM2.5 2014 9 16 11 73 µg/m³
Beijing PM2.5 2014 9 16 12 75 µg/m³
Beijing PM2.5 2014 9 16 13 91 µg/m³
Beijing PM2.5 2014 9 16 14 104 µg/m³
Beijing PM2.5 2014 9 16 15 116 µg/m³
Beijing PM2.5 2014 9 16 16 121 µg/m³
Beijing PM2.5 2014 9 16 17 137 µg/m³
Beijing PM2.5 2014 9 16 18 151 µg/m³
Beijing PM2.5 2014 9 16 19 159 µg/m³
Beijing PM2.5 2014 9 16 20 157 µg/m³
Beijing PM2.5 2014 9 16 21 151 µg/m³
Beijing PM2.5 2014 9 16 22 150 µg/m³
Beijing PM2.5 2014 9 16 23 149 µg/m³
Beijing PM2.5 2014 9 17 0 141 µg/m³
Beijing PM2.5 2014 9 17 1 144 µg/m³
Beijing PM2.5 2014 9 17 2 148 µg/m³
Beijing PM2.5 2014 9 17 3 144 µg/m³
Beijing PM2.5 2014 9 17 4 150 µg/m³
Beijing PM2.5 2014 9 17 5 152 µg/m³
Beijing PM2.5 2014 9 17 6 155 µg/m³
Beijing PM2.5 2014 9 17 7 165 µg/m³
Beijing PM2.5 2014 9 17 8 181 µg/m³
Beijing PM2.5 2014 9 17 9 191 µg/m³
Beijing PM2.5 2014 9 17 10 124 µg/m³
Beijing PM2.5 2014 9 17 11 36 µg/m³
Beijing PM2.5 2014 9 17 12 40 µg/m³
Beijing PM2.5 2014 9 17 13 49 µg/m³
Beijing PM2.5 2014 9 17 14 30 µg/m³
Beijing PM2.5 2014 9 17 15 27 µg/m³
Beijing PM2.5 2014 9 17 16 27 µg/m³
Beijing PM2.5 2014 9 17 17 22 µg/m³
Beijing PM2.5 2014 9 17 18 24 µg/m³
Beijing PM2.5 2014 9 17 19 21 µg/m³
Beijing PM2.5 2014 9 17 20 26 µg/m³
Beijing PM2.5 2014 9 17 21 17 µg/m³
Beijing PM2.5 2014 9 17 22 23 µg/m³
Beijing PM2.5 2014 9 17 23 23 µg/m³
Beijing PM2.5 2014 9 18 0 21 µg/m³
Beijing PM2.5 2014 9 18 1 21 µg/m³
Beijing PM2.5 2014 9 18 2 17 µg/m³
Beijing PM2.5 2014 9 18 3 15 µg/m³
Beijing PM2.5 2014 9 18 4 13 µg/m³
Beijing PM2.5 2014 9 18 5 17 µg/m³
Beijing PM2.5 2014 9 18 6 14 µg/m³
Beijing PM2.5 2014 9 18 7 20 µg/m³
Beijing PM2.5 2014 9 18 8 18 µg/m³
Beijing PM2.5 2014 9 18 9 16 µg/m³
Beijing PM2.5 2014 9 18 10 27 µg/m³
Beijing PM2.5 2014 9 18 11 52 µg/m³
Beijing PM2.5 2014 9 18 12 67 µg/m³
Beijing PM2.5 2014 9 18 13 76 µg/m³
Beijing PM2.5 2014 9 18 14 79 µg/m³
Beijing PM2.5 2014 9 18 15 76 µg/m³
Beijing PM2.5 2014 9 18 16 66 µg/m³
Beijing PM2.5 2014 9 18 17 60 µg/m³
Beijing PM2.5 2014 9 18 18 66 µg/m³
Beijing PM2.5 2014 9 18 19 61 µg/m³
Beijing PM2.5 2014 9 18 20 57 µg/m³
Beijing PM2.5 2014 9 18 21 47 µg/m³
Beijing PM2.5 2014 9 18 22 30 µg/m³
Beijing PM2.5 2014 9 18 23 34 µg/m³
Beijing PM2.5 2014 9 19 0 29 µg/m³
Beijing PM2.5 2014 9 19 1 47 µg/m³
Beijing PM2.5 2014 9 19 2 72 µg/m³
Beijing PM2.5 2014 9 19 3 73 µg/m³
Beijing PM2.5 2014 9 19 4 70 µg/m³
Beijing PM2.5 2014 9 19 5 78 µg/m³
Beijing PM2.5 2014 9 19 6 90 µg/m³
Beijing PM2.5 2014 9 19 7 92 µg/m³
Beijing PM2.5 2014 9 19 8 94 µg/m³
Beijing PM2.5 2014 9 19 9 96 µg/m³
Beijing PM2.5 2014 9 19 10 77 µg/m³
Beijing PM2.5 2014 9 19 11 79 µg/m³
Beijing PM2.5 2014 9 19 12 79 µg/m³
Beijing PM2.5 2014 9 19 13 74 µg/m³
Beijing PM2.5 2014 9 19 14 76 µg/m³
Beijing PM2.5 2014 9 19 15 66 µg/m³
Beijing PM2.5 2014 9 19 16 44 µg/m³
Beijing PM2.5 2014 9 19 17 48 µg/m³
Beijing PM2.5 2014 9 19 18 52 µg/m³
Beijing PM2.5 2014 9 19 19 20 µg/m³
Beijing PM2.5 2014 9 19 20 15 µg/m³
Beijing PM2.5 2014 9 19 21 13 µg/m³
Beijing PM2.5 2014 9 19 22 14 µg/m³
Beijing PM2.5 2014 9 19 23 10 µg/m³
Beijing PM2.5 2014 9 20 0 7 µg/m³
Beijing PM2.5 2014 9 20 1 5 µg/m³
Beijing PM2.5 2014 9 20 2 6 µg/m³
Beijing PM2.5 2014 9 20 3 7 µg/m³
Beijing PM2.5 2014 9 20 4 10 µg/m³
Beijing PM2.5 2014 9 20 5 9 µg/m³
Beijing PM2.5 2014 9 20 6 11 µg/m³
Beijing PM2.5 2014 9 20 7 9 µg/m³
Beijing PM2.5 2014 9 20 8 11 µg/m³
Beijing PM2.5 2014 9 20 9 13 µg/m³
Beijing PM2.5 2014 9 20 10 11 µg/m³
Beijing PM2.5 2014 9 20 11 17 µg/m³
Beijing PM2.5 2014 9 20 12 14 µg/m³
Beijing PM2.5 2014 9 20 13 13 µg/m³
Beijing PM2.5 2014 9 20 14 9 µg/m³
Beijing PM2.5 2014 9 20 15 7 µg/m³
Beijing PM2.5 2014 9 20 16 9 µg/m³
Beijing PM2.5 2014 9 20 17 11 µg/m³
Beijing PM2.5 2014 9 20 18 12 µg/m³
Beijing PM2.5 2014 9 20 19 18 µg/m³
Beijing PM2.5 2014 9 20 20 11 µg/m³
Beijing PM2.5 2014 9 20 21 11 µg/m³
Beijing PM2.5 2014 9 20 22 7 µg/m³
Beijing PM2.5 2014 9 20 23 6 µg/m³
Beijing PM2.5 2014 9 21 0 5 µg/m³
Beijing PM2.5 2014 9 21 1 7 µg/m³
Beijing PM2.5 2014 9 21 2 12 µg/m³
Beijing PM2.5 2014 9 21 3 13 µg/m³
Beijing PM2.5 2014 9 21 4 17 µg/m³
Beijing PM2.5 2014 9 21 5 16 µg/m³
Beijing PM2.5 2014 9 21 6 26 µg/m³
Beijing PM2.5 2014 9 21 7 18 µg/m³
Beijing PM2.5 2014 9 21 8 19 µg/m³
Beijing PM2.5 2014 9 21 9 21 µg/m³
Beijing PM2.5 2014 9 21 10 24 µg/m³
Beijing PM2.5 2014 9 21 11 20 µg/m³
Beijing PM2.5 2014 9 21 12 22 µg/m³
Beijing PM2.5 2014 9 21 13 18 µg/m³
Beijing PM2.5 2014 9 21 14 19 µg/m³
Beijing PM2.5 2014 9 21 15 . µg/m³
Beijing PM2.5 2014 9 21 16 28 µg/m³
Beijing PM2.5 2014 9 21 17 36 µg/m³
Beijing PM2.5 2014 9 21 18 40 µg/m³
Beijing PM2.5 2014 9 21 19 49 µg/m³
Beijing PM2.5 2014 9 21 20 54 µg/m³
Beijing PM2.5 2014 9 21 21 55 µg/m³
Beijing PM2.5 2014 9 21 22 67 µg/m³
Beijing PM2.5 2014 9 21 23 71 µg/m³
Beijing PM2.5 2014 9 22 0 76 µg/m³
Beijing PM2.5 2014 9 22 1 72 µg/m³
Beijing PM2.5 2014 9 22 2 75 µg/m³
Beijing PM2.5 2014 9 22 3 93 µg/m³
Beijing PM2.5 2014 9 22 4 89 µg/m³
Beijing PM2.5 2014 9 22 5 98 µg/m³
Beijing PM2.5 2014 9 22 6 97 µg/m³
Beijing PM2.5 2014 9 22 7 109 µg/m³
Beijing PM2.5 2014 9 22 8 89 µg/m³
Beijing PM2.5 2014 9 22 9 66 µg/m³
Beijing PM2.5 2014 9 22 10 72 µg/m³
Beijing PM2.5 2014 9 22 11 37 µg/m³
Beijing PM2.5 2014 9 22 12 21 µg/m³
Beijing PM2.5 2014 9 22 13 17 µg/m³
Beijing PM2.5 2014 9 22 14 17 µg/m³
Beijing PM2.5 2014 9 22 15 11 µg/m³
Beijing PM2.5 2014 9 22 16 16 µg/m³
Beijing PM2.5 2014 9 22 17 11 µg/m³
Beijing PM2.5 2014 9 22 18 17 µg/m³
Beijing PM2.5 2014 9 22 19 31 µg/m³
Beijing PM2.5 2014 9 22 20 61 µg/m³
Beijing PM2.5 2014 9 22 21 151 µg/m³
Beijing PM2.5 2014 9 22 22 163 µg/m³
Beijing PM2.5 2014 9 22 23 98 µg/m³
Beijing PM2.5 2014 9 23 0 96 µg/m³
Beijing PM2.5 2014 9 23 1 119 µg/m³
Beijing PM2.5 2014 9 23 2 125 µg/m³
Beijing PM2.5 2014 9 23 3 136 µg/m³
Beijing PM2.5 2014 9 23 4 147 µg/m³
Beijing PM2.5 2014 9 23 5 150 µg/m³
Beijing PM2.5 2014 9 23 6 150 µg/m³
Beijing PM2.5 2014 9 23 7 173 µg/m³
Beijing PM2.5 2014 9 23 8 184 µg/m³
Beijing PM2.5 2014 9 23 9 191 µg/m³
Beijing PM2.5 2014 9 23 10 166 µg/m³
Beijing PM2.5 2014 9 23 11 128 µg/m³
Beijing PM2.5 2014 9 23 12 141 µg/m³
Beijing PM2.5 2014 9 23 13 141 µg/m³
Beijing PM2.5 2014 9 23 14 145 µg/m³
Beijing PM2.5 2014 9 23 15 156 µg/m³
Beijing PM2.5 2014 9 23 16 160 µg/m³
Beijing PM2.5 2014 9 23 17 165 µg/m³
Beijing PM2.5 2014 9 23 18 155 µg/m³
Beijing PM2.5 2014 9 23 19 118 µg/m³
Beijing PM2.5 2014 9 23 20 152 µg/m³
Beijing PM2.5 2014 9 23 21 214 µg/m³
Beijing PM2.5 2014 9 23 22 249 µg/m³
Beijing PM2.5 2014 9 23 23 247 µg/m³
Beijing PM2.5 2014 9 24 0 248 µg/m³
Beijing PM2.5 2014 9 24 1 253 µg/m³
Beijing PM2.5 2014 9 24 2 261 µg/m³
Beijing PM2.5 2014 9 24 3 257 µg/m³
Beijing PM2.5 2014 9 24 4 262 µg/m³
Beijing PM2.5 2014 9 24 5 270 µg/m³
Beijing PM2.5 2014 9 24 6 262 µg/m³
Beijing PM2.5 2014 9 24 7 260 µg/m³
Beijing PM2.5 2014 9 24 8 271 µg/m³
Beijing PM2.5 2014 9 24 9 281 µg/m³
Beijing PM2.5 2014 9 24 10 280 µg/m³
Beijing PM2.5 2014 9 24 11 270 µg/m³
Beijing PM2.5 2014 9 24 12 277 µg/m³
Beijing PM2.5 2014 9 24 13 249 µg/m³
Beijing PM2.5 2014 9 24 14 242 µg/m³
Beijing PM2.5 2014 9 24 15 192 µg/m³
Beijing PM2.5 2014 9 24 16 167 µg/m³
Beijing PM2.5 2014 9 24 17 168 µg/m³
Beijing PM2.5 2014 9 24 18 184 µg/m³
Beijing PM2.5 2014 9 24 19 199 µg/m³
Beijing PM2.5 2014 9 24 20 225 µg/m³
Beijing PM2.5 2014 9 24 21 252 µg/m³
Beijing PM2.5 2014 9 24 22 277 µg/m³
Beijing PM2.5 2014 9 24 23 290 µg/m³
Beijing PM2.5 2014 9 25 0 299 µg/m³
Beijing PM2.5 2014 9 25 1 326 µg/m³
Beijing PM2.5 2014 9 25 2 324 µg/m³
Beijing PM2.5 2014 9 25 3 320 µg/m³
Beijing PM2.5 2014 9 25 4 279 µg/m³
Beijing PM2.5 2014 9 25 5 250 µg/m³
Beijing PM2.5 2014 9 25 6 228 µg/m³
Beijing PM2.5 2014 9 25 7 232 µg/m³
Beijing PM2.5 2014 9 25 8 233 µg/m³
Beijing PM2.5 2014 9 25 9 239 µg/m³
Beijing PM2.5 2014 9 25 10 235 µg/m³
Beijing PM2.5 2014 9 25 11 226 µg/m³
Beijing PM2.5 2014 9 25 12 223 µg/m³
Beijing PM2.5 2014 9 25 13 229 µg/m³
Beijing PM2.5 2014 9 25 14 206 µg/m³
Beijing PM2.5 2014 9 25 15 189 µg/m³
Beijing PM2.5 2014 9 25 16 188 µg/m³
Beijing PM2.5 2014 9 25 17 163 µg/m³
Beijing PM2.5 2014 9 25 18 165 µg/m³
Beijing PM2.5 2014 9 25 19 152 µg/m³
Beijing PM2.5 2014 9 25 20 147 µg/m³
Beijing PM2.5 2014 9 25 21 157 µg/m³
Beijing PM2.5 2014 9 25 22 181 µg/m³
Beijing PM2.5 2014 9 25 23 190 µg/m³
Beijing PM2.5 2014 9 26 0 201 µg/m³
Beijing PM2.5 2014 9 26 1 226 µg/m³
Beijing PM2.5 2014 9 26 2 248 µg/m³
Beijing PM2.5 2014 9 26 3 269 µg/m³
Beijing PM2.5 2014 9 26 4 275 µg/m³
Beijing PM2.5 2014 9 26 5 311 µg/m³
Beijing PM2.5 2014 9 26 6 300 µg/m³
Beijing PM2.5 2014 9 26 7 317 µg/m³
Beijing PM2.5 2014 9 26 8 330 µg/m³
Beijing PM2.5 2014 9 26 9 346 µg/m³
Beijing PM2.5 2014 9 26 10 350 µg/m³
Beijing PM2.5 2014 9 26 11 331 µg/m³
Beijing PM2.5 2014 9 26 12 327 µg/m³
Beijing PM2.5 2014 9 26 13 327 µg/m³
Beijing PM2.5 2014 9 26 14 286 µg/m³
Beijing PM2.5 2014 9 26 15 246 µg/m³
Beijing PM2.5 2014 9 26 16 269 µg/m³
Beijing PM2.5 2014 9 26 17 309 µg/m³
Beijing PM2.5 2014 9 26 18 336 µg/m³
Beijing PM2.5 2014 9 26 19 360 µg/m³
Beijing PM2.5 2014 9 26 20 387 µg/m³
Beijing PM2.5 2014 9 26 21 399 µg/m³
Beijing PM2.5 2014 9 26 22 414 µg/m³
Beijing PM2.5 2014 9 26 23 465 µg/m³
Beijing PM2.5 2014 9 27 0 436 µg/m³
Beijing PM2.5 2014 9 27 1 435 µg/m³
Beijing PM2.5 2014 9 27 2 426 µg/m³
Beijing PM2.5 2014 9 27 3 413 µg/m³
Beijing PM2.5 2014 9 27 4 358 µg/m³
Beijing PM2.5 2014 9 27 5 389 µg/m³
Beijing PM2.5 2014 9 27 6 349 µg/m³
Beijing PM2.5 2014 9 27 7 340 µg/m³
Beijing PM2.5 2014 9 27 8 336 µg/m³
Beijing PM2.5 2014 9 27 9 369 µg/m³
Beijing PM2.5 2014 9 27 10 403 µg/m³
Beijing PM2.5 2014 9 27 11 444 µg/m³
Beijing PM2.5 2014 9 27 12 306 µg/m³
Beijing PM2.5 2014 9 27 13 115 µg/m³
Beijing PM2.5 2014 9 27 14 90 µg/m³
Beijing PM2.5 2014 9 27 15 82 µg/m³
Beijing PM2.5 2014 9 27 16 85 µg/m³
Beijing PM2.5 2014 9 27 17 95 µg/m³
Beijing PM2.5 2014 9 27 18 96 µg/m³
Beijing PM2.5 2014 9 27 19 107 µg/m³
Beijing PM2.5 2014 9 27 20 111 µg/m³
Beijing PM2.5 2014 9 27 21 125 µg/m³
Beijing PM2.5 2014 9 27 22 123 µg/m³
Beijing PM2.5 2014 9 27 23 145 µg/m³
Beijing PM2.5 2014 9 28 0 153 µg/m³
Beijing PM2.5 2014 9 28 1 159 µg/m³
Beijing PM2.5 2014 9 28 2 154 µg/m³
Beijing PM2.5 2014 9 28 3 191 µg/m³
Beijing PM2.5 2014 9 28 4 195 µg/m³
Beijing PM2.5 2014 9 28 5 194 µg/m³
Beijing PM2.5 2014 9 28 6 193 µg/m³
Beijing PM2.5 2014 9 28 7 175 µg/m³
Beijing PM2.5 2014 9 28 8 194 µg/m³
Beijing PM2.5 2014 9 28 9 165 µg/m³
Beijing PM2.5 2014 9 28 10 138 µg/m³
Beijing PM2.5 2014 9 28 11 100 µg/m³
Beijing PM2.5 2014 9 28 12 83 µg/m³
Beijing PM2.5 2014 9 28 13 53 µg/m³
Beijing PM2.5 2014 9 28 14 52 µg/m³
Beijing PM2.5 2014 9 28 15 60 µg/m³
Beijing PM2.5 2014 9 28 16 100 µg/m³
Beijing PM2.5 2014 9 28 17 142 µg/m³
Beijing PM2.5 2014 9 28 18 140 µg/m³
Beijing PM2.5 2014 9 28 19 148 µg/m³
Beijing PM2.5 2014 9 28 20 183 µg/m³
Beijing PM2.5 2014 9 28 21 217 µg/m³
Beijing PM2.5 2014 9 28 22 224 µg/m³
Beijing PM2.5 2014 9 28 23 222 µg/m³
Beijing PM2.5 2014 9 29 0 219 µg/m³
Beijing PM2.5 2014 9 29 1 65 µg/m³
Beijing PM2.5 2014 9 29 2 22 µg/m³
Beijing PM2.5 2014 9 29 3 16 µg/m³
Beijing PM2.5 2014 9 29 4 16 µg/m³
Beijing PM2.5 2014 9 29 5 28 µg/m³
Beijing PM2.5 2014 9 29 6 32 µg/m³
Beijing PM2.5 2014 9 29 7 25 µg/m³
Beijing PM2.5 2014 9 29 8 25 µg/m³
Beijing PM2.5 2014 9 29 9 22 µg/m³
Beijing PM2.5 2014 9 29 10 18 µg/m³
Beijing PM2.5 2014 9 29 11 23 µg/m³
Beijing PM2.5 2014 9 29 12 23 µg/m³
Beijing PM2.5 2014 9 29 13 25 µg/m³
Beijing PM2.5 2014 9 29 14 18 µg/m³
Beijing PM2.5 2014 9 29 15 23 µg/m³
Beijing PM2.5 2014 9 29 16 25 µg/m³
Beijing PM2.5 2014 9 29 17 26 µg/m³
Beijing PM2.5 2014 9 29 18 27 µg/m³
Beijing PM2.5 2014 9 29 19 36 µg/m³
Beijing PM2.5 2014 9 29 20 47 µg/m³
Beijing PM2.5 2014 9 29 21 59 µg/m³
Beijing PM2.5 2014 9 29 22 50 µg/m³
Beijing PM2.5 2014 9 29 23 61 µg/m³
Beijing PM2.5 2014 9 30 0 58 µg/m³
Beijing PM2.5 2014 9 30 1 66 µg/m³
Beijing PM2.5 2014 9 30 2 63 µg/m³
Beijing PM2.5 2014 9 30 3 51 µg/m³
Beijing PM2.5 2014 9 30 4 39 µg/m³
Beijing PM2.5 2014 9 30 5 42 µg/m³
Beijing PM2.5 2014 9 30 6 44 µg/m³
Beijing PM2.5 2014 9 30 7 44 µg/m³
Beijing PM2.5 2014 9 30 8 35 µg/m³
Beijing PM2.5 2014 9 30 9 30 µg/m³
Beijing PM2.5 2014 9 30 10 34 µg/m³
Beijing PM2.5 2014 9 30 11 21 µg/m³
Beijing PM2.5 2014 9 30 12 14 µg/m³
Beijing PM2.5 2014 9 30 13 11 µg/m³
Beijing PM2.5 2014 9 30 14 9 µg/m³
Beijing PM2.5 2014 9 30 15 12 µg/m³
Beijing PM2.5 2014 9 30 16 13 µg/m³
Beijing PM2.5 2014 9 30 17 18 µg/m³
Beijing PM2.5 2014 9 30 18 21 µg/m³
Beijing PM2.5 2014 9 30 19 24 µg/m³
Beijing PM2.5 2014 9 30 20 27 µg/m³
Beijing PM2.5 2014 9 30 21 39 µg/m³
Beijing PM2.5 2014 9 30 22 44 µg/m³
Beijing PM2.5 2014 9 30 23 64 µg/m³
Beijing PM2.5 2014 9 31 0 106 µg/m³
Beijing PM2.5 2014 9 31 1 137 µg/m³
Beijing PM2.5 2014 9 31 2 165 µg/m³
Beijing PM2.5 2014 9 31 3 153 µg/m³
Beijing PM2.5 2014 9 31 4 116 µg/m³
Beijing PM2.5 2014 9 31 5 127 µg/m³
Beijing PM2.5 2014 9 31 6 147 µg/m³
Beijing PM2.5 2014 9 31 7 180 µg/m³
Beijing PM2.5 2014 9 31 8 199 µg/m³
Beijing PM2.5 2014 9 31 9 209 µg/m³
Beijing PM2.5 2014 9 31 10 235 µg/m³
Beijing PM2.5 2014 9 31 11 254 µg/m³
Beijing PM2.5 2014 9 31 12 250 µg/m³
Beijing PM2.5 2014 9 31 13 235 µg/m³
Beijing PM2.5 2014 9 31 14 210 µg/m³
Beijing PM2.5 2014 9 31 15 127 µg/m³
Beijing PM2.5 2014 9 31 16 72 µg/m³
Beijing PM2.5 2014 9 31 17 27 µg/m³
Beijing PM2.5 2014 9 31 18 70 µg/m³
Beijing PM2.5 2014 9 31 19 113 µg/m³
Beijing PM2.5 2014 9 31 20 118 µg/m³
Beijing PM2.5 2014 9 31 21 143 µg/m³
Beijing PM2.5 2014 9 31 22 175 µg/m³
Beijing PM2.5 2014 9 31 23 159 µg/m³
;
Run;

Proc Univariate Data=AQI;
Var AQI;
Run;


Proc Univariate Data=AQI normal plots;
Var AQI;
histogram;
Run;

Proc Means Data=AQI noprint;
Var AQI;
Class Hour;
Output Out=AQIHour Mean=Mean STD=STD;
Run;

Proc Sort Data=AQIHour;
By descending Mean;
Run

Data Repair;
Infile Datalines dsd;
Input brand : $10. model : $20. Purdate : $30. Repdate : date9. Parts : $20. Cost;
Format Repdate date9.;
Datalines;
Asus,Zenbook,24JUL2012,06APR2015,Motherboard,57
Asus,Chromebook,05MAR2013,11JUL2014,Processor,61
Lenovo,Thinkpad,23JAN2012,20MAR2015,Hard Drive,358
Toshiba,Kirabook,07MAR2012,19DEC2014,Keyboard,136
Toshiba,Satellite,11APR2012,19NOV2015,Software,347
HP,Pavilion,04SEP2012,01DEC2014,Hard Drive,144
Dell,Inspiron,02MAR2013,19JUL2014,Keyboard,396
Lenovo,Thinkpad,28JAN2014,29AUG2014,Processor,355
Lenovo,Thinkpad,23JUN2012,08JAN2015,Keyboard,183
Asus,Zenbook,09JUN2012,06SEP2014,Processor,371
Lenovo,Yoga,22JAN2014,18JUN2015,Processor,238
HP,Probook,17MAY2014,24OCT2015,Processor,236
Lenovo,Yoga,03MAY2014,26OCT2014,Motherboard,136
Lenovo,Yoga,25AUG2013,11JUN2015,Hard Drive,163
HP,Envy,10DEC2012,14SEP2015,Hard Drive,189
HP,Pavilion,16APR2014,31JUL2014,Keyboard,92
Asus,Zenbook,28MAR2012,13JUL2014,Processor,340
HP,Pavilion,2013,31OCT2015,Keyboard,77
HP,Pavilion,25JUN2013,27AUG2014,Processor,53
Lenovo,Thinkpad,31JUL2012,13JAN2015,Motherboard,325
Toshiba,Kirabook,27AUG2012,12SEP2014,Keyboard,280
Toshiba,Kirabook,19FEB2012,29DEC2014,Processor,187
Lenovo,Thinkpad,02NOV2013,05DEC2014,Hard Drive,322
HP,Pavilion,FEB2013,27OCT2015,Hard Drive,291
Dell,Inspiron,09JUL2013,11NOV2014,Keyboard,62
Lenovo,Thinkpad,2014,16JUL2015,Motherboard,332
HP,Pavilion,22OCT2012,17OCT2014,Motherboard,73
Lenovo,Yoga,15MAR2013,28DEC2014,Keyboard,222
HP,Probook,11JAN2012,09OCT2015,Software,88
Asus,Transformer,28SEP2012,01DEC2015,Processor,168
Asus,Zenbook,28FEB2012,17MAR2015,Software,271
Lenovo,Yoga,29JAN2014,09AUG2015,Motherboard,81
Lenovo,Thinkpad,08APR2014,06SEP2015,Motherboard,188
Lenovo,Thinkpad,2014,14SEP2014,Keyboard,253
HP,Pavilion,21APR2012,17APR2015,Hard Drive,276
HP,Pavilion,21APR2014,20NOV2014,Software,377
Dell,Chromebook,14OCT2013,04JUN2015,Keyboard,280
Dell,XPS,09APR2014,21SEP2014,Keyboard,233
HP,Probook,07APR2013,17JUL2015,Processor,345
HP,Probook,2012,05APR2015,Motherboard,207
Lenovo,Yoga,13OCT2012,19NOV2015,Motherboard,188
Asus,Zenbook,06JUN2012,10MAR2015,Hard Drive,396
Lenovo,Yoga,07NOV2012,14NOV2015,Keyboard,85
Toshiba,Kirabook,01SEP2012,05NOV2015,Motherboard,201
Asus,Transformer,23JAN2013,15DEC2014,Keyboard,53
Toshiba,Kirabook,05AUG2012,04NOV2015,Keyboard,359
Toshiba,Satellite,06MAR2014,04DEC2014,Processor,321
Asus,Transformer,18JUL2012,24JUL2014,Processor,184
Toshiba,Kirabook,19DEC2013,27SEP2015,Keyboard,391
Toshiba,Kirabook,30MAY2014,24SEP2014,Hard Drive,271
Lenovo,Yoga,22JUN2014,03JAN2015,Processor,194
HP,Probook,04SEP2013,17SEP2015,Hard Drive,116
Asus,Zenbook,2013,17MAY2015,Processor,329
HP,Pavilion,OCT2013,27NOV2015,Keyboard,132
Lenovo,Thinkpad,13FEB2014,01JUL2014,Motherboard,228
Dell,Chromebook,24APR2012,21OCT2015,Keyboard,86
Toshiba,Satellite,07OCT2012,02MAR2015,Keyboard,95
Dell,XPS,27DEC2013,24SEP2014,Hard Drive,54
HP,Pavilion,27JUL2013,13AUG2014,Keyboard,182
Lenovo,Yoga,03SEP2012,19FEB2015,Software,342
Asus,Transformer,06MAR2013,20NOV2015,Keyboard,215
Asus,Transformer,05DEC2012,13AUG2015,Keyboard,122
Dell,XPS,22APR2013,12AUG2015,Processor,259
HP,Probook,18APR2013,04AUG2015,Processor,220
Lenovo,Thinkpad,06JAN2014,14MAR2015,Software,98
Lenovo,Thinkpad,14JUL2012,31JUL2015,Keyboard,234
Lenovo,Yoga,25MAY2014,26AUG2015,Keyboard,214
Dell,XPS,05APR2013,10NOV2014,Keyboard,171
Lenovo,Thinkpad,10AUG2012,13AUG2015,Motherboard,141
Toshiba,Kirabook,22JUL2013,23JUL2014,Software,336
HP,Pavilion,24JUN2014,28OCT2015,Software,107
Asus,Transformer,23JUN2012,21JUL2015,Keyboard,207
Dell,Inspiron,12OCT2013,09OCT2014,Hard Drive,128
Lenovo,Yoga,10JAN2012,27FEB2015,Hard Drive,183
Lenovo,Yoga,17DEC2013,13FEB2015,Keyboard,357
Lenovo,Yoga,06DEC2012,01SEP2014,Keyboard,203
Lenovo,Yoga,10SEP2013,27AUG2015,Motherboard,308
Lenovo,Thinkpad,28DEC2012,14APR2015,Keyboard,180
Lenovo,Yoga,03DEC2013,23MAR2015,Hard Drive,232
Lenovo,Yoga,2013,21JUN2015,Motherboard,210
HP,Envy,29JAN2014,02NOV2014,Hard Drive,52
HP,Probook,06JUN2014,27JUL2014,Processor,252
HP,Envy,13DEC2013,02MAR2015,Hard Drive,76
HP,Pavilion,10MAR2014,07OCT2015,Motherboard,161
Dell,Inspiron,24FEB2012,18NOV2014,Hard Drive,182
Dell,Inspiron,13MAR2012,06NOV2015,Keyboard,147
Asus,Zenbook,14DEC2013,26SEP2015,Hard Drive,64
HP,Probook,27APR2012,20JUN2015,Processor,299
Lenovo,Yoga,SEP2013,29SEP2014,Hard Drive,277
Lenovo,Z Series,06NOV2012,09AUG2014,Processor,160
Dell,XPS,15MAY2012,08MAY2015,Keyboard,216
Asus,Transformer,21MAR2013,23FEB2015,Keyboard,261
Lenovo,Yoga,14MAR2013,04DEC2014,Hard Drive,385
Toshiba,Kirabook,11FEB2013,08AUG2014,Processor,281
Asus,Zenbook,27JUL2013,21MAY2015,Hard Drive,92
HP,Pavilion,07MAY2013,27AUG2015,Keyboard,316
Lenovo,Z Series,12NOV2013,27APR2015,Hard Drive,373
Lenovo,Thinkpad,08FEB2013,09DEC2015,Hard Drive,220
Toshiba,Kirabook,27APR2014,19DEC2014,Software,343
Lenovo,Thinkpad,27SEP2013,19JUN2015,Hard Drive,373
Lenovo,Thinkpad,01MAY2014,27SEP2014,Processor,221
Toshiba,Kirabook,22NOV2013,05AUG2014,Motherboard,297
Lenovo,Yoga,SEP2012,21DEC2015,Hard Drive,376
Lenovo,Thinkpad,31JAN2014,20JUL2015,Hard Drive,198
Dell,Inspiron,2012,21SEP2015,Motherboard,360
Dell,XPS,21JUN2014,28SEP2015,Hard Drive,286
Dell,XPS,02SEP2012,11NOV2015,Keyboard,238
Asus,Transformer,21AUG2013,30OCT2015,Hard Drive,188
Asus,Chromebook,10JUL2012,28OCT2014,Keyboard,117
HP,Probook,07DEC2012,10JUL2014,Keyboard,109
Dell,XPS,28OCT2013,27MAR2015,Motherboard,171
Asus,Chromebook,13SEP2012,13JAN2015,Hard Drive,371
Lenovo,Thinkpad,05JUN2014,01NOV2014,Hard Drive,239
HP,Pavilion,10JAN2013,20SEP2015,Motherboard,319
Asus,Zenbook,12MAR2014,03FEB2015,Keyboard,100
Lenovo,Yoga,30APR2014,29JUL2014,Motherboard,156
HP,Probook,26APR2013,04OCT2014,Hard Drive,387
Lenovo,Yoga,20JUL2012,02AUG2014,Hard Drive,109
HP,Pavilion,18MAR2014,07OCT2015,Keyboard,63
Toshiba,Kirabook,23JAN2012,05MAR2015,Software,113
HP,Envy,29MAR2013,05JUL2014,Motherboard,105
Dell,XPS,06APR2014,20JUL2014,Hard Drive,74
Lenovo,Thinkpad,08MAY2013,27AUG2014,Hard Drive,215
Toshiba,Satellite,01MAR2012,13MAY2015,Processor,288
Toshiba,Kirabook,2012,18JUL2015,Motherboard,205
Dell,Inspiron,22JUN2012,05AUG2014,Processor,97
Asus,Transformer,11OCT2013,08JAN2015,Hard Drive,230
HP,Pavilion,12APR2013,07JUL2014,Keyboard,294
HP,Probook,24OCT2012,17SEP2014,Processor,138
Lenovo,Yoga,14NOV2012,05SEP2015,Hard Drive,144
Asus,Transformer,2012,08DEC2015,Keyboard,120
Toshiba,Kirabook,10AUG2013,24SEP2014,Keyboard,79
Lenovo,Yoga,03JUN2012,23JUN2015,Motherboard,221
Asus,Transformer,28MAY2014,24JUL2015,Software,204
Asus,Zenbook,15FEB2014,26JAN2015,Software,191
Dell,XPS,21NOV2012,20SEP2014,Software,354
HP,Envy,23FEB2013,15SEP2014,Processor,194
Toshiba,Kirabook,30DEC2012,26DEC2014,Motherboard,353
Dell,XPS,08MAY2012,21JUL2015,Software,385
HP,Probook,27OCT2012,04DEC2015,Keyboard,158
Toshiba,Kirabook,10NOV2012,14AUG2014,Motherboard,313
Dell,Inspiron,19JAN2014,19NOV2014,Motherboard,364
HP,Pavilion,NOV2013,08JUL2015,Hard Drive,252
Dell,XPS,16NOV2012,17OCT2015,Hard Drive,187
Lenovo,Yoga,16MAY2013,06JUL2015,Hard Drive,285
Lenovo,Thinkpad,09JUN2014,14FEB2015,Hard Drive,382
Dell,XPS,06FEB2014,19APR2015,Keyboard,251
HP,Probook,20JUL2013,02JUL2014,Hard Drive,378
Lenovo,Yoga,11APR2013,02JUL2014,Hard Drive,91
Toshiba,Kirabook,JUN2014,19APR2015,Hard Drive,55
HP,Envy,14OCT2013,09NOV2014,Motherboard,164
Lenovo,Yoga,2012,04JAN2015,Motherboard,368
Lenovo,Yoga,04FEB2012,14JUL2015,Software,305
HP,Envy,28JUL2013,30NOV2015,Keyboard,335
Lenovo,Thinkpad,25JAN2014,22APR2015,Hard Drive,378
Dell,XPS,06MAR2013,17MAY2015,Hard Drive,268
Lenovo,Thinkpad,08FEB2012,24AUG2015,Software,257
Lenovo,Z Series,24NOV2013,16JUN2015,Hard Drive,186
Toshiba,Kirabook,03JUN2012,12NOV2014,Motherboard,114
Lenovo,Thinkpad,12JAN2012,21JUN2015,Keyboard,74
HP,Pavilion,12DEC2013,11DEC2014,Hard Drive,373
Lenovo,Thinkpad,13JAN2014,15JUL2014,Motherboard,199
Asus,Transformer,27MAY2013,22AUG2015,Processor,154
Dell,Inspiron,2013,23AUG2014,Software,362
Dell,Chromebook,29MAR2013,27MAR2015,Processor,82
Lenovo,Yoga,04FEB2012,13MAY2015,Keyboard,325
Lenovo,Thinkpad,30APR2013,15MAR2015,Processor,146
Toshiba,Satellite,25MAY2013,12JUL2014,Processor,184
HP,Probook,16SEP2013,16NOV2015,Motherboard,230
Toshiba,Kirabook,12OCT2012,05JAN2015,Motherboard,269
Lenovo,Thinkpad,07OCT2012,02OCT2014,Motherboard,262
Dell,Chromebook,25MAY2012,14JUL2014,Hard Drive,193
Lenovo,Yoga,22NOV2012,14NOV2015,Keyboard,194
Toshiba,Kirabook,12DEC2013,21NOV2014,Hard Drive,341
HP,Envy,31AUG2013,05NOV2014,Motherboard,211
Dell,Inspiron,02JUN2013,22OCT2014,Keyboard,262
Lenovo,Thinkpad,04APR2012,23AUG2015,Software,140
Dell,XPS,05APR2014,26AUG2014,Hard Drive,235
Lenovo,Yoga,18MAY2014,12JUL2014,Processor,274
Toshiba,Satellite,17APR2012,21FEB2015,Hard Drive,333
HP,Pavilion,2013,17OCT2015,Processor,356
Lenovo,Yoga,2013,23SEP2014,Keyboard,300
Toshiba,Kirabook,16APR2012,03APR2015,Motherboard,102
Lenovo,Thinkpad,04MAR2013,09DEC2014,Keyboard,169
Dell,XPS,09APR2012,11OCT2014,Processor,80
Asus,Zenbook,24JUL2012,24JUN2015,Hard Drive,394
Lenovo,Z Series,25JAN2012,27AUG2015,Processor,315
Lenovo,Yoga,13APR2012,11NOV2015,Processor,111
Asus,Transformer,2013,03AUG2015,Processor,251
Asus,Transformer,JUN2013,15JUL2015,Software,122
Asus,Zenbook,19JUL2012,16FEB2015,Motherboard,173
Lenovo,Thinkpad,25JUN2012,02DEC2015,Motherboard,176
Asus,Zenbook,13OCT2013,22OCT2015,Motherboard,72
Toshiba,Kirabook,15AUG2012,13AUG2015,Keyboard,266
Toshiba,Kirabook,2012,07JUL2014,Processor,193
Dell,XPS,01AUG2012,23OCT2015,Processor,364
Asus,Transformer,06FEB2013,18AUG2014,Processor,286
Lenovo,Thinkpad,10FEB2013,01FEB2015,Keyboard,193
Lenovo,Yoga,17NOV2012,26AUG2014,Keyboard,369
Asus,Zenbook,16JUN2014,26JUL2015,Processor,337
Asus,Chromebook,2013,25FEB2015,Motherboard,262
Asus,Zenbook,30MAY2013,03AUG2015,Motherboard,292
Asus,Transformer,09JUN2013,28OCT2014,Keyboard,132
Lenovo,Yoga,01DEC2012,30AUG2014,Keyboard,240
Asus,Zenbook,21NOV2013,10FEB2015,Software,389
Lenovo,Z Series,JAN2013,11JUL2015,Motherboard,376
HP,Envy,07FEB2014,04JUN2015,Motherboard,303
Lenovo,Yoga,04DEC2013,26OCT2014,Processor,114
Dell,Inspiron,13AUG2012,07NOV2015,Keyboard,262
Dell,Chromebook,09JAN2012,25OCT2014,Processor,340
Asus,Zenbook,17AUG2013,07AUG2014,Hard Drive,154
Asus,Transformer,26MAR2012,26JAN2015,Motherboard,127
Lenovo,Yoga,11JAN2013,04SEP2015,Keyboard,131
Toshiba,Kirabook,19JUL2012,27FEB2015,Hard Drive,370
Dell,XPS,18SEP2012,03NOV2014,Motherboard,337
Asus,Transformer,26JUN2013,13MAR2015,Keyboard,55
Dell,XPS,15MAR2012,25AUG2014,Keyboard,69
Asus,Zenbook,21APR2012,08MAY2015,Processor,127
Asus,Zenbook,25DEC2012,16JUN2015,Software,151
Lenovo,Thinkpad,18MAR2013,16OCT2015,Processor,316
Asus,Transformer,09JUN2013,09APR2015,Hard Drive,368
Dell,XPS,03JUL2013,30SEP2015,Keyboard,240
HP,Pavilion,02SEP2013,10AUG2014,Motherboard,204
HP,Pavilion,22MAY2013,06NOV2015,Hard Drive,251
Lenovo,Yoga,07JAN2014,30JUL2015,Keyboard,137
Lenovo,Yoga,13FEB2014,22FEB2015,Motherboard,374
Asus,Chromebook,28MAY2013,04OCT2015,Hard Drive,382
Asus,Transformer,04MAY2014,29SEP2015,Keyboard,86
Lenovo,Yoga,17NOV2012,16MAY2015,Keyboard,211
Asus,Zenbook,12DEC2012,12AUG2014,Processor,304
Dell,Inspiron,10AUG2013,13JUN2015,Keyboard,173
Dell,XPS,01DEC2012,10JUN2015,Hard Drive,380
Asus,Zenbook,26JAN2012,19JUL2014,Keyboard,287
HP,Envy,12DEC2013,09JUL2014,Software,354
Lenovo,Thinkpad,26SEP2013,12OCT2014,Keyboard,240
HP,Probook,04APR2014,04SEP2015,Processor,219
Lenovo,Z Series,09JAN2014,07NOV2015,Motherboard,185
Toshiba,Satellite,01APR2012,05AUG2015,Keyboard,99
Lenovo,Yoga,04FEB2012,19FEB2015,Motherboard,153
Asus,Zenbook,10APR2013,20DEC2015,Hard Drive,51
Dell,XPS,2012,28JUL2015,Hard Drive,159
Asus,Transformer,27MAY2014,25OCT2014,Hard Drive,139
Lenovo,Thinkpad,25MAY2012,12JUN2015,Processor,383
Toshiba,Kirabook,25JUN2013,03JUL2014,Processor,80
HP,Pavilion,31JAN2014,06NOV2014,Motherboard,270
Lenovo,Thinkpad,12APR2014,10JUL2015,Hard Drive,280
Lenovo,Yoga,14DEC2013,30OCT2015,Software,394
Asus,Zenbook,15DEC2012,20JUL2015,Motherboard,143
Asus,Transformer,01DEC2013,04JUL2014,Motherboard,124
Asus,Transformer,13DEC2013,04JUN2015,Motherboard,388
Asus,Zenbook,27MAR2014,24JAN2015,Processor,394
Asus,Zenbook,08APR2012,23AUG2015,Keyboard,102
Lenovo,Z Series,08JUN2013,11JAN2015,Motherboard,254
Lenovo,Yoga,18MAR2014,04SEP2014,Keyboard,314
HP,Envy,20JUN2012,13AUG2015,Keyboard,327
Lenovo,Thinkpad,31JAN2012,23SEP2015,Keyboard,127
Asus,Transformer,OCT2013,23SEP2015,Motherboard,340
Asus,Chromebook,29JUL2012,15APR2015,Hard Drive,269
Lenovo,Yoga,22APR2013,17JUL2014,Motherboard,190
HP,Envy,31DEC2012,10NOV2014,Hard Drive,383
Lenovo,Yoga,27MAY2014,17NOV2015,Processor,196
Asus,Zenbook,10AUG2012,13AUG2015,Hard Drive,50
Lenovo,Yoga,25JUN2012,09DEC2014,Keyboard,337
Dell,Inspiron,19JAN2012,23JUL2015,Processor,290
Asus,Zenbook,28AUG2013,30DEC2014,Processor,334
Dell,XPS,28APR2014,04JAN2015,Hard Drive,139
Lenovo,Yoga,13DEC2013,10DEC2014,Processor,302
Toshiba,Kirabook,21JAN2012,20SEP2015,Keyboard,203
Dell,Inspiron,01APR2014,09AUG2015,Processor,245
Asus,Zenbook,31DEC2013,28DEC2014,Keyboard,89
Asus,Zenbook,10APR2012,21MAR2015,Motherboard,68
Toshiba,Kirabook,08JUN2012,04OCT2015,Motherboard,119
Dell,XPS,25NOV2013,01DEC2014,Software,339
HP,Probook,01OCT2012,25JUL2014,Motherboard,242
Asus,Transformer,25JUN2012,28NOV2014,Keyboard,179
Asus,Transformer,JUN2012,08AUG2015,Keyboard,318
Lenovo,Thinkpad,21DEC2012,22SEP2014,Keyboard,332
Toshiba,Kirabook,27MAY2012,17OCT2014,Keyboard,102
Asus,Transformer,18OCT2013,02NOV2015,Hard Drive,249
Dell,XPS,04JAN2013,30OCT2014,Keyboard,95
Asus,Transformer,29JUL2013,07MAY2015,Motherboard,109
Dell,Chromebook,17DEC2013,26OCT2015,Motherboard,351
HP,Pavilion,17NOV2013,25OCT2014,Software,82
HP,Probook,28JUL2012,02SEP2015,Hard Drive,68
Asus,Transformer,24SEP2013,04AUG2015,Hard Drive,257
HP,Pavilion,2014,24SEP2015,Keyboard,361
Asus,Transformer,02FEB2013,17NOV2014,Hard Drive,264
Asus,Chromebook,04JUL2012,04DEC2014,Hard Drive,129
HP,Probook,01MAY2014,02APR2015,Processor,243
Asus,Transformer,28JUN2012,27OCT2014,Keyboard,188
HP,Envy,26JUL2012,17SEP2014,Motherboard,191
Asus,Chromebook,23MAR2012,31OCT2015,Hard Drive,275
Dell,XPS,19APR2012,01DEC2014,Motherboard,367
HP,Pavilion,01APR2013,09JUL2014,Motherboard,188
HP,Pavilion,16MAY2013,13JUL2015,Hard Drive,157
Toshiba,Kirabook,08APR2013,18JUL2015,Hard Drive,148
Toshiba,Kirabook,07MAY2012,24SEP2015,Motherboard,234
Lenovo,Yoga,14MAR2013,08AUG2015,Processor,239
Toshiba,Kirabook,10JUN2014,15AUG2014,Keyboard,158
Asus,Transformer,20NOV2012,28OCT2015,Processor,158
Lenovo,Yoga,25OCT2012,22MAY2015,Keyboard,92
Asus,Zenbook,15APR2012,21OCT2014,Hard Drive,346
Lenovo,Thinkpad,2012,18SEP2015,Processor,137
HP,Envy,06MAR2014,16JUN2015,Software,179
Lenovo,Yoga,16JUN2012,02FEB2015,Keyboard,154
Dell,Inspiron,28JUN2014,22NOV2014,Keyboard,165
Asus,Transformer,23AUG2013,21SEP2015,Software,152
HP,Probook,04MAY2014,08JAN2015,Keyboard,369
Asus,Transformer,26MAY2013,29SEP2014,Hard Drive,176
Lenovo,Thinkpad,22MAY2014,07MAY2015,Hard Drive,257
Dell,Chromebook,16MAR2014,31OCT2014,Keyboard,211
HP,Envy,13MAY2014,15AUG2014,Hard Drive,231
Asus,Transformer,04JUN2012,16JAN2015,Keyboard,275
Asus,Zenbook,07APR2012,30SEP2015,Keyboard,373
Lenovo,Yoga,20FEB2014,11AUG2015,Processor,62
Asus,Transformer,22MAR2013,12NOV2014,Motherboard,370
Asus,Transformer,31JUL2013,17DEC2014,Hard Drive,312
Lenovo,Thinkpad,30MAY2012,15AUG2014,Processor,140
Lenovo,Yoga,13APR2013,22AUG2014,Hard Drive,227
HP,Pavilion,11JAN2013,10JUL2014,Processor,128
HP,Probook,20MAY2014,20MAR2015,Hard Drive,211
Lenovo,Yoga,30OCT2013,18AUG2014,Keyboard,62
Lenovo,Thinkpad,14AUG2013,21APR2015,Motherboard,244
Dell,XPS,21MAY2012,08JAN2015,Keyboard,173
HP,Pavilion,03JUN2012,02OCT2014,Hard Drive,280
Lenovo,Thinkpad,07JUL2012,08OCT2014,Processor,343
Lenovo,Thinkpad,05FEB2014,20JUL2015,Hard Drive,128
Asus,Chromebook,01MAR2012,19APR2015,Processor,122
Dell,Inspiron,03JUN2012,03NOV2014,Processor,261
Asus,Zenbook,2013,13SEP2014,Hard Drive,82
Asus,Zenbook,MAR2014,16SEP2014,Processor,373
Toshiba,Kirabook,2013,14MAR2015,Motherboard,370
HP,Probook,16JUN2012,02FEB2015,Keyboard,286
Asus,Transformer,30MAY2013,31JUL2014,Hard Drive,269
Lenovo,Thinkpad,06MAY2012,22SEP2015,Keyboard,383
Asus,Zenbook,30MAY2013,24MAY2015,Motherboard,96
Lenovo,Yoga,FEB2013,08DEC2015,Keyboard,219
Toshiba,Kirabook,30SEP2013,20NOV2015,Motherboard,150
Dell,Chromebook,NOV2012,07MAY2015,Processor,273
Asus,Transformer,14SEP2012,24APR2015,Hard Drive,278
Asus,Zenbook,13MAR2012,19APR2015,Software,156
Asus,Transformer,27OCT2012,20NOV2015,Keyboard,195
Lenovo,Yoga,30APR2013,01SEP2015,Keyboard,233
HP,Envy,11MAR2014,14DEC2015,Keyboard,373
HP,Pavilion,24FEB2012,08AUG2014,Keyboard,376
Lenovo,Thinkpad,24FEB2014,02MAY2015,Keyboard,231
HP,Pavilion,26MAR2012,26SEP2015,Processor,331
Lenovo,Yoga,05MAR2014,05NOV2014,Keyboard,143
Lenovo,Yoga,2013,18DEC2015,Hard Drive,198
Toshiba,Kirabook,06FEB2012,02AUG2014,Processor,241
Dell,XPS,03OCT2013,09AUG2015,Keyboard,364
Lenovo,Yoga,19MAY2014,13DEC2014,Keyboard,140
Lenovo,Yoga,06APR2014,18JAN2015,Software,371
Dell,XPS,16JAN2012,20APR2015,Keyboard,389
HP,Probook,07MAY2013,29SEP2014,Processor,117
HP,Pavilion,08SEP2013,26OCT2015,Keyboard,127
Dell,Chromebook,12JAN2012,30APR2015,Keyboard,160
Lenovo,Thinkpad,24SEP2013,04JUL2014,Keyboard,314
HP,Probook,24SEP2012,14SEP2015,Processor,354
HP,Probook,21JUN2012,02DEC2014,Hard Drive,135
Asus,Transformer,APR2012,26NOV2015,Motherboard,121
HP,Envy,17NOV2012,01AUG2014,Motherboard,295
Lenovo,Yoga,22MAR2012,10OCT2014,Keyboard,324
HP,Pavilion,20FEB2014,03OCT2014,Keyboard,398
Asus,Transformer,26JUN2014,07JAN2015,Processor,173
Lenovo,Yoga,24APR2014,25NOV2014,Processor,318
Lenovo,Thinkpad,26JUN2013,06APR2015,Motherboard,318
HP,Pavilion,08JUN2014,22AUG2015,Hard Drive,300
Toshiba,Satellite,01MAY2013,14MAR2015,Keyboard,274
Lenovo,Thinkpad,06SEP2012,04AUG2015,Hard Drive,156
Toshiba,Satellite,07MAR2012,20MAY2015,Motherboard,234
Asus,Zenbook,05JUL2013,08FEB2015,Hard Drive,118
HP,Probook,18JAN2014,10MAR2015,Software,375
Lenovo,Thinkpad,2014,24JUN2015,Keyboard,278
Lenovo,Yoga,09JAN2012,02SEP2015,Keyboard,358
Lenovo,Thinkpad,16JAN2014,14JUN2015,Hard Drive,278
Lenovo,Z Series,30NOV2013,25JUL2015,Keyboard,169
Asus,Zenbook,17APR2014,02NOV2014,Hard Drive,181
Lenovo,Yoga,16SEP2012,14SEP2014,Keyboard,399
Asus,Transformer,13JUL2013,03SEP2015,Software,140
Dell,Chromebook,2013,27NOV2015,Motherboard,192
Asus,Zenbook,06DEC2012,11MAR2015,Processor,297
Lenovo,Yoga,18MAY2014,22JUL2014,Keyboard,143
Asus,Transformer,27MAR2014,04NOV2015,Motherboard,218
HP,Envy,19MAR2014,11MAY2015,Hard Drive,345
Asus,Zenbook,13OCT2013,10OCT2014,Motherboard,261
Lenovo,Yoga,01APR2012,23SEP2015,Software,299
Lenovo,Thinkpad,15MAR2014,02NOV2015,Processor,380
Asus,Zenbook,20NOV2013,26MAY2015,Motherboard,235
Dell,XPS,AUG2012,04DEC2014,Hard Drive,205
HP,Pavilion,AUG2012,08SEP2014,Hard Drive,250
Lenovo,Yoga,01AUG2012,16MAR2015,Motherboard,145
Lenovo,Yoga,17AUG2012,30MAY2015,Processor,261
Lenovo,Yoga,16JUN2014,30MAY2015,Motherboard,390
Lenovo,Yoga,23SEP2012,15FEB2015,Keyboard,134
Asus,Transformer,14JAN2013,21JUN2015,Processor,374
Toshiba,Kirabook,2014,22OCT2014,Hard Drive,379
HP,Probook,JAN2013,17FEB2015,Keyboard,257
Asus,Transformer,28OCT2012,12NOV2015,Keyboard,261
Lenovo,Yoga,12FEB2014,18APR2015,Keyboard,94
HP,Envy,31JUL2013,04AUG2015,Processor,167
Toshiba,Kirabook,25MAY2012,17OCT2015,Motherboard,75
Asus,Transformer,16FEB2012,11DEC2015,Keyboard,66
Asus,Transformer,29OCT2013,28DEC2014,Motherboard,150
Lenovo,Thinkpad,01MAR2013,16NOV2015,Processor,160
HP,Pavilion,03JAN2013,23AUG2015,Motherboard,73
Toshiba,Satellite,10MAY2013,10JAN2015,Processor,259
Dell,Chromebook,11SEP2013,01JUL2015,Hard Drive,380
HP,Envy,16AUG2012,23APR2015,Processor,345
Toshiba,Satellite,16NOV2012,29AUG2014,Hard Drive,159
HP,Probook,26OCT2012,02OCT2014,Hard Drive,132
Lenovo,Thinkpad,11OCT2013,30MAY2015,Keyboard,271
Asus,Zenbook,12APR2013,02NOV2015,Hard Drive,215
Lenovo,Yoga,01FEB2014,09SEP2015,Hard Drive,381
Lenovo,Yoga,20AUG2013,24JUL2015,Software,203
Dell,Inspiron,APR2014,21FEB2015,Keyboard,160
Lenovo,Thinkpad,21MAR2014,04JUN2015,Software,80
Lenovo,Yoga,16OCT2013,16OCT2015,Hard Drive,309
Dell,Inspiron,18JAN2014,30MAR2015,Software,144
Asus,Zenbook,26FEB2014,19JAN2015,Processor,102
Dell,Inspiron,04JAN2014,24AUG2015,Keyboard,201
Asus,Zenbook,17JUL2012,21JUL2015,Hard Drive,182
Lenovo,Thinkpad,06MAR2014,21JUL2015,Hard Drive,324
Dell,Inspiron,17JAN2013,09AUG2015,Keyboard,324
HP,Pavilion,29JUN2013,21NOV2014,Keyboard,348
HP,Probook,05NOV2012,23OCT2015,Keyboard,368
Lenovo,Z Series,26NOV2013,26AUG2015,Keyboard,114
Lenovo,Yoga,16OCT2012,13OCT2014,Keyboard,388
HP,Pavilion,05NOV2012,10JUN2015,Processor,299
Dell,XPS,30APR2014,18DEC2015,Motherboard,223
Lenovo,Yoga,OCT2013,27DEC2014,Motherboard,94
Lenovo,Z Series,10JAN2012,22JUL2015,Processor,177
Asus,Transformer,03JUN2013,09DEC2014,Keyboard,297
HP,Probook,14JAN2012,17JUN2015,Keyboard,204
Lenovo,Yoga,06MAR2014,19JUL2014,Motherboard,61
Dell,XPS,01AUG2012,09SEP2014,Processor,111
Lenovo,Yoga,12JAN2014,16OCT2014,Keyboard,204
Asus,Transformer,04APR2012,15AUG2015,Software,373
Asus,Transformer,28OCT2012,03JUL2014,Processor,350
Asus,Zenbook,12JUN2014,17AUG2014,Keyboard,92
Toshiba,Satellite,02JAN2013,12OCT2014,Motherboard,155
Toshiba,Kirabook,SEP2013,27MAR2015,Motherboard,315
Dell,XPS,11MAR2012,17AUG2015,Hard Drive,53
HP,Envy,21NOV2012,22MAR2015,Hard Drive,363
HP,Pavilion,25MAY2012,15JAN2015,Hard Drive,93
Lenovo,Yoga,25SEP2012,02JAN2015,Processor,86
Lenovo,Thinkpad,2014,27JAN2015,Hard Drive,369
Dell,Inspiron,10JAN2013,17SEP2014,Motherboard,100
HP,Pavilion,20APR2014,03MAR2015,Motherboard,88
Dell,Inspiron,15FEB2012,26AUG2015,Hard Drive,202
Lenovo,Thinkpad,13JAN2012,14MAY2015,Keyboard,113
Lenovo,Z Series,21JUN2013,28APR2015,Keyboard,200
Dell,XPS,20DEC2012,06APR2015,Hard Drive,165
Dell,XPS,04JAN2012,28NOV2015,Hard Drive,76
Dell,XPS,08AUG2012,05AUG2015,Hard Drive,346
HP,Probook,25MAR2012,17AUG2015,Software,203
Toshiba,Kirabook,26APR2013,02AUG2014,Processor,161
Asus,Transformer,08MAY2013,19OCT2014,Keyboard,67
Asus,Zenbook,21JUL2013,04SEP2015,Hard Drive,160
Asus,Transformer,12APR2012,19JUL2014,Motherboard,261
Asus,Zenbook,28NOV2013,21APR2015,Keyboard,261
Asus,Zenbook,03OCT2013,03JAN2015,Keyboard,184
Asus,Transformer,30JUL2012,10DEC2015,Processor,98
Lenovo,Yoga,15FEB2013,13JUL2014,Keyboard,82
Asus,Transformer,03JUL2012,31MAY2015,Hard Drive,168
Toshiba,Kirabook,11SEP2012,27DEC2015,Motherboard,339
Dell,XPS,30DEC2013,02AUG2014,Keyboard,320
Asus,Zenbook,2012,27JUL2014,Motherboard,345
HP,Envy,09MAY2014,28JUL2014,Hard Drive,207
Toshiba,Kirabook,02OCT2013,27AUG2015,Keyboard,53
Asus,Zenbook,19FEB2014,23FEB2015,Hard Drive,262
Toshiba,Kirabook,10DEC2013,04MAY2015,Processor,291
Lenovo,Yoga,10OCT2013,10JUL2014,Hard Drive,173
HP,Pavilion,10JUN2012,25SEP2014,Keyboard,229
Asus,Zenbook,10APR2014,27OCT2014,Motherboard,363
Lenovo,Yoga,16FEB2014,06DEC2014,Hard Drive,134
Lenovo,Thinkpad,16JUN2014,13AUG2015,Keyboard,59
Lenovo,Thinkpad,25OCT2012,14SEP2014,Motherboard,310
Asus,Zenbook,17APR2014,17FEB2015,Keyboard,181
Asus,Transformer,07MAR2014,01APR2015,Motherboard,278
Toshiba,Satellite,26MAY2014,18AUG2014,Processor,200
Dell,Chromebook,23FEB2014,18NOV2015,Motherboard,195
Lenovo,Yoga,2012,14MAY2015,Keyboard,246
Dell,XPS,01JAN2012,21APR2015,Software,121
Asus,Chromebook,19JUL2012,08DEC2015,Hard Drive,355
HP,Probook,18DEC2012,28JUL2015,Processor,65
Lenovo,Yoga,04APR2013,10AUG2014,Keyboard,235
HP,Probook,30OCT2012,16DEC2015,Software,185
Lenovo,Thinkpad,30SEP2013,06FEB2015,Keyboard,153
HP,Pavilion,29OCT2012,20JUN2015,Keyboard,83
HP,Pavilion,31MAR2012,10APR2015,Hard Drive,178
Asus,Zenbook,28AUG2013,14DEC2014,Hard Drive,220
Asus,Transformer,16MAY2013,05OCT2015,Hard Drive,54
Toshiba,Kirabook,21JAN2013,28SEP2015,Keyboard,252
HP,Pavilion,06MAY2014,17JUL2014,Keyboard,114
HP,Probook,24APR2014,20MAR2015,Software,137
Lenovo,Thinkpad,03FEB2012,31JUL2014,Keyboard,225
Asus,Zenbook,27MAY2012,19OCT2014,Keyboard,282
HP,Pavilion,26JAN2012,15DEC2014,Software,178
HP,Pavilion,27FEB2014,04DEC2015,Software,240
;
Run;

Proc Freq Data=Repair;
Table Brand / plots=freqplot;
Run;

Proc Format;
Value period 1 = "< 1 year"
             2 = "Between 1-2 year"
             3 = "Between 2-3 year"
             4 = "> 3 years";
Run;

Data Repair2;
Set Repair;
** Correct Incomplete Date **;
Format Purdatenum date9. Period Period.;
If length(Purdate) = 9 then PurdateNum = input(Purdate, date9.);
else if length(Purdate) = 7 then PurdateNum = input("15" || Purdate, date9.);
else if length(Purdate) = 4 then PurdateNum = input("15JUN" || Purdate, date9.);

Diff = Repdate - PurdateNum;

if Diff <365 then Period = 1;
else if Diff <730 then Period = 2;
else if Diff <1095 then Period = 3;
else if Diff <1460 then Period = 4;

Run;

Proc Freq Data=Repair2;
Table Period / nocum;
Run;

Proc Freq Data=Repair2;
Table Brand * Parts;
Run;

Proc Means Data=Repair2;
Var Cost;
Class Brand;
Run;

ODS PDF file='/home/your_user_name/analysis.pdf';
proc means data=profile;
var age height weight income premium;
run;

proc freq data=profile;
table gender edu race region;
run;
ods pdf close;

Data Chips;
Input Sample Sodium Calories;
Datalines;
1 160.7 114.9
2 174.4 152.5
3 159.9 150.8
4 153.0 146.4
5 165.0 194.4
6 153.2 139.9
7 142.5 148.7
8 158.9 127.9
9 165.6 137.5
10 143.4 112.0
11 161.3 118.0
12 147.9 108.8
13 164.9 136.3
14 161.4 106.2
15 179.1 138.8
16 183.5 159.6
17 158.2 136.4
18 166.9 149.8
19 170.1 172.9
20 158.8 148.4
21 174.8 166.5
22 162.8 139.6
23 165.0 139.8
24 151.2 142.6
25 163.8 104.8
26 166.3 137.1
27 165.5 108.4
28 142.0 125.6
29 161.7 131.6
30 145.4 129.6
31 152.0 135.4
32 165.8 158.6
33 158.2 124.9
34 155.1 124.5
35 158.3 136.1
36 168.4 131.0
37 169.5 192.1
38 170.3 163.3
39 157.7 133.2
40 165.9 147.0
41 155.1 156.5
42 153.2 130.3
43 166.8 137.5
44 153.7 122.4
45 170.3 125.2
46 160.7 130.5
47 164.2 111.7
48 157.4 141.8
49 153.5 146.3
50 167.4 110.9
51 152.1 156.8
52 178.7 123.3
53 140.3 132.5
54 170.1 139.3
55 158.1 162.2
56 152.4 135.4
57 157.8 123.4
58 159.2 148.9
59 155.6 135.7
60 164.6 141.4
61 139.9 128.3
62 161.2 166.7
63 180.1 133.4
64 153.4 142.0
65 155.7 134.4
66 140.4 143.9
67 163.4 161.2
68 156.3 113.4
69 152.9 115.7
70 168.8 143.4
71 166.1 133.7
72 165.7 152.1
73 162.0 122.8
74 171.3 118.7
75 161.8 128.8
76 177.7 135.5
77 148.4 179.1
78 160.3 102.6
79 141.1 125.9
80 171.3 120.9
81 147.4 131.0
82 181.4 137.0
83 173.3 157.1
84 152.0 119.7
85 189.4 103.9
86 145.9 143.6
87 170.2 128.4
88 153.3 134.7
89 158.1 147.0
90 138.5 174.7
91 159.9 167.3
92 154.0 153.0
93 158.0 173.1
94 160.5 136.3
95 159.1 125.5
96 158.2 161.5
97 170.8 128.5
98 165.8 122.0
99 143.3 146.4
100 162.2 147.0
;
Run;

proc ttest data=chips h0=120;
var calories;
run;

proc ttest data=chips;
var sodium;
run;

Data Water;
Input Sample $ Chloride;
Datalines;
S1 240.7
S2 178.4
S3 193
S4 217.8
S5 313.7
S6 276.4
S7 209.2
S8 211.5
S9 280.4
S10 208.7
S11 248.3
S12 225.7
S13 170.9
S14 181.2
S15 215.3
S16 206
S17 225.3
S18 196.7
S19 296.4
S20 142.1
S21 281.3
S22 202.1
S23 329.5
S24 208.6
S25 239.6
S26 272.8
S27 64
S28 293.4
S29 258.3
S30 303.2
S31 230.2
S32 161.5
S33 257.5
S34 267.4
S35 318.1
S36 271.1
S37 123
S38 72.3
S39 244.3
S40 223.7
S41 165.9
S42 180
S43 195.9
S44 255.5
S45 179.1
S46 230.9
S47 274.7
S48 291.4
S49 206.7
S50 287.2
S51 293.4
S52 154.5
S53 247.4
S54 145.8
S55 276.8
S56 153.6
S57 253.3
S58 267
S59 323.4
S60 264
S61 273.4
S62 311.2
S63 238.2
S64 181.1
S65 238.1
S66 179.5
S67 267.9
S68 298.8
S69 162.3
S70 353.4
S71 293.9
S72 253.6
S73 359.7
S74 315.1
S75 216
S76 242.7
S77 223.6
S78 240.4
S79 304.7
S80 142.1
S81 234.5
S82 123.8
S83 277.8
S84 234.2
S85 197.7
S86 211.4
S87 195.6
S88 311.4
S89 223.9
S90 140.5
S91 238.2
S92 261.3
S93 252.2
S94 285.5
S95 340.3
S96 177
S97 260.4
S98 219.2
S99 294.9
S100 260.7
;
Run;

Data Bulbs;
Input Bulb Hours;
datalines;
1 11192
2 8418
3 5666
4 6816
5 9343
6 11065
7 9936
8 9070
9 10250
10 11647
11 10646
12 10256
13 9602
14 12427
15 11337
16 13748
17 7073
18 5194
19 7652
20 8449
21 6502
22 8008
23 9313
24 7700
25 9791
26 9604
27 8529
28 6248
29 13781
30 11960
31 4945
32 9861
33 8342
34 9184
35 10266
36 7291
37 4203
38 8131
39 12539
40 8800
41 8322
42 8469
43 9218
44 12913
45 8378
46 6405
47 7164
48 9235
49 8908
50 4627
;
Run;

proc ttest data=bulbs H0=8000
SIDED=U;
var hours;
run;

Data Groupon;
Input Restaurant N_Bfr Profit_Bfr N_Aftr Profit_Aftr ;
Datalines;
1 90 28 328 15
2 139 37 229 7
3 96 18 225 9
4 167 49 346 18
5 90 32 266 8
6 95 16 321 4
7 90 37 342 3
8 161 61 298 14
9 123 39 385 6
10 192 71 355 7
11 90 48 261 12
12 90 69 273 13
13 134 29 252 5
14 137 10 267 8
15 117 37 263 13
16 156 38 242 14
17 158 21 320 11
18 180 80 234 12
19 188 50 295 7
20 90 43 173 10
21 114 44 401 16
22 175 20 239 7
23 90 38 289 10
24 127 15 299 13
25 150 30 336 9
26 142 10 250 9
27 90 76 179 12
28 117 53 285 7
29 111 20 297 9
30 104 45 385 12
31 90 71 277 11
32 143 69 333 9
33 174 37 335 11
34 120 44 267 6
35 104 10 305 15
36 126 42 272 12
37 101 18 340 10
38 161 30 333 7
39 114 17 322 10
40 107 10 278 11
41 124 51 329 12
42 166 62 296 11
43 135 41 322 3
44 133 21 348 10
45 106 26 258 17
46 107 61 303 6
47 113 23 311 8
48 174 24 284 14
49 178 46 220 14
50 123 10 261 15
;
Run;

Data Groupon2;
Set Groupon;
Total_Bfr = N_Bfr*Profit_Bfr;
Total_Aftr = N_Aftr*Profit_Aftr;
Run;

Proc ttest data=groupon2;
paired total_bfr*total_aftr;
Run;

Data Campaign;
Input Segement Group Purchase;
Datalines;
23 1 1118
23 1 1326
23 0 1774
23 0 1483
23 0 1226
23 0 1021
23 1 982
23 1 1647
23 1 1535
23 1 442
23 0 81
23 0 232
23 1 1175
23 0 2596
23 1 1743
23 0 1251
23 1 1454
23 1 69
23 0 224
23 0 1442
23 1 1177
23 0 1483
23 0 1910
23 0 69
23 0 255
23 0 855
23 1 259
23 1 360
23 1 337
23 0 1805
23 0 867
23 0 1487
23 0 173
23 1 1446
23 0 1447
23 1 1703
23 0 491
23 0 1970
23 0 1290
23 1 1787
23 0 368
23 0 1018
23 0 1881
23 1 1137
23 1 693
23 0 1097
23 1 3157
23 1 1427
23 0 1436
23 0 681
23 0 1095
23 1 1848
23 0 547
23 0 527
23 1 1143
23 1 1446
23 1 1053
23 0 2212
23 0 2066
23 1 1057
23 1 1326
23 1 0
23 1 1261
23 1 1998
23 0 1416
23 1 759
23 0 1346
23 0 766
23 1 1378
23 1 246
;
Run;

proc ttest data=campaign;
class group;
var purchase;
run;

ods output statistics = stat conflimits = confl equality = equa ttests = tresults;
proc ttest data=campaign;
class group;
var purchase;
run;

Data Voter;
Infile datalines dsd;
Input Voter Party : $12. Income : $20.;
Datalines;
1,Democrat,< 70K 2,Republican,70K - 120K 3,Democrat,70K - 120K 4,Republican,70K - 120K 5,Republican,< 70K 6,Democrat,70K - 120K 7,Republican,>120 K
8,Democrat,>120 K
9,Republican,70K - 120K
10,Republican,>120 K
11,Republican,>120 K
12,Republican,>120 K
13,Democrat,>120 K
14,Republican,< 70K 15,Republican,< 70K 16,Democrat,>120 K
17,Republican,< 70K 18,Republican,70K - 120K 19,Republican,70K - 120K 20,Democrat,>120 K
21,Democrat,70K - 120K
22,Republican,>120 K
23,Democrat,< 70K 24,Republican,>120 K
25,Republican,< 70K 26,Democrat,< 70K 27,Republican,>120 K
28,Republican,70K - 120K
29,Republican,>120 K
30,Democrat,70K - 120K
31,Democrat,< 70K 32,Democrat,>120 K
33,Republican,>120 K
34,Democrat,< 70K 35,Democrat,>120 K
36,Republican,< 70K 37,Democrat,>120 K
38,Republican,>120 K
39,Republican,70K - 120K
40,Democrat,>120 K
41,Democrat,70K - 120K
42,Democrat,70K - 120K
43,Democrat,>120 K
44,Democrat,70K - 120K
45,Republican,>120 K
46,Democrat,>120 K
47,Republican,70K - 120K
48,Democrat,>120 K
49,Republican,< 70K 50,Democrat,>120 K
51,Democrat,>120 K
52,Democrat,70K - 120K
53,Democrat,>120 K
54,Democrat,< 70K 55,Republican,< 70K 56,Republican,< 70K 57,Democrat,>120 K
58,Democrat,< 70K 59,Republican,>120 K
60,Democrat,>120 K
61,Democrat,70K - 120K
62,Republican,< 70K 63,Democrat,70K - 120K 64,Republican,70K - 120K 65,Democrat,< 70K 66,Republican,>120 K
67,Democrat,>120 K
68,Democrat,< 70K 69,Republican,70K - 120K 70,Democrat,70K - 120K 71,Democrat,>120 K
72,Republican,< 70K 73,Democrat,>120 K
74,Democrat,70K - 120K
75,Republican,< 70K 76,Republican,< 70K 77,Republican,70K - 120K 78,Republican,>120 K
79,Democrat,< 70K 80,Democrat,70K - 120K 81,Democrat,>120 K
82,Democrat,< 70K 83,Republican,>120 K
84,Republican,< 70K 85,Democrat,< 70K 86,Republican,>120 K
87,Democrat,< 70K 88,Democrat,>120 K
89,Democrat,70K - 120K
90,Republican,< 70K 91,Republican,>120 K
92,Democrat,< 70K 93,Republican,70K - 120K 94,Democrat,< 70K 95,Democrat,< 70K 96,Democrat,>120 K
97,Republican,70K - 120K
98,Republican,70K - 120K
99,Republican,70K - 120K
100,Democrat,>120 K
;
Run;

proc freq data = voter;
table party * income / chisq;
Run;

proc freq data=voter;
table party * income / fisher;
run;

Data Wine;
Input Price Qty;
Datalines;
10.1 242
13.1 168
20.0 162
10.4 199
12.0 198
18.6 159
17.9 171
19.1 142
17.1 184
12.1 185
18.9 168
12.7 162
10.7 201
19.4 171
18.9 160
10.7 230
13.4 206
12.8 206
11.6 223
17.8 180
12.9 206
13.5 166
15.6 153
18.3 175
16.6 188
12.8 193
16.8 161
19.5 168
15.4 176
17.2 179
15.5 166
19.6 143
11.2 184
14.6 199
13.2 190
12.8 166
17.4 144
15.5 155
19.8 155
15.2 167
13.0 199
18.9 155
17.1 162
13.9 165
17.1 173
16.7 152
17.4 154
14.0 168
13.8 195
19.1 168
12.8 213
16.5 183
13.2 168
13.8 203
13.3 176
13.3 209
16.5 157
19.6 156
19.4 159
17.0 178
13.5 190
15.1 191
13.0 174
14.4 198
11.1 174
17.8 150
12.5 203
18.3 177
12.1 164
15.4 156
17.3 161
13.8 201
11.1 204
16.3 165
18.8 172
19.6 167
14.8 199
16.0 193
11.4 202
14.0 162
15.4 159
17.6 181
18.5 179
14.2 152
14.5 154
16.2 190
10.3 176
15.9 191
16.8 161
16.6 177
13.0 159
18.2 168
19.9 158
15.5 186
17.7 170
13.9 171
14.1 202
19.8 146
15.5 149
11.3 193
;
Run;

Proc Corr Data=Wine;
Var Price Qty;
Run;

proc corr data =wine plots=matrix;
	var price qty;
run;

Data Wolf;
Infile datalines dsd;
Input mark esti;
Datalines;
1,7142
2,6523
3,6105
4,5746
5,6879
6,6389
7,6444
8,6045
9,6522
10,5944
11,6522
12,6246
13,6622
14,5588
15,5787
16,6938
17,7340
18,5898
19,6545
20,6234
21,6417
22,6234
23,6792
24,6475
25,5432
26,6205
27,6564
28,6039
29,6198
30,5835
31,6186
32,6056
33,7408
34,6850
35,7106
36,6076
37,6386
38,7254
39,6504
40,5971
41,6434
42,5829
43,5995
44,6186
45,6278
46,6616
47,5990
48,6256
49,5779
50,6159
;
Run;

proc ttest data=wolf H0=6500 Sided=L;
Var esti;
Run;


Data Coffee;
Infile Datalines dsd;
Input Brand :$8. Sample Caffeine;
Datalines;
Brand A,1,10.95
Brand A,2,10.77
Brand A,3,8.04
Brand A,4,7.13
Brand A,5,6.89
Brand A,6,10.72
Brand A,7,10.82
Brand A,8,7.79
Brand A,9,5.17
Brand A,10,6.38
Brand A,11,7.04
Brand A,12,6.24
Brand A,13,6.51
Brand A,14,2.74
Brand A,15,6.24
Brand A,16,3.58
Brand A,17,8.82
Brand A,18,5.47
Brand A,19,5.40
Brand A,20,4.43
Brand A,21,7.67
Brand A,22,6.52
Brand A,23,6.70
Brand A,24,8.24
Brand A,25,5.12
Brand A,26,10.13
Brand A,27,5.23
Brand A,28,11.18
Brand A,29,8.06
Brand A,30,4.71
Brand A,31,7.09
Brand A,32,6.75
Brand A,33,6.24
Brand A,34,6.42
Brand A,35,4.49
Brand A,36,7.10
Brand A,37,8.88
Brand A,38,5.43
Brand A,39,5.41
Brand A,40,8.08
Brand A,41,6.79
Brand A,42,8.76
Brand A,43,7.62
Brand A,44,7.69
Brand A,45,7.80
Brand A,46,5.30
Brand A,47,6.19
Brand A,48,7.53
Brand A,49,7.62
Brand A,50,8.45
Brand A,51,4.62
Brand A,52,5.95
Brand A,53,9.76
Brand A,54,1.98
Brand A,55,9.26
Brand A,56,10.07
Brand A,57,10.61
Brand A,58,5.09
Brand A,59,6.61
Brand A,60,6.50
Brand A,61,8.58
Brand A,62,6.82
Brand A,63,6.88
Brand A,64,8.42
Brand A,65,7.00
Brand A,66,7.63
Brand A,67,7.55
Brand A,68,6.83
Brand A,69,7.21
Brand A,70,11.61
Brand A,71,8.41
Brand A,72,6.24
Brand A,73,9.15
Brand A,74,7.40
Brand A,75,5.11
Brand A,76,9.35
Brand A,77,8.90
Brand A,78,5.91
Brand A,79,3.83
Brand A,80,4.88
Brand A,81,3.16
Brand A,82,3.50
Brand A,83,8.81
Brand A,84,6.60
Brand A,85,6.66
Brand A,86,9.67
Brand A,87,11.85
Brand A,88,6.00
Brand A,89,5.06
Brand A,90,6.11
Brand A,91,6.13
Brand A,92,3.91
Brand A,93,8.98
Brand A,94,4.51
Brand A,95,10.43
Brand A,96,7.63
Brand A,97,5.16
Brand A,98,9.11
Brand A,99,7.42
Brand A,100,6.42
Brand B,1,11.36
Brand B,2,12.50
Brand B,3,15.89
Brand B,4,15.03
Brand B,5,13.96
Brand B,6,10.93
Brand B,7,14.86
Brand B,8,10.80
Brand B,9,11.82
Brand B,10,14.27
Brand B,11,12.38
Brand B,12,15.36
Brand B,13,15.28
Brand B,14,14.21
Brand B,15,15.22
Brand B,16,13.64
Brand B,17,14.47
Brand B,18,17.43
Brand B,19,15.21
Brand B,20,13.54
Brand B,21,16.35
Brand B,22,10.77
Brand B,23,12.63
Brand B,24,11.23
Brand B,25,14.26
Brand B,26,15.62
Brand B,27,14.35
Brand B,28,14.22
Brand B,29,13.31
Brand B,30,14.36
Brand B,31,14.45
Brand B,32,14.83
Brand B,33,15.52
Brand B,34,13.28
Brand B,35,12.98
Brand B,36,15.12
Brand B,37,14.56
Brand B,38,13.67
Brand B,39,14.16
Brand B,40,15.96
Brand B,41,13.07
Brand B,42,13.34
Brand B,43,16.26
Brand B,44,16.86
Brand B,45,15.96
Brand B,46,16.02
Brand B,47,14.42
Brand B,48,13.34
Brand B,49,16.65
Brand B,50,14.61
Brand B,51,13.28
Brand B,52,14.29
Brand B,53,12.92
Brand B,54,13.59
Brand B,55,12.44
Brand B,56,16.89
Brand B,57,16.53
Brand B,58,11.51
Brand B,59,13.69
Brand B,60,11.41
Brand B,61,15.61
Brand B,62,15.29
Brand B,63,15.05
Brand B,64,17.72
Brand B,65,13.09
Brand B,66,12.49
Brand B,67,13.70
Brand B,68,15.06
Brand B,69,13.11
Brand B,70,14.86
Brand B,71,12.72
Brand B,72,14.44
Brand B,73,14.31
Brand B,74,15.10
Brand B,75,13.56
Brand B,76,12.53
Brand B,77,10.13
Brand B,78,11.45
Brand B,79,14.45
Brand B,80,13.65
Brand B,81,10.85
Brand B,82,13.78
Brand B,83,17.38
Brand B,84,14.09
Brand B,85,13.38
Brand B,86,12.59
Brand B,87,9.36
Brand B,88,13.11
Brand B,89,11.56
Brand B,90,10.82
Brand B,91,14.78
Brand B,92,15.07
Brand B,93,11.30
Brand B,94,13.83
Brand B,95,16.43
Brand B,96,15.60
Brand B,97,16.37
Brand B,98,14.70
Brand B,99,14.60
Brand B,100,14.30
Brand C,1,8.72
Brand C,2,4.91
Brand C,3,6.04
Brand C,4,7.17
Brand C,5,6.86
Brand C,6,9.33
Brand C,7,7.84
Brand C,8,4.93
Brand C,9,7.54
Brand C,10,6.00
Brand C,11,9.99
Brand C,12,8.01
Brand C,13,10.27
Brand C,14,6.21
Brand C,15,2.58
Brand C,16,10.87
Brand C,17,6.34
Brand C,18,9.61
Brand C,19,8.82
Brand C,20,6.49
Brand C,21,9.23
Brand C,22,2.43
Brand C,23,3.42
Brand C,24,5.19
Brand C,25,6.43
Brand C,26,1.98
Brand C,27,6.81
Brand C,28,4.31
Brand C,29,5.48
Brand C,30,8.34
Brand C,31,4.86
Brand C,32,7.97
Brand C,33,8.99
Brand C,34,7.99
Brand C,35,4.27
Brand C,36,10.59
Brand C,37,4.25
Brand C,38,8.27
Brand C,39,8.10
Brand C,40,11.49
Brand C,41,11.14
Brand C,42,9.14
Brand C,43,5.55
Brand C,44,8.20
Brand C,45,7.00
Brand C,46,2.26
Brand C,47,4.92
Brand C,48,9.02
Brand C,49,6.53
Brand C,50,7.98
Brand C,51,7.87
Brand C,52,6.41
Brand C,53,4.09
Brand C,54,5.43
Brand C,55,5.07
Brand C,56,7.01
Brand C,57,4.94
Brand C,58,5.94
Brand C,59,6.37
Brand C,60,4.96
Brand C,61,10.78
Brand C,62,3.58
Brand C,63,9.60
Brand C,64,7.12
Brand C,65,8.29
Brand C,66,4.91
Brand C,67,10.75
Brand C,68,6.65
Brand C,69,9.00
Brand C,70,6.63
Brand C,71,5.47
Brand C,72,10.16
Brand C,73,8.77
Brand C,74,8.92
Brand C,75,7.79
Brand C,76,9.18
Brand C,77,6.85
Brand C,78,8.11
Brand C,79,11.05
Brand C,80,7.38
Brand C,81,7.98
Brand C,82,3.97
Brand C,83,4.36
Brand C,84,4.64
Brand C,85,8.73
Brand C,86,8.52
Brand C,87,7.15
Brand C,88,7.55
Brand C,89,5.55
Brand C,90,6.07
Brand C,91,6.05
Brand C,92,5.52
Brand C,93,8.06
Brand C,94,7.08
Brand C,95,6.60
Brand C,96,7.83
Brand C,97,6.72
Brand C,98,6.94
Brand C,99,2.86
Brand C,100,7.42
;
Run;

Proc ttest data=coffee H0=7;
var caffeine;
by brand;
run;

Data Poker;
Infile datalines dsd;
Input time $ visit results;
Datalines;
Before,1,-956.2
Before,2,-574.7
Before,3,-464.7
Before,4,-923.0
Before,5,-625.8
Before,6,-586.0
Before,7,-562.0
Before,8,-645.9
Before,9,-856.7
Before,10,-68.6
After,1,-214.7
After,2,-65.7
After,3,-146.2
After,4,-132.0
After,5,-168.8
After,6,-38.1
After,7,71.1
After,8,196.3
After,9,-26.5
After,10,-155.0
;
Run;

Proc ttest data=poker;
class time;
var results;
run;

Data Wine;
Infile datalines dsd;
Input Participant Rate1 Rate2;
Datalines;
1,83.0,86.5
2,82.5,84.0
3,83.5,79.9
4,76.1,87.5
5,85.1,85.2
6,80.0,89.2
7,76.9,86.5
8,79.1,85.0
9,80.5,86.9
10,79.7,86.9
11,76.4,84.3
12,81.6,84.0
13,80.4,86.2
14,83.3,84.1
15,79.8,79.1
16,82.0,90.4
17,84.3,85.5
18,78.9,90.1
19,83.0,84.4
20,76.1,90.8
21,80.4,88.8
22,81.3,89.7
23,82.5,88.2
24,86.6,82.8
25,79.0,86.3
26,81.0,86.8
27,83.6,83.5
28,78.3,85.2
29,81.8,96.3
30,84.8,83.4
31,78.3,88.5
32,84.8,90.9
33,89.5,85.8
34,76.7,87.2
35,82.3,90.7
36,81.8,82.5
37,83.4,81.5
38,84.0,87.7
39,81.9,86.5
40,74.3,89.2
41,78.7,87.7
42,81.1,82.5
43,76.0,82.9
44,79.4,88.8
45,80.8,90.7
46,81.8,87.0
47,81.4,89.8
48,74.3,87.6
49,82.3,90.2
50,75.6,85.1
51,77.6,83.4
52,77.8,82.5
53,80.3,87.4
54,79.1,85.9
55,81.9,80.1
56,81.5,85.5
57,84.6,86.9
58,78.1,87.9
59,82.3,86.6
60,77.8,83.2
61,88.4,86.8
62,80.8,89.4
63,82.2,89.9
64,80.7,88.1
65,82.9,84.8
66,81.7,84.4
67,80.4,90.7
68,78.6,87.1
69,81.0,85.5
70,82.6,86.9
71,77.3,86.1
72,76.5,87.1
73,76.7,87.1
74,77.5,88.1
75,78.1,96.1
76,79.9,90.0
77,80.0,86.3
78,78.3,88.5
79,80.6,85.8
80,89.4,84.2
81,82.5,85.9
82,79.2,84.9
83,82.8,87.2
84,80.9,84.2
85,79.1,89.7
86,77.6,82.3
87,80.7,91.0
88,76.6,92.3
89,84.9,91.5
90,79.1,86.3
91,77.6,87.6
92,80.6,88.6
93,74.9,87.5
94,81.9,87.1
95,83.3,87.0
96,77.6,88.8
97,77.1,86.3
98,83.2,90.5
99,78.7,89.1
100,84.5,83.0
101,77.3,83.7
102,81.7,87.9
103,80.7,87.7
104,77.7,91.1
105,77.7,89.3
106,85.2,88.9
107,80.7,90.1
108,73.4,86.2
109,78.0,86.7
110,77.0,81.8
111,80.2,88.1
112,82.4,80.6
113,81.9,86.8
114,72.6,86.5
115,84.8,86.0
116,79.8,89.4
117,76.1,92.3
118,76.7,83.5
119,78.8,86.7
120,76.0,85.6
121,77.7,81.1
122,79.2,86.8
123,77.1,90.3
124,83.0,92.7
125,80.0,85.2
126,80.2,84.0
127,82.4,89.7
128,78.9,88.9
129,79.1,88.4
130,80.5,88.2
131,80.0,91.1
132,81.2,90.1
133,75.8,83.0
134,78.1,90.8
135,79.7,87.4
136,77.0,87.3
137,82.8,80.5
138,85.2,85.4
139,83.1,89.7
140,86.0,88.3
141,79.5,88.2
142,78.5,84.4
143,82.3,89.2
144,80.5,86.1
145,84.1,81.1
146,75.9,86.3
147,78.0,86.2
148,75.6,86.3
149,78.0,88.7
150,81.6,91.4
151,82.8,91.4
152,77.8,87.4
153,83.5,88.9
154,76.5,85.8
155,78.9,88.0
156,79.0,88.7
157,79.0,91.8
158,83.2,91.5
159,73.2,83.2
160,79.7,86.1
161,76.4,83.1
162,75.7,93.2
163,81.5,83.2
164,80.4,84.5
165,78.1,84.3
166,84.3,90.2
167,79.5,88.7
168,78.8,87.3
169,78.3,87.6
170,75.8,85.5
171,82.7,83.6
172,76.1,87.6
173,82.6,86.0
174,83.6,84.1
175,76.6,87.3
176,81.6,89.4
177,84.4,87.1
178,82.5,86.8
179,80.3,86.1
180,79.1,87.0
181,81.5,89.5
182,79.9,80.3
183,84.7,85.4
184,79.6,88.7
185,78.4,84.7
186,79.4,93.7
187,82.5,86.9
188,83.8,89.0
189,76.5,92.0
190,84.8,87.6
191,88.0,86.7
192,86.7,86.5
193,81.7,87.3
194,83.6,90.8
195,82.2,88.2
196,81.8,88.4
197,81.4,89.9
198,76.0,87.6
199,82.3,86.9
200,81.0,92.1
201,81.6,88.7
202,80.2,87.1
203,81.1,89.5
204,79.3,84.1
205,79.4,92.5
206,81.3,88.5
207,82.3,89.2
208,79.1,80.1
209,77.4,85.9
210,81.9,81.1
211,79.2,92.0
212,82.1,92.9
213,81.2,88.5
214,83.5,81.6
215,76.2,86.2
216,76.0,89.7
217,83.9,86.6
218,84.0,85.3
219,81.5,86.1
220,79.5,86.3
221,83.8,84.3
222,86.8,87.0
223,74.4,86.2
224,80.4,90.4
225,75.3,82.7
226,83.0,93.2
227,71.0,89.9
228,77.8,84.0
229,82.3,85.5
230,77.3,90.7
231,83.4,83.9
232,76.5,87.0
233,77.6,85.3
234,82.5,78.5
235,78.5,88.5
236,77.9,88.2
237,88.0,86.7
238,72.9,84.0
239,82.2,88.4
240,81.1,86.1
241,79.4,86.1
242,79.1,84.4
243,85.9,85.7
244,82.2,84.0
245,79.8,89.8
246,78.1,88.5
247,83.5,90.8
248,78.8,81.8
249,77.8,86.6
250,83.5,91.6
251,79.0,82.8
252,75.5,92.2
253,83.6,94.6
254,76.0,84.8
255,81.3,81.9
256,79.5,82.1
257,82.4,88.3
258,82.7,83.1
259,79.3,87.5
260,82.3,86.7
261,80.6,90.2
262,80.6,88.1
263,79.4,89.9
264,79.7,85.6
265,75.8,93.4
266,78.4,86.6
267,74.5,91.3
268,84.1,85.9
269,82.1,91.0
270,80.2,83.8
271,84.2,89.2
272,72.7,88.9
273,76.0,84.4
274,81.0,81.2
275,73.2,85.3
276,80.9,86.9
277,77.3,87.9
278,78.5,83.9
279,83.0,82.8
280,79.8,88.3
281,80.4,89.5
282,72.6,87.6
283,78.4,89.6
284,79.7,82.8
285,77.6,89.6
286,83.4,88.4
287,81.3,87.1
288,73.6,87.0
289,76.9,89.2
290,81.5,94.2
291,81.7,82.7
292,83.4,88.9
293,84.6,83.6
294,80.8,89.3
295,81.9,82.9
296,79.4,81.5
297,85.8,89.7
298,82.2,87.2
299,81.7,84.7
300,90.3,87.9
301,81.9,86.8
302,81.5,86.7
303,76.5,84.0
304,79.4,83.6
305,80.2,86.8
306,79.7,88.4
307,76.8,83.8
308,81.2,87.9
309,76.7,81.6
310,77.2,86.6
311,81.6,84.2
312,84.0,89.6
313,79.2,86.0
314,79.6,87.9
315,74.8,79.9
316,81.5,89.5
317,77.6,85.8
318,78.7,93.9
319,77.7,89.4
320,79.7,85.1
321,82.3,93.6
322,71.1,83.7
323,84.8,86.2
324,79.0,83.6
325,75.0,86.7
326,82.0,88.7
327,84.6,91.4
328,80.5,86.7
329,79.5,84.6
330,72.6,87.7
331,80.0,89.4
332,85.9,94.5
333,78.9,88.4
334,76.0,87.4
335,76.0,81.0
336,75.9,93.4
337,82.0,85.0
338,81.7,81.6
339,79.4,89.5
340,74.4,82.4
341,80.1,88.0
342,80.3,85.2
343,80.9,87.2
344,77.1,85.5
345,74.4,79.5
346,77.8,93.1
347,79.8,88.4
348,81.7,88.7
349,78.9,85.8
350,82.6,85.6
351,81.2,92.2
352,82.7,88.3
353,78.5,89.2
354,80.6,90.4
355,75.7,90.4
356,82.1,88.0
357,81.9,91.2
358,82.4,84.6
359,76.4,83.2
360,79.7,84.6
361,77.3,79.1
362,79.9,86.2
363,82.9,87.5
364,79.3,84.7
365,77.9,81.1
366,82.1,89.9
367,81.4,86.0
368,81.2,85.6
369,81.0,87.1
370,74.9,88.6
371,79.4,83.1
372,75.7,86.2
373,79.9,84.9
374,73.7,87.7
375,80.2,81.4
376,77.0,87.1
377,81.0,82.5
378,84.1,84.3
379,78.8,89.3
380,81.6,84.9
381,83.1,87.7
382,76.4,87.6
383,82.8,89.9
384,77.0,84.5
385,80.9,89.0
386,85.4,87.5
387,76.4,85.4
388,82.9,90.5
389,75.5,85.0
390,79.4,83.5
391,81.8,92.9
392,79.5,85.5
393,83.0,83.7
394,79.5,86.3
395,81.3,88.4
396,80.3,84.7
397,81.5,93.1
398,78.8,88.9
399,81.6,87.8
400,84.7,84.5
401,76.1,85.7
402,83.6,93.2
403,80.4,89.9
404,81.1,85.9
405,74.2,85.1
406,79.9,85.4
407,78.4,89.3
408,79.0,87.6
409,79.4,88.6
410,81.6,87.3
411,76.4,89.7
412,80.7,89.0
413,75.4,86.4
414,79.4,93.2
415,82.7,90.0
416,77.0,88.3
417,78.6,88.6
418,80.9,88.0
419,80.2,92.6
420,78.8,85.3
421,73.2,89.1
422,77.3,88.2
423,77.6,90.6
424,80.0,87.5
425,84.5,90.5
426,78.7,86.9
427,88.7,85.6
428,79.0,86.1
429,78.6,90.1
430,75.1,93.3
431,75.1,86.0
432,75.3,85.0
433,78.1,88.9
434,81.8,86.6
435,76.8,88.5
436,78.4,81.9
437,77.6,86.5
438,81.2,88.7
439,80.1,83.2
440,80.3,91.0
441,80.0,90.5
442,77.1,90.8
443,82.1,85.7
444,79.4,89.5
445,83.5,84.1
446,80.8,88.8
447,80.7,90.1
448,83.7,90.1
449,77.9,86.8
450,76.6,95.0
451,76.4,84.7
452,82.2,82.1
453,81.5,88.3
454,82.3,84.2
455,86.0,87.6
456,81.6,92.2
457,76.1,88.8
458,79.3,90.0
459,77.0,80.7
460,84.4,84.1
461,79.6,89.6
462,79.0,91.2
463,82.1,86.6
464,77.7,85.0
465,80.9,90.4
466,79.5,80.3
467,82.4,89.7
468,79.8,89.5
469,79.3,89.5
470,76.4,89.2
471,79.5,88.3
472,78.5,82.4
473,71.3,87.9
474,82.7,89.2
475,77.0,86.6
476,78.7,84.2
477,79.2,89.4
478,79.1,87.1
479,82.0,87.8
480,75.9,87.2
481,81.4,86.8
482,75.2,83.7
483,83.6,90.2
484,74.1,85.1
485,84.4,83.3
486,74.6,80.3
487,79.6,92.0
488,80.4,82.1
489,86.4,85.5
490,84.1,83.0
491,83.6,85.0
492,80.1,87.6
493,79.7,87.0
494,83.5,88.4
495,77.6,90.5
496,76.6,84.3
497,79.5,83.8
498,77.2,84.7
499,76.7,84.7
500,75.2,87.6
;
Run;

proc ttest data=wine;
paired rate1*rate2;
run;

