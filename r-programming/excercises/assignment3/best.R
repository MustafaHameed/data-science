best <- function(state, outcome) {
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
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        col <- if(outcome == "heart attack") {
                11
        } else if(outcome == "heart failure") {
                17
        } else {
                23
        }
        filter <- data["State"] == state
        fData <- data[filter,]
        fData[, col] <- as.numeric(fData[, col])
        with(fData, Hospital.Name[which.min(fData[, col])])
}

#test
#best("TX", "heart attack")
#[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
#best("TX", "heart failure")
#[1] "FORT DUNCAN MEDICAL CENTER"
#best("MD", "heart attack")
#[1] "JOHNS HOPKINS HOSPITAL, THE"
#best("MD", "pneumonia")
#[1] "GREATER BALTIMORE MEDICAL CENTER"
#best("BB", "heart attack")
#Error in best("BB", "heart attack") : invalid state
#best("NY", "hert attack")
#Error in best("NY", "hert attack") : invalid outcome