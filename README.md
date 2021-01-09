---
title: "README.md"
author: "Kartik Bhutani"
date: "09/01/2021"
output: html_document
---

Getting and Cleaning Data
=========================

This is a repository for Programming assignment of the "Getting and Cleaning Data" course on Coursera through Johns Hopkins University.

The script required to run is "run_analysis.R". It does the following tasks : 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to run this project

* Make a directory (say "ProgAsg") for this project and download the data source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in this location. (Also set your working directory as this location.)

* Unzip it (either manually or through "unzip" function in R).

* Create a new script file called run_analysis.R in this main directory itself.  

* In RStudio, enter the following command to load the script
```> source("run_analysis.R")  ```

* To read the final data with average, use : 
```> data <- read.table("final_data_with_average.txt") ```
