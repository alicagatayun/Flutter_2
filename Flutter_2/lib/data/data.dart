class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel
      .setDesc("Yeni bir Pazar deneyimi ve üstelik pazar fiyatıyla aynı!");
  sliderModel.setTitle("Dikmen Pazarcım");
  sliderModel.setImageAssetPath("assets/logo.PNG");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Her hafta düzenli olarak kurulu pazarlardan uygun fiyatla alışverişinizi online yapın. Kapınıza getirelim.");
  sliderModel.setTitle("Dikmene Özel Pazar Alışverişi");
  sliderModel.setImageAssetPath("assets/pazar_Yeri.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Online olarak gerçekleştirip ödemesi alınan alışverişleriniz 1 saat içerisinde ücretsiz olarak teslim garantisi !");
  sliderModel.setTitle("Ücretsiz Teslimat");
  sliderModel.setImageAssetPath("assets/deliver.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
