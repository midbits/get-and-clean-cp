## run_analysis.R
##
## Assignment: A script that
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##

library(plyr)

## Create datasets from files and combine them into one
features <- read.table("UCI HAR Dataset/features.txt")[,2]
train <- cbind(read.table("UCI HAR Dataset/train/subject_train.txt",
                          col.names="subject",
                          header=FALSE,
                          colClasses="numeric",
                          nrows=7500),
               read.table("UCI HAR Dataset/train/y_train.txt",
                          header=FALSE,
                          colClasses="numeric",
                          col.names="activity", 
                          nrows=7500),
               read.table("UCI HAR Dataset/train/X_train.txt",
                          header=FALSE,
                          colClasses="numeric",
                          col.names = features, nrows=7500))

test <- cbind(read.table("UCI HAR Dataset/test/subject_test.txt",
                         header=FALSE,
                         colClasses="numeric",
                         col.names="subject",
                         nrows=3000),
              read.table("UCI HAR Dataset/test/y_test.txt",
                         header=FALSE, colClasses="numeric",
                         col.names="activity",
                         nrows=3000),
              read.table("UCI HAR Dataset/test/X_test.txt",
                         header=FALSE,
                         colClasses="numeric",
                         col.names = features, nrows=3000))

combineddataset <- rbind(train, test)

## Extract only the measurements for means and standard deviations
dataset <- cbind(combineddataset[,c(1:2)],
                 combineddataset[,grepl("mean", names(combineddataset))],
                 combineddataset[,grepl("std", names(combineddataset))])

## Fix column names and set subject and activity as factors
names(dataset) <- tolower(gsub("\\.", "", names(dataset),))

## Convert activity codes to desctriptive labels
dataset$activity[dataset$activity == 1] <- "walking"
dataset$activity[dataset$activity == 2] <- "walkingupstairs"
dataset$activity[dataset$activity == 3] <- "walkingdownstairs"
dataset$activity[dataset$activity == 4] <- "sitting"
dataset$activity[dataset$activity == 5] <- "standing"
dataset$activity[dataset$activity == 6] <- "laying"

## Add factors where they should be
dataset$activity <- as.factor(dataset$activity)
dataset$subject <- as.factor(dataset$subject)

## Create tidy data set contining means per measurement over subject and activity
tidy = aggregate(dataset[,3:81], by=list(activity = dataset$activity, subject=dataset$subject), mean)
