library(tidyverse)
library(kernlab)
library(caret)
data(spam)

intrain<-createDataPartition(y=spam$type,p=0.75, list=FALSE)

#typeof(training)--it's a list. [list]
training <-spam[intrain,]

testing <-spam[-intrain,]

#dim(training) dimention 

dim(training)

#?????????
set.seed(3)
sample(3)

#set.seed() ??????,??????????????? 
set.seed(32343)

#data is training, predict is type, ~. use all other variable (make, money, credit, all) from training. 
modelFit <- train(type ~.,data=training, method="glm")

#   Accuracy is 0.9214226  Kappa 0.834591

#look at the detail of the model 
modelFit$finalModel

# you can make prediction on your testing models 
prediction<-predict(modelFit,newdata=testing)
#spam..nonspam....
prediction

#confusion matrix do determine the predictions and the actual results
confusionMatrix(prediction,testing$type)

#Reference
#Prediction nonspam spam
#nonspam     656   54
#spam         41  399
# this means that 656+399 prediction are correct. Accuracy 0.9174 

