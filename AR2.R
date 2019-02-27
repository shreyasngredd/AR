#####ASSOCIATION RULES#####

#Choose File 
groc<-read.transactions(file.choose(),format="basket")
View(groc)

library(arules)
library(arulesViz)

#summarize the data
summary(groc)

library(DataExplorer)
plot_str(groc)
str(groc)

inspect(groc[1:20])
class(groc)

itemFrequencyPlot(groc)
#Figure margins too large
plot(1:10)
dev.new(width=5, height=4)
plot(1:20)

#Applying Apriori Algorithm
groc_rules<-apriori(groc,parameter = list(support = 0.002,confidence = 0.05))
inspect(head(sort(groc_rules, by= "lift")))
groc_rules

inspect(head(sort(rules, by = "lift")))
plot(groc_rules)

head(quality(groc_rules))
plot(groc_rules, method="grouped")
plot(rules,method = "graph")
