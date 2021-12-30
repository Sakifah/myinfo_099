class Anime {
  String? animeId;
  String? animeName;
  String? animeTName;
  bool checked = false;

  Anime(this.animeId,this.animeName,this.animeTName,this.checked);
  
  static List<Anime> getAnime() {
    return[
      Anime('00001', 'Jujutsu Kaisen', 'มหาเวทผนึกมาร',false),
      Anime('00002', 'SK8 the Infinity','SK8 the Infinity' ,false),
      Anime('00003', 'Tensei shitara Slime Datta Ken', 'เกิดใหม่ทั้งทีก็เป็นสไลม์ไปซะแล้ว',false),
      Anime('00004', 'Kemono Jihen','คดีประหลาดคนปีศาจ' ,false),
      Anime('00005', 'Kai Byoui Ramune','คุณหมอประหลาด รามุเนะ' ,false),
      Anime('00006', 'Mushoku Tensei','เกิดชาตินี้พี่ต้องเทพ' ,false),
    ];

  }
}