#Loading the required Packages
install.packages("caTools")
library("caTools")
library(readxl)

#Setting the working directory
setwd("D:/GRIP")

#Importing the Data
studentsData <- read_xlsx("StudentGradesandScores.xlsx")

#Check if data is imported correct
View(studentsData)
str(studentsData)
head(studentsData)
tail(studentsData)

#Split the data into Training and Testing 
split = sample.split(studentsData$Hours,SplitRatio = 0.7)
split
trainingSet <- subset(studentsData, split == TRUE)
testSet <- subset(studentsData, split == FALSE)

#Fitting linear regression to the training set
lm = lm(studentsData$Hours ~ studentsData$Scores, data = trainingSet)
summary(lm)
coef(lm)

plot(studentsData$Hours,studentsData$Scores)
warnings()
yPred <- predict(lm,testSet)
yPred
summary(yPred)
?predict

#Equation : -0.006285579 + (0.097480295) * x

#Score expected for a student who studies for 9.25hrs/day
-0.006285579 + (0.097480295) * 9.25
0.8954071 *100
89.54
