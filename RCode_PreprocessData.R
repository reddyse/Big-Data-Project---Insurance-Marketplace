#R code to clean the code

#Load the data into a csv file
MyData <- read.csv(file="/home/praneeth/Downloads/insurance_marketplace_dataset/BenefitsCostSharing.csv", header=TRUE, sep=",")

#check for the columns if they have any NA values
apply(MyData, 2, function(x) any(is.na(x)))

#Fix the columns that has the NA values
MyData$LimitQty[is.na(MyData$LimitQty)]<-0


#Removed the coloumn 24 as it contained NA values and it was unwanted.
MyData <- MyData[-24]

#check for the columns if they have any NA values
apply(MyData, 2, function(x) any(is.na(x)))


#Write the frame to a new csv file.
write.csv(MyData, file = "/home/praneeth/Downloads/insurance_marketplace_dataset/BenefitsCostSharing_Clean.csv",row.names=TRUE)