rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", 
                         colClasses = "character")
        ## Check that state and outcome are valid
        if(!(state %in% data$State)) {
                stop('invalid state')
        }
        if(outcome != "heart attack" && outcome != "heart failure" 
           && outcome != "pneumonia") {
                stop('invalid outcome')
        }
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        col <- if(outcome == "heart attack") {
                11
        } else if(outcome == "heart failure") {
                17
        } else {
                23
        }
        filter1 <- data["State"] == state
        data1 <- data[filter1,]       
        data1[, col] <- as.numeric(data1[, col])
        filter2 <- is.na(data1[, col])
        data2 <- data1[!filter2, ]
        sorted <- data2[order(data2[,col], data2[,2]),]
        if (num == "best") {
                sorted[1, 2]
        } else if (num == "worst") {
                sorted[nrow(sorted), 2]
        } else {
                sorted[as.numeric(num), 2]  
        }
}

#test
rankhospital("TX", "heart failure", 4)
#[1] "DETAR HOSPITAL NAVARRO"
rankhospital("MD", "heart attack", "worst")
#[1] "HARFORD MEMORIAL HOSPITAL"
rankhospital("MN", "heart attack", 5000)
#[1] NA