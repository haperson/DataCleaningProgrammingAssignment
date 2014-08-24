DataCleaningProgrammingAssignment
=================================

Process Summary
=================================
The following steps describe the data transformation process used in run_analysis.R.

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

Code Book
=================================
A list of all variables included in the raw data can be found in "UCI HAR Dataset/features.txt". Descriptions of these variables, how they were obtained or calculated, and any additional information can be found in "UCI HAR Dataset documentation/features_info.txt".

Of the original variables, those included in the final dataset are those that are mean or standard deviation values. Note that some variables with mean in the name, specifically the meanFreq() variables, were not included in the final dataset as they were judged to be different than the other mean values. This judgement was made based on the differentation of the variables identified in the "features_info.txt" file.

The following list of variables is included in the final dataset. Again, descriptions can be found in "UCI HAR Dataset documentation/features_info.txt".

"tBodyAcc-mean()-Z"          
"tGravityAcc-mean()-X"       
"tGravityAcc-mean()-Y"       
"tGravityAcc-mean()-Z"       
"tBodyAccJerk-mean()-X"      
"tBodyAccJerk-mean()-Y"      
"tBodyAccJerk-mean()-Z"      
"tBodyGyro-mean()-X"         
"tBodyGyro-mean()-Y"         
"tBodyGyro-mean()-Z"         
"tBodyGyroJerk-mean()-X"     
"tBodyGyroJerk-mean()-Y"     
"tBodyGyroJerk-mean()-Z"     
"tBodyAccMag-mean()"         
"tGravityAccMag-mean()"      
"tBodyAccJerkMag-mean()"     
"tBodyGyroMag-mean()"        
"tBodyGyroJerkMag-mean()"    
"fBodyAcc-mean()-X"          
"fBodyAcc-mean()-Y"          
"fBodyAcc-mean()-Z"          
"fBodyAccJerk-mean()-X"      
"fBodyAccJerk-mean()-Y"      
"fBodyAccJerk-mean()-Z"      
"fBodyGyro-mean()-X"         
"fBodyGyro-mean()-Y"         
"fBodyGyro-mean()-Z"         
"fBodyAccMag-mean()"         
"fBodyBodyAccJerkMag-mean()" 
"fBodyBodyGyroMag-mean()"    
"fBodyBodyGyroJerkMag-mean()"
"tBodyAcc-std()-X"           
"tBodyAcc-std()-Y"           
"tBodyAcc-std()-Z"           
"tGravityAcc-std()-X"        
"tGravityAcc-std()-Y"        
"tGravityAcc-std()-Z"        
"tBodyAccJerk-std()-X"       
"tBodyAccJerk-std()-Y"       
"tBodyAccJerk-std()-Z"       
"tBodyGyro-std()-X"          
"tBodyGyro-std()-Y"          
"tBodyGyro-std()-Z"          
"tBodyGyroJerk-std()-X"      
"tBodyGyroJerk-std()-Y"      
"tBodyGyroJerk-std()-Z"      
"tBodyAccMag-std()"          
"tGravityAccMag-std()"       
"tBodyAccJerkMag-std()"      
"tBodyGyroMag-std()"         
"tBodyGyroJerkMag-std()"     
"fBodyAcc-std()-X"           
"fBodyAcc-std()-Y"           
"fBodyAcc-std()-Z"           
"fBodyAccJerk-std()-X"       
"fBodyAccJerk-std()-Y"       
"fBodyAccJerk-std()-Z"       
"fBodyGyro-std()-X"          
"fBodyGyro-std()-Y"          
"fBodyGyro-std()-Z"          
"fBodyAccMag-std()"          
"fBodyBodyAccJerkMag-std()"  
"fBodyBodyGyroMag-std()"     
"fBodyBodyGyroJerkMag-std()"

Study Design
=================================
All data used was provided as part of the class. From the course website:

"The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"