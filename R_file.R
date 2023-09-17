#Task 1
#Print number of missing and refused values
library(readxl)
project <- read_excel("Survey.xlsx")
for (i in 1: ncol(project)){
  a = as.integer(table(project[i])["Refused"])
  b = as.integer(table(project[i])["NA"])
  
  print(c(i, a, b))
}

#replacing refused with mode for categorical
df <- read_excel("Survey.xlsx")

calc_mode <- function(x){
  
  distinct_values <- unique(x)
  
  distinct_tabulate <- tabulate(match(x, distinct_values))
  
  distinct_values[which.max(distinct_tabulate)]
}

for(i in list(3, 4, 7, 9, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30)){
  dt <- df[, i]
  dt_vec <- unlist(dt)
  df[,i]<-replace(df[,i], (df[,i] == 'Refused' | df[, i] == "NA" | df[, i]=="DK/Refused"), calc_mode(dt_vec))
}

#Task 2
#replacing refused with median for numerical
dt<-df[!(df[, 2]=="Refused" | df[, 2] == "NA"),]
v = c()
for (i in 1: nrow(dt)){
  v <- append(v, as.numeric(dt[i, 2]))
}
median(v)

df[,2]<-replace(df[,2], df[,2] == 'Refused' | df[, 2] == "NA", as.character(median(v)))

dt<-df[!(df[, 8]=="Refused" | df[, 8] == "NA"),]
v = c()
for (i in 1: nrow(dt)){
  v <- append(v, as.numeric(dt[i, 8]))
}
median(v)

df[,8]<-replace(df[,8], df[,8] == 'Refused' | df[, 8] == "NA", as.character(median(v)))

# Statistics of numerical variable "Weight"
df$weight <- as.numeric(df$weight)
min(df$weight)
max(df$weight)
mean(df$weight)
median(df$weight)
sd(df$weight)
IQR(df$weight)
# Statistics of numerical variable "age"
df$age <- as.numeric(df$age)
min(df$age)
max(df$age)
mean(df$age)
median(df$age)
sd(df$age)
IQR(df$age)

#Least and most frequent values in categorical variables
for(i in list(3, 4, 7, 9, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30)){
  a = names(which.min(table(df[, i])))
  b = names(which.max(table(df[, i])))
  
  print(c(i, a, b))
}

# Task 3: Part 1
library(ggplot2)

df <- read_excel("Survey.xlsx")
dt <- df[, c("Q3b")]
table(dt)

dt<-df[df[, 14]=="Moderate" & df[, 15] == "Female" & 
         df$Q3b != "DK/Refused" & df$Q3b != "Both relationships are equally important" 
       & df$Q3b != "VOL: Neither",]

dt$age <- as.numeric(dt$age)
dt1 <- dt[dt[, 8] < 30,]
dt2 <- dt[(dt[, 8] < 50 & dt[, 8] > 29), ]
dt3 <- dt[(dt[, 8] < 65 & dt[, 8] > 49), ]
dt4 <- dt[dt[, 8] > 64 ,]

table(dt1$Q3b)
table(dt2$Q3b)
table(dt3$Q3b)
table(dt4$Q3b)

Relation = c("Having a close relationship to China", "Having a close relationship to Germany", "Having a close relationship to China", "Having a close relationship to Germany", "Having a close relationship to China", "Having a close relationship to Germany", "Having a close relationship to China", "Having a close relationship to Germany")
frequency = c(9, -10, 36, -33, 12, -20, 6, -26)
age = c("18-29", "18-29", "30-49", "30-49", "50-64", "50-64", "65+", "65+")

d <- data.frame(Relation, frequency, age)

ggplot(d, aes(x = age, y = frequency, fill = Relation))+
  geom_bar(stat = "identity")+
  coord_flip()


#Task 4

q1 = df[df$Q5a == 'Yes, as a partner',] 
q2 = df[df$Q5b == 'Yes, as a partner',] 
q3 = df[df$Q5c == 'Yes, as a partner',] 
q4 = df[df$Q5d == 'Yes, as a partner',] 
q5 = df[df$Q5e == 'Yes, as a partner',] 
q6 = df[df$Q5f == 'Yes, as a partner',] 
tot_f = nrow(df[df$sex == 'Female',])
tot_m = nrow(df[df$sex == 'Male',])
table(q1$sex)
table(q2$sex)
table(q3$sex)
table(q4$sex)
table(q5$sex)
table(q6$sex)

Questions = c('Q1', 'Q1', 'Q2','Q2', 'Q3','Q3', 'Q4', 'Q4', 'Q5', 'Q5', 'Q6', 'Q6')
Percent = c(c(as.numeric(table(q1$sex)['Female']/tot_f*100), 
              -as.numeric(table(q1$sex)['Male']/tot_m*100)),
            c(as.numeric(table(q2$sex)['Female']/tot_f*100), 
              -as.numeric(table(q2$sex)['Male']/tot_m*100)),
            c(as.numeric(table(q3$sex)['Female']/tot_f*100), 
              -as.numeric(table(q3$sex)['Male']/tot_m*100)),
            c(as.numeric(table(q4$sex)['Female']/tot_f*100), 
              -as.numeric(table(q4$sex)['Male']/tot_m*100)),
            c(as.numeric(table(q5$sex)['Female']/tot_f*100), 
              -as.numeric(table(q5$sex)['Male']/tot_m*100)),
            c(as.numeric(table(q6$sex)['Female']/tot_f*100), 
                -as.numeric(table(q6$sex)['Male']/tot_m*100))
)
sx = c('Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male')

d <- data.frame(Questions, Percent, sx)

ggplot(d, aes(x = Questions, y = Percent, fill = sx))+
  geom_bar(stat = "identity")+
  coord_flip()






