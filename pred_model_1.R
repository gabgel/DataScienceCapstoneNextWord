load(file = file.path(getwd(),"dataframes.RData"))
#cerco di ridurre il dataset a tokens con frequenza > di x (10 per ora)
sum(df_unigrams$freq > 10)/dim(df_unigrams)[1]
df_bigrams[,c("word_1","word_2")] <- as.character(df_bigrams[,c("word_1","word_2")])


df_uni_10 <- df_unigrams[df_unigrams$freq>10,]
df_bi_5 <- df_bigrams[df_bigrams$freq >=5,]
df_tri_2 <- df_trigrams[df_trigrams$freq>1,]
df_tet_2 <- df_tetragrams[df_tetragrams$freq>1,]
save(df_uni_10, df_bi_5, df_tri_2, df_tet_2, file = file.path(getwd(),"dataframes_short.RData"))

#iter to load
load(file = file.path(getwd(),"dataframes_short.RData"))
source(file = file.path(getwd(),"my_prediction.R"))


df_uni_10 <- data.frame(
  word=as.character(df_uni_10[,1]), 
  freq=df_uni_10[,2], 
  stringsAsFactors = FALSE)

df_bi_5 <- data.frame(
  apply(df_bi_5[,c(1:2)],2,as.character), 
  freq=df_bi_5[,3], 
  stringsAsFactors = FALSE)

df_tri_2 <- data.frame(
  apply(df_tri_2[,c(1:3)],2,as.character), 
  freq=df_tri_2[,4], 
  stringsAsFactors = FALSE)

df_tet_2 <- data.frame(
  apply(df_tet_2[,c(1:4)],2,as.character), 
  freq=df_tet_2[,5], 
  stringsAsFactors = FALSE)

save(df_uni_10, df_bi_5, df_tri_2, df_tet_2, file = file.path(getwd(),"dataframes_short.RData"))

test <- c("'d give anything to see")
my_prediction(test)


