#####ASSOCIATION RULES#####

#Choose File 
books<-read.csv(file.choose())
View(books)
attach(books)

library(arules)
library(arulesViz)

#summarize the data
summary(books)

#ChildBks: Mean= 0.423, Median= 0.000; As Mean>Median,it is skewed to the left
#YouthBks: Mean= 0.2475, Median= 0.000; As Mean>Median,it is skewed to the left
#CookBks: Mean= 0.431, Median= 0.000; As Mean>Median,it is skewed to the left
#DoItBks: Mean= 0.282, Median= 0.000; As Mean>Median,it is skewed to the left
#RefBks: Mean= 0.2145, Median= 0.000; As Mean>Median,it is skewed to the left
#ArtBks: Mean= 0.241, Median= 0.000; As Mean>Median,it is skewed to the left
#GeogBks: Mean= 0.276, Median= 0.000; As Mean>Median,it is skewed to the left
#ItalCook: Mean= 0.1135, Median= 0.000; As Mean>Median,it is skewed to the left
#ItalAtlas: Mean= 0.037, Median= 0.000; As Mean>Median,it is skewed to the left
#ItalArt: Mean= 0.0485, Median= 0.000; As Mean>Median,it is skewed to the left
#Florence: Mean= 0.1085, Median= 0.000; As Mean>Median,it is skewed to the left

library(DataExplorer)
plot_str(books)
str(books)

plot_missing(books)

plot_histogram(ChildBks)
plot_histogram(YouthBks)
plot_histogram(CookBks)
plot_histogram(DoItYBks)
plot_histogram(RefBks)
plot_histogram(ArtBks)
plot_histogram(GeogBks)
plot_histogram(ItalCook)
plot_histogram(ItalAtlas)
plot_histogram(ItalArt)
plot_histogram(Florence)

#Apriori Algorithm 
rules <- apriori(as.matrix(books),parameter=list(support=0.02, confidence = 0.5,minlen=5))
rules

inspect(head(sort(rules, by = "lift")))

head(quality(rules))

plot(rules, method="scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")
