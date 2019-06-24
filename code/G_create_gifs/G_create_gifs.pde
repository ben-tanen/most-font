void setup() {
  size(400, 400);
  noLoop();
}

void draw() {
  
  // loop through fonts/letters
  Table table = loadTable("../../data/letter_font_scores.csv", "header");
  for (TableRow row : table.rows()) {
    
    String font = row.getString("font");
    String letter = row.getString("letter");
    println(String.format("%s - %s", letter, font));
    
    // layer images, calculate overlap
    layer_images(letter, font);
    
    // save layered image
    save(String.format("../../images/overlap-outline/overlap-outline_%s_%s.png", letter, font));
  }
  
  // saveTable(table, "../../data/letter_font_scores.csv");
}

void layer_images(String letter, String font) {
  image(loadImage(String.format("../../images/stacked/stacked_%s.png", letter)), 0, 0);
  image(loadImage(String.format("../../images/trans-outline/trans-outline_%s_%s.png", letter, font.replace(" ",""))), 0, 0);
}
