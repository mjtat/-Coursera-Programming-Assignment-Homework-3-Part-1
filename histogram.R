## Read in the data

outcome_dat<-read.csv("outcome-of-care-measures.csv", header = TRUE)

outcome_heartattack <- data.frame(as.double(outcome_dat$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
outcome_heartattack[outcome_heartattack == "Not Available"] <- NA
outcome_heartattack <- outcome_heartattack[complete.cases(outcome_heartattack),]
outcome_heartattack <- data.frame(as.double(outcome_heartattack))
names(outcome_heartattack)<-c("Deaths")

## Let's over achieve and use ggplot2 because the regular plots in R aren't so fancy. Refer to the ggplot2 
## documentation to understand how building plots works.

library(ggplot2)

object <- ggplot(data = outcome_heartattack, aes(x = Deaths))

hist <- geom_histogram(binwidth = 5, colour = "black", fill = "cyan")

axislabs <- labs(title = "Histogram of 30-day death rates due to Heart Attack",  y = "# of Deaths", x = "Deaths (binned)") 

theme <- theme(panel.background = element_rect(colour = "black", fill = "gray97"))

scale_x <- scale_x_continuous(breaks = seq(0, 100, by = 10))

# Put all the ggplot pieces together

histogram<-object + hist + axislabs + theme + scale_x

# Save the plot

ggsave("histogram.png", plot = histogram , width = 8, height = 6)
