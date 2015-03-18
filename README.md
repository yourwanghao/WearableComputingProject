# WearableComputingProject
This is a project for wearable computing. The initial purpose is to complete my course project of "Getting and Cleaning Data". 

# Description:
Please see https://class.coursera.org/getdata-012/human_grading for detail

# Pre-request:
To run this script successfully, you should download the raw data from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
And unzip it to a directory UCI_HAR_Dataset in the same level of this script

So that the directory tree looks like:

.
├── README.md
├── UCI_HAR_Dataset
│   ├── README.txt
│   ├── activity_labels.txt
│   ├── features.txt
│   ├── features_info.txt
│   ├── test
│   └── train
├── UCI_HAR_Dataset.zip
├── run_analysis.R
└── testfile.txt

# Processing steps
## Read train data and test data seperatly using read.table
## Read subject id for train data and test data also
## Combind test data and train data to totalData




