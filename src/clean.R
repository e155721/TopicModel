# read in our data

clean <- function(input_text, sw = c("a")) 
{
  # create a document term matrix to clean
  reviewsCorpus <- Corpus(VectorSource(input_text)) 
  reviewsDTM <- DocumentTermMatrix(reviewsCorpus)
  
  # convert the document term matrix to a tidytext corpus
  reviewsDTM_tidy <- tidy(reviewsDTM)
  
  # I'm going to add my own custom stop words that I don't think will be
  # very informative in hotel reviews
  ## custom_stop_words <- tibble(word = c("hotel", "room"))
  custom_stop_words <-tibble(word = sw)
  print(sw)
  
  # remove stopwords
  reviewsDTM_tidy_cleaned <- reviewsDTM_tidy %>% # take our tidy dtm and...
    anti_join(stop_words, by = c("term" = "word")) %>% # remove English stopwords and...
    anti_join(custom_stop_words, by = c("term" = "word")) # remove my custom stopwords
  
  # stem the words (e.g. convert each word to its stem, where applicable)
  reviewsDTM_tidy_cleaned <- reviewsDTM_tidy_cleaned %>% 
    mutate(stem = wordStem(term))
  input_text <- reviewsDTM_tidy_cleaned$stem
  return(input_text)
}
