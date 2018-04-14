input_text <- readFile("../data/papers/")
input_text <- clean(input_text, sw = c("+", "-", "/"))

input_text <- readFile("../data/gundam_and_math/")
input_text <- clean(input_text, sw = c("+", "-", "/"))
top_terms_by_topic_LDA(input_text, number_of_topics = 2)

input_text <- readFile("../data/anime/tmp/")

reviews <- read_csv("../data/deceptive-opinion.csv")
input_text <- reviews$text
input_text <- clean(input_text, sw = c("relea", "includ", "+", "-", "/"))
top_terms_by_topic_LDA(input_text, number_of_topics = 2)

lda <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = F)
top_terms_by_topic_LDA(input_text, user_model = lda)
top_terms_by_topic_LDA(input_text, number_of_topics = 2)

top_terms_by_topic_LDA(input_text, number_of_topics = 2)
top_terms_by_topic_LDA(input_text, number_of_topics = 3)
top_terms_by_topic_LDA(input_text, number_of_topics = 4)
top_terms_by_topic_LDA(input_text, number_of_topics = 5)
top_terms_by_topic_LDA(input_text, number_of_topics = 6)
top_terms_by_topic_LDA(input_text, number_of_topics = 7)
top_terms_by_topic_LDA(input_text, number_of_topics = 8)
top_terms_by_topic_LDA(input_text, number_of_topics = 9)
top_terms_by_topic_LDA(input_text, number_of_topics = 10)

top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot=)
lda <- top_terms_by_topic_LDA(input_text, number_of_topics = 2, plot = F)
top_terms_by_topic_LDA(input_text, user_model = lda)
