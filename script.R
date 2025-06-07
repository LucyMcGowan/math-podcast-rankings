library(rvest)

current_rankings <- read.csv("podcast_rankings.csv")

url <- "https://podcasts.apple.com/us/genre/1536"
page <- read_html(url)
podcast_nodes <- html_nodes(page, "div[data-testid='product-lockup']")
podcast_names <- html_attr(podcast_nodes, "aria-label")

data <- data.frame(
  rank = seq_along(podcast_names),
  podcast = podcast_names,
  date = Sys.time()
)

current_rankings <- rbind(current_rankings, data)

write.csv(current_rankings, "podcast_rankings.csv", row.names = FALSE)
