source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

input_text <- read_csv("../data/IEEE/control_and_security.csv")
input_text <- input_text$`Document Title`
input_text <- clean(input_text)
topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2)

pdf(file = "plot.pdf")
plot(topics)
dev.off()
