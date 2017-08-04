#########Libraries#################
library(sqldf)
install.packages("RODBC")
library(RODBC)
install.packages("sqldf")
install.packages("RMySQL")
install.packages("RSQLite")
library(RSQLite)
library(RMySQL)
##########Data Read-17################
mydata <- read.csv("breac17.csv")
View(mydata)
head(mydata)
colnames(mydata)
#######Changing Column names##########
colnames(mydata)[colnames(mydata) == 'records.lost'] <- 'RecordLost'
colnames(mydata)[colnames(mydata) == 'Entity'] <- 'CompanyName'
colnames(mydata)[colnames(mydata) == 'story'] <- 'Description'
colnames(mydata)[colnames(mydata) == 'DATA.SENSITIVITY'] <- 'DataSensitivity'
colnames(mydata)[colnames(mydata) == 'METHOD.OF.LEAK'] <- 'LeakMethod'
colnames(mydata)[colnames(mydata) == 'NO.OF.RECORDS.STOLEN'] <- 'RecordStolen'
View(mydata)
##############################################
library(sqldf)
df <- write.csv(mydata, file="breachz.csv")
####Final Data###
def <- mydata[-c(8), ]
View(def)
########Replace Years#######
def1 <- def$YEAR[def$YEAR == 13] <- 2017
#########TRY-1########
def1 <- sqldf("SELECT * from def where YEAR = 2017")
View(def1)
#####################
def1 <- def$YEAR[def$YEAR == 12] <- 2016
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 11] <- 2015
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 10] <- 2014
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 9] <- 2013
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 8] <- 2012
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 7] <- 2011
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 6] <- 2010
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 5] <- 2009
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 4] <- 2008
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 3] <- 2007
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 2] <- 2006
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 1] <- 2005
View(def)
#####################
def1 <- def$YEAR[def$YEAR == 0] <- 2004
View(def)
############################
###############Replace Data Sensitivity######################
def2 <- def$DataSensitivity[def$DataSensitivity == 1] <- "Email Address and Online Information"
def2 <- def$DataSensitivity[def$DataSensitivity == 20] <- "Social Security Number and Personal Details"
def2 <- def$DataSensitivity[def$DataSensitivity == 300] <- "Credit Card Information"
def2 <- def$DataSensitivity[def$DataSensitivity == 4000] <- "Email Password and Health Records"
def2 <- def$DataSensitivity[def$DataSensitivity == 50000] <- "Full bank Account Details"
View(def)
def3 <- sqldf("SELECT CompanyName, ORGANISATION, YEAR, RecordStolen, LeakMethod, DataSensitivity from def")
View(def3)
#############################################################
final1 <- write.csv(def3, file = "final1.csv")
final2 <- read.csv("final1.csv")
View(final2)
mn <- sqldf("SELECT RecordStolen from final2 where CompanyName= 'Walmart' ")
mn
########Connectivity#########
mycon <- odbcDriverConnect("Driver={SQL Server Native Client 11.0};server=192.168.1.146;uid=sa;pwd=sa#1234;database=HistoricData;trusted_connection=yes;")
odbcDriverConnect()
############Data Read-15#####################################
fifdata <- read.csv("breach15.csv")
View(fifdata)
#############################################################
colnames(fifdata)
#######Changing Column names-15##########
colnames(fifdata)[colnames(fifdata) == 'records.lost'] <- 'RecordLost'
colnames(fifdata)[colnames(fifdata) == 'Entity'] <- 'CompanyName'
colnames(fifdata)[colnames(fifdata) == 'story'] <- 'Description'
colnames(fifdata)[colnames(fifdata) == 'DATA.SENSITIVITY'] <- 'DataSensitivity'
colnames(fifdata)[colnames(fifdata) == 'METHOD.OF.LEAK'] <- 'LeakMethod'
colnames(fifdata)[colnames(fifdata) == 'NO.OF.RECORDS.STOLEN'] <- 'RecordStolen'
View(fifdata)
##############################################
#############Try-2##############
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 11] <- 2015
View(fifdata)
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 10] <- 2014
View(fifdata)
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 9] <- 2013
View(fifdata)
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 8] <- 2012
View(fifdata)
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 7] <- 2011
View(fifdata)
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 6] <- 2010
View(fifdata)
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 5] <- 2009
View(fifdata)
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 4] <- 2008
View(fifdata)
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 3] <- 2007
View(fifdata)
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 2] <- 2006
View(fifdata)
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 1] <- 2005
View(fifdata)
#####################
def5 <- fifdata$YEAR[fifdata$YEAR == 0] <- 2004
View(fifdata)
########################################################
###############Replace Data Sensitivity######################
def6 <- fifdata$DataSensitivity[fifdata$DataSensitivity == 1] <- "Email Address and Online Information"
def6 <- fifdata$DataSensitivity[fifdata$DataSensitivity == 20] <- "Social Security Number and Personal Details"
def6 <- fifdata$DataSensitivity[fifdata$DataSensitivity == 300] <- "Credit Card Information"
def6 <- fifdata$DataSensitivity[fifdata$DataSensitivity == 4000] <- "Email Password and Health Records"
def6 <- fifdata$DataSensitivity[fifdata$DataSensitivity == 50000] <- "Full bank Account Details"
View(fifdata)
def7 <- sqldf("SELECT CompanyName, ORGANISATION, YEAR, RecordStolen, LeakMethod, DataSensitivity from fifdata")
View(def7)
######################
finaldata <- merge(def3,def7)
View(finaldata)
final2 <- write.csv(finaldata, file = "final2.csv")
######################################################

                    