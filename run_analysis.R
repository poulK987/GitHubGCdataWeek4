#Getting and Cleaning Data Course Project, week 4

#Assumes dplyr package is installed
library(dplyr)

#Load training data:
trainy <- read.table("train/y_train.txt", header = FALSE)
trainX <- read.table("train/X_train.txt", header = FALSE)

#Load testing data:
testy <- read.table("test/y_test.txt",  header = FALSE)
testX <- read.table("test/X_test.txt", header = FALSE)

#Get subject info:
subject_train <- read.table("train/subject_train.txt", header = FALSE)
subject_test <- read.table("test/subject_test.txt", header = FALSE)

#Get feature names:
featureNames <- read.table("features.txt", header = FALSE)

#Get activity names:
activityNames <- read.table("activity_labels.txt", header = FALSE)

#Add subjectID to test and train dataframes:
trainX <- mutate(trainX, subjectID = subject_train$V1)
testX <- mutate(testX, subjectID = subject_test$V1)

#Merge train and test data:
y <- rbind(trainy, testy)                   #Labels (train and test)
X <- rbind(trainX, testX)                   #Features (train and test)

#Assign proper label to data in X and y:
names(y) <- c("ActivityLabel")
names(X) <- c(as.character(featureNames$V2), "subjectID")

#Create one big dataframe called DATA:
DATA <- cbind(X,y)
DATAnamelist <- names(DATA)

#Select only the mean and standard deviations from the feature vector (keeping ActivityLabel and subjectID in DATA):
#selectCols <- as.character(c(DATAnamelist[grepl("mean\\(\\)|std\\(\\)", featureNames$V2)], "ActivityLabel","subjectID"))
selectCols <- as.character(c(DATAnamelist[grepl("mean\\(\\)|std\\(\\)", featureNames$V2)]))
DATA <- DATA[, selectCols]         #Now only mean and std features (and subjectID) included

#Edit to make feature names more descriptive:
names(DATA) <- gsub("^t", "time", names(DATA))
names(DATA) <- gsub("^f", "frequency", names(DATA))
names(DATA) <- gsub("Gyro","Gyroscope", names(DATA))
names(DATA) <- gsub("Mag","Magnitute", names(DATA))               

#Assign descriptions of activities:
DATA$ActivityLabel <- activityNames$V2[DATA$ActivityLabel]

#Create second, ti dy data set with average of each variable by activity and subject:
DATA2 <- aggregate(DATA, list(Activity = DATA$ActivityLabel, Subject = DATA$subjectID), mean)


