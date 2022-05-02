setwd("C:\\Users\\dave_\\Desktop\\DHDA\\SEMESTER1\\DHDS110 -Data Science and Data Analytics\\assignment2")
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

# Read SAS data and assign to a dataframe name 
xtrfxdat1 <- read.sas7bdat("xtrfxnd.sas7bdat")

#Read and create a subset of the xtrfxnd dataframe
data.frame(colnames(xtrfxdat1))
Subset = xtrfxdat1[,c(76,8,9,22,10,21,23,15,28,63,49,46,59,33,51)]
summary(Subset)

# convert all variable names to lowercase
names(Subset)=casefold(names(Subset))
utils::View(Subset)

#Do a frequency count for 'hicnum' and 'centre' - these are the study sites

library(plyr)
counts <- ddply(Subset, .(Subset$"hicnum", Subset$"centre"), nrow)
names(counts) <- c("hicnum", "centre", "Freq")
counts


#Q3. Create a new variable called 'sitename', which serves as a proper label for the site names. Run another frequency procedure on the new 'sitename' variable to check if you did this correctly.
counts$sitename = c("","Calgary", "Hamilton", "Saskatoon", "Toronto - Referent", "Vancouver")
names(counts)

Subset %>% drop_na("hicnum")


#Q4. a) Create a boxplot of how t_ttbmd varies by site
#Add a title and axis labels - change font size to be bigger
#Also make the figure larger: 12 x 6
#Compare side by side those with and without a prevalent fracture (prevfx_any)



