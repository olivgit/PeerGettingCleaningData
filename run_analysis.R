# Checking for the dataset presence
# if not, let's download/unzip it
if(!file.exists('UCI HAR Dataset')){
  if (!file.exists('Dataset.zip')){
    fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="Dataset.zip",method="curl")
  }
  unzip('Dataset.zip')
}

# Reading the dataset into data frames
sub_test<-read.table('UCI HAR Dataset/test/subject_test.txt',sep="")
x_test<-read.table('UCI HAR Dataset/test/X_test.txt',sep="")
y_test<-read.table('UCI HAR Dataset/test/y_test.txt',sep="")
sub_train<-read.table('UCI HAR Dataset/train/subject_train.txt',sep="")
x_train<-read.table('UCI HAR Dataset/train/X_train.txt',sep="")
y_train<-read.table('UCI HAR Dataset/train/y_train.txt',sep="")
features <- read.table('UCI HAR Dataset/features.txt')

# Q1: Merging the dataset
x<-rbind(x_test,x_train)
# Q4 : Label the data set with descriptive variable names (coming from features.txt)
names(x) <- features[,2]
y<-rbind(y_test,y_train)
sub<-rbind(sub_test,sub_train)
data_set <- cbind(sub,y,x)

# Q2 : Extracting the mean and standard deviation
mean_std <- cbind(data_set[,1],data_set[,2],data_set[,grep("mean|std|Mean",colnames(data_set))])
names(mean_std)[1:2] <- c("SUBJECT","ACTIVITY")

#Q3 : Refactoring the activity names
mean_std$ACTIVITY<-as.factor(mean_std$ACTIVITY)
levels(mean_std$ACTIVITY)<- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

# Q5:Getting the tidy data set
library(reshape2)
m_s_melt<-melt(mean_std,id=c("SUBJECT","ACTIVITY"))
tidy_wide_mean_per_sub_act<-dcast(m_s_melt,SUBJECT+ACTIVITY~variable,mean)

#Create .txt file for uploading
write.table(tidy_wide_mean_per_sub_act,file="tidy_data_set_om.txt",row.name=FALSE)



