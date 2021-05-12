std.data <- read.csv("https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv", header = T)
std.data
str(std.data)


##----------- Assigning variables to the column names for accessibility
 
hours <- std.data$Hours
score <- std.data$Scores

##----------- Creating a linear model
lr <- lm(formula = score~hours)
lr

##----------- Plotting 2 variables 

plot(hours,score, main = "Hours vs Score", xlab = "Hours Studied", ylab = "Marks scored")
abline(lr, col = "Red")

##------------ Predicted values

new.hr <- data.frame(hours)
predicted.score <- predict(lr, new.hr)


##------------ Comparing both values
actual.score <- score
act.vs.predict <- data.frame(cbind(actual.score,predicted.score))
is.data.frame(act.vs.predict)

##------------- Predicted Score for a student studying for 9.25 hrs
check <- data.frame(hours=9.25)
predict(lr,check)

install.packages("Metrics")
library(Metrics)

mae(actual.score,predicted.score)


