DataCleaningProgrammingAssignment
=================================

One script is included in this repository called run_analysis.R. The purpose of the script is to take the raw data and modify it per the following instructions included with the programming assingment. The script takes no arguments but assumes the file structure found in this repository.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

To that end, the run_analysis function performs the following steps.

1. Pull in necessary libraries.
2. Read the raw data files and store the data in memory.
3. Add labels with descriptive variable names for existing columns.
4. Create a list of column numbers that correspond to column names of measurements performing mean and standard deviation functions. I chose to only include columns with exact matches to "-mean()" and "-std()". I believe this is the most accurate way to differentiate from other measurements such as frequency mean which is descriptive of the type of measurement but not actually a mean measurement.
5. Remove columns from the test and train datasets not identified in step 4.
6. Merge the activity and subject raw datasets to the main test and train sets.
7. Add labels with descriptive variable names for the activity and subject columns.
8. Merge the train and test datasets into a combined set.
9. Correspond the numeric values in the activity column to the descriptions found in the activity_labels.txt file by creating a factor variable.
10. Use the reshape2 library to "melt" the data into a mean value for each variable identified in step 4 and organized by subject and activity.
11. Write the resulting tidy data to file.