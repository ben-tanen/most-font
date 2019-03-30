## The most font

This is a project to explore the similarities and differences in font design and to find the most representative font (i.e., the most averagely designed).

The project is primarily done in Processing, but includes a helper bash script (to use ImageMagick). The project includes the following (and should be run in this order):

- **A. Calculate bounding boxes**: calculating the positioning and size of each font-letter in order to scale and center
- **B. Generate white on black font-letter images**: generating white on black images of each font-letter
- **C. Generate stacked letter images**: generating stacked images of each font for a given letter
- **D. Generate transparent font-letter images**: converting black and white font-letter images to transparent
- **E. Calculate overlap**: layering images to calculate each font-letter's overlap score
