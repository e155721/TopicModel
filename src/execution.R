source("top_terms_by_topic_LDA.R")
source("readFile.R")
source("clean.R")

if(1) {
  #load("../data/list_of_lda_02-10.RData")
  load("../data/list_of_lda_11-20.RData")
  #load("../data/list_of_lda.RData")

  file_path <- "../data/"
  #file_name <- "data.txt"
  #file_name <- "data_500000.txt"
  #file_name <- "a.csv"
  file_name <- "pubmed_trending-articles"
  #file_name <- "alg"
  #file_name <- "allergy_wiki"
  plot_path <- "../plot/"

  file_path <- paste(file_path, file_name, sep = "")
  #input_text <- read_csv(file_path)$text
  input_text <- read_file(file_path)
  input_text <- clean(input_text)

  for (i in 20:20) {
    #lda_result <- top_terms_by_topic_LDA(input_text, number_of_topics = i)
    #path <- paste(plot_path, file_name, "_unused", "_k_", i, ".pdf", sep = "")
    lda_result <- top_terms_by_topic_LDA(input_text, user_model = list_of_lda[[i-1]])
    path <- paste(plot_path, file_name, "_used", "_k_", i, ".pdf", sep = "")
    pdf(file = path)
    plot(lda_result[[1]])
    dev.off()
    #path <- paste(plot_path, "top_terms_unused_k_", i, ".txt", sep = "")
    path <- paste(plot_path, "top_terms_used_k_", i, ".txt", sep = "")
    write.table(lda_result[[2]], file=path)
  }
}

if(0) {
  file_path <- "../data/"
  file_name <- "data.txt"
  plot_path <- "../plot/"

  file_path <- paste(file_path, file_name, sep = "")
  input_text <- read_file(file_path)
  input_text <- clean(input_text)

  list_of_lda <- list(19)
  for (i in 11:20) {
    lda <- top_terms_by_topic_LDA(input_text, number_of_topics = i, plot = F)
    list_of_lda[i-1] <- lda
  }
  save.image("list_of_lda_11-20.RData")
}