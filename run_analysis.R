setwd("D:/TAF/JOHNS HOPKINS DATA SCIENCE SPECIALIZATION/3. GETTING AND CLEANING DATA/Course project")

## RECUPERATION DES FICHIERS
url = "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./file.zip", method = "auto")
unzip("./file.zip") 

## CREATION DU FICHIER TEST
setwd("D:/TAF/JOHNS HOPKINS DATA SCIENCE SPECIALIZATION/3. GETTING AND CLEANING DATA/Course project/UCI HAR Dataset/test")
t2 <- read.table("X_test.txt", sep="")
t3 <- read.table("y_test.txt", sep="\t")
t4 <- read.table("subject_test.txt", sep="\t")
t_tot <- cbind(t2, t3, t4)

## CREATION DU FICHIER TRAINING
setwd("D:/TAF/JOHNS HOPKINS DATA SCIENCE SPECIALIZATION/3. GETTING AND CLEANING DATA/Course project/UCI HAR Dataset/train")
tr2 <- read.table("X_train.txt", sep="")
tr3 <- read.table("y_train.txt", sep="\t")
tr4 <- read.table("subject_train.txt", sep="\t")
tr_tot <- cbind(tr2, tr3, tr4)

## 1. MERGING FILES
data <- rbind(t_tot, tr_tot)
setwd("D:/TAF/JOHNS HOPKINS DATA SCIENCE SPECIALIZATION/3. GETTING AND CLEANING DATA/Course project/UCI HAR Dataset")
names <- read.table("features.txt", sep="", stringsAsFactors=FALSE)
colnames(data) <- c(names[,2],"Activity","Subject")

## 2. SELECT ONLY MEAN AND STANDARD DEVIATION VARIABLES
data <- data[, grep("mean()|std|Subject|Activity",names(data))]
data <- data[, -grep("meanFreq()",names(data))]

## 3. NAME ACTIVITIES IN THE DATASET
data$ActivityName <- "Activity"
data$ActivityName[data$Activity == 1] <- "WALKING"
data$ActivityName[data$Activity == 2] <- "WALKING_UPSTAIRS"
data$ActivityName[data$Activity == 3] <- "WALKING_DOWNSTAIRS"
data$ActivityName[data$Activity == 4] <- "SITTING"
data$ActivityName[data$Activity == 5] <- "STANDING"
data$ActivityName[data$Activity == 6] <- "LAYING"

## 4. LABEL VARIABLES
names(data) <- gsub(" ","",names(data))
names(data) <- gsub("-","",names(data))
names(data) <- gsub("\\()","",names(data))
names(data) <- gsub("mean","Mean",names(data))
names(data) <- gsub("std","Std",names(data))
## names(data) <- tolower(names(data))

## 5. CREATION OF A NEW DATASET
aggregate(tBodyAccMeanX~Activity+Subject, data, mean)
## tapply( X = data$tBodyAccMeanX, 
##         INDEX = list(data$activity,data$subject), 
##         FUN = mean )
data5 <- ddply(data, .(ActivityName, Subject), numcolwise(mean)) 

write.table(data5, file = "data5.txt", row.names = FALSE)
