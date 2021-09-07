class SplashModel {
  late String title;
  late String content;
  late String image;

  SplashModel({
    required this.title,
    required this.content,
    required this.image,
  });
}

class SplashData {
  static final List<SplashModel> data = [
    SplashModel(
      title: "Welcome to Waste Ninja",
      content: "Report any illegal dumping sites by taking pictures and tagging location to the waste commission of Ghana/nJoin us and make Ghana clean",
      image: "assets/images/31145.json",
    ),
    SplashModel(
      title: "Help keep Ghana Clean",
      content: "Support our cleaning exercises to make our roads clean by avoiding littering around the country",
      image: "assets/images/41248-cleaning-the-floor-to-destroy-germs.json",
    ),
    SplashModel(
      title: "Report Dumping sites",
      content: "Report any illegal dumping sites from a household around your area!! all you need is the location and pictures!",
      image: "assets/images/45858-garbage-collection.json",
    ),
    SplashModel(
      title: "Cleaning Services",
      content: "Book cleaning services for your commercial and enterprise events and even your household.",
      image: "assets/images/66890-covid-19-cleanup.json",
    ),
  ];

  
}
