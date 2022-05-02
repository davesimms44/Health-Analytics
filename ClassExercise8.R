setwd("C:\\Users\\dave_\\Desktop\\DHDA\\SEMESTER1\\DHDS110 -Data Science and Data Analytics\\week8-RStudio")
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

#1) From assignment 1, import the provided xlsx files
Comment2data = read_xlsx("Comment2.xlsx", col_names = TRUE)
Fall2data = read_xlsx("FallTable2.xlsx", col_names = TRUE)
Interview2data = read_xlsx("InterviewTable2.xlsx", col_names = TRUE)
MedHx2data = read_xlsx("MedicalHistory2.xlsx", col_names = TRUE)
SurgHx2data = read_xlsx("SurgicalHistory2.xlsx", col_names = TRUE)


#2) Sort each of them by SubjectID
Comment2data.sortid = Comment2data[order(Comment2data$SubjectID),]
Fall2data.sortid = Fall2data[order(Fall2data$SubjectID),]
Interview2data.sortid = Interview2data[order(Interview2data$SubjectID),]
MedHx2data.sortid = MedHx2data[order(MedHx2data$SubjectID),]
SurgHx2data.sortid = SurgHx2data[order(SurgHx2data$SubjectID),]


#) Merge all of them together in an inner join as a new dataframe
CommFall_inner = merge(x=Comment2data.sortid,y=Fall2data.sortid, by="SubjectID")
CFInter_inner = merge(CommFall_inner,Interview2data.sortid, by="SubjectID")
CFIHX_inner = merge(CFInter_inner,MedHx2data.sortid, by="SubjectID")
Full_inner = merge(CFIHX_inner, SurgHx2data.sortid, by="SubjectID")
utils::View(Full_inner)


#4) Calculate time SINCE the interview date (SIDateiv) - using your "today's date" (whatever it may be) - expressed in months  (call this timesinceint)
timesinceint = (difftime(Sys.Date(), Full_inner$SIDateiv, units = c("weeks"))/4)
timesinceint = as.numeric(timesinceint)
Full_inner$timesinceint = timesinceint
Full_inner

#6) Subset this dataframe by selecting only cases where  timesinceint is >= mean of the value of  timesinceint across all participants (e.g. the 50% most recent participants)
GThanMean = subset(Full_inner, Full_inner$timesinceint >= mean(Full_inner$timesinceint))
utils::View(GThanMean)

#7) Create another subset of this dataframe from 6) selecting only:  SubjectID and these variables: 
#  SDOsteoDiag      SDRheumaDiag SDOADiag            SDLupusDiag      SDHyperthyDiag
Subset = Full_inner[, c("SubjectID","SDOsteoDiag","SDRheumaDiag", "SDOADiag", "SDLupusDiag", "SDHyperthyDiag")]
utils::View(Subset)

#8) Use the mutate function to recode the yes and no's to 1's and 0's, respectively. Also recode missing data and Don't know to NA. 
Subset = mutate(Subset, SDOsteoDiag=ifelse(SDOsteoDiag=="Yes","1",ifelse(SDOsteoDiag=="No","0",ifelse(SDOsteoDiag=="Don't Know","NA",ifelse(SDOsteoDiag=="missing data","NA", SDOsteoDiag)))))
Subset = mutate(Subset, SDRheumaDiag=ifelse(SDRheumaDiag=="Yes","1",ifelse(SDRheumaDiag=="No","0",ifelse(SDRheumaDiag=="Don't Know","NA",ifelse(SDRheumaDiag=="missing data","NA", SDRheumaDiag)))))
Subset = mutate(Subset, SDOADiag=ifelse(SDOADiag=="Yes","1",ifelse(SDOADiag=="No","0",ifelse(SDOADiag=="Don't Know","NA",ifelse(SDOADiag=="missing data","NA", SDOADiag)))))
Subset = mutate(Subset, SDLupusDiag=ifelse(SDLupusDiag=="Yes","1",ifelse(SDLupusDiag=="No","0",ifelse(SDLupusDiag=="Don't Know","NA",ifelse(SDLupusDiag=="missing data","NA", SDLupusDiag)))))
Subset = mutate(Subset, SDHyperthyDiag=ifelse(SDHyperthyDiag=="Yes","1",ifelse(SDHyperthyDiag=="No","0",ifelse(SDHyperthyDiag=="Don't Know","NA",ifelse(SDHyperthyDiag=="missing data","NA", SDHyperthyDiag)))))
utils::View(Subset)



#9) Create a separate dataframe just like in 7 and try to recode again using the ifelse statement 
Subset2 = Full_inner[, c("SubjectID","SDOsteoDiag","SDRheumaDiag", "SDOADiag", "SDLupusDiag", "SDHyperthyDiag")]


varlist = colnames(Subset2)[2:6]
for(i in varlist){
  Subset2[[i]] = ifelse(Subset2[[i]] == "yes","1",ifelse(Subset2[[i]] == "no", "0",ifelse(Subset2[[i]] =="Don't Know", "NA",ifelse(Subset2[[i]] == "missing data", "NA",Subset2[[i]]))))
}
Subset2
  
varange = 2:6
rowrange = 1:length(Subset2$SubjectID)
for(i in varange){
  for(j in rowrange){
    Subset2[j,i] = ifelse(!is.na(Subset2[j,i]) && Subset2[j,i]=="yes",1,
                         ifelse(!is.na(Subset2[j,i]) && Subset2[j,i]=="no",0,Subset2[j,i]))
  }
}
Subset2
for(i in varange){
  print(table(Subset2[,i]))
  print(colnames(Subset2[i]))
}


#10) Determine the frequencies of the response categories for these same variables in 7 that you've recoded using the table() function
varange = 2:6
for(i in varange){
  print(table(Subset2[,i]))
}








