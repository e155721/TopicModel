source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

input_text <- read_file("../data/PubMed/a")
#input_text <- input_text$Title
input_text <- clean(input_text, sw = c("author", "oper", "function", "predomin"))
topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2)

pdf(file = "plot.pdf")
plot(topics)
dev.off()
