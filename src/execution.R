source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

input_text <- read_file("../data/a")
input_text <- clean(input_text)
topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2)

pdf(file = "Rplot.pdf")
plot(topics)
dev.off()
