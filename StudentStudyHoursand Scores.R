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
trainingSet <- subset(studentsData, split == TRUE)
View(trainingSet)
testSet <- subset(studentsData, split == FALSE)
View(testSet)

#Fitting linear regression to the training set
l_model <- lm(Scores ~ Hours, trainingSet)
summary(l_model)
coef(l_model)

plot(studentsData$Hours,studentsData$Scores)

testSet$yPred <- predict(l_model,testSet)
View(testSet)

newStudent = data.frame(Hours = 9.25)
PredictedValue <- predict(l_model,newStudent)
PredictedValue

#Equation : 2.927549 + (9.6328) * x

#Score expected for a student who studies for 9.25hrs/day
2.927549 + (9.6328) * 9.25
92.03
