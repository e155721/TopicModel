source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

if(0) {
input_text <- read_file("../data/a-200000.txt")
input_text <- clean(input_text)

lda <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = F)
}

if(1){
file_path <- "../data/"
file_name <- "a-tail-1000"
plot_path <- "../plot/"

file_path <- paste(file_path, file_name, sep = "")
input_text <- read_file(file_path)
input_text <- clean(input_text)

plot_path <- paste(plot_path, "Rplot_", file_name, ".pdf", sep = "")
topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = T)
pdf(file = "../plot/Rplot_tail-2.pdf")
plot(topics)
dev.off()

plot_path = paste(plot_path, "Rplot_", file_name, "_used-model", ".pdf", sep = "")
topics <- top_terms_by_topic_LDA(input_text, user_model = lda)
pdf(file = "../plot/Rplot_tail-2_used-model.pdf")
plot(topics)
dev.off()
}