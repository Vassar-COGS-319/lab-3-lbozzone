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
model1 <- random.walk.model(1000, drift = .02, criterion=3)

#correct
mean(model1[model1$correct == TRUE,]$rt)
#incorrect
mean(model1[model1$correct == FALSE,]$rt)
#average
mean(sum(model1[model1$correct == TRUE,]$correct)/1000)

###########################################################################
#second model
model2 <- accumulator.model(1000, rate.1 = 87, rate.2 = 84.4, criterion=3)

#correct
mean(model2[model2$correct == TRUE,]$rt)
#incorrect
mean(model2[model2$correct == FALSE,]$rt)
#average
mean(sum(model2[model2$correct == TRUE,])/1000)

# You don't need to get a perfect match. Just get in the ballpark. 


# Can both models do a reasonable job of accounting for the mean RT and accuracy? Report the
# results of your efforts:


# Using the parameters that you found above, plot histograms of the distribution of RTs
# predicted by each model. Based on these distributions, what kind of information could
# we use to evaluate which model is a better descriptor of the data for the experiment?
# Describe briefly how you might make this evaluation.
