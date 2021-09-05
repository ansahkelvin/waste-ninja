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
  final List<SplashModel> _data = [
    SplashModel(
      title: "Welcome to Waste Ninja",
      content: "Join us and make Ghana clean",
      image: "assets/images/31145.json",
    ),
    SplashModel(
      title: "Help keep Ghana Clean",
      content: "Join us and make Ghana clean",
      image: "assets/images/41248-cleaning-the-floor-to-destroy-germs.json",
    ),
    SplashModel(
      title: "Environment Cleanlines",
      content: "Join us and make Ghana clean",
      image: "assets/images/45858-garbage-collection.json",
    ),
    SplashModel(
      title: "Cleaning Services",
      content: "Join us and make Ghana clean",
      image: "assets/images/66890-covid-19-cleanup.json",
    ),
  ];

  List<SplashModel> get getData {
    return [..._data];
  }
}
