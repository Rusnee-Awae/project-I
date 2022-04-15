import 'package:cloud_firestore/cloud_firestore.dart';
CollectionReference Profile = FirebaseFirestore.instance.collection("Profile");

class PlanetInfo {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  PlanetInfo(
      this.position, {
        this.name,
        this.iconImage,
        this.description,
        this.images,
      });
}

List<PlanetInfo> planets = [
  PlanetInfo(1,
      name: 'Paracetamol',
      iconImage: 'assets/mercury.png',
      description:
      "การออกฤทธิ์ของยาพาราเซตามอลจะเข้าไปยับยั้งสารเคมีในสมอง เช่น สารพรอสตาแกลนดิน (Prostaglandins) ที่เกี่ยวข้องกับอาการปวด และทำให้อุณหภูมิของร่างกายลดลงได้ด้วยการยับยั้งสารในสมองส่วนที่มีหน้าที่ควบคุมอุณหภูมิของร่างกาย ซึ่งยาพาราจะออกฤทธิ์ภายใน 30 นาทีโดยประมาณหลังจากรับประทาน และออกฤทธิ์ต่อเนื่องได้นาน 4-6 ชั่วโมง",
      images: [
        'https://www.doctorraksa.com/th-TH/wp-content/uploads/2021/07/paracetamol.jpg',
        'https://www.doctorraksa.com/th-TH/wp-content/uploads/2021/07/paracetamol-syrup.jpg',
        'https://www.doctorraksa.com/th-TH/wp-content/uploads/2021/07/paracetamol-interations.jpg',

      ]),
  PlanetInfo(2,
      name: 'Chlorhexidine gluconate',
      iconImage: 'assets/venus.png',
      description:
      "ใช้อมกลั้วในช่องปาก ครั้งละ 15 ml เป็นเวลา 30-60 วินาทีแล้วบ้วนทิ้ง วันละ 2 ครั้งหลังอาหารเช้าและก่อนนอน โดยไม่ต้องบ้วนน้ำหรือแปรงฟันตามควรใช้หลังจากขูดหินปูนหรือขัดฟันทำความสะอาดช่องปากโดยทันตบุคลากร",
      images: [
        'https://cdn.shopify.com/s/files/1/0996/0350/products/Chlorhexidine_Gluconate_Mouthwash_Oral_Rinse_Mint_16_oz.jpg?v=1600354368',
        'https://m.media-amazon.com/images/I/71sBkpXuNKL._AC_SX450_.jpg',
      ]),
  PlanetInfo(3,
      name: ' Amoxicillin',
      iconImage: 'assets/earth.png',
      description:
      "Amoxicillin 500mg ครั้งละ 1-2 เม็ด 3 เวลา ควรใช้ให้ครบ dose คือติดต่อกัน 5 วันขึ้นไป แต่ไม่ควรซื้อมากินเอง เพราะคุณๆอาจแพ้ได้ ควรได้รับการสั่งยาจากทันตแพทย์ก่อน",
      images: [
        'https://www.doctorraksa.com/th-TH/wp-content/uploads/2021/05/Raksa-Attached-1.jpg',
        'https://res.cloudinary.com/dk0z4ums3/image/upload/v1637737073/attached_image_th/antibioticpillgreenandbluecolourcapsules.jpg',
        'https://www.rama.mahidol.ac.th/ramachannel/wp-content/uploads/2016/08/1-13.png',
        'https://www.doctorraksa.com/th-TH/wp-content/uploads/2021/05/Raksa-Attached-2.jpg'
      ]),
  PlanetInfo(4,
      name: 'metronidazole',
      iconImage: 'assets/mars.png',
      description:
      "metronidazole 200-250mg ซึ่งเป็นยาที่ได้ผลดี ต่อเชื้อแบคทีเรียชนิดนี้ ครั้งละ 1 เม็ด วันละ 3 ครั้ง หลังอาหารทันทีเพราะยานี้อาจระคายเคืองต่อทางเดินอาหารได้ ควรใช้ยานี้ติดต่อจน ครบเช่นเดียวกับยาปฏิชีวนะชนิดอื่นๆ",
      images: [
        'https://www.spdrug.com/administrator/product/images/P21062018142624.jpg',
        'https://static.hdmall.co.th/system/image_attachments/images/000/123/455/original/Metrolex_%28Metronidazole_400_mg%29_%281%29.jpg',
      ]),
];