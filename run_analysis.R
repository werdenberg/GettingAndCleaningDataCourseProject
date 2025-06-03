##
## Getting and Cleaning Data Course Project
##
## This R script
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average
##    of each variable for each activity and each subject.
##

# Load  libraries and download and unzip data
library(dplyr)
library(data.table)

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, destfile = "Dataset.zip", method = "curl")
unzip("Dataset.zip")

# Load ActivityLabels and Features
activityLabels <- fread("./UCI HAR Dataset/activity_labels.txt",
		      col.names = c("class", "activity"))
features <- fread("./UCI HAR Dataset/features.txt",
		  col.names = c("feature_id", "feature"))
featuresWanted <- grep("(mean|std)\\(\\)", features[, feature])
measurements <- features[featuresWanted, feature]
measurements <- gsub("[()]", "", measurements)

# Load test data
testData <- fread("./UCI HAR Dataset/test/X_test.txt")
testData <- select(testData, all_of(featuresWanted))
colnames(testData) <- measurements
testActivities <- fread("./UCI HAR Dataset/test/y_test.txt",
			col.names = "Activity")
testSubjects <- fread("./UCI HAR Dataset/test/subject_test.txt",
		       col.names = "SubjectID")
test <- cbind(testSubjects, testActivities, testData)

# Load train data
trainData <- fread("./UCI HAR Dataset/train/X_train.txt")
trainData <- select(trainData, all_of(featuresWanted))
colnames(trainData) <- measurements
trainActivities <- fread("./UCI HAR Dataset/train/y_train.txt"
			, col.names = "Activity")
trainSubjects <- fread("./UCI HAR Dataset/train/subject_train.txt",
		       col.names = "SubjectID")
train <- cbind(trainSubjects, trainActivities, trainData)

# Merge both datasets
mergedData <- rbind(test,train)

# Use descriptive name for activities 
mergedData[["Activity"]] <- factor(mergedData[, Activity],
				   levels = activityLabels$class,
				   labels = activityLabels$activity)

# Make data a tibble to work with dplyr
mergedData <- as_tibble(mergedData)

# Group data by SubjectID and Activity and summarise all data to get the mean of each variable
dataSummary <- mergedData %>%
	group_by(SubjectID, Activity) %>%
	summarise_all(mean)

# Write new file
#fwrite(dataSummary, file="summaryData.txt")
write.table(dataSummary, file="summaryData.txt", row.name=FALSE)
