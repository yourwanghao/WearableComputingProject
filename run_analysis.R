###########################################################################
# Script:      run_analysis.R
# Author:      Hawk Wang
# Description: 
#     This script is for the course project of "Getting and Cleaning Data"
#     Please read https://class.coursera.org/getdata-012/human_grading
#     for detail. 
###########################################################################

# Read train data X and train data y, note: it is better to only read the mean and standard deviation for X
# Replace y data to its descriptive activity names
trainDataX<-read.table('./UCI_HAR_Dataset/train/X_train.txt', header=F)
trainData_Subject<-read.table('./UCI_HAR_Dataset/train/subject_train.txt', header=F)
trainDataY<-read.table('./UCI_HAR_Dataset/train/y_train.txt', header=F)
trainData <- cbind(trainDataX, trainData_Subject, trainDataY)

# Read test data X and test data y, note: it is better to only read the mean and standard deviation for X
testDataX<-read.table('./UCI_HAR_Dataset/test/X_test.txt', header=F)
testData_Subject<-read.table('./UCI_HAR_Dataset/test/subject_test.txt', header=F)
testDataY<-read.table('./UCI_HAR_Dataset/test/y_test.txt', header=F)
testData <- cbind(testDataX, testData_Subject, testDataY)

# Combine train data and test data
totalData <- rbind(trainData, testData)

# Read in featureNames and set the column names for totalData
featureNames<-read.table('./UCI_HAR_Dataset/features.txt', header=F)
featureNames<-featureNames$V2
featureNames<-c(as.character(featureNames),'SubjectID', 'ActivityLabel')
colnames(totalData)<-featureNames

# Search mean and std columns in featureNames
allMeanCols<-grep(featureNames, pattern='mean')
allStdCols<-grep(featureNames, pattern='std')

# Subset the needed columns from totalData
newData<-cbind(totalData[,allMeanCols], totalData[,allStdCols], totalData$'SubjectID', totalData$'ActivityLabel')
rm(totalData)

# Group the newData by subject id and activity label and compute the mean value of each variable
fnumber <- ncol(newData) - 2
result<-aggregate(x=newData[,1:fnumber], by=list(newData[,fnumber+1], newData[,fnumber+2]), FUN=mean)
rm(newData)

# Now we modify this first column and second colum of the result to make it readable
cn <-colnames(result)
cn[1]<-"SubjectID"
cn[2]<-"ActivityLabel"
colnames(result)<-cn

# Now we replace the activity label from integer number to corresponding characters
# Read in activity labels
actLabels <- read.table('./UCI_HAR_Dataset/activity_labels.txt')
actLabels <- actLabels$V2
actLabels <- actLabels[result$'ActivityLabel']

# Modify the Acitity Label from integer to corresponding string name
result$'ActivityLabel' <- actLabels

# Finally we save the data
write.table(result, 'tidydata.txt', row.names=F)







