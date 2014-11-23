Assessments /Getting and Cleaning Data Course Project
==========
The file describing how the script works.  
*The data obtained from:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
the data for the project:   
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
*steps:  
1. import library data.table  
2. the files are stored in directory named Dataset. Get X_train,y_train,subject_train from directory ./Dataset/train, and then get test data respectively.  
3. use rbind to merge the training and the test sets, and  create one data set.  
4. read features from "./Dataset/features.txt"  
5. use setnames from data.table to set names of the dataset X_all  
6. use grep to get columns which names contain "mean" and "std"  
7. extract these columns and saved in X_all1  
8. read descriptive activity names from "./Dataset/activity_labels.txt", and use it to change y_all, and saved as y_all1.  
9. get the tidydata needed, and change their names appropirately.  
10. save tidydata to tidydata.txt  
11. use aggregate to get a new tidy data set with the average of each variable for each activity and each subject, name it tidymean  
12. save tidymean to tidymean.txt  


