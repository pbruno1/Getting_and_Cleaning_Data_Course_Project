## First step to merging the data is reading the data into R. 
## In order to ensure the data is read properly while using this script 
## all the files must be in the current working directory

## Reading in the test and train data, each table is its own table currently
features<-read.table("features.txt",header=FALSE)
xtest<-read.table("X_test.txt",header=FALSE)
xtrain<-read.table("X_train.txt",header=FALSE)
ytest<-read.table("Y_test.txt",header=FALSE)
ytrain<-read.table("Y_train.txt",header=FALSE)
activitytype<-read.table("activity_labels.txt",header=FALSE)
subjecttest<-read.table("subject_test.txt",header=FALSE)
subjecttrain<-read.table("subject_train.txt",header=FALSE)

## Now that the data has been read in, headers are given to the appropriate
## columns in order to keep track of the data
colnames(activitytype)  <- c('activityid','activitytype')
colnames(subjecttrain)  <- "subjectid"
colnames(xtrain)        <- features[,2]
colnames(ytrain)        <- "activityid"
colnames(subjecttest) <- "subjectid"
colnames(xtest)       <- features[,2]
colnames(ytest)       <- "activityid"

## Now we merge the test and train data to their own specific sets
mergedtrain<-cbind(ytrain,subjecttrain,xtrain)
mergedtest<-cbind(ytest,subjecttest,xtest)

## Then merge the completed sets together
merged<-rbind(mergedtrain,mergedtest)

## Now set a logical check to find the mean and standard deviation columns
## That will be used to find those specific columns we're interested in
name<-colnames(merged)
findnames <- (grepl("activity..",name) | grepl("subject..",name) | 
                grepl("-mean..",name) & !grepl("-meanFreq..",name) 
              & !grepl("mean..-",name) | grepl("-std..",name) 
              & !grepl("-std()..-",name))

## Now setting things to only keep the columns we want
moremerge<-merged[findnames==TRUE]

## Merge the moremerge set with the acitivitytype table to include descriptive activity names
moremerge <- merge(moremerge,activitytype,by='activityid',all.x=TRUE)

## Updating the colNames vector to include the new column names after merge
name  <- colnames(moremerge); 

 

## Cleaning up the variable names using a for loop to run each check along the entire set
## this check will clean up upper/lowercase letters and give more detail on abbreviations
for (i in 1:length(name)) 
{
  name[i] <- gsub("\\()","",name[i])
  name[i] <- gsub("-std$","StdDev",name[i])
  name[i] <- gsub("-mean","Mean",name[i])
  name[i] <- gsub("^(t)","time",name[i])
  name[i] <- gsub("^(f)","freq",name[i])
  name[i] <- gsub("([Gg]ravity)","Gravity",name[i])
  name[i] <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",name[i])
  name[i] <- gsub("[Gg]yro","Gyro",name[i])
  name[i] <- gsub("AccMag","AccMagnitude",name[i])
  name[i] <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",name[i])
  name[i] <- gsub("JerkMag","JerkMagnitude",name[i])
  name[i] <- gsub("GyroMag","GyroMagnitude",name[i])
}
## Reassigning the new descriptive column names to the finalData set
colnames(moremerge) <- name

## Creating a second, independent tidy data set with the average of each variable 
## for each activity and each subject. 
## Create a new table, mergednoactivity without the activitytype column
mergednoactivity  <- moremerge[,names(moremerge) != 'activityType']

## Summarizing the finalDataNoActivityType table to include just the mean of each 
## variable for each activity and each subject
tidydata<- aggregate(mergednoactivity[,names(mergednoactivity)
                                      != c('activityid','subjectid')],
                     by=list(activityid=mergednoactivity$activityid,
                             subjectid = mergednoactivity$subjectid),mean)

## Merging the tidyData with activityType to include descriptive acitvity names
tidydata<- merge(tidydata,activitytype,by='activityid',all.x=TRUE)

## Export the tidy data set 
write.table(tidydata, './tidyData.txt',row.names=TRUE,sep='\t')
