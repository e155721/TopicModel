source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

input_text <- read_file("../data/a-200000.txt")
input_text <- clean(input_text)

lda <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = F)

input_text <- read_file("../data/a")
input_text <- clean(input_text)

topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = T)
pdf(file = "../plot/Rplot-2.pdf")
plot(topics)
dev.off()

topics <- top_terms_by_topic_LDA(input_text, user_model = lda)
pdf(file = "../plot/Rplot.pdf")
plot(topics)
dev.off()
