source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

if(0) {
  input_text <- read_file("../data/allergy-and-psychiatry_200000")
  input_text <- clean(input_text)

  lda <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = F)
}

if(0) {
  file_path <- "../data/"
  file_name <- "allergy"
  plot_path <- "../plot/"

  file_path <- paste(file_path, file_name, sep = "")
  input_text <- read_file(file_path)
  input_text <- clean(input_text)

  list_of_topics <- list(10)
  for (i in 11:20) {
    topics <- top_terms_by_topic_LDA(input_text, number_of_topics = i, plot = T)
    # topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = T, user_model = lda)
    path <- paste(plot_path, file_name, "_k_", i, ".pdf", sep = "")
    pdf(file = path)
    plot(topics)
    dev.off()
    list_of_topics[i] <- topics
  }

  save.image("list_of_topics-2.RData")
}

if(1) {
  file_path <- "../data/"
  #file_name <- "alg"
  file_name <- "allergy"
  plot_path <- "../plot/"

  file_path <- paste(file_path, file_name, sep = "")
  input_text <- read_file(file_path)
  input_text <- clean(input_text)

  load("../data/list_of_lda.R")

  for (i in 2:10) {
    topics <- top_terms_by_topic_LDA(input_text, user_model = list_of_lda[i-1])
    path <- paste(plot_path, file_name, "_k_", i, ".pdf", sep = "")
    pdf(file = path)
    plot(topics)
    dev.off()
  }
}
