#Getting and Cleaning Data 
##Course Project Instructions:
You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##The data for the project:
[Data collected from the accelerometers from the Samsung Galaxy S smartphone](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[[Download link]](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)(```UCI HAR Dataset```)

##How to work on this project
1. Download ```run_analysis.R```, put it into your working directory.
2. Run ```run_analysis.R``` using ```source(run_analysis.R)``` command in ```R``` or ```RStudio```.
3. Then it will automatically download the ```UCI HAR Dataset```(if you didn't downloaded it before), work on the data, and generate a new file ```tiny_data.txt``` in your working directory.

Please refer to the ```CodeBook.md```if you need more information about the variables, the data, and any transformations performed to clean up the data.
