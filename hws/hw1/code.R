#setwd("~/University/statistical-learning/hws/hw1") #set working directory

#install.packages("tidyverse")
#install.packages("GGally")

#libraries
library(tidyverse)
library(GGally)

#1
carseats = read_delim("Carseats_mod.csv", delim=",", na = c(".", "NA"))

#2
summary(carseats)

#3
carseats2 <- na.omit(carseats)
summary(carseats2)

#4
carseats2 %>%
  select(Sales, Price:US) %>%
  ggpairs()

#5
levels(as.factor(carseats2$US))

carseats2 <- carseats2 %>%
  mutate(US = if_else(US == "yes", "Yes", US))

levels(as.factor(carseats2$US))

#6
carseats2 %>%
  group_by(Urban, ShelveLoc) %>%
  summarize(MeanSales = mean(Sales))

#7
ggplot(carseats2, aes(Price, Sales, color = ShelveLoc)) +
  geom_point()
