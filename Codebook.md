# Transformations
The run_analysis.R script summaries the data using 4 parts.

## Part 1
First the training data set is prepared:
1. A complete set of variable names are read in from "UCI HAR Dataset/features.txt"
2. The training dataset is read in from "UCI HAR Dataset/train/X_train.txt" into a data frame "train" with the variable names as column names. The descriptive names used in the dataset read in in step 1 are used as column names. Some characters present in these names such as () and - are not valid variable names in R so are replaced by periods .
3. All columns of "train" which have names without "mean" or "std" are removed. This removes all columns which aren't means or standard deviations.
4. Descriptive names for activity codes are read in from "UCI HAR Dataset/activity_labels.txt"
5. A the list of activity codes corresponding to measurements in "train" are read in from the file "UCI HAR Dataset/train/y_train.txt".
6. This this is joined with the descriptive activity names read in in 4
7. From the result of the join in 6 the column with the descriptive names is added to "train"
8. The subject_id is read in from the file "UCI HAR Dataset/train/subject_train.txt" and added as a column to "train"

## Part 2
Then the same thing is done for the test data set:
1. The training dataset is read in from "UCI HAR Dataset/test/X_test.txt" into a data frame "test" with the descriptive variable names as column names, with the same limitations as mentioned in part 1 step 1 above.
2. All columns of "test" which have names without "mean" or "std" are removed. This removes all columns which aren't means or standard deviations.
3. A the list of activity codes corresponding to measurements in "test" are read in from the file "UCI HAR Dataset/test/y_test.txt".
4. This this is joined with the descriptive activity names read in in step 4 from part 1 above.
5. From the result of the join in 4 the column with the descriptive names is added to "test"
6. The subject_id is read in from the file "UCI HAR Dataset/test/subject_test.txt" and added as a column to "test"

## Part 3
The data is combined into one data frame "uci_data" by rbind()ing "test" and "train"

## Part 4
The data is summarized using the package reshape2
1. The data is melt()ed into table "meltData", using "subject_id" and "activity" as ID variables, and the rest of the variables as measure variables.
2. "meltData" is recast into a a summary data frame "summary_data", using the formula "subject_id + activity ~ variable" and the function "mean". This gives the requisite average of every variable for each combination of subject and activity.
3. The result is written out as "summary_data.txt" without row names but with column names.

# Variables in the output file "summary_data.txt"
Note: all variables are mean summaries of many original measurements, as described above.
##subject_id
The participant number.
##activity
The activity performed, as identified by video.
##tBodyAcc.mean...X
##tBodyAcc.mean...Y
##tBodyAcc.mean...Z
The mean of the time sequence body acceleration, measured on the x, y, and z axis. Units: m/s^2
##tBodyAcc.std...X
##tBodyAcc.std...Y
##tBodyAcc.std...Z
The standard deviation of the time sequence body acceleration, measured on the x, y, and z axis. Units: m/s^2
##tGravityAcc.mean...X
##tGravityAcc.mean...Y
##tGravityAcc.mean...Z
Mean of the time sequence gravity, measured on the x, y, and z axis. Units: m/s^2
##tGravityAcc.std...X
##tGravityAcc.std...Y
##tGravityAcc.std...Z
Standard deviation of the time sequence gravity, measured on the x, y, and z axis. Units: m/s^2
##tBodyAccJerk.mean...X
##tBodyAccJerk.mean...Y
##tBodyAccJerk.mean...Z
Mean of the time sequence body jerk, measured on the x, y, and z axis. units: m/s^2
##tBodyAccJerk.std...X
##tBodyAccJerk.std...Y
##tBodyAccJerk.std...Z
Standard deviation of the time sequence body jerk, measured on the x, y, and z axis. Units: m/s^2
##tBodyGyro.mean...X
##tBodyGyro.mean...Y
##tBodyGyro.mean...Z
Mean of the time sequence angular velocity, measured about the x, y, and z axis. Units: rad/s
##tBodyGyro.std...X
##tBodyGyro.std...Y
##tBodyGyro.std...Z
Standard deviation of the time sequence angular velocity, measured on the x, y, and z axis. Units: rad/s
##tBodyGyroJerk.mean...X
##tBodyGyroJerk.mean...Y
##tBodyGyroJerk.mean...Z
Mean of the time sequence angular velocity jerk, measured on the x, y, and z axis. Units: rad/s
##tBodyGyroJerk.std...X
##tBodyGyroJerk.std...Y
##tBodyGyroJerk.std...Z
Standard deviation of the time sequence angular velocity jerk, measured on the x, y, and z axis. Units: rad/s
##tBodyAccMag.mean..
Mean of the time sequence Euclidean norm of the body acceleration. Units: m/s^2
##tBodyAccMag.std..
Standard deviation of the time sequence Euclidean norm of the body acceleration. Units: m/s^2
##tGravityAccMag.mean..
Mean of the time sequence Euclidean norm of gravity. Units: m/s^2
##tGravityAccMag.std..
Standard deviation of the time sequence Euclidean norm of gravity. Units: m/s^2
##tBodyAccJerkMag.mean..
Mean of the time sequence Euclidean norm of the body jerk acceleration. Units: m/s^2
##tBodyAccJerkMag.std..
Standard deviation of the time sequence Euclidean norm of the body jerk acceleration. Units: m/s^2
##tBodyGyroMag.mean..
Mean of the time sequence Euclidean norm of the angular velocity. Units: rad/s
##tBodyGyroMag.std..
Standard deviation of the time sequence Euclidean norm of the angular velocity. Units: rad/s
##tBodyGyroJerkMag.mean..
Mean of the time sequence Euclidean norm of the angular velocity jerk. Units: rad/s
##tBodyGyroJerkMag.std..
Standard deviation of the time sequence Euclidean norm of the angular velocity jerk. Units: rad/s
##fBodyAcc.mean...X
##fBodyAcc.mean...Y
##fBodyAcc.mean...Z
The mean of the Fast Fourier Transform (FFT) of body acceleration, measured on the x, y, and z axis. Units: m/s^2
##fBodyAcc.std...X
##fBodyAcc.std...Y
##fBodyAcc.std...Z
Standard deviation of the FFT of body acceleration, measured on the x, y, and z axis. Units: m/s^2
##fBodyAcc.meanFreq...X
##fBodyAcc.meanFreq...Y
##fBodyAcc.meanFreq...Z
Weighted average of frequency components of the FFT of the body acceleration, measured on the x, y, and z axis. Units: m/s^2
##fBodyAccJerk.mean...X
##fBodyAccJerk.mean...Y
##fBodyAccJerk.mean...Z
Mean of the FFT of body jerk acceleration, measured on the x, y, and z axis. Units: m/s^2
##fBodyAccJerk.std...X
##fBodyAccJerk.std...Y
##fBodyAccJerk.std...Z
Standard deviation of the FFT of body jerk acceleration, measured on the x, y, and z axis. Units: m/s^2
##fBodyAccJerk.meanFreq...X
##fBodyAccJerk.meanFreq...Y
##fBodyAccJerk.meanFreq...Z
Weighted average of frequency components of the FFT of the body jerk acceleration, measured on the x, y, and z axis. Units: m/s^2
##fBodyGyro.mean...X
##fBodyGyro.mean...Y
##fBodyGyro.mean...Z
Mean of the FFT of angular velocity, measured about the x, y, and z axis. Units: rad/s
##fBodyGyro.std...X
##fBodyGyro.std...Y
##fBodyGyro.std...Z
Standard deviation of the FFT of angular velocity, measured about the x, y, and z axis. Units: rad/s
##fBodyGyro.meanFreq...X
##fBodyGyro.meanFreq...Y
##fBodyGyro.meanFreq...Z
Weighted average of frequency components of the FFT of angular velocity, measured on the x, y, and z axis. Units: rad/s
##fBodyAccMag.mean..
Mean of the FFT of the Euclidean norm of the body acceleration. Units: m/s^2
##fBodyAccMag.std..
Standard deviation of the FFT of the Euclidean norm of the body acceleration. Units: m/s^2
##fBodyAccMag.meanFreq..
Weighted average of frequency components of the FFT of the Euclidean norm of the body acceleration. Units: m/s^2
##fBodyBodyAccJerkMag.mean..
Mean of the FFT of the Euclidean norm of the body jerk acceleration. Units: m/s^2
##fBodyBodyAccJerkMag.std..
Standard deviation of the FFT of the Euclidean norm of the body jerk acceleration. Units: m/s^2
##fBodyBodyAccJerkMag.meanFreq..
Weighted average of frequency components of the FFT of the Euclidean norm of the body jerk acceleration. Units: m/s^2
##fBodyBodyGyroMag.mean..
Mean of the FFT of the Euclidean norm of the angular velocity. Units: m/s^2
##fBodyBodyGyroMag.std..
Standard deviation of the FFT of the Euclidean norm of the angular velocity. Units: rad/s
##fBodyBodyGyroMag.meanFreq..
Weighted average of frequency components of the FFT of the Euclidean norm of the angular velocity. Units: rad/s
##fBodyBodyGyroJerkMag.mean..
Mean of the FFT of the Euclidean norm of the angular jerk velocity. Units: m/s^2
##fBodyBodyGyroJerkMag.std..
Standard deviation of the FFT of the Euclidean norm of the angular jerk velocity. Units: m/s^2
##fBodyBodyGyroJerkMag.meanFreq..
Weighted average of frequency components of the FFT of the Euclidean norm of the angular jerk velocity. Units: rad/s
