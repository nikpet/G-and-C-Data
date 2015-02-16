###Getting and Cleaning Data CODEBOOK
This file describes the procedure done to clean the data originally obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* read train data from:
** data/train/X_train.txt
** data/train/y_train.txt
** data/train/subject_train.txt
* read test data from:
** data/test/X_test.txt
** data/test/y_test.txt
** data/test/subject_test.txt
* combine the sets, labels and subjects
* read the column labels from data/features.txt
* set the dataset colum names
* extract the measurements on mean and std 
* replace the activity ids with the activity names and make them a factor
* change the names of the columns with a more descriptive ones
* extract the average of each variable for each activity and each subject and save it in tydydata.txt