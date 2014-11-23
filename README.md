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