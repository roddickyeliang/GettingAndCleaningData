# Steps to generate the tidy data
# 1. Merges the training and the test sets to create one data set.

trainData <- read.table("train/subject_train.txt")
testData <- read.table("test/subject_test.txt")
subject <- rbind(trainData, testData)

trainData <- read.table("train/X_train.txt")
testData <- read.table("test/X_test.txt")
X <- rbind(trainData, testData)

trainData <- read.table("train/y_train.txt")
testData <- read.table("test/y_test.txt")
Y <- rbind(trainData, testData)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
target_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, target_features]
names(X) <- tolower(gsub("\\(|\\)", "", features[target_features, 2]))

# 3. Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("activity_labels.txt")
activity_labels[, 2] = gsub("_", "", tolower(as.character(activity_labels[, 2])))
Y[,1] = activity_labels[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(subject) <- "subject"
firstTidyData <- cbind(subject, Y, X)

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uSubjects = unique(subject)[,1]
nSubjects = length(unique(subject)[,1])
nActivities = length(activity_labels[,1])
nCols = dim(firstTidyData)[2]
secondTidyData = firstTidyData[1:(nSubjects*nActivities), ]

row = 1
for (s in 1:nSubjects) {
	for (a in 1:nActivities) {
		secondTidyData[row, 1] = uSubjects[s]
		secondTidyData[row, 2] = activity_labels[a, 2]
		tmp <- firstTidyData[firstTidyData$subject==s & firstTidyData$activity==activity_labels[a, 2], ]
		secondTidyData[row, 3:nCols] <- colMeans(tmp[, 3:nCols])
		row = row + 1
	}
}

write.table(secondTidyData, "tidy_data.txt")
