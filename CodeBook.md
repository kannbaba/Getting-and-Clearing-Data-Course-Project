# Code Book

This document describes the data, its list of variables, and any modification performed to clean up.

## Source of the Data:

* Source of the original data:
  [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]().
* Original description:
  [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]().

## Dataset Information ##

(*copied from the `README.txt` file in the Dataset package*)

**Human Activity Recognition Using Smartphones Dataset**
by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
e captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore 
a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 
variables from the time and frequency domain.

### The Data Package ###

The package contents are:

- `README.txt`
- `features_info.txt`: Shows information about the variables used on the feature vector.
- `features.txt`: List of all features.
- `activity_labels.txt`: Links the class labels with their activity name.
- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- `train/subject_train.txt`: Each row refers to one (out of thirty) subject who performed the activity for each window sample. 
                             Therefore, values range from 1 to 30.      

- `train/Inertial Signals/total_acc_x_train.txt`: The acceleration signal from the smartphone accelerometer X axis in standard 
                                                    gravity units 'g'. Each row shows a `128` element vector. 
                                                    The same description applies for the `total_acc_x_train.txt` and for the
                                                    `total_acc_z_train.txt` files for the Y and Z axis.

- `train/Inertial Signals/body_acc_x_train.txt`: The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- `train/Inertial Signals/body_gyro_x_train.txt`: The angular velocity vector measured by the gyroscope for each window sample. 
                                                  These values are expressed in `radians-per-second`. 

## Data Manipulation details

`run_analysis.R` script performs the following operations:
     0. Reads the files
     
     1. Merges userdata, activity data and both the training and the test sets to create one single table
     
     2. creates an index to extract the measurements on the mean and standard deviation for each measurement 
        and exctract the data from the single table according to the index
     
     3. Uses descriptive activity names to name to replace the data activities in the single table

     4. Labels the data set appropriately with descriptive variable names.
     
     4. Creates a second, independent tidy data set with the average of each variable 
         for each activity and each subject.


### Merges userdata, activity data and both the training and the test sets to create one single table

* "subject_test.txt", "y_test.txt" ,and "X_test.txt" : this results in a `10299 x 1` data frame with subject IDs, activity IDs, and measurements
* "subject_train.txt", "y_train.txt" ,and "X_train.txt" : this results in a `10299 x 1` data frame with subject IDs, activity IDs, and measurements
* both tables are merged with rrbind method

### Labels the data set appropriately with descriptive variable names. ###

The script properly labels the dataset with descriptive names from the features_list which has clean names without the need for further cleaning

The single data set is a a single `10299x563` data frame corresponding to, `subject IDs`, renamed `activity labels` and complete list of `attributes` in the features_list.txt


### Extracts only the measurements on the mean and standard deviation for each measurement. 

In order to extract onle the meansurements of *mean* and *standart deviation*, the script performs text filtering with grep function using the seelection
criteria "mean()" and "std()"

This results in a `10299 x 81` data frame

Names of the extracted 79 attributes corresponds to:

"tBodyAcc-mean()-X " <br>
"tBodyAcc-mean()-Z "<br>
"tGravityAcc-mean()-Y "<br>
"tBodyAccJerk-mean()-X "<br>
"tBodyAccJerk-mean()-Z "<br>
"tBodyGyro-mean()-Y "<br>
"tBodyGyroJerk-mean()-X "<br>
"tBodyGyroJerk-mean()-Z "<br>
"tGravityAccMag-mean() "<br>
"tBodyGyroMag-mean() "<br>
"fBodyAcc-mean()-X "<br>
"fBodyAcc-mean()-Z "<br>
"fBodyAcc-meanFreq()-Y "<br>
"fBodyAccJerk-mean()-X "<br>
"fBodyAccJerk-mean()-Z "<br>
"fBodyAccJerk-meanFreq()-Y "<br>
"fBodyGyro-mean()-X "<br>
"fBodyGyro-mean()-Z "<br>
"fBodyGyro-meanFreq()-Y "<br>
"fBodyAccMag-mean() "<br>
"fBodyBodyAccJerkMag-mean() "<br>
"fBodyBodyGyroMag-mean() "<br>
"fBodyBodyGyroJerkMag-mean() "<br>
"tBodyAcc-mean()-Y "<br>
"tGravityAcc-mean()-X "<br>
"tGravityAcc-mean()-Z "<br>
"tBodyAccJerk-mean()-Y "<br>
"tBodyGyro-mean()-X "<br>
"tBodyGyro-mean()-Z "<br>
"tBodyGyroJerk-mean()-Y "<br>
"tBodyAccMag-mean() "<br>
"tBodyAccJerkMag-mean() "<br>
"tBodyGyroJerkMag-mean() "<br>
"fBodyAcc-mean()-Y "<br>
"fBodyAcc-meanFreq()-X "<br>
"fBodyAcc-meanFreq()-Z "<br>
"fBodyAccJerk-mean()-Y "<br>
"fBodyAccJerk-meanFreq()-X "<br>
"fBodyAccJerk-meanFreq()-Z "<br>
"fBodyGyro-mean()-Y "<br>
"fBodyGyro-meanFreq()-X "<br>
"fBodyGyro-meanFreq()-Z "<br>
"fBodyAccMag-meanFreq() "<br>
"fBodyBodyAccJerkMag-meanFreq() "<br>
"fBodyBodyGyroMag-meanFreq() "<br>
"fBodyBodyGyroJerkMag-meanFreq() "<br>
"tBodyAcc-std()-X "<br>
"tBodyAcc-std()-Z "<br>
"tGravityAcc-std()-Y "<br>
"tBodyAccJerk-std()-X "<br>
"tBodyAccJerk-std()-Z "<br>
"tBodyGyro-std()-Y "<br>
"tBodyGyroJerk-std()-X "<br>
"tBodyGyroJerk-std()-Z "<br>
"tGravityAccMag-std() "<br>
"tBodyGyroMag-std() "<br>
"fBodyAcc-std()-X "<br>
"fBodyAcc-std()-Z "<br>
"fBodyAccJerk-std()-Y "<br>
"fBodyGyro-std()-X "<br>
"fBodyGyro-std()-Z "<br>
"fBodyBodyAccJerkMag-std() "<br>
"fBodyBodyGyroJerkMag-std() "<br>
"tBodyAcc-std()-Y "<br>
"tGravityAcc-std()-X "<br>
"tGravityAcc-std()-Z "<br>
"tBodyAccJerk-std()-Y "<br>
"tBodyGyro-std()-X "<br>
"tBodyGyro-std()-Z "<br>
"tBodyGyroJerk-std()-Y "<br>
"tBodyAccMag-std() "<br>
"tBodyAccJerkMag-std() "<br>
"tBodyGyroJerkMag-std() "<br>
"fBodyAcc-std()-Y "<br>
"fBodyAccJerk-std()-X "<br>
"fBodyAccJerk-std()-Z "<br>
"fBodyGyro-std()-Y "<br>
"fBodyAccMag-std() "<br>
"fBodyBodyGyroMag-std() "

### Uses descriptive activity names to name the activities in the data set ###

In this step, the script reads the name of the activities from `activity_labels.txt`, and replaces the data in the second column of the single table 
with column label "activityID"

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### Create the Summary Tidy Dataset

Finally, the R script creates a final **tidy dataset** with the average of each measurement for each subject and then each activity

The result is saved in the `tidy_dataset_with_average_values.txt` file, containing a `180x81` table

Again, the data frame contains:
- `subject IDs` in the 1st column;
- `activity labels` in the 2nd column;
- the average of `features` in the next 66 columns.
