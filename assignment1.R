setwd("C:\\Users\\dave_\\Desktop\\DHDA\\SEMESTER2\\Data Analytics II\\assignment 1")

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
head(data$nbalc_week)
table(data$cig_cur, data$prevfx_any)




summary(data)
str(data)
table(data$untreat_hyperthyr_ever)

chisq.test(table(data$untreat_hyperthyr_ever), p = c(0.95,0.05)/1)
head(data$centre_char)
data$centre_char = as.character(data$centre)
class(data$centre_char)
levels(data$centre_char)
table(data$centre_char)
length(data$centre_char)

data$centre_factor = as.factor(data$centre)
summary(aov(data$age ~ data$centre_factor))

aggregate(data$age, list(data$centre), FUN=mean)


kruskal.test(data$weight, data$centre)

t.test(data$r_tbsp, data$t_tbsp
       , paired = TRUE)
  

table(data$newosteofx, data$cortico_oral_reg)
fisher.test(table(data$newosteofx, data$cortico_oral_reg))