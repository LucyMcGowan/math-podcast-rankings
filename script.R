library(rvest)


url <- "https://podcasts.apple.com/us/genre/1536"
page <- read_html(url)
podcast_nodes <- html_nodes(page, "div[data-testid='product-lockup']")
podcast_names <- html_attr(podcast_nodes, "aria-label")

data <- data.frame(
  rank = seq_along(podcast_names),
  podcast = podcast_names,
  date = Sys.time()
)

write.csv(data, "podcast_rankings.csv", row.names = FALSE)
