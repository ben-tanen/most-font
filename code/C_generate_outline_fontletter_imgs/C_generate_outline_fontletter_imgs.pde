
void setup() {
  size(400, 400);
  textAlign(CENTER, CENTER); 
  noLoop();
}

void draw() {
  
  // load in table of font/letters
  Table table = loadTable("../../data/letter_fonts2.csv", "header");
  for (TableRow row : table.rows()) {
    
    // get font and letter
    String font = row.getString("font");
    String letter = row.getString("letter");
    println(String.format("%s - %s", letter, font));
    
    // clear frame
    clear();
    background(255);
    
    // set font, draw outline
    PFont f = createFont(font, 200 * row.getFloat("scale_y_font"));
    textFont(f);
    draw_outline(letter, 200 + row.getInt("scale_offset_x"), 200 + row.getInt("scale_offset_y"));
    
    // save output
    save(String.format("../../images/outline/outline_%s_%s.png", letter, font.replace(" ","")));
  }
}

void draw_outline(String letter, int pos_x, int pos_y) {
  
  // set padding
  int pad_x = 2, pad_y = 2;
  
  // set fill to black (for outline); draw outline
  fill(0);
  for (int dx = -pad_x; dx <= pad_x; dx++) {
    for (int dy = -pad_y; dy <= pad_y; dy++) {
      text(letter, pos_x + dx, pos_y + dy);
    }
  }
  
  // set fill to white (for interior); draw
  fill(255);
  text(letter, pos_x, pos_y);
}
