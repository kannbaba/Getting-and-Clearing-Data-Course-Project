Getting and Cleaning Data Project
=================================
Welcome to my GitHub Repository for the [Getting and Cleaning Data Course](https://www.coursera.org/learn/data-cleaning/home/info) Project.

## Project Description ##

The aim of this project is to present the coding capability to gather, clean and work on data sets. The goal of the course project is to clean the data, which is constructed from multiple tables.

In order to complete this assignment, the following are the review criteria:

* The submitted data set is tidy.
* The Github repo contains the required scripts.
* GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
* The README that explains the analysis files is clear and understandable.
* The work submitted for this project is the work of the student who submitted it.

## Data Description ##

The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained.

The downloadable data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the web site where the data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]().

## Data Analysis ##

I have observed the following **steps** for the data analysis

*  **Download and Unrar** the package at the following link:
  
    [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]()

*  **Set the Working Directory** to the folder where you unrar'ed the package:

* **Run** the `run_analysis.R` script: 

 The script will perform the following steps: <br>
     - Read the Dataset<br>
     - Merges userdata, activity data and both the training and the test sets to create one single table<br>
     - Extracts only the measurements on the mean and standard deviation for each measurement. <br>
     - Uses descriptive activity names to name the activities in the data set <br>
     - Create the summary table with the average of each variable for each activity and each subject.<br>

  The following file is created at the end <br>
    - summary_table.txt 
