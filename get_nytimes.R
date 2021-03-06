# GET NY TIMES DATA

# get ny times data that match the criteria
library(rtimes)
if(!"rtimes" %in% rownames(installed.packages())) { print("package rtimes is required for function get_nytimes") }

get_nytimes <- function(keywords, from.date, to.date, section=NULL, api.key, sleep.time=2) {
  if(!is.null(section)) {
    facet_field <- "section_name"
    fl <- section
  } else {
    facet_field <- NULL
    fl <- NULL }
  
  # set api.key
  options(nytimes_as_key <- api.key)
  
  # check number of matches
  total.hits<- rtimes::as_search(q=keywords, facet_field=facet_field, fl=fl, begin_date=gsub("-","", from.date), end_date=gsub("-","", to.date), key=api.key)$meta$hits
  page.nyt <- (1:floor(total.hits/10))-1
  response <- data.frame()
  
  # retrieve nytimes data
  for(i in page.nyt) {
    results <- rtimes::as_search(q=keywords, facet_field=facet_field, fl=fl, begin_date=gsub("-","", from.date), end_date=gsub("-","", to.date), page=i, key=api.key)$data
    DF <- data.frame(web_url=rep(NA,10), snippet=rep(NA,10), lead_paragraph=rep(NA,10), abstract=rep(NA,10), 
                     print_page=rep(NA,10), source=rep(NA,10), headline=rep(NA,10), pub_date=rep(NA,10), 
                     document_type=rep(NA,10), news_desk=rep(NA,10), section_name=rep(NA,10), 
                     subsection_name=rep(NA,10), byline=rep(NA,10), word_count=rep(NA,10))
    for(u in 1:length(results)){
      if(length(results[[u]]$web_url)==1) { DF$web_url[u] <- try(results[[u]]$web_url) }
      if(length(results[[u]]$snippet)==1) { DF$snippet[u] <- try(results[[u]]$snippet) }
      if(length(results[[u]]$lead_paragraph)==1) { DF$lead_paragraph[u] <- try(results[[u]]$lead_paragraph) }
      if(length(results[[u]]$abstract)==1) { DF$abstract[u] <- try(results[[u]]$abstract) }
      if(length(results[[u]]$print_page)==1) { DF$print_page[u] <- try(results[[u]]$print_page) }
      if(length(results[[u]]$source)==1) { DF$source[u] <- try(results[[u]]$source) }
      if(length(results[[u]]$headline$main)==1) { DF$headline[u] <- try(results[[u]]$headline$main) }
      if(length(results[[u]]$pub_date)==1) { DF$pub_date[u] <- try(results[[u]]$pub_date) }
      if(length(results[[u]]$document_type)==1) { DF$document_type[u] <- try(results[[u]]$document_type) }
      if(length(results[[u]]$news_desk)==1) { DF$news_desk[u] <- try(results[[u]]$news_desk) }
      if(length(results[[u]]$section_name)==1) { DF$section_name[u] <- try(results[[u]]$section_name) }
      if(length(results[[u]]$subsection_name)==1) { DF$subsection_name[u] <- try(results[[u]]$subsection_name) }
      if(length(results[[u]]$byline$original)==1) { DF$byline[u] <- try(results[[u]]$byline$original) }
      if(length(results[[u]]$word_count)==1) { DF$word_count[u] <- try(results[[u]]$word_count) }
    }
    response <- rbind(DF,response)
    Sys.sleep(sleep.time)
  }
  return(response)
}
