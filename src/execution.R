source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

if(0) {
  input_text <- read_file("../data/allergy-and-psychiatry_200000")
  input_text <- clean(input_text)
  
  lda <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = F)
}

if(1) {
  file_path <- "../data/"
  file_name <- "allergy"
  plot_path <- "../plot/"
  
  file_path <- paste(file_path, file_name, sep = "")
  input_text <- read_file(file_path)
  input_text <- clean(input_text)
  
  for (i in 2:10) {
    topics <- top_terms_by_topic_LDA(input_text, number_of_topics = i, plot = T)
    # topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = T, user_model = lda) 
    path <- paste(plot_path, file_name, "k_", i, ".pdf", sep = "")
    pdf(file = path)
    plot(topics)
    dev.off()
  }
}

if(0){
  file_path <- "../data/"
  file_name <- "allergy-and-psychiatry_2"
  plot_path <- "../plot/"
  
  file_path <- paste(file_path, file_name, sep = "")
  input_text <- read_file(file_path)
  input_text <- clean(input_text)
  
  topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = T)
  path <- paste(plot_path, file_name, ".pdf", sep = "")
  pdf(file = path)
  plot(topics)
  dev.off()
  
  topics <- top_terms_by_topic_LDA(input_text, user_model = lda)
  path = paste(plot_path, file_name, "_used-model", ".pdf", sep = "")
  pdf(file = path)
  plot(topics)
  dev.off()
}