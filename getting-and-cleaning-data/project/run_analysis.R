# This R script called run_analysis.R does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

library(data.table)
library(reshape2)

# Sets working directory and checks for data, downloads one if it does not exist
if (!file.exists("UCI HAR Dataset")) {
        # download the data
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, destfile="UCI_HAR_data.zip", method="curl")
        unzip("UCI_HAR_data.zip")
}

# Loads test sets data
test.x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("./UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Loads training sets data
train.x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("./UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Merges training data and test datasets
merged.x <- rbind(train.x, test.x)
merged.y <- rbind(train.y, test.y)
merged.subject <- rbind(train.subject, test.subject)

# Loads the features and extracts only the measurements on the mean and standard
# deviation for each measurement
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
names(merged.x) = features
extract <- grepl("mean|std", features)
merged.x <- merged.x[, extract]

# Loads activity labels
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
merged.y[,2] = activity.labels[merged.y[,1]]
names(merged.y) = c("Activity_ID", "Activity_Label")
names(merged.subject) = "subject"

# Binds and clears data
all.data <- cbind(merged.subject, merged.y, merged.x)
id.labels   = c("subject", "Activity_ID", "Activity_Label")
data.labels = setdiff(colnames(all.data), id.labels)
melt.data = melt(all.data, id = id.labels, measure.vars = data.labels)
tidy.data = dcast(melt.data, subject + Activity_Label ~ variable, mean)

write.table(tidy.data, file = "./tidy_data.txt", row.names=F)
