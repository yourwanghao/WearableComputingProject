# WearableComputingProject
This is a project for wearable computing. The initial purpose is to complete my course project of "Getting and Cleaning Data". 

# Description:
Please see https://class.coursera.org/getdata-012/human_grading for detail

# Pre-request:
To run this script successfully, you should download the raw data from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
And unzip it to a directory UCI_HAR_Dataset in the same level of this script

# Input:
* ./UCI_HAR_Dataset/train/X_train.txt
* ./UCI_HAR_Dataset/train/subject_train.txt
* ./UCI_HAR_Dataset/train/y_train.txt 
* ./UCI_HAR_Dataset/test/X_test.txt
* ./UCI_HAR_Dataset/test/subject_test.txt
* ./UCI_HAR_Dataset/test/y_test.txt 
* ./UCI_HAR_Dataset/features.txt
* ./UCI_HAR_Dataset/activity_labels.txt

# Output: (The request tidy data)
* ./testfile.txt

# Codebook:
There is a codebook with description of the fields of the output tidy data, please see codebook.md file for detail

# Processing steps
1. Read train data and test data seperatly using read.table
1. Read subject id for train data and test data also
1. Combind test data and train data to totalData
1. Then read the feature names from features.txt, and set them to the colnames of totalData. Note: we also add the colnames for subject id and activity label
1. Now use grep function to search all the columns that match "mean" and "std" pattern. So that we can subset only these new columns from totalData to form newData
1. Now we use aggregate function to group the newData by subject id and activity label
1. The result of above step doesn't have clear column name for subject id and activity label, so we make them more clear
1. Finaly we use write.table to save te output tidy data as "testfile.txt", with row.names=F

# Reference
* https://class.coursera.org/getdata-012/forum/thread?thread_id=9
* https://class.coursera.org/getdata-012/forum/thread?thread_id=234




