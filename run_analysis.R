## Read the labels to name the columns of both training and test sets

features_list <- read.table("Project/UCI HAR Dataset/features.txt",header=FALSE)

## Read the subjectID, Activity data and feature vector data for TEST group

test_data <- cbind(read.table("Project/UCI HAR Dataset/test/subject_test.txt", header=FALSE),
                   read.table("Project/UCI HAR Dataset/test/y_test.txt", header=FALSE),
                   read.table("Project/UCI HAR Dataset/test/X_test.txt", header=FALSE))
## Label 1.column as subject ID
##       2.column as activityID
##       3-rest of columns as with the items from the features list
colnames(test_data) <- c("subjectID","activityID",features_list[,2])

## Read the subjectID, Activity data and feature vector data for TRAIN group
train_data <- cbind(read.table("Project/UCI HAR Dataset/train/subject_train.txt", header=FALSE),
                    read.table("Project/UCI HAR Dataset/train/y_train.txt", header=FALSE),
                    read.table("Project/UCI HAR Dataset/train/X_train.txt", header=FALSE))
## Label 1.column as subject ID
##       2.column as activityID
##       3-rest of columns as with the items from the features list
colnames(train_data) <- c("subjectID","activityID",features_list[,2])

## Merging both TEST and TRAIN data
complete_data<-rbind(test_data,train_data)

## Creating indexes in order to extract only the measurements 
## on the mean and standard deviation for each measurement. 
mean_index <- grep("mean()", features_list$V2)
std_index <- grep("std()", features_list$V2)

## Extracting indexed data from the merged data
extracted_data <- complete_data[,c(1,2,mean_index+2,std_index+2)]

## installing and loading dplyr package to calculate the summary table
library(dplyr)

## Constructing summary table for the means of feature listed variables, 
## grouped by each subject and each activity
agg_data <- extracted_data %>% group_by(subjectID, activityID) %>%
  summarise(across(everything(),mean),.groups ="drop") %>%
  as.data.frame()
## Renaming the activityIDs with activity names from the activity labels table
activity_names <- read.table("Project/UCI HAR Dataset/activity_labels.txt")
agg_data [,2]=activity_names[,2]

write.table(agg_data, "summary_table.txt", sep=",", row.names=FALSE, quote=FALSE)

