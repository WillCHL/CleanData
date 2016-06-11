## Code for the Getting and Cleaning data assignment

# Load dplyr library
library(dplyr)

# Read in activity identifiers
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE,sep=" ")
names(activity_labels)<-c("anum","activity")

# Read in feature identifiers
feature_labels<-read.table("UCI HAR Dataset/features.txt",header=FALSE,sep=" ")
names(feature_labels)<-c("fnum","feature")

#Read test info and dataset
test_subjects<-read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep=" ")
names(test_subjects)<-c("snum")
test_labels<-read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE,sep=" ")
names(test_labels)<-c("anum")
test_set<-read.table("UCI HAR Dataset/test/x_test.txt")
names(test_set)<-feature_labels[,2]

#Read train info and dataset
train_subjects<-read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep=" ")
names(train_subjects)<-c("snum")
train_labels<-read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE,sep=" ")
names(train_labels)<-c("anum")
train_set<-read.table("UCI HAR Dataset/train/x_train.txt")
names(train_set)<-feature_labels[,2]

#Join the test and train datasets and labels
combined<-rbind(test_set,train_set)
subjects<-rbind(test_subjects, train_subjects)
activities<-rbind(test_labels,train_labels)

# Select only mean and standard deviation variables
mean_col<-grep("mean\\(",names(combined))
std_col<-grep("std",names(combined))
select_col<-sort(c(mean_col,std_col))
mean_std<-combined[,select_col]

# Clean up names
#Function to remove the leading t or f
clean_nm<-function(y) {
  if (substr(y, 1, 1) == "t") { y<-paste("Time",substr(y,2,nchar(y)),sep="") }
  if (substr(y, 1, 1) == "f") { y<-paste("Freq",substr(y,2,nchar(y)),sep="") }
  y<-sub("\\(\\)","",y)
  }

var_nm<-names(mean_std)
names(mean_std)<-as.character(sapply(var_nm,clean_nm))
#names(mean_std)<-as.character(sub("\\(\\)","",var_nm))

# Convert the activity variable and subject number to factors with labels for activities
subjects<-mutate(subjects,snum=as.factor(snum))
activities<-mutate(activities,anum=as.factor(anum))
levels(activities)<-activity_labels[,2]

#aggregate the table on subject and activity using the mean
mean_std_grp<-aggregate(mean_std, by=list(subject=subjects$snum,activity=activities$anum), FUN=mean)
levels(mean_std_grp$activity)<-activity_labels[,2]

#Write out table
write.table(mean_std_grp, file="groupData.txt", row.name=FALSE )

