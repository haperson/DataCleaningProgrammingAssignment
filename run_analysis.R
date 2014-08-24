run_analysis <- function() {
	
	library(data.table)
	library(reshape2)
	
	## Read in all data before merging
	test <- read.table("./UCI HAR Dataset/test/X_test.txt")
	testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
	testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
	train <- read.table("./UCI HAR Dataset/train/X_train.txt")
	trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
	trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
	activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
	features <- read.table("./UCI HAR Dataset/features.txt")
	
	## Apply feature names to test and train datasets
	names(test) <- features$V2
	names(train) <- features$V2
	
	## Find the columns that correspond to mean and std
	features <- data.table(features)
	meanCols <- features[grep("-mean()", V2, fixed=TRUE)]
	stdCols <- features[grep("-std()", V2, fixed=TRUE)]
	cols <- rbind(meanCols, stdCols)
	
	## Reduce the combined dataset to just those columns that are mean or std
	test <- test[, cols$V1]
	train <- train[, cols$V1]
	
	## Merge activity and subject columns for test and train datasets
	test <- cbind(test, testLabels, testSubject)
	train <- cbind(train, trainLabels, trainSubject)
	
	## Rename column names for labels and subject
	index <- length(cols$V1)
	names(test)[index + 1] <- "activity"
	names(test)[index + 2] <- "subject"
	names(train)[index + 1] <- "activity"
	names(train)[index + 2] <- "subject"
	
	## Merge the test and train datasets
	combinedData <- rbind(train, test)
	
	## Create a factor for the 'activity' column and use the names from activities
	combinedData$activity <- factor(combinedData$activity, labels=activities$V2)
	
	## Finish cleaning the data by averaging each variable for each activity and subject
	dataMelt <- melt(combinedData, id.vars=c("activity", "subject"))
	summaryData <- dcast(dataMelt, activity+subject ~ variable, mean)
	
	## Write the tidy data to file
	write.table(data, file="tidy_data.txt")
}