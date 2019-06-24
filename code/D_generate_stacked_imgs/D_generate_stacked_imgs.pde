void setup() {
  size(400, 400);
  textAlign(CENTER, CENTER); 
  noLoop();
}

void draw() {  
  String font = "", letter = "A";
  
  // set background and fill
  background(255);
  fill(#ff0000, 2);
  
  // load in table of fonts/letters
  Table table = loadTable("../../data/letter_fonts2.csv", "header");
  for (TableRow row : table.rows()) {
    
    // if new letter, save output and clear
    if (!letter.equals(row.getString("letter"))) {
      save(String.format("../../images/stacked/stacked_%s.png", letter));
      clear();
      
      // set background and fill
      background(255);
      fill(#ff0000, 2);
    }
    
    // get font and letter
    font = row.getString("font");
    letter = row.getString("letter");
    println(String.format("%s - %s", letter, font));
    
    // set new font and output character
    PFont f = createFont(font, 200 * row.getFloat("scale_y_font"));
    textFont(f);
    text(letter, 200 + row.getFloat("scale_offset_x"), 200 + row.getFloat("scale_offset_y"));
  }
  
  // final output of Z
  save(String.format("../../images/stacked/stacked_%s.png", letter));
}
