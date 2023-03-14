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
