#install.packages('data.table')

library(tidyverse)
library(data.table)
library(tidyverse)
library(dplyr)
library(ggplot2)

library(readr)

bamudb <- fread("F:/Data science/Data analysis/bamudb.csv", na.strings = c("", "NA", "\0"))






bamudb <- read_csv('F:/Data science/Data analysis/bamudb.csv')


problems(bamudb) 


bamudb <- read.csv('F:/Data science/Data analysis/bamudb.csv')

phd_all <- read_csv('F:/Data science/Data analysis/filtered/phd_all.csv')

phd_all <- read.csv('F:/Data science/Data analysis/filtered/phd_all.csv')


glimpse(bamudb)

glimpse(phd_all)


glimpse(length(bamudb$GENDER))


print(length(bamudb$GENDER))

nrow(bamudb)
ncol(bamudb)


# R datasets available 
data()


# variable types 
# use glimpse() to check rows and columns other nrow and ncol

glimpse(bamudb)

unique(bamudb$GENDER)

view(group_by(unique(bamudb$GENDER)))

view(unique(bamudb$GENDER))

length(unique(bamudb$GENDER))
bamudb$GENDER1 <- as.factor(bamudb$GENDER)

class(bamudb$GENDER1)

glimpse(bamudb$GENDER1)
view(bamudb$GENDER1)

class(bamudb$PROGRAMME.NAME)


length(unique(bamudb$PROGRAMME.NAME))

bamudb$PROGRAMME.NAME1 <- as.factor(bamudb$PROGRAMME.NAME)


class(bamudb$PROGRAMME.NAME1)


glimpse(bamudb$PROGRAMME.NAME1)

levels(bamudb$PROGRAMME.NAME1)


view(levels(bamudb$PROGRAMME.NAME1))



ggplot(levels(bamudb$PROGRAMME.NAME1, mapping = aes())

       
ggplot(bamudb,aes(x = unique(GENDER1), y = GENDER1)) + 
  geom_bar(fill = 'purple') + 
  labs(title = 'box plto of score ', x = '', y = 'Score')       
       

       
levels(bamudb$PROGRAMME.NAME1)

names(bamudb)

names(bamudb)


view(bamudb %>% 
       select(PROGRAMME.NAME1 ,starts_with('DOCTOR OF PHILOSOPHY'))
)



# Example data
PROGRAMME.NAMES <- data.frame(category = bamudb$PROGRAMME.NAME1)





view(PROGRAMME.NAMES)


programcountes <- table(PROGRAMME.NAMES$category)




############ Creates a categorical Data >>>>>>>>>>>>>>>>>>>>>>>>>>

gender <- data.frame(category = bamudb$GENDER)
# Count occurrences
view(gender$category)
genderCounts <- table(gender$category)
genderCounts <- as.data.frame(genderCounts)
colnames(genderCounts) <- c("Gender","Counts")
#gender count
view(genderCounts)

############ Creates a categorical Data >>>>>>>>>>>>>>>>>>>>>>>>>>


#>>>>>>>>>>>>>>>>>>>>>>>> Plotting the Gender Datta >>>>>>>>>>>>>>>>>>>>>>>
#>
genderCounts <- data.frame(genderCounts)


ggplot(genderCounts, aes(x = Gender, y = Counts))+
  geom_bar(stat = "identity",fill='purple', show.legend = TRUE ) +  
  scale_fill_manual(values=rainbow(nrow(genderCounts))) +
  coord_cartesian() +
  labs(
    title = "Genderwise Enrollment",
    x = "Genders",
    y = "Enrolled Students" 
    ) +
  theme_minimal(base_size = 15) +  # Adjust label size
  theme(axis.text = element_text(size = 12), axis.title = element_text(size = 14))





ggplot(genderCounts, aes(x = Gender, y = Counts, fill = Gender)) +
  geom_bar(stat = "identity", show.legend = TRUE) +                     # Bars with fill aesthetic
  geom_text(aes(label = Counts), vjust = -0.5, size = 4) +             # Add labels at the top of bars
  scale_fill_manual(values = rainbow(nrow(genderCounts))) +            # Apply custom colors
  coord_cartesian() +                                                  # Default Cartesian coordinates
  labs(
    title = "Genderwise Enrollment",
    x = "Genders",
    y = "Enrolled Students"
  ) +
  theme_minimal(base_size = 15) +                                      # Minimal theme with adjusted base size
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14)
  )



#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Relative Frequency >>>>>>>>>>>>>>>>>>>>>>>>>>



# Calculate relative frequency

genderCounts$RelativeFreq <- genderCounts$Counts / sum(genderCounts$Counts) 

view(genderCounts)

summary(genderCounts)

sum(genderCounts$RelativeFreq) 

# Create a pie chart
ggplot(genderCounts, aes(x = "", y = RelativeFreq, fill = Gender)) +
  geom_bar(stat = "identity", width = 1) +                # Bar for pie chart (uses identity stats)
  coord_polar(theta = "y") +                              # Transform to a pie chart
  geom_text(aes(label = scales::percent(RelativeFreq)),   # Add percentage labels
            position = position_stack(vjust = 0.5), 
            size = 4) +
  scale_fill_manual(values = rainbow(nrow(genderCounts))) + # Custom colors
  labs(
    title = "Genderwise Enrollment - Relative Frequency",
    x = NULL,
    y = NULL,
    fill = "Gender"
  ) +
  theme_void() +                                          # Remove axes and background
  theme(
    plot.title = element_text(size = 16, hjust = 0.5)    # Center-align the title
  )


df <- genderCounts

ggplot(df, aes(x = Gender, y = Counts, fill = Gender)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label=Counts),vjust=-0.5,size=4) +
  labs(title = "Gender Distribution", x = "Gender", y = "Count") +
  theme_minimal()
  
df

df_sorted <- df[order(-df$RelativeFreq),]

# Total Count
total_count <- sum(df$Counts)
total_count



df$Percentage <- df$Counts / total_count * 100
print(df)













#>

#>
#>
#>
#>











print(programcountes)
view(programcountes)

programcountes <- data.frame(programcountes)


view(programcountes)

ggplot(programcountes,aes(x=Var1 , y=Freq ))+
  geom_bar(fill = 'purple') + 
  labs(title = 'programes ', x = 'Names of the Programes', y = 'enrolled') 

rlang::last_trace()




# Example data
set.seed(123)
data <- data.frame(
  programme = paste("Programme", 1:167),
  students = sample(1:1000, 167, replace = TRUE)
)

# Summarize top 10 categories
top_programmes <- programcountes %>%
  arrange(desc(Freq)) %>%
  slice(1:10)


top_programmes <- data.frame(top_programmes)



view(top_programmes)

view(top_programmes$Freq)



ggplot(top_programmes,aes(x = Var1 , y= Freq )) + 
  geom_bar(stat = 'identity') +
  labs( title = 'Top 10 programme', x = "Programme Name", y = 'Enrolled')




ggplot(top_programmes, aes(x = reorder(Var1, Freq), y = Freq)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Top 10 Programmes by Enrollment",
    x = "Programmes",
    y = "Number of Students"
  ) +
  theme_minimal()




ggplot(top_programmes, aes(x = reorder(Var1, Freq), y = Freq, fill = Var1)) +
  geom_bar(stat = "identity", show.legend = FALSE) +  # Different colors for bars
  geom_text(aes(label = Freq), hjust = -0.2, size = 4) +  # Add labels to bars
  scale_fill_manual(values = rainbow(nrow(top_programmes))) +  # Unique colors for bars
  coord_flip() +
  labs(
    title = "Top Programmes by Enrollment",
    x = "Programmes",
    y = "Number of Students"
  ) +
  theme_minimal(base_size = 15) +  # Adjust label size
  theme(axis.text = element_text(size = 12), axis.title = element_text(size = 14))


# Plotted a bar graph of top 10 programes and students 

ggplot(top_programmes,aes(x=reorder(Var1,Freq), y=Freq,fill=Var1)) +
  geom_bar(stat = "identity",show.legend = FALSE) + # Different Colors for bars
  geom_text(aes(label = Freq),hjust=0.2,size = 3 ) + 
  scale_fill_manual(values = rainbow(nrow(top_programmes))) +
  coord_flip() +
  labs(
    title = 'Top 10 Programmes',
    x = 'Programmes',
    y = 'Number of Students'
  ) +
  theme_minimal(base_size = 15) +  # Adjust label size
  theme(axis.text = element_text(size = 12), axis.title = element_text(size = 14))






















