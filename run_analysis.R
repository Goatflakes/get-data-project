library(plyr)
library(reshape2)

# read in the (somewhat) descriptive list of variable names
var_names <- read.table("UCI HAR Dataset/features.txt")

# read in the training dataset, complete with descriptive variable names
train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = var_names$V2)

# subset the training dataset to only those variables with the "mean" or "std"
# in their name
var_index = grep(".*(mean|std).*", var_names$V2) # find index for matching vars
train <- train[var_index]                        # do the actual indexing      

# read in the descriptive activity names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              col.names = c("activity_code","activity"))

# read in the activity code list corresponding to the training dataset
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt",
                                   col.names = "activity_code")
# join the activity code list with the corresponding descriptive activity names
train_activity <- join(train_activity, activity_labels)

# add the (now descriptive) activity list to the training data
train <- mutate(train, activity = train_activity$activity)

# read in the subject list corresponding to the training data
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# add the subject list to the training data
train <- mutate(train, subject_id = train_subjects$V1)


# do exactly the same thing for the test data set
#

# read in the testing dataset, complete with descriptive variable names
test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = var_names$V2)

# subset the testing dataset to only those variables with the "mean" or "std"
# in their name
test <- test[grep(".*(mean|std).*", var_names$V2)]

# read in the activity code list corresponding to the testing dataset
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt",
                            col.names = "activity_code")
# join the activity code list with the corresponding descriptive activity names
test_activity <- join(test_activity, activity_labels)

# add the (now descriptive) activity list to the testing data
test <- mutate(test, activity = test_activity$activity)

# read in the subject list corresponding to the training data
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# add the subject list to the training data
test <- mutate(test, subject_id = test_subjects$V1)


# Now, concatenate the two data sets together
#
uci_data <- rbind(test, train)

# now do the analysis
#

# first melt the data to separate each measurement by subject and activity
meltData <- melt(uci_data,
                 id=c("subject_id","activity"),
                 measure.vars = names(uci_data)[1:79])

# now recast that as a mean to get the mean of each measurement for each user
# and activity

summary_data <- dcast(meltData, subject_id + activity ~ variable, mean)

# write out the result
write.table(summary_data, "summary_data.txt", row.names = FALSE)