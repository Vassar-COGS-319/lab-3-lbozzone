# model selection ####

# suppose we have data from an experiment like this:
# mean RT correct = 250ms
# mean RT incorrect = 246ms
# accuracy = 0.80

# try to fit this data with both models by adjusting the parameters of the model
# HINT: you can speed up your parameter search by using a small number of samples
# initially, and then increasing the samples as you get closer to a viable set
# of parameters.
# 2nd HINT: Don't adjust the sdrw parameter of the random.walk.model or the criterion
# paramter of the accumulator model.


#run the other documents first
#first model
model1 <- random.walk.model(5000, drift = .0134, criterion=4.894)

#correct
mean(model1[model1$correct == TRUE,]$rt)
#incorrect
mean(model1[model1$correct == FALSE,]$rt)
#average
mean(sum(model1[model1$correct == TRUE,]$correct)/5000)

###########################################################################
#second model
model2 <- accumulator.model(10000, rate.1 = 84, rate.2 =90, criterion=3)
#model2 <- accumulator.model(1000, rate.1 = 88, rate.2 = 90, criterion=3)


#correct
mean(model2[model2$correct == TRUE,]$rt)
#incorrect
mean(model2[model2$correct == FALSE,]$rt)
#average
mean(sum(model2[model2$correct == TRUE,]$correct)/10000)

# You don't need to get a perfect match. Just get in the ballpark. 


# Can both models do a reasonable job of accounting for the mean RT and accuracy? Report the
# results of your efforts:

#It does appear that both can do a reasonable job.
#Not ideal, but the first has correct: 244, incorrect 238, with 80% accuracy. 
#The second has 249 correct, 255 incorrect, and 79% accuracy.



# Using the parameters that you found above, plot histograms of the distribution of RTs
# predicted by each model. Based on these distributions, what kind of information could
# we use to evaluate which model is a better descriptor of the data for the experiment?
# Describe briefly how you might make this evaluation.


library(dplyr)

correct1.data <- model1 %>% filter(correct==TRUE)
incorrect1.data <- model1 %>% filter(correct==FALSE)

hist(correct1.data$rt)
hist(incorrect1.data$rt)


correct2.data <- model2 %>% filter(correct==TRUE)
incorrect2.data <- model2 %>% filter(correct==FALSE)

hist(correct2.data$rt)
hist(incorrect2.data$rt)


#Considering the historgrams, the one from the random walk model (1) is skewed to the right.
#There are even some data points that are near 1500ms, which is much higher than the mean of
#250 and 246. For the accumulator model (2), the distribution is roughly normal. I would
#expect data from an experiment to be roughly normal with reaction times such as 250ms (eg if
#the mean reaction time was close to, say 5ms, then I would expect it to be more skewed right).
#Thus we could use the distribution as an indicator for the strength of the model,
#and in this case I'd choose the accumulator model (2).