---
title: "README"
author: "Peter Bruno"
date: "February 26, 2016"
---

## Getting and Cleaning Data Project

This repo contains my submission of the course project for the Johns Hopkins Coursera "Getting and Cleaning Data" course.

## Project Overview

The goal of the project was to create a tidy data set to be used for potential further analysis by merging the training and test data sets, extracting the mean and standard deviation of those measurements, using descriptive activity names to name activities, labeling the data set with those names, and creating a tidy data set independent from the first which contains the average of each variable for each activity and each subject. 

## Necessary modifications before running the script

In order to run the script yourself, you must obtain and unzip the source files. Those source files must then be placed in the current working directory of R in order for the data to be loaded in. 

You could also alter lines 6-13 of the run_analysis.R file to contain the appropriate path

## Summary of analysis
CodeBook.md which is also found in this repo contains a brief summary of the steps taken, and the code itself in run_analysis.R is documented with each function called