void setup() {
  size(400, 400);
  textAlign(CENTER, CENTER);
  noLoop();
}

void draw() {
  
  // set background and fill
  background(0);
  fill(255);
  
  // load in table of fonts/letters
  Table table = loadTable("../../data/letter_fonts2.csv", "header");
  for (TableRow row : table.rows()) {
    
    // get font and letter
    String font = row.getString("font");
    String letter = row.getString("letter");
    println(String.format("%s - %s", letter, font));
    
    // set font, output letter
    PFont f = createFont(font, 200 * row.getFloat("scale_y_font"));
    textFont(f);
    text(letter, 200 + row.getFloat("scale_offset_x"), 200 + row.getFloat("scale_offset_y"));
    
    // save output, clear
    save(String.format("../../images/bw_maps/bw_map_%s_%s.png", letter, font.replace(" ","")));
    clear();
  }
}
