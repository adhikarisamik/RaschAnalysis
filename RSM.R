install.packages("eRm")
library(eRm)
#Agreeableness
bf1 <- read.csv(file="/Users/samikadhikari/Dropbox (Personal)/WB/noncognitivedata/rsmagreeableness.csv",head=TRUE,sep=",")
res.rsm <- RSM(na.omit(bf1))
thresholds(res.rsm)
pres.rsm <-person.parameter(res.rsm)
itemfit(pres.rsm)

#Conscientiousness

bf2 <- read.csv(file="/Users/samikadhikari/Dropbox (Personal)/WB/noncognitivedata/rsmconscientiousness.csv",head=TRUE,sep=",")
res.rsm <- RSM(na.omit(bf2))
thresholds(res.rsm)
pres.rsm <-person.parameter(res.rsm)
itemfit(pres.rsm)

#Emotional Stablity 

bf3 <- read.csv(file="/Users/samikadhikari/Dropbox (Personal)/WB/noncognitivedata/rsmemstability.csv",head=TRUE,sep=",")
res.rsm <- RSM(na.omit(bf3))
thresholds(res.rsm)
pres.rsm <-person.parameter(res.rsm)
itemfit(pres.rsm)

#Extraversion 

bf4 <- read.csv(file="/Users/samikadhikari/Dropbox (Personal)/WB/noncognitivedata/rsmextraversion.csv",head=TRUE,sep=",")
res.rsm <- RSM(na.omit(bf4))
thresholds(res.rsm)
pres.rsm <-person.parameter(res.rsm)
itemfit(pres.rsm)

#Openness

bf5 <- read.csv(file="/Users/samikadhikari/Dropbox (Personal)/WB/noncognitivedata/rsmopenness.csv",head=TRUE,sep=",")
res.rsm <- RSM(na.omit(bf5))
thresholds(res.rsm)
pres.rsm <-person.parameter(res.rsm)
itemfit(pres.rsm)









plotICC(res.rsm, mplot = TRUE, legpos = FALSE, ask = FALSE)
model.matrix(res.rsm)
summary(res.rsm)