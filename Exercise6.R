setwd("C:\\Users\\dave_\\Desktop\\DHDA\\SEMESTER2\\Data Analytics II\\Week 6 - logistic regression")
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

data <- read.sas7bdat('xtrfxcovbs.sas7bdat')
names(data) = casefold(names(data))
names(data)

# Run a univariable LOGISTIC regression model examining the relationship between 
# t_tbsp (in mm) as the exposure and newosteofx as the outcome (1/0)
# outcome - newosteofx, 1 = experienced new fx, 2 = did not exp new fx 
# exposure - t_tbsp, continous

model1 <- glm(newosteofx ~ t_tbsp, data =data,
              family = binomial)
summary(model1)

#get odds ratio
exp(coef(model1))

#get 95% CI (in log-odds scale)
confint.default(model1)

#to get odds ratio and 95%CI in odds :
exp(cbind(OR = coef(model1), confint.default(model1)))




data2 <- data
data2$bmi <- data2$weight / (data2$height /100) **2

#Repeat the model, this time adjusting for age and BMI 
# outcome - newosteofx, 1 = experienced new fx, 2 = did not exp new fx 
# exposure - t_tbsp, continous
#covariates : age, bmi

model2 = glm(newosteofx ~ t_tbsp + age + bmi, data =data2,
                       family = binomial)
summary(model2)

#to get odds ratio and 95%CI in odds :
exp(cbind(OR = coef(model2), confint.default(model2)))

# obtain OR for a 1 SD increase in t_tbsp
model2a <- glm(newosteofx ~ scale(t_tbsp) + age + bmi, data=data2,
               family = binomial)
#get odds ratio and 95% CI
exp(cbind(OR = coef(model2a), confint.default(model2a)))


#Recode the t_ctth variable into a new variable called t_ctth_cat with 4 categories as defined by: 
#  •	1 if t_ctth < 0.77 else 2 if t_ctth < 0.96 else 3 if t_ctth < 1.12 else 4

data3 <- data2 
data3$t_ctth_cat = ifelse(data3$t_ctth < 0.77, 1, ifelse(data3$t_ctth < 0.96, 2,ifelse(data3$t_ctth < 1.12, 3, 4)))
data3  
#make factor
data3$t_ctth_cat <- as.factor(data3$t_ctth_cat)

#Use this t_ctth_cat variable as the main exposure in a multivariable LOGISTIC regression model 
 #looking at newosteofx as the outcome, adjusting for age and BMI as covariates
#	Make sure to set the highest category (value of 4) as the referent

model3 = glm(newosteofx ~ relevel(t_ctth_cat,ref='4') + age + bmi, data = data3,
             family=binomial)


summary(model3)

#get odds ratio
exp(coef(model3))

#get 95% CI (in log-odds scale)
confint.default(model3)

#to get odds ratio and 95%CI in odds :
exp(cbind(OR = coef(model3), confint.default(model3)))
