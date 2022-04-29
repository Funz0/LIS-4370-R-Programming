# Alejandro Cepeda
# Module 4: Programming Structure in R
# 2/5/2022

# libraries
library(ggplot2)

# storing hospital data in data frame
hospital <- data.frame(Freq=c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2),
                            bloodp=c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176),
                            first=c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1),
                            second=c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1),
                            finaldecision=c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1))

# convert decisions to factor variables
hospital[,3:5] <- lapply(hospital[,3:5], as.factor)

# general doctor assessment boxplot
first.boxplot <- boxplot(bloodp~first, hospital,
                         main="General Doctor Assessment",
                         col=c("turquoise", "coral"),
                         xlab="First Decision",
                         ylab("Blood Pressure"),
                         names=c("good","bad")) # good = 0 bad = 1
# external doctor assessment boxplot
second.boxplot <- boxplot(bloodp~second, hospital,
                          main="External Doctor Assessment",
                          col=c("cyan", "orange"),
                          xlab="Second Decision",
                          ylab("Blood Pressure"),
                          names=c("good","bad"))
# final decision boxplot
final.boxplot <- boxplot(bloodp~finaldecision, hospital,
                         main="General Doctor Assessment",
                         col=c("lightblue", "darkred"),
                         xlab="First Decision",
                         ylab("Blood Pressure"),
                         names=c("good","bad"))

# patient blood pressure histogram by hospitsl frequency
hospital.histogram <- hist(hospital$bloodp,
                           main="Patient Blood Pressure by Frequency of Hospital Visits",
                           col=c("maroon"),
                           xlab="Blood Pressure",
                           ylab="Hospital Frequency")

