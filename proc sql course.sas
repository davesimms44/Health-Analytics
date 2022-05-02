LIBNAME sqlprac '/home/u59478853/IQVIA PRACTICE'; 
run;

data school;
infile datalines dsd;
input name : $20. gender $ age school $ height;
datalines;
Angelo,M,13,School B,53.7
Anh,F,15,School A,71.1
Art,M,15,School C,58.4
Benita,F,13,School C,52
Brigida,F,16,School C,64.6
Chau,F,15,School A,56.7
Foster,M,13,School A,58.9
Genaro,M,15,School A,62.2
Hoa,F,14,School C,55.2
Jayson,M,13,School A,66.5
Jeffery,M,16,School A,68.2
Joselyn,F,16,School B,63.1
Karine,F,16,School B,55.2
Keli,F,13,School C,60.4
Krystal,F,15,School C,58.3
Lu,F,14,School B,61.3
Marylouise,F,13,School B,52.6
Sherise,F,15,School C,57
Tamie,F,16,School B,53.2
Tiny,F,15,School C,64.6
;
run;

proc sql;
SELECT model 
from sashelp.cars
quit;

proc sql;
SELECT make, model, MRSP
FROM sashelp.cars;
quit;

proc sql;
select make, model mrsp,
msrp * 0.02 as commission
label = 'COmmission (2% of MSRP)'
from sashelp.cars;

data salary;
input id $ salary;
datalines;
EM100 70000
EM101 58000
EM102 45000
EM103 98000
EM104 40000
EM105 63000
EM106 91000
EM107 48000
EM108 50000
EM109 46000
EM110 60000
EM111 47000
EM112 92000
EM113 59000
EM114 74000
EM115 50000
EM116 97000
EM117 72000
EM118 57000
EM119 44000
EM120 57000
EM121 42000
EM122 72000
EM123 70000
EM124 53000
EM125 63000
EM126 56000
EM127 89000
EM128 62000
EM129 84000
EM130 51000
EM131 44000
EM132 73000
EM133 77000
EM134 82000
EM135 68000
EM136 74000
EM137 89000
EM138 48000
EM139 68000
EM140 47000
EM141 55000
EM142 86000
EM143 60000
EM144 63000
EM145 96000
EM146 85000
EM147 60000
EM148 95000
EM149 73000
EM150 44000
EM151 40000
EM152 88000
EM153 61000
EM154 75000
EM155 45000
EM156 84000
EM157 63000
EM158 94000
EM159 42000
EM160 45000
EM161 71000
EM162 48000
EM163 68000
EM164 77000
EM165 72000
EM166 72000
EM167 97000
EM168 53000
EM169 48000
EM170 48000
EM171 70000
EM172 47000
EM173 88000
EM174 66000
EM175 80000
EM176 85000
EM177 51000
EM178 67000
EM179 46000
EM180 44000
EM181 59000
EM182 54000
EM183 60000
EM184 87000
EM185 82000
EM186 50000
EM187 77000
EM188 72000
EM189 84000
EM190 58000
EM191 50000
EM192 49000
EM193 70000
EM194 41000
EM195 44000
EM196 82000
EM197 97000
EM198 87000
EM199 92000
EM200 90000
;
run;


proc sql;
select *,
case
when salary < 60000 then salary*0.05
when salary between 60000 and 80000 then salary*0.06
when salary > 80000 then salary*0.055
end as bonus
from salary;
quit;


proc sql;
SELECT *
from sashelp.shoes;
where sales between 200000 and 300000;
quit;

proc sql;
select make, model, msrp, invoice,
msrp-invoice as diff
from sashelp.cars
where calculated diff > 9000;
quit;


proc sql;
select make, model, msrp, invoice
msrp-invoice as diff
from sashelp.cars
where msrp-invoice > 9000;
quit;

data bestproduct;
infile datalines dlm='09'x;
input category : $100. award : $100. product : $100.;
datalines;
Overall Products and Technologies Product of the Year Asus Transformer Book T100
Overall Products and Technologies Technology of the Year Chromebooks
Overall Products and Technologies Potential Breakout Technology of 2014 Intel ʺBay Trailʺ Processors
Overall Products and Technologies Best Geek-Tech Product of the Year Asus Transformer AIO P1801
Overall Products and Technologies Best Geek-Tech Product of the Year (Honorable Mention) Nvidia Shield
Overall Products and Technologies Top Flop Windows RT
Laptops Laptop of the Year (All Categories) Apple MacBook Air (13.3-inch, 2013 Version)
Laptops Best Big-Screen Laptop Apple MacBook Pro With Retina Display (15-inch, 2013 Version)
Laptops Best Budget Big-Screen Laptop Gateway NE72206u
Laptops Best High-End Gaming Laptop Alienware 17
Laptops Best Mainstream Gaming Laptop MSI GX70 3BE-007US
Laptops Best Midsize Gaming Laptop Razer Blade (2013)
Laptops Best Midsize Laptop Lenovo IdeaPad U430 Touch
Laptops Best Light Laptop Apple MacBook Air (11.6-inch, 2013 Version)
Laptops Best Ultrabook Sony VAIO Pro 11 and 13
Laptops Best Business Laptop Lenovo ThinkPad Edge E431
Laptops Best Budget Laptop (Conventional) Asus VivoBook X202E-DH31T
Laptops Best Budget Laptop (Hybrid) Asus Transformer Book T100
Laptops Best-Designed Laptop Sony VAIO Flip 15
Laptops Best Convertible Laptop Lenovo Yoga 2 Pro
Laptops Best Detachable Laptop/Tablet Asus Transformer Book T100
Laptops Best Chromebook Google Chromebook Pixel
Desktops Desktop of the Year (All Categories) Dell XPS 27
Desktops Best All-in-One PC Apple iMac (27-Inch, 2013 Version)
Desktops Best All-in-One PC (Honorable Mention) Dell Inspiron 23
Desktops Best Gaming Desktop Maingear Shift Super Stock (2013)
Desktops Best Mainstream Gaming Tower Digital Storm ODE Level 3
Desktops Best Compact Gaming PC Alienware X51 (2013)
Desktops Best Business Desktop HP Z230 Workstation
Desktops Best Cost-No-Object Desktop Origin Genesis
Desktops Best Small-Form-Factor Desktop Zotac Zbox Nano XS AD13 Plus
Desktops Best Desktop PC/Giant Tablet Hybrid Dell XPS 18
Desktops Best Desktop PC/Giant Tablet Hybrid (Honorable Mention) Lenovo IdeaCentre Horizon
Desktops Best Designed Desktop Apple iMac (27-Inch, 2013 Version)
Tablets and E-Readers Tablet of the Year (All Platforms) Apple iPad Air
Tablets and E-Readers Best Compact Android Tablet Google Nexus 7 (2013)
Tablets and E-Readers Best Full-Size Android Tablet Sony Xperia Tablet Z
Tablets and E-Readers Best Full-Size Android Tablet (Honorable Mention) Samsung Galaxy Note 10.1 (2014 Edition)
Tablets and E-Readers Best Budget Tablet Asus MeMO Pad HD 7
Tablets and E-Readers Best Windows Tablet Lenovo ThinkPad Tablet 2
Tablets and E-Readers Best E-Reader Amazon Kindle Paperwhite (2013, Wi-Fi)
Tablets and E-Readers Best E-Reader (Honorable Mention) Kobo Aura
Tablets and E-Readers Best Color Tablet for Reading Amazon Kindle Fire HDX (7-Inch)
Tablets and E-Readers Best iPad Accessory Belkin Ultimate Keyboard Case for iPad
Printers Printer of the Year (All Categories) HP Officejet Pro X576dw Multifunction Printer
Printers Best Budget Printer Dell B1163w Mono Laser Multifunction Printer
Printers Best Inkjet All-in-One Printer Canon Pixma MG5420 Wireless Photo All-in-One Printer
Printers Best Color Laser/Laser-Class Printer OKI C331dn
Printers Best Monochrome Laser/Laser-Class Printer Dell B3460dn Mono Laser Printer
Printers Best Monochrome Laser/Laser-Class AIO Printer Dell B1163w Mono Laser Multifunction Printer
Printers Best Consumer/Small Office Wide Format Printer Brother MFC-J6920DW
PC Components Best Performance Processor Intel Core i7-4960X Extreme Edition
PC Components Best Performance Processor (Honorable Mention) Intel Core i7-4770K
PC Components Best Budget Processor AMD A10-6700
PC Components Best High-End Video Card Nvidia GeForce GTX 780 Ti
PC Components Best High-End Video Card (Honorable Mention) AMD Radeon R9 290
PC Components Best Midrange Video Card AMD Radeon R9 270X
PC Components Best Budget Video Card Nvidia GeForce GTX 650 Ti Boost
PC Components Best High-End PC Case In Win H-Frame
PC Components Best High-End PC Case (Honorable Mention) Lian Li PC-X2000FN
PC Components Best Midrange/Budget PC Case Rosewill Thor V2-W
PC Components Best Small-Form-Factor/Compact Case SilverStone Sugo SG10
PC Components Best Enthusiast Motherboard MSI Z87 MPower Max
Storage and Networking Gear Best External Hard Drive LaCie Blade Runner
Storage and Networking Gear Best External Hard Drive (Honorable Mention) Buffalo DriveStation DDR (HD-GD2.0U3)
Storage and Networking Gear Best External Portable Hard Drive Western Digital My Passport Slim (1TB)
Storage and Networking Gear Best High-Performance Solid-State Drive Samsung SSD 840 EVO (500GB)
Storage and Networking Gear Best Mainstream Solid-State Drive SanDisk Ultra Plus (256GB)
Storage and Networking Gear Best Consumer NAS Drive Seagate Central
Storage and Networking Gear Best Consumer Wireless Router Buffalo AirStation Extreme AC 1750 Gigabit Dual Band Wireless Router
LCDs and Peripherals Best Gaming Keyboard Corsair K70 Mechanical Gaming Keyboard
LCDs and Peripherals Best Mobile Keyboard Logitech Bluetooth Illuminated Keyboard K810
LCDs and Peripherals Best General-Use PC Mouse HP Touch to Pair Mouse
LCDs and Peripherals Best Gaming Mouse Roccat Kone XTD
LCDs and Peripherals Best Mobile Mouse Microsoft Sculpt Mobile Mouse
LCDs and Peripherals Best LCD Monitor (27 Inches or Larger) Acer B296CL
LCDs and Peripherals Best LCD Monitor (20 to 26 Inches) NEC MultiSync EA244WMi
LCDs and Peripherals Best Desktop PC Speakers KEF X300A
LCDs and Peripherals Best Consumer Scanner Flip-Pal Mobile Scanner
LCDs and Peripherals Best Projector Epson PowerLite Home Cinema 5020UBe
Cameras and HDTVs Best Premium Point-and-Shoot Camera Sony Cyber-shot DSC-RX100 II
Cameras and HDTVs Best Budget Point-and-Shoot Camera Canon PowerShot A1400
Cameras and HDTVs Best Megazoom Point-and-Shoot Camera Canon PowerShot SX280 HS
Cameras and HDTVs Best Compact Interchangeable-Lens Camera Olympus OM-D E-M1
Cameras and HDTVs Best Digital SLR (dSLR) Camera Nikon D7100
Cameras and HDTVs HDTV of the Year Samsung PN60F8500
Smartphones and Mobile Gadgets Smartphone of the Year (Tie) Apple iPhone 5s
Smartphones and Mobile Gadgets Smartphone of the Year (Tie) Samsung Galaxy S4
Smartphones and Mobile Gadgets Best ʺPhabletʺ (Large-Format Smartphone) Samsung Galaxy Note 3
Smartphones and Mobile Gadgets Best Portable Media Player Apple iPod Touch (2013 Version)
Smartphones and Mobile Gadgets Best Wireless Speaker Bose SoundLink Bluetooth Mobile Speaker II
Smartphones and Mobile Gadgets Best Gaming Headset Skullcandy PLYR 1
Smartphones and Mobile Gadgets Best Headphones Bose QuietComfort 20i
Smartphones and Mobile Gadgets Best Portable Gaming Device Nintendo 2DS
Software and Services Software of the Year Apple OS X 10.9 (ʺMavericksʺ)
Software and Services Best Productivity Software Microsoft Office 365 Home Premium
Software and Services Best Security Software McAfee LiveSafe
Software and Services Best PC Game BioShock Infinite
Software and Services Best iOS App Flipboard for iPad
Software and Services Best Android App Evernote 5
;
run;

proc sql;
select *
from sashelp.electric
where customer in ('Residential' 'Commercial')
and year in (1997, 1998, 1999);
quit;

data bname;
infile datalines dlm='!' missover dsd;
input name : $12. meaning : $60.;
datalines;
Barden !Barley valley
Baron !Nobleman, baron
Barron !A form of baron
Barton !Barley farm or bart's town. the epon..
Bayron !A form of baron
Beaman !Beekeeper
Ben !Right-hand son
Benjamen !Son of my right
Benjamin !Son of my right hand
Benjammin !Son of my right hand
Benn !Son of the south, son of the right hand
Bennjamin !Son of my right hand
Benson !Ben's son, excellent son
Blain !A form of blaine
Boston !A form of bosley
Bradden !Resembling salmon / from the wide valley
Bradyn !A form of braden
Braedan !A form of braden
Braeden !A form of braden
Braedon !A form of bradon
Braedyn !A form of braden
Braiden !A form of braden
Braidon !A form of bradon
Brandan !A form of brandon
Branddon !Beacon hill
Branden !Beacon valley
Brandenn !From the broom or gorse hill
Brandin !A form of branden
Brandon !Beacon hill
Brandonn !Beacon hill
Brandyn !A form of brandon
Branndon !Beacon hill
Bransen !A form of branson
;
run;

proc sql;
select * 
from bname
where name like "%jam%";
run;

proc sql;
select *
from sashelp.cars
where msrp > 60000
order by msrp desc;
quit;

proc sql;
select make, mean(msrp) as mean_msrp
from sashelp.cars
group by make;
quit;

proc sql;
SELECT 
make,
mean(horsepower) as mean,
std(horsepower) as std,
min(horsepower) as min,
max(horsepower) as max
from sashelp.cars
group by make;
quit;

proc sql;
select make, count(*) as n
from sashelp.cars
group by make;
quit;

proc sql;
select make, mean(msrp) as mean
from sashelp.cars
group by make
having mean > 50000;
quit;

proc sql;
select make, mean(msrp) as mean
from sashelp.cars
group by make
having mean > 50000;
quit;

proc sql;
select make, mean(msrp) as mean
from sashelp.cars
group by make
having mean > (select mean(msrp) from sashelp.cars);
quit;

Data FacebookAd;
Infile Datalines dsd;
Input Ad $;
Datalines;
Ad 1
Ad 2
Ad 3
;
Run;

Data Audiences;
Infile Datalines dsd;
Input Group $;
Datalines;
Group 1
Group 2
Group 3
;
Run;
proc sql;
select *
from facebookad, audiences;
quit;

Data Driver;
Input TripID $ Fare;
Datalines;
TID010 11.05
TID011 9.5
TID012 13.99
TID013 12.42
TID014 11.83
TID015 18.82
TID016 12.3
TID017 3.81
TID018 13.73
TID019 8.68
TID020 22.89
TID021 15.84
TID022 14.85
TID023 10.41
TID024 5.3
TID025 19.54
TID026 10.46
TID027 12.01
TID028 15.98
TID029 14.68
TID030 11.74
;
Run;

Data Rating;
Input TripID $ Rate;
Datalines;
TID010 5
TID011 4
TID012 5
TID013 5
TID014 4
TID015 5
TID016 4
TID017 3
TID018 5
TID019 5
TID020 4
TID021 5
TID022 4
TID023 4
TID024 5
TID025 3
TID026 5
TID027 5
TID028 5
TID029 5
TID030 5
;
Run;

proc sql;
SELECT *
from rating, driver
where driver.tripid = rating.tripid;
quit;

Data Amazon;
Infile datalines dsd;
Input Teas : $12. price;
Datalines;
White Teas,2.99
Green Teas,3.99
Oolong Teas,6.99
Black Teas,5.99
Pu'er Teas,8.99
;
Run;

Data Local;
Infile datalines dsd;
Input Teas : $12. price;
Datalines;
Oolong Teas,3.99
Black Teas,7.99
Green Teas,5.99
Pu'er Teas,10.99
White Teas,4.99
;
Run;

proc sql;
select a.teas,
a.price as amazonrpice,
l.price as localprice,
min(a.price,l.price) as lowerprice
from amazon as a, local as l
where a.teas = l.teas;
quit;

Data Support;
Input ID : $10. Rating;
Datalines;
CRD450012 2
CRD450013 3
CRD450014 2
CRD450015 2
CRD450016 2
CRD450017 2
CRD450018 1
CRD450019 4
CRD450020 3
CRD450021 5
CRD450022 1
CRD450023 2
CRD450024 3
CRD450025 4
CRD450026 3
CRD450027 2
CRD450028 2
CRD450029 0
CRD450030 5
CRD450031 3
CRD450032 1
CRD450033 4
CRD450034 4
CRD450035 4
CRD450036 2
CRD450037 4
CRD450038 2
CRD450039 5
CRD450040 4
CRD450041 1
CRD450042 4
CRD450043 3
CRD450044 4
CRD450045 5
CRD450046 4
CRD450047 5
CRD450048 3
CRD450049 2
CRD450050 3
CRD450051 1
CRD450052 3
CRD450053 4
CRD450054 3
CRD450055 3
CRD450056 5
CRD450057 1
CRD450058 4
CRD450059 0
CRD450060 4
CRD450061 2
CRD450062 5
CRD450063 2
CRD450064 4
CRD450065 2
CRD450066 4
CRD450067 3
CRD450068 3
CRD450069 1
CRD450070 4
CRD450071 5
CRD450072 3
CRD450073 4
CRD450074 4
CRD450075 4
CRD450076 2
CRD450077 2
CRD450078 4
CRD450079 1
CRD450080 4
CRD450081 5
CRD450082 4
CRD450083 5
CRD450084 1
CRD450085 3
CRD450086 2
CRD450087 4
CRD450088 3
CRD450089 3
CRD450090 2
CRD450091 3
CRD450092 4
;
Run;

Data Record;
Infile datalines dsd;
Input Agent $ ID : $10.;
Datalines;
Agent 3,CRD450012
Agent 3,CRD450013
Agent 2,CRD450014
Agent 2,CRD450015
Agent 3,CRD450016
Agent 3,CRD450017
Agent 3,CRD450018
Agent 2,CRD450019
Agent 3,CRD450020
Agent 1,CRD450021
Agent 3,CRD450022
Agent 3,CRD450023
Agent 2,CRD450024
Agent 3,CRD450025
Agent 2,CRD450026
Agent 3,CRD450027
Agent 3,CRD450028
Agent 2,CRD450029
Agent 1,CRD450030
Agent 2,CRD450031
Agent 3,CRD450032
Agent 2,CRD450033
Agent 2,CRD450034
Agent 1,CRD450035
Agent 2,CRD450036
Agent 3,CRD450037
Agent 3,CRD450038
Agent 1,CRD450039
Agent 1,CRD450040
Agent 2,CRD450041
Agent 1,CRD450042
Agent 2,CRD450043
Agent 2,CRD450044
Agent 1,CRD450045
Agent 1,CRD450046
Agent 1,CRD450047
Agent 3,CRD450048
Agent 1,CRD450049
Agent 1,CRD450050
Agent 3,CRD450051
Agent 3,CRD450052
Agent 1,CRD450053
Agent 2,CRD450054
Agent 1,CRD450055
Agent 2,CRD450056
Agent 3,CRD450057
Agent 1,CRD450058
Agent 3,CRD450059
Agent 1,CRD450060
Agent 2,CRD450061
Agent 2,CRD450062
Agent 3,CRD450063
Agent 2,CRD450064
Agent 2,CRD450065
Agent 2,CRD450066
Agent 2,CRD450067
Agent 1,CRD450068
Agent 2,CRD450069
Agent 2,CRD450070
Agent 1,CRD450071
Agent 1,CRD450072
Agent 1,CRD450073
Agent 1,CRD450074
Agent 2,CRD450075
Agent 3,CRD450076
Agent 2,CRD450077
Agent 1,CRD450078
Agent 3,CRD450079
Agent 1,CRD450080
Agent 1,CRD450081
Agent 1,CRD450082
Agent 1,CRD450083
Agent 3,CRD450084
Agent 2,CRD450085
Agent 3,CRD450086
Agent 3,CRD450087
Agent 1,CRD450088
Agent 1,CRD450089
Agent 3,CRD450090
Agent 2,CRD450091
Agent 1,CRD450092
;
Run;

proc sql;
select agent, mean(rating) as mean
from support as s, record as r where s.id = r.id
group by agent
order by mean;
quit;

Data Product;
Infile datalines dsd;
Input Sku Model : $15. Description : $100.;
datalines;
5733205,43L511U18,Toshiba - 43" Class (42.5" Diag.) - LED - 1080p - with Chromecast Built-in - HDTV
5746805,LC-50LBU591U,Sharp - 50" Class (49.5" Diag.) - LED - 2160p - Smart - 4K Ultra HD TV Roku TV
5746700,LC-32LB591U,Sharp - 32" Class (31.5" Diag.) - LED - 720p - Smart - HDTV Roku TV
5803100,49LJ550M,LG - 49" Class (48.5" Diag.) - LED - 1080p - Smart - HDTV
4904501,D32x-D1/D32f-E1,VIZIO - 32" Class - (31.51" Diag.) - LED - 1080p - Smart - HDTV
;
Run;

Data Pricelist;
Input sku price;
datalines;
5733205 349.99
5746805 379.99
5746700 199.99
5803100 349.99
4904502 199.99
;
Run;

proc sql;
select coalesce(pd.sku, pr.sku) as sku,
model, description, price
from product as pd full join pricelist as pr
on pd.sku = pr.sku;
quit;

proc sql;
select *
from medrecord left join risk
on age>rangelow and age<rangehigh;
quit;

Data Store1;
Input ProdID : $10. StockDate : date9.;
format stockdate date9.;
Datalines;
X01234 01JAN2015
YZ9874 05JAN2015
KK1232 01AUG2014
TN4321 12DEC2015
AB9543 10JAN2015
;
Run;

Data Store2;
Input ProdID : $10. StockDate : date9.;
format stockdate date9.;
Datalines;
LN9245 03JAN2015
PM2953 10JAN2015
DB4132 15JUL2014
TN4321 12DEC2015
AB9543 10JAN2015
;
Run;

proc sql;
select * from store1 where
'12jan2015'd - stockdate > 90
union
select * from store2 where
'12jan2015'd - stockdate > 90;
;
quit;


data temp1;
do i = 1 to 4000;
output;
end;
run;

data temp2;
do i = 2001 to 6000;
output;
end;
run;

proc sql;
select * from temp1
outer union corr
select * from temp2;
quit;

data temp;
set temp1 temp2;
run;

proc sql;
create table mastersales
(orderno char(12),
item char (200),
quantity num,
date num format=yymmdd10.,
price num format=dollar8.);
quit;

Data demo1;
input name $ age;
datalines;
John 22
Mary 28
Peter 30
;
Run;

Data demo2;
input name $ gender $;
datalines;
John M
Mary F
Peter M
;
Run;

proc sql;
create table avgsales as
select product, mean(sales) as 
avgsales
from sashelp.shoes
group by product;
quit;

proc sql;
create table class as
select * from sashelp.class;

alter table class
add EnrolDate num
format=yymmdd10.,
results num
drop height, weight;
quit;

Proc sql;
create table class as
select * from sashelp.class;

alter table class
add EnrolDate num format=yymmdd10.,
Results num
drop height, weight;
quit;

proc sql;
create table product
(Name char(40) unique,
Model char(200) primary key,
Price num check(price>0),
Inventory num
check(inventory>=0));

describe table constraints product;
quit;