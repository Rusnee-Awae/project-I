class Recipe {

  String title;
  String description;
  String image;
  int calories;
  int carbo;
  int protein;

  Recipe(this.title, this.description, this.image, this.calories, this.carbo, this.protein);

}

List<Recipe> getRecipes(){
  return <Recipe>[
    Recipe("โปรโมชั่นการจัดฟัน", "ราคาพิเศษสำหรับเดือนมกราคมนี้", "images/n.jpg", 47000, 1500, 2),
    Recipe("โปรโมชั่นฟอกสีฟันด้วยแสงเย็น", "ราคาพิเศษสำหรับเดือนมกราคมนี้", "images/poo.jpg", 2000, 0, 0),
    Recipe("โปรโมชั่นฟอกสีฟันด้วยเลเซอร์", "ราคาพิเศษสำหรับเดือนมกราคมนี้", "images/poo1.jpg", 1500, 0, 0),
    Recipe("โปรโมชั่นรักษารากฟัน", "ราคาพิเศษสำหรับเดือนมกราคมนี", "images/rak.jpg", 1900, 0, 0),
    Recipe("โปรโมชั่นจัดฟันโลหะ", "ราคาพิเศษสำหรับเดือนมกราคมนี้", "images/jad.jpg", 2500, 0, 0),
  ];
}