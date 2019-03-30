void setup() {
  size(1000, 1000);
  textAlign(CENTER, CENTER);
  noLoop();
}

void draw() {
  // output_lf_bbox_table("letter_fonts.csv", "letter_font_bbox.csv", false);
  output_lf_bbox_table("letter_fonts2.csv", "letter_font_bbox2.csv", true);
}

void output_lf_bbox_table(String input, String output, boolean scale) {
  // load in table of fonts/letters
  Table table = loadTable("../_data/".concat(input), "header");
  table.addColumn("min_x", 1);
  table.addColumn("min_y", 1);
  table.addColumn("max_x", 1);
  table.addColumn("max_y", 1);
  
  // loop through fonts and letters to calculate bounding box dimensions
  for (TableRow row : table.rows()) {
    String font = row.getString("font");
    String letter = row.getString("letter");
    
    println(letter.concat(" --- ").concat(font));
  
    background(255);
    fill(0);
    textFont(createFont(font, 200 * (scale ? row.getFloat("scale_y_font") : 1)));
    text(letter, 500, 500);
  
    int [] bbox = calculate_bounding_box();
    
    row.setInt("min_x", bbox[0]);
    row.setInt("min_y", bbox[1]);
    row.setInt("max_x", bbox[2]);
    row.setInt("max_y", bbox[3]);
    
    clear();
  }
  
  saveTable(table, "../_data/".concat(output));
}

int [] calculate_bounding_box() {
  int min_x = width, min_y = height, max_x = 0, max_y = 0;
  int [] bounding_box = {min_x, min_y, max_x, max_y};
  
  loadPixels();
  for (int i = 0; i < width * height; i++) {
    if (pixels[i] != color(255)) {
      bounding_box[0] = min(bounding_box[0], i % width);
      bounding_box[1] = min(bounding_box[1], i / height);
      bounding_box[2] = max(bounding_box[2], i % width);
      bounding_box[3] = max(bounding_box[3], i / height);
    }
  }
  
  return bounding_box;
}

void draw_bounding_box() {
  int [] bbox = calculate_bounding_box();
  line(bbox[0], bbox[1], bbox[0], bbox[3]);
  line(bbox[0], bbox[1], bbox[2], bbox[1]);
  line(bbox[0], bbox[3], bbox[2], bbox[3]);
  line(bbox[2], bbox[1], bbox[2], bbox[3]);
}
