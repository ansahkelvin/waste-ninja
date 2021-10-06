
class Report {
  final String location;
  final String image;
  final String additionalInfo;
  final double latitude;
  final double longitude; //
  final String userId;

  Report( {
   required this.latitude,required this.longitude,required this.userId,
    required this.location,
    required this.image,
    required this.additionalInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      "additional_info": additionalInfo,
      "latitude":latitude,
      "longitude": longitude,
      "place_name": location,
      "image_url": image,
      "user_id": userId,
    };
  }
}
