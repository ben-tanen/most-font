## The most font

This is a project to explore the similarities and differences in font design and to find the most representative font (i.e., the most averagely designed). There is [an associated post](http://ben-tanen.com/blog/2019/06/23/most-font.html) on my website.

The project is primarily done in Processing, but includes a helper bash script (to use ImageMagick). The project includes the following (and should be run in this order):

- **A. Calculate bounding boxes**: calculating the positioning and size of each font-letter in order to scale and center
- **B. Generate white on black font-letter images**: generating white on black images of each font-letter
- **C. Generate black on white outline font-letter images**: generating black outline images of each font-letter (not for analysis, for visualization GIF)
- **D. Generate stacked letter images**: generating stacked images of each font for a given letter
- **E. Generate transparent font-letter images**: converting black and white and outline font-letter images to transparent
- **F. Calculate overlap**: layering images to calculate each font-letter's overlap score
- **G. Create gifs**: stacking and organizing images to create gifs showing all fonts compared to heatmaps
- **H. Create font comparisons**: generating grid images to compare each letter of various fonts against heatmaps

