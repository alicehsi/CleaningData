Codebook
Create R script called run_analysis.R that does the following:
1. Download and extracted the dataset from the folder UCI HAR Dataset.
2.  Assign variable names to test and training sets:
•	features <- features.txt
 	features selected comes from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
•	alabel <- activity_labels.txt
List of activities performed when the corresponding measurements were taken and its codes (labels)
•	xtest <-/test/X_test.txt
contains recorded features test data
•	ytest <- /test/y_test.txt
contains test data of activities’code labels
•	subtest <- /test/subject_test.txt
contains test data of the subjects being observed
#train
•	ytrain <- /train/y_train.txt
contains test data of activities’code labels
•	subtrain <- /train/subject_train.txt
o	contains train data of the subjects being observed
•	xtrain <- /X_train.txt
o	contains recorded features train data
3.  Merges the training and the test sets to create one data set.
xdata created by merging xtrain and xtest using rbind() function
ydata created by merging ytrain and ytest using rbind() function
subs created by merging subtrain and subtest using rbind() function
4.  Extracts only the measurements on the mean and standard deviation for each measurement.
measures takes the features columns for selecting mean and standard deviation for each measurement.
5.  Uses descriptive activity names to name the activities in the data set
Replace the entire ydata set with activity and activity labels.
6. Appropriately labels the data set with descriptive variable names.
Label the xdata with column names with specific measures (Body Acc mean, Body Acc std(), etc.)
7.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata.txt is created by  taking the means of each variable for each activity and each subject, after grouped by subject and activity.

