#importing required libraries 

library(tidyverse)
library(data.table)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)



## --------------- Extracting main details (required) from the dataset using pipe operator ---------
## >> TAKING ONLY THOSE DETIALS WHICH WOULD BE REQUIRED FOR THE ANALYSIS ---------------
## programme, applicant name, category , ug and pg detials are taken from the dataset


required_details <- data %>% 
  select(NAME.OF.THE.APPLICANT,PROGRAMME.NAME, CATEGORY,,MARITAL.STATUS,
         GENDER, EMAIL ,FAMILY.INCOME, UG.COURSE.NAME, 
         DOB.YEAR, AGE..AS.REFERENCED.,UG.PASSING.YEAR,
         HOSTEL.REQUIRED  ,XII.PERCENTAGE ,XII.PASSING.YEAR
         ,PINCODE ,PERMANENT.ADDRESS.LINE.1 ,PERMANENT.ADDRESS.LINE.2 ,
         COUNTRY,STATE , Are.you.Citizen.of.India. ,MINORITY ,RELIGION,
         ,PLACE.OF.BIRTH..COUNTRY. ,PLACE.OF.BIRTH..STATE., ,MOBILE,
         , UG.QUALIFICATION.STATUS,
         UG.PERCENTAGE, UG.total.attempt, UG.SUBJECT.COMBINATION,
         PG.COURSE.NAME,PG.Year.of.Passing.Appeared.Appearing.final.exam,
         , PG.QUALIFICATION.STATUS, PG.PERCENTAGE,
         PG.total.attempt, PG.SUBJECT.COMBINATION)


# view in the table format

view(required_details)

# ----------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------
# data separation

any(is.na(required_details$UG.PERCENTAGE))

any(is.na(required_details$UG.PERCENTAGE))

## who applied for UG OR other Ocational training programme or diploma 

not_ug_done <- required_details %>%
  filter(is.na(UG.PERCENTAGE))


dim(not_ug_done)

summary(not_ug_done)





remove(not_ug_percentage)

#----------------------------------------------------- 12th details 

twelth <- sort(table(required_details$XII.PERCENTAGE), decreasing = TRUE)

barplot(twelth[1:10] )

summary(required_details$XII.PERCENTAGE)

any(is.na(required_details$XII.PASSING.YEAR))

# there is no na vlaues in xii 

programme <- as.data.frame(sort(table(required_details$PROGRAMME.NAME), decreasing = TRUE)[1:10])

colnames(programme) <- c('programme Name','Enrolled Students')



#======================================= VISUALIZATION ==========================

# Correlation Between XII Marks and UG/PG Percentage

dataset <- required_details

cor(dataset$XII.PERCENTAGE, dataset$UG.PERCENTAGE, use = "complete.obs")
cor(dataset$UG.PERCENTAGE, dataset$PG.PERCENTAGE, use = "complete.obs")



ggplot(data, aes(x = XII.PERCENTAGE, y = UG.PERCENTAGE)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "XII Marks vs UG Percentage", x = "XII Percentage", y = "UG Percentage")






#=========================================
programme <- sort(table(required_details$PROGRAMME.NAME) , decreasing = TRUE)[1:10]

programme <- as.data.frame((programme))

colnames(programme) <- c('programmes' , 'enrolled students ')


view(programme)



ggplot(programme, aes(x = `programmes` , y = `enrolled students `, fill = as.factor(`enrolled students `))) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Count of Students Across Programs (Horizontal Bar Plot)",
       x = "Program Name", y = "Number of Students", fill = "Students Count")

















