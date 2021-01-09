---
title: "CodeBook.md"
author: "Kartik Bhutani"
date: "09/01/2021"
output: html_document
---

Project Code Book
========================

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The main R script "run_analysis.R" does the following tasks :  

* Merges the training set `X_train.txt` with test set `X_test.txt` using rbind which produces a data frame with 10299 observations and 561 attributes. Similarly, it merges `y_train.txt` with `y_test.txt` to produce a data frame with single column of 6 different activities. Finally, it merges `subject_train.txt` with `subject_test.txt` to produce a data frame with single column of 30 different subjects. 

* Extracts only the measurements on the mean and standard deviation for each measurement. This reduces the attributes in the data frame from 561 to only 66 relevant attributes.

* Uses descriptive activity names to name the activities in the data set, which are as follows : 

        walking  
        
        walkingupstairs  
        
        walkingdownstairs  
        
        sitting  
        
        standing  
        
        laying  

* The script also appropriately labels the data set with descriptive variable names as per the good practices mentioned in course i.e. all attributes and activity names are converted to lower case, with underscores and parenthesis removed. Then all the data tables (namely `dtX, dtY and dtSubject` are merge column wise to produce data frame with same number of observations as before but two extra columns of subject and activity. Thus, a total of 68 attributes.

* Finally, from previous step data, the script creates a second, independent tidy data set with the average of each variable for each activity and each subject. This aggregation produces data frame consisting of 180 observations (1 for each subject and activity), as there are total of 30 subjects and 6 activities. This data is saved as `final_data_with_average.txt`.