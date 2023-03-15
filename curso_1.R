# NXN 13/03/2022
# Estadistica descriptiva
mean(c(2, 3))
mean(2:10) 
sd(c(2,3))
sd(2:3)
metallica <- c("Lars", "James", "Jason", "Kirk")
metallica2 <- metallica[metallica!='Jason']
soda <- c('cerati', 'zeta', 'charly')
soda[1]
sodaAge <- c(22, 23, 25)
sodaColor <- c("blue", "white", "yellow")
# naming columns in data frame
sodaDataFrame <- data.frame(Name = soda, Age = sodaAge, Color = sodaColor)
sodaDataFrame
str(sodaDataFrame)
# Can use the NULL method to remove any object from the frame
sodaDataFrame$Color <- NULL
sodaDataFrame
#add a new object using $ method
sodaDataFrame$childAge <- c(2, 1, 3)
sodaDataFrame
# Do a large scale calculation and put it in a new col
sodaDataFrame$ChildBirthAge <- sodaDataFrame$Age - sodaDataFrame$childAge
sodaDataFrame
# Using the rep() method
rep(10, 10)
# Vamos a crear un base de datos sobre el nombre, la fecha de nacimiento
# y el trabajo de distintas personas. Para que R identifique los números
# como fechas usamos la función as.Date (por defecto el formato es yyyy-mm-dd)
name <- c("Ben", "Martin", "Andy", "Paul", "Graham",
          "Carina", "Karina", "Doug", "Mark", "Zoe")
name
birth_date <- as.Date(c("1977-07-03", "1969-05-24", "1973-06-21",
                        "1970-07-16", "1949-10-10", "1983-11-05",
                        "1987-10-08", "1989-09-16", "1973-05-20",
                        "1984-11-12"))
birth_date
# que es el equivalente a: job <- c(1,1,1,1,1,2,2,2,2,2)
job <- c(rep(1, 5), rep(2, 5))
job
job <- factor(job, levels = (1:2), labels = c("lecturer", "student"))
job
# now R will display the labels 'lecturer' and 'student', however
# if you ask R for the class of the data, it will say INT
typeof(job)
# Now put all data in a frame
jobAndBirth <- data.frame(name, birth_date, job)
jobAndBirth
# 3.6 importing data
# get your current directory
getwd()
# can also set a directory with setwd()
setwd("/home/nick/utalca/estadistica_con_R/data")
getwd()
# now lets get data file
dat <- read.delim(file = "facebook_friends_1.txt")
dat
colnames(dat) <- c('friends')
dat
dat2 <- read.csv("facebook_friends_1.csv", header = FALSE)
dat2
# 3.7
# Uno de los aspectos fundamentales de esta manipulación es la selección 
# de datos. Primero, importemos alguna base de datos.
lectData <- read.csv('lecturer_data.csv')
lectData
lectData$job <- factor(lectData$job,
                      levels = c(1:2),
                      labels = c('Lecturer', 'Student'))
lectData
onlyLecturer <- lectData[lectData$job == 'Lecturer',]
# the comma is required after lecturer
onlyLecturer
LecturersThatDrinkLeast <- onlyLecturer[onlyLecturer$alcohol <= 15,]
LecturersThatDrinkLeast
# 3.8 Transform data
satisfactionData <- read.csv("Honeymoon_Period.csv")
head(satisfactionData)

# Esta data frame la podemos a transformar a un formato long usando
# la función stack.
satisfy_Stacked <- stack(satisfactionData,
                         select = c("Satisfaction_Base",
                                    "Satisfaction_6_Months",
                                    "Satisfaction_12_Months",
                                    "Satisfaction_18_Months"))
colnames(satisfy_Stacked) <- c("Values", "SatisfType")
# cambiamos los encabezados
head(satisfy_Stacked)

# Otra manera de transformar datos a formato long es usando
# la función melt. Para ello necesitamos cargar la librería reshape.
library(reshape)

restructData <- melt(satisfactionData,
                     id = c("Person", "Gender"),
                     measured = c("Satisfaction_Base",
                                  "Satisfaction_6_Months",
                                  "Satisfaction_12_Months",
                                  "Satisfaction_18_Months"))
colnames(restructData)[3:4] <- c("SatisfType", "Values") #Change labels

head(restructData)
# Use the order() method to reorder data
orderedData <- restructData[order(restructData$Person),]
orderedData

# Convert back to wide format data using cast method
# newData <- cast(longData, variables_coded_within_a_single_column
# ~ variables_coded_across_many_columns, value = "outcome_variable")

wideData <- cast(restructData, Person + Gender ~ SatisfType, value = "Values")
head(wideData)

# 3.9 Exporting Data
write.table(LecturersThatDrinkLeast, "datos_exportados.txt", sep = "\t")

# 3.10 Pactice
library(ggplot2)
latidos <- read.csv("latidos_cardiacos.csv", header = TRUE)
latidos
mean(latidos$latidos)
sd(latidos$latidos)

h1 <- ggplot(latidos, aes(latidos))
h1 + geom_histogram()
