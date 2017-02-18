# Mohamed Ali - utility for loading blogs, news, and twitter data into RData files that will be used later to build summaries


# load the stingi library for text manipulation
library(stringi)

# import the blogs and twitter datasets in text mode
blogs <- readLines("C:/Users/Mohamed/Documents/Coursera/Capstone Project/DataScienceCapstoneGitHub/Coursera-SwiftKey/final/en_US/en_US.blogs.txt", encoding="UTF-8")
twitter <- readLines("C:/Users/Mohamed/Documents/Coursera/Capstone Project/DataScienceCapstoneGitHub/Coursera-SwiftKey/final/en_US/en_US.twitter.txt", encoding="UTF-8")

# import the news dataset in binary mode
con <- file("C:/Users/Mohamed/Documents/Coursera/Capstone Project/DataScienceCapstoneGitHub/Coursera-SwiftKey/final/en_US/en_US.news.txt", open="rb")
news <- readLines(con, encoding="UTF-8")
close(con)
rm(con)

# drop non UTF-8 characters
twitter <- iconv(twitter, from = "latin1", to = "UTF-8", sub="")
twitter <- stri_replace_all_regex(twitter, "\u2019|`","'")
twitter <- stri_replace_all_regex(twitter, "\u201c|\u201d|u201f|``",'"')

# save the data to an .RData files
save(blogs, file="C:/Users/Mohamed/Documents/Coursera/Capstone Project/DataScienceCapstoneGitHub/data/blogs.RData")
save(news, file="C:/Users/Mohamed/Documents/Coursera/Capstone Project/DataScienceCapstoneGitHub/data/news.RData")
save(twitter, file="C:/Users/Mohamed/Documents/Coursera/Capstone Project/DataScienceCapstoneGitHub/data/twitter.RData")
