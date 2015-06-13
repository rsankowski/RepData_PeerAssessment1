## 1. Loading and preprocessing the data
        ifelse(!dir.exists("~/data/RepData_PeerAssessment1/"), dir.create("~/data/RepData_PeerAssessment1/"), FALSE)
        setwd("./data/RepData_PeerAssessment1/")
        url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
        download.file(url,destfile="./data1.zip", method = "curl")
        
        ##unzip and read data
        data1 <- unzip ("data1.zip", exdir = "./")
        dir()
        data <- read.csv(data1, header = T, stringsAsFactors = FALSE)
        head(data)
        str(data)

## 2. What is mean total number of steps taken per day?
library(plyr)
library(dplyr)

        ##summarize by date and take mean step count
        step <- data %>%  group_by(date) %>% summarize(sum(steps, na.rm = TRUE))
        par(mfrow = c(1,1))
        
        ##Plot the total steps in histogram
        hist(step$sum, main = "Total steps per day")
        
        ## Summary statistics of steps 
        summary(step$sum)


##
stepmean <- step %>% mutate(mea = mean(sum)) %>% mutate(med = median(sum))
step_median <- step %>%  group_by(date) %>% summarize(median(steps, na.rm = TRUE))

str(step_median)
##plot coal related Emissions 

plot(em, pch=20, main = "Baltimore - Median Emissions from Motor Vehicles")
lines(em$year, em$median)


