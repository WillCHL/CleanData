## Code for the Getting and Cleaning data assignment

# Load dplyr library
library(dplyr)


# Set working folder
folder1<-"UCI HAR Dataset/"

# Read in activity identifiers
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE,sep=" ")
names(activity_labels)<-c("anum","activity")

# Read in feature identifiers
feature_labels<-read.table("UCI HAR Dataset/features.txt",header=FALSE,sep=" ")
names(feature_labels)<-c("fnum","feature")

#Read test info
test_subjects<-read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep=" ")
names(test_subjects)<-c("snum")
test_labels<-read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE,sep=" ")
names(test_labels)<-c("anum")
test_set<-read.table("UCI HAR Dataset/test/x_test.txt")
#names(test_set)<-feature_labels[,2]
#test_acc_x<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
#b_test_acc_y<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
#b_test_acc_z<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
#b_test_gyro_x<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
#b_test_gyro_y<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
#b_test_gyro_z<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
#t_test_acc_x<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
#t_test_acc_y<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
#t_test_acc_z<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")



test<-cbind(test_subjects,test_labels,test_set)


#Read train info
train_subjects<-read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep=" ")
names(train_subjects)<-c("snum")
train_labels<-read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE,sep=" ")
names(train_labels)<-c("anum")
train_set<-read.table("UCI HAR Dataset/train/x_train.txt")
#names(train_set)<-feature_labels[,2]
#b_train_acc_x<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
#b_train_acc_y<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
#b_train_acc_z<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
#b_train_gyro_x<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
#b_train_gyro_y<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
#b_train_gyro_z<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
#t_train_acc_x<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
#t_train_acc_y<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
#t_train_acc_z<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")



train<-cbind(train_subjects,train_labels,train_set)

combined<-rbind(test,train)

# Select only mean and standard deviation variables
mean_col<-grep("mean",names(combined))
std_col<-grep("std",names(combined))
select_col<-sort(c(1,2,mean_col,std_col))
mean_std<-combined[,select_col]

# Convert the activity variable and subject number to factors
mean_std<-mutate(mean_std,snum=as.factor(snum),anum=as.factor(anum))
levels(mean_std$anum)<-activity_labels[,2]
mean_std<-rename(mean_std, activity = anum)
#mean_std_grp<-group_by(mean_std,snum,activity)
mean_std_grp<-aggregate(mean_std, by=list(mean_std$snum,mean_std$activity), FUN=mean, na.action=na.omit)
#rename variables


#select only relevant columns

