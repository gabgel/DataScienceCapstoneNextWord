my_prediction <- function(string_in){
  require(dplyr)
  
  #to lower,...
  string_in <- tolower(string_in)
  
  #define string length
  n <- sapply(strsplit(string_in," "), length)
  str_words_in <- strsplit(string_in," ")[[1]]
  
  max_len <- 3
  
  #cut the string to length of 3
  if(n>max_len){
    str_wr <- str_words_in[seq((n-max_len + 1),n)]
  } else {
    str_wr <- str_words_in
  }
  
  m <- length(str_wr)
  str_wr_loop <- str_wr
  
  if(m == 3){
    df_loop <- filter(df_tet_2,
                      word_1 == str_wr_loop[1],
                      word_2 == str_wr_loop[2],
                      word_3 == str_wr_loop[3])
    
    if(dim(df_loop)[1] == 0){
      str_wr_loop <- str_wr_loop[2:3]
      df_loop <- filter(df_tri_2,
                        word_1 == str_wr_loop[1],
                        word_2 == str_wr_loop[2])
      
      if(dim(df_loop)[1] == 0){
        str_wr_loop <- str_wr_loop[2]
        df_loop <- filter(df_bi_5,
                          word_1 == str_wr_loop[1])
        
        if(dim(df_loop)[1] == 0){
          #select from unigrams
          #out_pred_word <- df_uni_10 %>% arrange(desc(freq)) %>% select(word) %>% head(1)
          out_pred_word <-sample(x = as.character(df_uni_10$word), size = 1, prob = df_uni_10$freq/sum(df_uni_10$freq))
        } else {
          #select the most frequent word from bigrams
          out_pred_word <- df_loop %>% arrange(desc(freq)) %>% select(word_2) %>% head(1)
        }
      } else {
        #select the most frequent word from trigrams
        out_pred_word <- df_loop %>% arrange(desc(freq)) %>% select(word_3) %>% head(1)
      }
    } else {
      #select the most frequent word from tetragrams
      out_pred_word <- df_loop %>% arrange(desc(freq)) %>% select(word_3.1) %>% head(1)
    }
  } else if (m == 2){
    df_loop <- filter(df_tri_2,
                      word_1 == str_wr_loop[1],
                      word_2 == str_wr_loop[2])
    
    if(dim(df_loop)[1] == 0){
      str_wr_loop <- str_wr_loop[2]
      df_loop <- filter(df_bi_5,
                        word_1 == str_wr_loop[1])
      
      if(dim(df_loop)[1] == 0){
        #select from unigrams
        #out_pred_word <- df_uni_10 %>% arrange(desc(freq)) %>% select(word) %>% head(1)
        out_pred_word <-sample(x = as.character(df_uni_10$word), size = 1, prob = df_uni_10$freq/sum(df_uni_10$freq))
      } else {
        #select the most frequent word from bigrams
        out_pred_word <- df_loop %>% arrange(desc(freq)) %>% select(word_2) %>% head(1)
      }
    } else {
      #select the most frequent word from trigrams
      out_pred_word <- df_loop %>% arrange(desc(freq)) %>% select(word_3) %>% head(1)
    } 
  } else if (m == 1){
    df_loop <- filter(df_bi_5,
                      word_1 == str_wr_loop[1])
    
    if(dim(df_loop)[1] == 0){
      #select from unigrams
      #out_pred_word <- df_uni_10 %>% arrange(desc(freq)) %>% select(word) %>% head(1)
      out_pred_word <-sample(x = as.character(df_uni_10$word), size = 1, prob = df_uni_10$freq/sum(df_uni_10$freq))
    } else {
      #select the most frequent word from bigrams
      out_pred_word <- df_loop %>% arrange(desc(freq)) %>% select(word_2) %>% head(1)
    }
  }
  
  return(as.character(out_pred_word))
}