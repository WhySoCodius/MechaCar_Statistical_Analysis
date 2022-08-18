#import dependencies
library(dplyr)                                                   # D1:Step 3

#*******************************************************************************
# Deliverable 1: Linear Regression to Predict MPG
#*******************************************************************************

MechaCar_mpg <-read.csv(file="Resources/MechaCar_mpg.csv")      # D1:Step 4

head(MechaCar_mpg)
# Generate multiple Regression Analysis                         # D1:Step 5
lmObj <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg)
# Summary of the Regression Analysis                            # D1:Step 6
summary(lmObj)


#*******************************************************************************
# Deliverable 2: Create Visualizations for the Trip Analysis
#*******************************************************************************

#import the csv file
suspension_coil <- read.csv(file="Resources/Suspension_Coil.csv")                                                           # D2:Step 2
head(suspension_coil)

#create summary of Mean, Median, Variance, and standard deviation
total_summary <- suspension_coil %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))   # D2:Step 3
head(total_summary)

#Calculate total samples
total_samples  <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarise(number_of_samples = n())
head(total_samples)

#Create Dataframe & group each manufacturing lot by the mean, median, variance, and standard deviation                      # D2:Step 4
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
head(lot_summary)


#*******************************************************************************
# Deliverable 3: T-Tests on Suspension Coils
#*******************************************************************************

# Comparing all lot sample vs the population

t.test(suspension_coil$PSI,mu=1500) 

# One Sample t-Test on 'Lot 1'
suspension_coil_Lot1 <-subset(suspension_coil,Manufacturing_Lot == 'Lot1')
t.test(suspension_coil_Lot1$PSI,mu=1500) 
# One Sample t-Test on 'Lot 2'
suspension_coil_Lot2 <-subset(suspension_coil,Manufacturing_Lot == 'Lot2')
t.test(suspension_coil_Lot2$PSI,mu=1500) 
# One Sample t-Test on 'Lot 3'
suspension_coil_Lot3 <-subset(suspension_coil,Manufacturing_Lot == 'Lot3')
t.test(suspension_coil_Lot3$PSI,mu=1500) 

#*******************************************************************************
# Deliverable 4: Study Design: MechaCar vs Competition
#*******************************************************************************