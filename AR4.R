#####ASSOCIATION RULES#####

#Choose File 
phone<-read.csv(file.choose())
View(phone)

#summarize the data
summary(phone)

library(DataExplorer)
plot_str(phone)
str(phone)

phone[] <- lapply(phone,as.character)
View(phone)

#Custom collapse function and application
paste_fun <- function(i){
  return (paste(as.character(i),collapse=" "))
}
phone["new_col"] <- apply(phone,1,paste_fun)
View(phone)

#TDM matrix for data frame
library(tm)
x <- Corpus(VectorSource(phone$new_col))
x <- tm_map(x,stripWhitespace)
dtm0 <- t(TermDocumentMatrix(x))
dtm0_df <- data.frame(as.matrix(dtm0))
View(dtm0_df)

detach(package:tm, unload=TRUE)

#Applying Apriori Algorithm
library(arules)
library(arulesViz)
phone_rules<-apriori(as.matrix(dtm0_df),parameter =list(support = 0.0002,confidence = 0.5, minlen=2))
phone_rules
summary(phone_rules)
inspect(phone_rules)
plot(phone_rules)

#Sorting by confidence & lift
prules_conf <- sort(phone_rules,by="confidence")
inspect(prules_conf)

prules_lift <- sort(phone_rules,by="lift")
inspect(prules_lift)

#Scatter Plot rule visualization
dev.new(width=5, height=4)
plot(phone_rules, method="grouped")
plot(phone_rules,method = "graph")
