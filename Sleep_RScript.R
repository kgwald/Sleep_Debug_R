#


#necessary libraries
library(dplyr)


#sets working directory
setwd("~/Desktop/SleepStudy_Data_ASIMOV/")



data <- read.table("SleepDebug.txt",header=TRUE, sep='\t')

summary(data)
#NOTE: some participants when pressing spacebar or potentially removing/putting on headset triggered a multi-line (like 20-30) spazz attack
#in the asimov resulting in multiple lines at the same date/time

#ID is identified as a number so change to factor
data$ID <- as.factor(data$ID)

#Clean data (get rid of junk we don't want to deal with)
#get rid of spacebar presses, sound on/off lines, headband docked/undocked, key etc. leaving only 1,2,3,4,0 and sound files
#probably can just use subset

#split file into ONLY stage and ONLY sound file nums
#Two ways to subset data
#data[data$SleepStage == 4,]
#subset(data,SleepStage == 4)


#summarise in stage
#time using asimov (count ~0 and multiply by 30 seconds)
#time asleep (count ~1 and ~0 and multiply by 30 seconds)
#time in each stage (count rows of each stage multiply by 30seconds each)
#% time in each stage

#more like a script
#get all 4s together by person/evening
#if match then still part of stage else new stage
#ideally not in a loop... use matrix operations
#num periods
#length of periods

#summarise in sound
#num times each sound
#num minutes each sound (30seconds * each line)


test <- data %>%
  group_by(ID, Session, SleepStage) %>%
  summarise(
    Numn = n()
  )
