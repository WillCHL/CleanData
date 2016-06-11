# Getting and Cleaning Data Assignment - Code Book

## Data source
All data for this assignment is from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Further information on the dataset can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables
* subject: The subject number from the study (factor variable 1:30).
* activity: The activity number from the study (factor variable 1:6 levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
* Measurement variables: A mean of the original data aggregated on the subject and activity variables.

    TimeBodyAcc-mean-Y, TimeBodyAcc-mean-Z, TimeBodyAcc-std-X, TimeBodyAcc-std-Y, TimeBodyAcc-std-Z, TimeGravityAcc-mean-X, TimeGravityAcc-mean-Y, TimeGravityAcc-mean-Z, TimeGravityAcc-std-X, TimeGravityAcc-std-Y, TimeGravityAcc-std-Z, TimeBodyAccJerk-mean-X, TimeBodyAccJerk-mean-Y, TimeBodyAccJerk-mean-Z, TimeBodyAccJerk-std-X, TimeBodyAccJerk-std-Y, TimeBodyAccJerk-std-Z, TimeBodyGyro-mean-X, TimeBodyGyro-mean-Y, TimeBodyGyro-mean-Z, TimeBodyGyro-std-X, TimeBodyGyro-std-Y, TimeBodyGyro-std-Z, TimeBodyGyroJerk-mean-X, TimeBodyGyroJerk-mean-Y, TimeBodyGyroJerk-mean-Z, TimeBodyGyroJerk-std-X, TimeBodyGyroJerk-std-Y, TimeBodyGyroJerk-std-Z, TimeBodyAccMag-mean, TimeBodyAccMag-std, TimeGravityAccMag-mean, TimeGravityAccMag-std, TimeBodyAccJerkMag-mean, TimeBodyAccJerkMag-std, TimeBodyGyroMag-mean, TimeBodyGyroMag-std, TimeBodyGyroJerkMag-mean, TimeBodyGyroJerkMag-std, FreqBodyAcc-mean-X, FreqBodyAcc-mean-Y, FreqBodyAcc-mean-Z, FreqBodyAcc-std-X, FreqBodyAcc-std-Y, FreqBodyAcc-std-Z, FreqBodyAccJerk-mean-X, FreqBodyAccJerk-mean-Y, FreqBodyAccJerk-mean-Z, FreqBodyAccJerk-std-X, FreqBodyAccJerk-std-Y, FreqBodyAccJerk-std-Z, FreqBodyGyro-mean-X, FreqBodyGyro-mean-Y, FreqBodyGyro-mean-Z, FreqBodyGyro-std-X, FreqBodyGyro-std-Y, FreqBodyGyro-std-Z, FreqBodyAccMag-mean, FreqBodyAccMag-std, FreqBodyBodyAccJerkMag-mean, FreqBodyBodyAccJerkMag-std, FreqBodyBodyGyroMag-mean, FreqBodyBodyGyroMag-std, FreqBodyBodyGyroJerkMag-mean, FreqBodyBodyGyroJerkMag-std

## Processing
* Test and Training datasets were joined
* The were filtered to find only the mean and standard deviation (std) measurements in the time and frequency domain
* Variables were renamed
  * "Time" prefix variable related to measurements in time
  * "Freq" prefix variables related to measuremes dervied from a Fast Fourier Transform
* Factor variables to identify the subject the measurement relates to and the activity being conducted were joined to the measurement data
* An grouped data file contain was obtained by aggregateing by subject and activity using the mean of each group
* Output table is written to "groupData.txt"
