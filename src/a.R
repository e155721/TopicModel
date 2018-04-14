source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

input_text <- readFile("../data/gundam_and_math/")
input_text <- clean(input_text, sw = c("+", "-", "/"))
topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2)

pdf(file = "plot.pdf")
plot(topics)
dev.off()
