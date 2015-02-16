trainSets <- read.table("data/train/X_train.txt")
trainLabels <- read.table("data/train/y_train.txt")
trainSubjects <- read.table("data/train/subject_train.txt")
testSets <- read.table("data/test/X_test.txt")
testLabels <- read.table("data/test/y_test.txt")
testSubjects <- read.table("data/test/subject_test.txt")
sets <- rbind(trainSets, testSets)
rm(trainSets, testSets)
activityLabelsIds <- rbind(trainLabels, testLabels)
rm(trainLabels, testLabels)
subjects <- rbind(trainSubjects, testSubjects)
rm(trainSubjects, testSubjects)
features <- read.table("data/features.txt")
colnames(sets) <- features[,2]
rm(features)
colnames(activityLabelsIds) <- "activityLabelId"
colnames(subjects) <- "subjectId"
data <- cbind(sets,subjects,activityLabelsIds)
rm(activityLabelsIds,sets,subjects)
#2
stdAndMean <- data[grep("mean\\(\\)|std\\(\\)", names(data))]
#3
labels <- read.table("data/activity_labels.txt")
labels[, 2] <- tolower(gsub("_", " ", labels[, 2]))
for (i in seq(length(data[,"activityLabelId"]))) {
    data[i,"activityLabelId"] <- labels[data[i,"activityLabelId"],2]
}
data[,563] <- factor(data[,563])
data[,562] <- factor(data[,562])
#4
colnames(data) <- sub("^t", "time", names(data))
colnames(data) <- sub("^f", "frequency", names(data))
colnames(data) <- sub("Acc", "Accelerometer", names(data))
colnames(data) <- sub("Gyro", "Gyroscope", names(data))
colnames(data) <- sub("Mag", "Magnitude", names(data))
colnames(data) <- sub("BodyBody", "Body", names(data))
#5
data2 <- aggregate(formula = . ~subjectId + activityLabelId, data = data, FUN = mean)
write.table(data2, file = "tidydata.txt", row.name = FALSE)