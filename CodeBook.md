---
title: "CodeBook"
author: "Peter Bruno"
date: "February 26, 2016"
---

## Data Source
A description of the data collection can be found on the UCI Machine Learning Repository Website here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set
The data used can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The description of data collection From the UCI Machine Learning Repository Website is as follows
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Step 1 in the Project, Merging the Data Sets

First all the required files are set into the appropriate working directory. The files are then read into corresponding tables. The data required is 
features.txt
X_test.txt
X_train.txt
Y_test.txt
Y_train.txt
activity_labels.txt
subject_test.txt
subject_train.txt

Next all tables are given column names and merged to create one data set

## Step 2 in the Project, extracting the mean and standard deviation

The mean and standard deviation are extracted by creating a logical vector with the grep command to find columns containing mean or std and label them as TRUE with other columns labeled as FALSE

A subset of that data is created in order to readily pull the mean and stdev columns

## Step 3 in the the Project, using descriptive activity names to name activities

Merging the subset of data with the activitytype table provides descriptive activity names

## Step 4 in the Project, appropriately labeling the data set with descriptive activity names

The gsub function is used to replace names with more descriptive ones

## Step 5 in the Project, creating a second, independent tidy data set with the average of each variable for each activity and each subject
The tidy data set is created using the subsetted table