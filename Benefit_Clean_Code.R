#R code to clean the code

#Load the data into a csv file
MyData <- read.csv(file="/home/praneeth/Downloads/insurance_marketplace_dataset/CleanData/BenefitsCostSharingClean2.csv", header=TRUE, na.strings=c("","NA"), sep=",")

#check for the columns if they have any NA values
apply(MyData, 2, function(x) any(is.na(x)))

#Fix the columns that has the NA values
MyData$LimitQty[is.na(MyData$LimitQty)]<-9999

#Removed the coloumn 24 as it contained NA values and it was unwanted.
#MyData <- MyData[-1]
#MyData <- MyData[-9]
MyData <- MyData[-10]
#MyData <- MyData[-11]

MyData$CoinsOutofNet <- gsub("$", "", MyData$CoinsOutofNet)
MyData$CoinsInnTier1 <- gsub("$", "", MyData$CoinsInnTier1)

#Write the frame to a new csv file.
write.csv(MyData, file = "/home/praneeth/Downloads/insurance_marketplace_dataset/CleanData/BenefitsCostSharingClean3.csv",row.names=TRUE)
