get_facebook <-
function(links, sleep.time=0) {
    fbk.response <- data.frame()
    fbk.call <- paste0("https://api.facebook.com/method/links.getStats?urls=",links,"&format=json")
    if(.Platform$OS.type == "windows") { if(!file.exists("cacert.perm")) download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.perm") }
    if(.Platform$OS.type == "windows") { api_scrapper <- function(x) try(getURL(x, cainfo = "cacert.perm", timeout = 240, ssl.verifypeer = FALSE)) } else { 
    api_scrapper <- function(x) try(getURL(x, timeout = 240, ssl.verifypeer = FALSE)) }
    Sys.sleep(sleep.time)
    fbk.response <- try(data.frame(fromJSON(api_scrapper(fbk.call))))
    return(fbk.response)
}
