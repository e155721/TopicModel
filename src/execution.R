source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

input_text <- read_file("../data/PubMed/t")
#input_text <- input_text$Title
input_text <- clean(input_text)
topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 5)

top_terms_by_topic_LDA(topics, number_of_topics = 5)

pdf(file = "plot.pdf")
plot(topics)
dev.off()
