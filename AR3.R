#####ASSOCIATION RULES#####

#Choose File 
movie<-read.csv(file.choose())
View(movie)

library(arules)
library(arulesViz)

#summarize the data
summary(movie)

library(DataExplorer)
plot_str(movie)
str(movie)
class(movie)

#Applying Apriori Algorithm
movie_rules<-apriori(as.matrix(movie[,6:15],parameter=list(support=0.2, confidence = 0.5,minlen=5)))
movie_rules

plot(movie_rules)
inspect(head(sort(movie_rules, by = "lift"))) 
head(quality(movie_rules))

dev.new(width=5, height=4)
plot(movie_rules, method="grouped")
plot(movie_rules,method = "graph")
