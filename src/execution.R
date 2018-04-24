source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

if(1) {
  file_path <- "../data/"
  file_name <- "allergy_wiki"
  plot_path <- "../plot/"
  
  file_path <- paste(file_path, file_name, sep = "")
  input_text <- read_file(file_path)
  input_text <- clean(input_text)
  
  for (i in 2:20) {
    #topics <- top_terms_by_topic_LDA(input_text, number_of_topics = i, plot = T)
    topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = T, user_model = list_of_lda[[i-1]])
    path <- paste(plot_path, file_name, "_used", "_k_", i, ".pdf", sep = "")
    pdf(file = path)
    plot(topics)
    dev.off()
  }
}

if(0) {
  file_path <- "../data/"
  file_name <- "allergy"
  plot_path <- "../plot/"
  
  file_path <- paste(file_path, file_name, sep = "")
  input_text <- read_file(file_path)
  input_text <- clean(input_text)
  
  list_of_lda <- list(19)
  for (i in 2:20) {
    lda <- top_terms_by_topic_LDA(input_text, number_of_topics = i, plot = F)
    # topics <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = T, user_model = lda)
    
    if(0) {
      path <- paste(plot_path, file_name, "_k_", i, ".pdf", sep = "")
      pdf(file = path)
      plot(topics)
      dev.off()
    }
    
    list_of_lda[i-1] <- lda
  }
  
  save.image("list_of_lda.RData")
}