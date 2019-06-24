library(data.table)

setwd("~/Desktop/Projects/most-font/data")
dt <- data.table(read.csv('letter_font_scores.csv'))
dt[, r := rank(.SD$scale_y_letter, ties.method = 'last'), by = list(letter, score)][order(letter, score, r)]
dt <- dt[r <= 3][order(letter, score, r)]

# organize images for overlap-outline gifs
setwd("~/Desktop/Projects/most-font/images/overlap-outline")
for (l in LETTERS) {
  dt_a <- dt[letter == l]
  dt_a <- dt_a[order(score)]
  
  for (i in 1:nrow(dt_a)) {
    font <- as.character(dt_a$font[i])
    print(font)
    file.copy(paste0("overlap-outline_", l, "_", font, ".png"), "_gif")
    file.rename(paste0("_gif/overlap-outline_", l, "_", font, ".png"),
                sprintf("_gif/%03d_overlap-outline_%s_%s.png", i, l, font))
  }
}
