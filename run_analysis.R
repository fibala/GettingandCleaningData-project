
library(data.table)

# 1 Merges the training and the test sets to create one data set.

#train
X_train<-read.table("./Dataset/train/X_train.txt")
y_train<-read.table("./Dataset/train/y_train.txt")
subject_train<-read.table("./Dataset/train/subject_train.txt")

#test
X_test<-read.table("./Dataset/test/X_test.txt")
y_test<-read.table("./Dataset/test/y_test.txt")
subject_test<-read.table("./Dataset/test/subject_test.txt")

#bind
X_all<-rbind(X_train,X_test)
y_all<-rbind(y_train,y_test)
subject_all<-rbind(subject_train,subject_test)


# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
features<-read.table("./Dataset/features.txt")
newnames<-as.character(features[,2])
setnames(X_all,names(X_all),newnames)
contain <- grep("mean\\(\\)|std\\(\\)", features[, 2])
X_all1<-X_all[,contain]

# 3 Uses descriptive activity names to name the activities in the data set
activity<-read.table("./Dataset/activity_labels.txt")
y_all1<-activity[y_all$V1,2]

# 4 Appropriately labels the data set with descriptive variable names. 
setnames(subject_all,"V1","subject")
tidydata<-cbind(subject_all, y_all1, X_all1)
setnames(tidydata,"y_all1","activity")
write.table(tidydata,file="tidydata.txt")

# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidymean<-aggregate(tidydata[,3]~subject+activity,data=tidydata,FUN="mean")
for (i in 4:ncol(tidydata)) {
  tidymean[,i]<-aggregate(tidydata[,i]~subject+activity,data=tidydata,FUN="mean")[,3]
}
setnames(tidymean,names(tidymean),names(tidydata))
write.table(tidymean,file="tidymean.txt")



