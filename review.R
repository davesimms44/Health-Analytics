setwd("C:\\Users\\dave_\\Desktop\\DHDA\\SEMESTER2\\Data Analytics II\\week 1")
install.packages("data.table")
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("tidyr")
install.packages("plotly")
install.packages("Hmisc")
install.packages("sas7bdat")
install.packages("broom")
install.packages("esquisse")
install.packages("readxl")
install.packages("anytime")
install.packages("robustbase")
install.packages("gtsummary")
install.packages("rjson")
install.packages("jsonlite")


library(data.table)
library(sas7bdat)
library(readxl)
library(broom)
library(ggplot2)
library(tidyr)
library(anytime)
library(robustbase)
library(gtsummary)
library(rjson)

getwd()
list.files("C:\\Users\\dave_\\Desktop\\DHDA\\SEMESTER2\\Data Analytics II\\week 1")

#read demo data from each site 
democa <- read.sas7bdat("supdemoca.sas7bdat")
demoha <- read.sas7bdat("supdemoha.sas7bdat")
demosk <- read.sas7bdat("supdemosk.sas7bdat")
demoto <- read.sas7bdat("supdemoto.sas7bdat")
demovr <- read.sas7bdat("supdemovr.sas7bdat")

df_full <- rbind(democa, demoha, demosk, demoto, demovr)
df_full = df_full[order(df_full$ID),]
View(df_full)


#read fx data from each site 
fxca <- read.sas7bdat("supfxca.sas7bdat")
fxha <- read.sas7bdat("supfxha.sas7bdat")
fxsk <- read.sas7bdat("supfxsk.sas7bdat")
fxto <- read.sas7bdat("supfxto.sas7bdat")
fxvr <- read.sas7bdat("supfxvr.sas7bdat")

fx_full <- rbind(fxca, fxha, fxsk, fxto, fxvr)
fx_full = fx_full[order(fx_full$ID),]
View(fx_full)

# Read bone data and assign to a dataframe name 
boneca <- read.sas7bdat("supboneca.sas7bdat")
boneha <- read.sas7bdat("supboneha.sas7bdat")
bonesk <- read.sas7bdat("supbonesk.sas7bdat")
boneto <- read.sas7bdat("supboneto.sas7bdat")
bonevr <- read.sas7bdat("supbonevr.sas7bdat")

bone_full <- rbind(boneca, boneha, bonesk, boneto, bonevr)
bone_full = bone_full[order(bone_full$ID),]
View(bone_full)

full_df = merge(x=df_full,y=fx_full, by="ID", all.x = TRUE) # left join - takes all in x (where left = x)
damnit = merge(x=full_df,y=bone_full, by="ID", all.x = TRUE) # left join - takes all in x (where left = x)
View(damnit)

damnit$BMI = damnit$weight / damnit$height
damnit

damnit$CTDate = as.Date(damnit$CTDate, origin="1970-01-01")
damnit$StudyEndDate = as.Date(damnit$StudyEndDate, origin="1970-01-01")
damnit$FractureDate = as.Date(damnit$FractureDate, origin="1970-01-01")
damnit
damnit$timetostudyendd = difftime(damnit$CTDate, damnit$StudyEndDate, units=c('days'))
damnit$timetostudyendy = round(as.numeric(damnit$timetostudyendd)/365.25 * 12,0)
damnit
class(damnit$timetostudyendd)
class(damnit$timetostudyendy) 
class(damnit$FractureDate)

damnit$timetoFracture = difftime(damnit$CTDate, damnit$FractureDate, units=c('days'))
damnit$timetoFracture = round(as.numeric(damnit$timetoFracture/365.25 * 12,0)
View(damnit)

