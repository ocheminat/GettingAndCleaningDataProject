GettingAndCleaningDataProject
=============================

--- run_analysis.R ---

I went through the 5 steps of the course project:

1. Merge training and test data sets.
I first downloaded the different files that were needed to create the training and test data sets. For each data set, I merged the
activity number, the subject number and the variables containing the values of the measurements. Then, I merged training and test
data sets, and I got a 10.299 observations and 563 variables dataset.

2. Extract only the measurements on the mean the standard deviation.
I selected the variable names that had "mean", "std", "Activity" or "Subject". I chose to remove the variables whom name contained
"meanFreq" because I considered this kind of variable as different from the standard calculation of a mean.

3. Use descriptive activity names.
I used the codebook for activity names in order to use descriptive activity names.

4. Label the dataset with descriptive variable names.
I removed blank spaces and the following types of characters: "-", "()". I chose not to lower all the letters in order to have
understandable names for variables.

5. Create a second data set that contains the average of each measurement for activity and each subject.
In order to have one line for each subject and each activity, with all the means for the measurement variables, I used ddply
and numcolwise(mean) to get this second data set.

--- Codebook ---
ActivityName: Activity label (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
Subject: Subject number (number)
tBodyAccMeanX (number)
tBodyAccMeanY (number)
tBodyAccMeanZ (number)
tBodyAccStdX (number)
tBodyAccStdY (number)
tBodyAccStdZ (number)
tGravityAccMeanX (number)
tGravityAccMeanY (number)
tGravityAccMeanZ (number)
tGravityAccStdX (number)
tGravityAccStdY (number)
tGravityAccStdZ (number)
tBodyAccJerkMeanX (number)
tBodyAccJerkMeanY (number)
tBodyAccJerkMeanZ (number)
tBodyAccJerkStdX (number)
tBodyAccJerkStdY (number)
tBodyAccJerkStdZ (number)
tBodyGyroMeanX (number)
tBodyGyroMeanY (number)
tBodyGyroMeanZ (number)
tBodyGyroStdX (number)
tBodyGyroStdY (number)
tBodyGyroStdZ (number)
tBodyGyroJerkMeanX (number)
tBodyGyroJerkMeanY (number)
tBodyGyroJerkMeanZ (number)
tBodyGyroJerkStdX (number)
tBodyGyroJerkStdY (number)
tBodyGyroJerkStdZ (number)
tBodyAccMagMean (number)
tBodyAccMagStd (number)
tGravityAccMagMean (number)
tGravityAccMagStd (number)
tBodyAccJerkMagMean (number)
tBodyAccJerkMagStd (number)
tBodyGyroMagMean (number)
tBodyGyroMagStd (number)
tBodyGyroJerkMagMean (number)
tBodyGyroJerkMagStd (number)
fBodyAccMeanX (number)
fBodyAccMeanY (number)
fBodyAccMeanZ (number)
fBodyAccStdX (number)
fBodyAccStdY (number)
fBodyAccStdZ (number)
fBodyAccJerkMeanX (number)
fBodyAccJerkMeanY (number)
fBodyAccJerkMeanZ (number)
fBodyAccJerkStdX (number)
fBodyAccJerkStdY (number)
fBodyAccJerkStdZ (number)
fBodyGyroMeanX (number)
fBodyGyroMeanY (number)
fBodyGyroMeanZ (number)
fBodyGyroStdX (number)
fBodyGyroStdY (number)
fBodyGyroStdZ (number)
fBodyAccMagMean (number)
fBodyAccMagStd (number)
fBodyBodyAccJerkMagMean (number)
fBodyBodyAccJerkMagStd (number)
fBodyBodyGyroMagMean (number)
fBodyBodyGyroMagStd (number)
fBodyBodyGyroJerkMagMean (number)
fBodyBodyGyroJerkMagStd (number)
Activity: Activity number (1 = WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING_DOWNSTAIRS, 4 = SITTING, 5 = STANDING, 6 = LAYING)
