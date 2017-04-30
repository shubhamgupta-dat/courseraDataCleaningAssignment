#Download and Extract the file

filename <- "getdata_dataset.zip"
download.url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(download.url, filename)

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Moving Inside the working directory

current.dir<-getwd()

setwd(paste(current.dir,"UCI HAR Dataset", sep = "/" ))

activityLabels <- read.table("activity_labels.txt")
features<- read.table("features.txt")

#For Test

setwd(paste(getwd(),"test", sep = "/" ))

featuresWanted<- grep("mean|std", features[,2])
test_X <- read.table("X_test.txt")[featuresWanted]
test_Y <- read.table("Y_test.txt")
test_subjects <- read.table("subject_test.txt")
test<- cbind(test_subjects,test_Y,test_X)

names(test)<- c("subject","current_activity",grep("mean|std", features[,2], value = TRUE))


#For Train

setwd(paste(current.dir,"UCI HAR Dataset", sep = "/" ))
setwd(paste(getwd(),"train", sep = "/" ))

featuresWanted<- grep("mean|std", features[,2])
train_X <- read.table("X_train.txt")[featuresWanted]
train_Y <- read.table("Y_train.txt")
train_subjects <- read.table("subject_train.txt")
train<- cbind(train_subjects,train_Y,train_X)

names(train)<- c("subject","current_activity",grep("mean|std", features[,2], value = TRUE))


#Accumulating Data

allData<-rbind(test,train)

#Factorizing Activity
allData$current_activity<- factor(allData$current_activity, levels = activityLabels[,1], labels = activityLabels[,2])

library(dplyr)
library(reshape2)
meltedData<-melt(allData, id = 1:2)
grouped<-group_by(meltedData, subject, current_activity, variable)
summarised<-summarise(grouped, mean_value = mean(value), std_value = sd(value))
mean.data <- dcast(allData.melted, subject + current_activity ~ variable, mean)

setwd(current.dir)
write.table(mean.data, "tidy.txt", row.names = FALSE, quote = FALSE)


