planData<- read.csv('/home/praneeth/Downloads/insurance_marketplace_dataset/PlanAttributes.csv', header = T, sep= ',', stringsAsFactors = F)
RateData<- read.csv('/home/praneeth/Downloads/insurance_marketplace_dataset/Rate.csv', header = T, sep= ',', stringsAsFactors = F)


IndividualOption <- subset(RateData, (RateData$Age != "Family Option" & RateData$IndividualRate < "9000"),
                           select = c(BusinessYear:IndividualTobaccoRate))


benefit <- subset(planData, select = names(planData)[c(115,104,162,166,170)])
benefit$PlanId <- substr(benefit$PlanId, 1, 14)
IndividualOption$PlanId <- as.character(IndividualOption$PlanId)


planData$TEHBInnTier1IndividualMOOP <- gsub(",", "", planData$TEHBInnTier1IndividualMOOP)
planData$TEHBInnTier1IndividualMOOP <- gsub("\\$", "", planData$TEHBInnTier1IndividualMOOP)
planData$TEHBInnTier1IndividualMOOP <- as.numeric(planData$TEHBInnTier1IndividualMOOP)
planData$TEHBInnTier2IndividualMOOP <- gsub(",", "", planData$TEHBInnTier2IndividualMOOP)
planData$TEHBInnTier2IndividualMOOP <- gsub("\\$", "", planData$TEHBInnTier2IndividualMOOP)
planData$TEHBInnTier2IndividualMOOP <- as.numeric(planData$TEHBInnTier2IndividualMOOP)
planData$TEHBOutOfNetIndividualMOOP <- gsub(",", "", planData$TEHBOutOfNetIndividualMOOP)
planData$TEHBOutOfNetIndividualMOOP <- gsub("\\$", "", planData$TEHBOutOfNetIndividualMOOP)
planData$TEHBOutOfNetIndividualMOOP <- as.numeric(planData$TEHBOutOfNetIndividualMOOP)


#Write the frame to a new csv file.
write.csv(IndividualOption, file = "/home/praneeth/Downloads/insurance_marketplace_dataset/CleanData/Analysis4/IndividualOption.csv",row.names=TRUE)
write.csv(benefit, file = "/home/praneeth/Downloads/insurance_marketplace_dataset/CleanData/Analysis4/benefit.csv",row.names=TRUE)