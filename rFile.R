getwd()

######################################################
#################### Q1 ##############################
crime_data <- read.csv("london-crime-data.csv")
str(crime_data)

crime_data[1:15, ]
?paste

crime_data$date <- paste("1/", crime_data$month, "/", crime_data$year)

crime_data$date <- as.Date(crime_data$date, "%d/ %m / %Y")

class(crime_data$date)


######################################################
##################### Q2 #############################

names(crime_data)[2] <- "Borough"
names(crime_data)[3] <- "MajorCategory"
names(crime_data)[4] <- "SubCategory"
names(crime_data)[5] <- "Value"
names(crime_data)[8] <- "CrimeDate"
str(crime_data)

london_crime <- crime_data[, c(2:5, 8)]
str(london_crime)

#######################################################
######################## Q3 ###########################

# already done from Q1
# see line 13
class(crime_data$CrimeDate)


#######################################################
######################## Q4 ###########################

summary(london_crime$Borough)
london_crime[1:15, ]
plot.new()
crime_bourough <- table(london_crime$Borough)
barplot(crime_bourough, main = "Bar plot of Crimes by Borough", xlab = "Bourough", 
        ylab = "Crime Rate", horiz = FALSE)



# Croydon has the highest crime rate
# City of London has the lowest crime rate

#######################################################
####################### Q5 ############################

plot.new()
crime_mcat <- table(london_crime$MajorCategory)
crime_mcat
pie(crime_mcat)

# Theft and handeling has the heightest level of crime
# Sexual offences has the lowest level of crime

########################################################
####################### Q6 #############################

crime_data$Region[crime_data$Borough == "Barking and Dagenham"] <- "East"
crime_data$Region[crime_data$Borough == "Bexley"] <- "East"
crime_data$Region[crime_data$Borough == "Greenwich"] <- "East"
crime_data$Region[crime_data$Borough == "Havering"] <- "East"
crime_data$Region[crime_data$Borough == "Kingston upon Thames"] <- "East"
crime_data$Region[crime_data$Borough == "Newham"] <- "East"
crime_data$Region[crime_data$Borough == "Redbridge"] <- "East"
crime_data$Region[crime_data$Borough == "Wandsworth"] <- "East"

crime_data$Region[crime_data$Borough == "Barnet"] <- "North"
crime_data$Region[crime_data$Borough == "Camden"] <- "North"
crime_data$Region[crime_data$Borough == "Enfield"] <- "North"
crime_data$Region[crime_data$Borough == "Hackney"] <- "North"
crime_data$Region[crime_data$Borough == "Haringey"] <- "North"

crime_data$Region[crime_data$Borough == "Brent"] <- "West"
crime_data$Region[crime_data$Borough == "Ealing"] <- "West"
crime_data$Region[crime_data$Borough == "Hammersmith and Fulham"] <- "West"
crime_data$Region[crime_data$Borough == "Harrow"] <- "West"
crime_data$Region[crime_data$Borough == "Hillingdon"] <- "West"
crime_data$Region[crime_data$Borough == "Hounslow"] <- "West"
crime_data$Region[crime_data$Borough == "Richmond upon Thames"] <- "West"

crime_data$Region[crime_data$Borough == "Bromley"] <- "South"
crime_data$Region[crime_data$Borough == "Croydon"] <- "South"
crime_data$Region[crime_data$Borough == "Merton"] <- "South"
crime_data$Region[crime_data$Borough == "Sutton"] <- "South"

crime_data$Region[crime_data$Borough == "Islington"] <- "Central"
crime_data$Region[crime_data$Borough == "Kensington and Chelsea"] <- "Central"
crime_data$Region[crime_data$Borough == "Lambeth"] <- "Central"
crime_data$Region[crime_data$Borough == "Lewisham"] <- "Central"
crime_data$Region[crime_data$Borough == "Southwark"] <- "Central"
crime_data$Region[crime_data$Borough == "Tower Hamlets"] <- "Central"
crime_data$Region[crime_data$Borough == "Waltham Forest"] <- "Central"
crime_data$Region[crime_data$Borough == "Westminster"] <- "Central"

str(crime_data)
# check for NAs
missing_values <- as.data.frame(abs(is.na(crime_data$Region)))
sum(missing_values)

# replace NAs with south
crime_data$Region[is.na(crime_data$Region)] <- "South"

# check again for NAs
missing_values <- as.data.frame(abs(is.na(crime_data$Region)))
sum(missing_values)

####################################################################
####################### Q7 #########################################
crime_rate <- table(crime_data$Region)
plot(crime_rate, type = "b", main = "Bar plot of Crimes by Region", xlab = "Region", 
        ylab = "Crime Rate", lty = 2, pch = 17, col = "blue" )

crime_rate

# Central has the highest crime rate with 28505
# South has the lowest number of crimes with 15573


#####################################################################
########################## Q8 ########################################

highest_crimes <- subset(crime_data, Region == "Central" | Region == "East" | Region == "West")
lowest_crimes <- subset(crime_data, Region == "North" | Region == "South")
crime_data

######################################################################
########################### Q10 ######################################

write.csv(crime_data, "london-crime-modified.csv")
write.csv(london_crime, "london-crime-modified2.csv")


