PImage img;

String [] letters = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                     "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
                     
String [] fonts = {"ArialUnicodeMS", "BlackoakStd", "Courier", "Futura-Medium",
                   "GillSans", "Helvetica", "KozGoPro-Regular", "LucidaGrande",
                   "Montserrat-Regular", "MyriadPro-Regular", "Papyrus", "Tahoma",
                   "Times-Roman", "Webdings", "Wingdings3"};

void setup() {
  size(900, 750);
  background(255);
  noLoop();
}

void draw() {
  for (int j = 0; j < fonts.length; j++) {
    for (int i = 0; i < letters.length; i++) {
      String img_file = String.format("overlap-outline_%s_%s.png", letters[i], fonts[j]);
      img = loadImage(String.format("../../images/overlap-outline/%s", img_file));
      img.resize(width / 6, height / 5);
      image(img, (width / 6 * i) % width, round(i / 6) * height / 5);
    }
    save(String.format("../../images/font-comp/font-comp-%s.png", fonts[j]));
  }
  
}
