#package kerlab,ml datasets 

library(kernlab)
library(tidyverse)
data(spam)
spam%>%
  head()

#this datasets are whole bunch of characters plus a type whether it is a spam or not 

#money and credit might be spam email so doing a density plot, spam=red, non-spam=blue 
# density of world "yours" appearance 
 

plot(density(spam$your[spam$type=="nonspam"]),
     col="blue",main="",xlab="frequencu of 'your' ")
lines(density(spam$your[spam$type=="spam"]),col="red"
      )

#build algorithm, cut off c=0.5  

plot(density(spam$your[spam$type=="nonspam"]),
     col="blue",main="",xlab="frequencu of 'your' ")
lines(density(spam$your[spam$type=="spam"]),col="red"
)
abline(v = 0.5,col="black")

# everything above 0.5 is spam and less than 0.5 is nonspam 

prediction <- ifelse(spam$your >0.5, "spam","nonspam" )
table(prediction)

# nonspam is 2580, and spam is 2021 

table(prediction,spam$type)

#2788 spam and 1813 not spam 
spam%>%
  pull(type)%>%
  summary()

# out of 2580, 2112 are right, 468 are wrong 
prediction <- ifelse(spam$your >0.5, "spam","nonspam" )
table(prediction,spam$type)






