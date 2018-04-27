source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

if(1) {
  #load("../data/list_of_lda.RData")

  file_path <- "../data/"
  #file_name <- "data.txt"
  file_name <- "pubmed_result.clean"
  #file_name <- "alg"
  #file_name <- "allergy_wiki"
  plot_path <- "../plot/"

  file_path <- paste(file_path, file_name, sep = "")
  input_text <- read_file(file_path)
  input_text <- clean(input_text)

  for (i in 2:10) {
    #topics <- top_terms_by_topic_LDA(input_text, number_of_topics = i)
    #path <- paste(plot_path, file_name, "_unused", "_k_", i, ".pdf", sep = "")
    topics <- top_terms_by_topic_LDA(input_text, user_model = list_of_lda[[i-1]])
    path <- paste(plot_path, file_name, "_used", "_k_", i, ".pdf", sep = "")
    pdf(file = path)
    plot(topics)
    dev.off()
  }
}

if(0) {
  file_path <- "../data/"
  file_name <- "data.txt"
  plot_path <- "../plot/"

  file_path <- paste(file_path, file_name, sep = "")
  input_text <- read_file(file_path)
  input_text <- clean(input_text)

  list_of_lda <- list(9)
  for (i in 2:10) {
    lda <- top_terms_by_topic_LDA(input_text, number_of_topics = i, plot = F)
    # topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = T, user_model = lda)
    list_of_lda[i-1] <- lda
  }
  save.image("list_of_lda.RData")
}