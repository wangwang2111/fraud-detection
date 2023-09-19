library(tidyverse)
library(dplyr)
library(funModeling)
library(Hmisc)
library(ggplot2)
library(readr)
library(readxl)
library(tibble)
train_clean <- read_excel("D:/quang/data attacker/logistic/train_clean.xlsx")
test_clean <- read_excel("D:/quang/data attacker/logistic/test_clean.xlsx")

attach(train_clean)
cat_1 <- as.character(cat_1)
cat_2 <- as.character(cat_2)
cat_3 <- as.character(cat_3)
cat_4 <- as.character(cat_4)
cat_5 <- as.character(cat_5)
cat_6 <- as.character(cat_6)
cat_7 <- as.character(cat_7)
cat_8 <- as.character(cat_8)
cat_9 <- as.character(cat_9)
cat_10 <- as.character(cat_10)
cat_11 <- as.character(cat_11)
cat_12 <- as.character(cat_12)

attach(test_clean)
cat_1 <- as.character(cat_1)
cat_2 <- as.character(cat_2)
cat_3 <- as.character(cat_3)
cat_4 <- as.character(cat_4)
cat_5 <- as.character(cat_5)
cat_6 <- as.character(cat_6)
cat_7 <- as.character(cat_7)
cat_8 <- as.character(cat_8)
cat_9 <- as.character(cat_9)
cat_10 <- as.character(cat_10)
cat_11 <- as.character(cat_11)
cat_12 <- as.character(cat_12)

dat1 <- train_clean %>% filter(!is.na(time_1))
dat2 <- train_clean %>% filter(is.na(time_1))

test_clean$index <- 1:nrow(test_clean)

test_clean1 <- test_clean %>% filter(!is.na(time_1))
test_clean2 <- test_clean %>% filter(is.na(time_1))
df_status(dat1)
df_status(dat2)

#plot cat 
freq(dat1$cat_1)
freq(dat1$cat_2)
freq(dat1$cat_3)
freq(dat1$cat_5)#có mỗi 1 giá trị
freq(dat1$cat_6)
freq(dat1$cat_7)
freq(dat1$cat_8)
freq(dat1$cat_9)
freq(dat1$cat_10) #character (not numeric)
freq(dat1$cat_11)
freq(dat1$cat_12)



##EDA
install.packages("esquisse")
library(esquisse)
esquisser(dat1)

##log dat1

sample_fill_na = function(x) {
  x_na = is.na(x)
  x[x_na] = sample(x[!x_na], size = sum(x_na), replace = TRUE)
  return(x)
}
dat1 <- dat1 %>% mutate(across(value, ~replace_na(., median(., na.rm=TRUE))))
dat1 <- dat1 %>% filter(age>18,age< 100)
dat1$cat_12 <- sample_fill_na(dat1$cat_12)
dat1$com_type <- sample_fill_na(dat1$com_type)
dat1$com_type <- sample_fill_na(dat1$com_type)
dat1$unknown_var_1 <- sample_fill_na(dat1$unknown_var_1)
dat1$unknown_var_2 <- sample_fill_na(dat1$unknown_var_2)
dat1$unknown_var_3 <- sample_fill_na(dat1$unknown_var_3)
dat1$unknown_var_5 <- sample_fill_na(dat1$unknown_var_5)
dat1$unknown_var_6 <- sample_fill_na(dat1$unknown_var_6)
dat1$unknown_var_9 <- sample_fill_na(dat1$unknown_var_9)
dat1$unknown_var_10 <- sample_fill_na(dat1$unknown_var_10)
dat1$unknown_var_12 <- sample_fill_na(dat1$unknown_var_12)
dat1$unknown_var_16 <- sample_fill_na(dat1$unknown_var_16)
dat1$unknown_var_17 <- sample_fill_na(dat1$unknown_var_17)
dat1$unknown_var_18 <- sample_fill_na(dat1$unknown_var_18)
dat1$unknown_var_19 <- sample_fill_na(dat1$unknown_var_19)
dat1$unknown_var_20 <- sample_fill_na(dat1$unknown_var_20)
View(dat1)
df_status(dat1)

test_clean1 <- test_clean1 %>% mutate(across(value, ~replace_na(., median(., na.rm=TRUE))))
test_clean1$cat_12 <- sample_fill_na(test_clean1$cat_12)
test_clean1$com_type <- sample_fill_na(test_clean1$com_type)
test_clean1$unknown_var_1 <- sample_fill_na(test_clean1$unknown_var_1)
test_clean1$unknown_var_2 <- sample_fill_na(test_clean1$unknown_var_2)
test_clean1$unknown_var_3 <- sample_fill_na(test_clean1$unknown_var_3)
test_clean1$unknown_var_5 <- sample_fill_na(test_clean1$unknown_var_5)
test_clean1$unknown_var_6 <- sample_fill_na(test_clean1$unknown_var_6)
test_clean1$unknown_var_9 <- sample_fill_na(test_clean1$unknown_var_9)
test_clean1$unknown_var_10 <- sample_fill_na(test_clean1$unknown_var_10)
test_clean1$unknown_var_12 <- sample_fill_na(test_clean1$unknown_var_12)
test_clean1$unknown_var_16 <- sample_fill_na(test_clean1$unknown_var_16)
test_clean1$unknown_var_17 <- sample_fill_na(test_clean1$unknown_var_17)
test_clean1$unknown_var_18 <- sample_fill_na(test_clean1$unknown_var_18)
test_clean1$unknown_var_19 <- sample_fill_na(test_clean1$unknown_var_19)
test_clean1$unknown_var_20 <- sample_fill_na(test_clean1$unknown_var_20)
#correlation
core <- cor(dat1[c("unknown_var_1" , "unknown_var_2","unknown_var_3",
                        "unknown_var_6","unknown_var_7","unknown_var_9",
                        "unknown_var_10","unknown_var_11","unknown_var_12","unknown_var_13","unknown_var_14","unknown_var_15",
                        "unknown_var_18","unknown_var_19","unknown_var_20")])
core
core <- cor(dat1[c("unknown_var_3","unknown_var_6","unknown_var_9","unknown_var_11","unknown_var_15","unknown_var_14","unknown_var_20")])
#model data đủ sau khi bỏ biến nhiều NA+ correlate
attach(dat1)
options(max.print=1000000)
logistic <- glm(label~cat_1+cat_3+cat_6+cat_7+cat_8+cat_9+cat_10+cat_12+value+mul_rate+num_date_review+review_value+location_id+num_trans_last_month+
                  sex+age+unknown_var_3+unknown_var_5+unknown_var_6+unknown_var_9+unknown_var_10+unknown_var_11+unknown_var_14+
                  unknown_var_15+unknown_var_20)
summary(logistic)

## machine learning 
library(caret)
test_index <- createDataPartition(dat1$label, times=1, p=0.1, list = FALSE)
train <- dat1[-test_index,]
test <- dat1[test_index,]


model_1 <- lm(label~ cat_1+cat_3+cat_6+cat_7+com_type+cat_9+cat_10+cat_12+value+mul_rate+num_date_review+review_value+num_trans_last_month+
                sex+age+unknown_var_1+unknown_var_6+unknown_var_9+unknown_var_10+unknown_var_11+unknown_var_14+
                unknown_var_15+unknown_var_20 ,data= train) # location_id bỏ vì có biến mới, cat8 thay bằng com_type (fill ngẫu nhiên) vì có biến mới // bỏ tạm unknown 5
model_1
pre.model_1<- predict(model_1,test)
RMSE(pre.model_1,test$label)
kq1 <- data.frame(label= pre.model_1)
kq1 <- kq1 %>% mutate(label_2 = case_when(label<0.4 ~ 0, TRUE~1))
df_status(kq1)

#model 2
df_status(dat2)
dat2$unknown_var_1 <- sample_fill_na(dat2$unknown_var_1)
dat2$unknown_var_2 <- sample_fill_na(dat2$unknown_var_2)
dat2$unknown_var_3 <- sample_fill_na(dat2$unknown_var_3)
dat2$unknown_var_5 <- sample_fill_na(dat2$unknown_var_5)
dat2$unknown_var_6 <- sample_fill_na(dat2$unknown_var_6)
dat2$unknown_var_7 <- sample_fill_na(dat2$unknown_var_7)
dat2$unknown_var_9 <- sample_fill_na(dat2$unknown_var_9)
dat2$unknown_var_10 <- sample_fill_na(dat2$unknown_var_10)
core_2 <- cor(dat2[c("unknown_var_1" , "unknown_var_2","unknown_var_3",
                     "unknown_var_6","unknown_var_7","unknown_var_9",
                     "unknown_var_10")])
core_2
core_2 <- cor(dat2[c("unknown_var_1" ,"unknown_var_6","unknown_var_7","unknown_var_9")])
test_index_2 <- createDataPartition(dat2$label, times=1, p=0.1, list = FALSE)
train_2 <- dat2[-test_index_2,]
test_2 <- dat2[test_index_2,]
model_2 <- lm(label~ unknown_var_1+unknown_var_6+unknown_var_7+unknown_var_9+unknown_var_11 ,data= train_2) 
model_2
pre.model_2<- predict(model_2,test_2)
RMSE(pre.model_1,test$label)
kq2 <- data.frame(label= pre.model_2)
kq2 <- kq2 %>% mutate(label_2 = case_when(label<0.4 ~ 0, TRUE~1))
df_status(kq2)

test_clean2$unknown_var_1 <- sample_fill_na(test_clean2$unknown_var_1)
test_clean2$unknown_var_2 <- sample_fill_na(test_clean2$unknown_var_2)
test_clean2$unknown_var_3 <- sample_fill_na(test_clean2$unknown_var_3)
test_clean2$unknown_var_5 <- sample_fill_na(test_clean2$unknown_var_5)
test_clean2$unknown_var_6 <- sample_fill_na(test_clean2$unknown_var_6)
test_clean2$unknown_var_7 <- sample_fill_na(test_clean2$unknown_var_7)
test_clean2$unknown_var_9 <- sample_fill_na(test_clean2$unknown_var_9)
test_clean2$unknown_var_10 <- sample_fill_na(test_clean2$unknown_var_10)
test_clean2$unknown_var_16 <- sample_fill_na(test_clean2$unknown_var_16)
test_clean2$unknown_var_17 <- sample_fill_na(test_clean2$unknown_var_17)
test_clean2$unknown_var_18 <- sample_fill_na(test_clean2$unknown_var_18)
test_clean2$unknown_var_19 <- sample_fill_na(test_clean2$unknown_var_19)
test_clean2$unknown_var_20 <- sample_fill_na(test_clean2$unknown_var_20)
test_clean2$unknown_var_5 <- sample_fill_na(test_clean2$unknown_var_5)
test_clean2$unknown_var_6 <- sample_fill_na(test_clean2$unknown_var_6)
##applied
df_status(test_clean1)
df_status(test_clean2)
x <- predict(model_1,test_clean1)
y <- predict(model_2,test_clean2)

x1 <- cbind(x, index = test_clean1$index)
y1 <- cbind(y, index = test_clean2$index)
total = rbind(x1, y1)

total <- data.frame(total)
total = total[order(total[,2]),]

total <- total %>% mutate(x_2 = case_when(x<0.4 ~ 0, TRUE~1))
library(readxl)
suss <- read_excel("D:/quang/data attacker/suss.xlsx", 
                   col_names = FALSE)
View(suss)
total1 <- total[1:1024,]
total1 <- total1$x_2
total1 = as.factor(total1)
suss = as.factor(suss$...1)
library(ModelMetrics)
confusionMatrix(total1, suss, mode = "everything", positive="1")
