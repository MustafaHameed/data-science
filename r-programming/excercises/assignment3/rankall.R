rankall <- function(outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", 
                         colClasses = "character")
        ## Check that state and outcome are valid
        if(outcome == "heart attack") {
                col <- 11
        } else if(outcome == "heart failure") {
                col <- 17
        } else if (outcome == "pneumonia") {
                col <- 23
        } else {
                stop('invalid outcome')
        }
        ## For each state, find the hospital of the given rank
        splitted <- split(data, data$State)
        states <- names(splitted)
        hospitals <- character(0)
        for (data1 in splitted) {
                data1[, col] <- as.numeric(data1[, col])
                filter2 <- is.na(data1[, col])
                data2 <- data1[!filter2, ]
                sorted <- data2[order(data2[,col], data2[,2]),]
                if (num == "best") {
                        hospitals <- c(hospitals, sorted[1, 2])
                } else if (num == "worst") {
                        hospitals <- c(hospitals, sorted[nrow(sorted), 2])
                } else {
                        hospitals <- c(hospitals, sorted[as.numeric(num), 2]) 
                }
        }
        ## Return a data frame with the hospital names and the
        ## (abrreviated state name)
        data.frame(hospital=hospitals, state=states, row.names=states)
}

#test
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)