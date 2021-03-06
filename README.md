# Social Media Tools: a set of R functions

<b>get_interactions</b> The function takes a vector of tweets and a second vector with the usernames that tweeted the messages. It builds a network of retweets (if return.network="retweets"), @-mentions (if return.network="mentions"), or both (if return.network="all.interactions"). The funcion returns an edgelist (if return.graph=F -- default), but it can convert the data frame on the fly to an igraph object (if return.graph=T). Optional arguments include a thrid vector with edge atributes (edge.atribute defaults to NA), an encoding conversion to ASCII (if ascii=TRUE -- default), and an indication of the network as directional or not. As the funcion is built for Twitter data, the argument directed defaults to TRUE. The funcion can be deployed to other sources of relational data, particularly social media.

<b>get_emails_text</b> The function scraps text files for email addresses within the R environment. 

<b>get_emails_webpage</b> The function retrieves the email addresses listed in webpages that include email hyperlinks (if email.href=T) or the full body of the document (if email.href=F). This function takes one or multiple vectors of URLs and returns a vector with the emails found in the document (if return.df=F) or a data frame with the original URL(s) followed by emails on that page separated by columns (if return.df=T). The default arguments are return.df=F and email.href=F.

<b>get_url_title</b> This function takes one or multiple vectors of URLs and returns the title of each webpage (if return.df=F) or a data frame with the original URL(s) followed by the webpage title (if return.df=T -- default).

<b>get_url</b> This function resolves short URLs to their actual address.

<b>get_aggieness</b> Simple classifier for agriculture-related tweets

<b>get_socialmedia</b> The function takes one or multiple URLs and returns a data frame with the number of shares, likes, tweets, pins, and hits on Facebook, Twitter, Pinterest, StumbleUpon, LinkedIn, and Reddit for each URL. The resulting data frame includes the following 15 columns:

<i>url</i> URL searched

<i>normalized_url</i> URL returned

<i>fbk_shares</i> number of Facebook shares 

<i>fbk_likes</i> number of Facebook likes

<i>fbk_comments</i> number of Facebook comments

<i>fbk_total</i> total number of hits on Facebook 

<i>fbk_clicks</i> number of Facebook clicks

<i>twt_tweets</i> number of tweets on Twitter

<i>rdt_score</i> Reddit score 

<i>rdt_downs</i> number of downs on Reddit 

<i>rdt_ups</i> number of ups on Reddit

<i>rdt_comments</i> number of comments on Reddit

<i>lkn_shares</i> number of LinkedIn shares

<i>stu_views</i> number of StumbleUpon views

<i>pin_counts</i> number of pins on Pinterest


---------------

Author: Marco T. Bastos

Date: 2014-10-08

Modified: 2015-06-12

Description: A Set of R Functions for Web and Social Media Analysis

Imports: RCurl, XML, stringr, httr, igraph

