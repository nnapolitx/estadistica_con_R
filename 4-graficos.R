# Class 02- Chapter 4 on the website
# notes on class
getwd()
setwd("/home/nick/utalca/estadistica_con_R/data")
# common libraries for working with graphics and plots
library(ggplot2)
library(reshape)
library(plyr)
library(Rmisc)
# important ideas when drawing graphics:
# Generally, try to use as little "ink" as possible
# KISS method
# Try not to distortion the data
# using large, coherent data sets
facebook <- read.delim("FacebookNarcissism.dat", header = TRUE)
head(facebook)
# Create a point graph with ggplot
graph <- ggplot(facebook, aes(NPQC_R_Total, Rating))
graph + geom_point()
# add a title to the graph
graph <- ggplot(facebook, aes(NPQC_R_Total, Rating))
graph + geom_point() + labs(title = "Figura 1")
# Change points for triangles
graph + geom_point(shape = 17)
# change size
graph + geom_point(size = 6)

# change colors automatically
graph + geom_point(aes(color = Rating_Type))

# Use jitter to display multiple points over one position
graph + geom_point(aes(color = Rating_Type), position = "jitter")

# Can remove grey background and change the color of the axis line
graph + 
  geom_point(aes(colour = Rating_Type), position = "jitter") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"))

#4.3 - dispersion graphic




