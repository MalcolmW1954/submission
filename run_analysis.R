setwd("C:/UCI HAR Dataset")
library(plyr)

# reads 'train' data files 

xtrain <- read.table("c:/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("c:/UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("c:/UCI HAR Dataset/train/subject_train.txt")
xtraincols <- read.table("c:/UCI HAR Dataset/features.txt")

# applies activity and subject labels

colnames(ytrain) <- "activity"
colnames(subjecttrain) <- "subject"
names(xtrain) <- xtraincols$V2

# creates single 'train' data frame

jointrain <- cbind(ytrain, subjecttrain, xtrain)

# applies activity labels

jointrain$activity [jointrain$activity == 1] <- "WALKING"
jointrain$activity [jointrain$activity == 2] <- "WALKING_UPSTAIRS"
jointrain$activity [jointrain$activity == 3] <- "WALKING_DOWNSTAIRS"
jointrain$activity [jointrain$activity == 4] <- "SITTING"
jointrain$activity [jointrain$activity == 5] <- "STANDING"
jointrain$activity [jointrain$activity == 6] <- "LAYING"

# reads 'test' data files 

xtest <- read.table("c:/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("c:/UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("c:/UCI HAR Dataset/test/subject_test.txt")
xtestcols <- read.table("c:/UCI HAR Dataset/features.txt")

# applies activity and subject labels

colnames(ytest) <- "activity"
colnames(subjecttest) <- "subject"
names(xtest) <- xtestcols$V2

# creates single 'train' data frame

jointest <- cbind(ytest, subjecttest, xtest)

# applies activity labels

jointest$activity [jointest$activity == 1] <- "WALKING"
jointest$activity [jointest$activity == 2] <- "WALKING_UPSTAIRS"
jointest$activity [jointest$activity == 3] <- "WALKING_DOWNSTAIRS"
jointest$activity [jointest$activity == 4] <- "SITTING"
jointest$activity [jointest$activity == 5] <- "STANDING"
jointest$activity [jointest$activity == 6] <- "LAYING"

# joins 'train' and 'test' together

combined <- rbind(jointrain, jointest)

# selects variables containing "mean()" and "std()"
# hard-coded (as per David Hood) after wasting too much time trying to get dplyr's select function to work
# these columns correspond to variables containing activity, subject, mean() *3, and std() *3

colsToKeep <- c(1,2,3,4,5,6,7,8)
stripped <- combined[, colsToKeep]

#calculates means of columns; condenses 10299 rows to 180

output <- ddply(stripped, c("activity", "subject"), numcolwise(mean))
write.table(output, "output.text", row.name= FALSE)
