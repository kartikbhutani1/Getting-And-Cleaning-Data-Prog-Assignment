# Data source used for this project :
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# This R script does the following tasks : 

# 0. Downloads the data, and unzips it.

  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data_smartphones.zip")
  unzip("data_smartphones.zip")
  
# 1. Merges the training and the test sets to create one data set.
  
  dtX_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  dtX_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  dtX <- rbind(dtX_train, dtX_test)
  
  dtY_test <- read.table("UCI HAR Dataset/test/y_test.txt")
  dtY_train <- read.table("UCI HAR Dataset/train/y_train.txt")
  dtY <- rbind(dtY_train, dtY_test)
  
  dtSub_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  dtSub_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  dtSubject <- rbind(dtSub_train, dtSub_test)

# 2. Extracts only the measurements on the mean and 
#    standard deviation for each measurement.

  features <- read.table("UCI HAR Dataset/features.txt")
  reqd_indices <- grep("-mean\\(\\)|-std\\(\\)", features[,2])
  dtX <- dtX[,reqd_indices]
  names(dtX) <- gsub("\\(|\\)", "", tolower(features[reqd_indices, 2]))

# 3. Uses descriptive activity names to name the activities in the data set.  

  activities <- read.table("UCI HAR Dataset/activity_labels.txt")
  dtY[,1] <- gsub("_", "", tolower(activities[dtY[,1],2]))
  names(dtY) <- "activity"

# 4. Appropriately labels the data set with descriptive 
#    variable names. Writes this merged data to a new text file.

  names(dtSubject) <- "subject"
  mergedData <- cbind(dtSubject, dtX, dtY)

# 5. From the data set in step 4, creates a second, independent tidy
#    data set with the average of each variable for each activity and each subject.

  drops <- c("subject", "activity")
  finalData <- aggregate(mergedData[,!names(mergedData) %in% drops], by=list(mergedData$subject, mergedData$activity), mean)
  write.table(finalData, "final_data_with_average.txt", row.names = FALSE)
  