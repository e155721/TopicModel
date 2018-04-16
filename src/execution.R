source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

input_text <- read_file("../data/a-2000.txt")
input_text <- clean(input_text)
topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2)

pdf(file = "Rplot-2000.pdf")
plot(topics)
dev.off()

input_text <- read_file("../data/a-20000.txt")
input_text <- clean(input_text)
topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2)

pdf(file = "Rplot-20000.pdf")
plot(topics)
dev.off()

input_text <- read_file("../data/a-200000.txt")
input_text <- clean(input_text)
topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2)

pdf(file = "Rplot-200000.pdf")
plot(topics)
dev.off()
