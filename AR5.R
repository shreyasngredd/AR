#####ASSOCIATION RULES#####

#Choose File 
retail<-read.csv(file.choose())
View(retail)

#summarize the data
summary(retail)

library(DataExplorer)
plot_str(retail)
str(retail)

class(retail)

#Applying Apriori Algorithm
retail_rules<-apriori(retail,parameter = list(support = 0.003,confidence = 0.8,minlen=5))
retail_rules
summary(retail_rules)
inspect(head(sort(retail_rules, by= "lift")))
head(quality(retail_rules))

plot(retail_rules)

dev.new(width=5, height=4)
plot(retail_rules, method = "grouped")
plot(retail_rules,method = "graph")
