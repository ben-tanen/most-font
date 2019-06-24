void setup() {
  size(400, 400);
  noLoop();
}

void draw() {
  
  // loop through fonts/letters
  Table table = loadTable("../../data/letter_fonts2.csv", "header");
  table.addColumn("score", 3);
  for (TableRow row : table.rows()) {
    
    String font = row.getString("font");
    String letter = row.getString("letter");
    println(String.format("%s - %s", letter, font));
    
    // layer images, calculate overlap
    layer_images(letter, font);
    row.setFloat("score", calculate_overlap_score());
    
    // save layered image
    save(String.format("../../images/overlap/overlap_%s_%s.png", letter, font));
  }
  
  saveTable(table, "../../data/letter_font_scores.csv");
}

void layer_images(String letter, String font) {
  image(loadImage(String.format("../../images/stacked/stacked_%s.png", letter)), 0, 0);
  image(loadImage(String.format("../../images/trans/trans_%s_%s.png", letter, font.replace(" ",""))), 0, 0);
}

float calculate_overlap_score() {
  int pixel_count = 0;
  int color_sum = 0;
  
  loadPixels();
  for (int i = 0; i < (width * height); i++) {
    if (red(pixels[i]) != blue(pixels[i])) {
      pixel_count++;
      color_sum += green(pixels[i]);
    }
  }

  return(color_sum / pixel_count);
}
