
# R project
wdir <- "c:/Users/alice.c.hsi2.NAE/Documents/R/RtutorialJHU"

setwd(wdir)
destfile <- "c:/Users/alice.c.hsi2.NAE/Documents/R/RtutorialJHU/dataset.zip"

urlfile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(urlfile, destfile)

unzip("dataset.zip")
install.packages("dplyr")
library(dplyr)
install.packages("xlsx")
library(xlsx)
install.packages("data.table")
library(data.table) 

# test

ytest <- fread("UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)
subtest <- fread("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)
xtest <- fread("UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE)


#train
ytrain <- fread("UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE)
subtrain <- fread("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)
xtrain <- fread("UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE)


# get features.txt
features <- fread("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
# get activity labels
alabel <- fread("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

# 1. 	Merges the training and the test sets to create one data set. 
# merging xtrain, xtest
xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)
subs <- rbind(subtrain, subtest)

# 2.Extracts only the measurements on the mean and standard 
# deviation for each measurement.

# features[,2] are column names.
measures <- features[grep("mean\\(\\)|std\\(\\)",features$V2),]
# measures[,1] is indexm measures[,2] is name.
xdata2 <- xdata[,measures[,1]] # [,1] holds indxes of mean() & std() cols.

# 3.	Uses descriptive activity names to name 
# the activities in the data set

colnames(ydata) <- "activity"
ydata$activitylabel <- factor(ydata$activity, labels = as.character(alabel[,2]))
activitylabel <- ydata[,-1]

# 4.	Appropriately labels the data set with descriptive variable names.
colnames(xdata) <- features[measures[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(subs) <- "subject"
total <- cbind(xdata, activitylabel, subs)
meantot <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(meantot, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
