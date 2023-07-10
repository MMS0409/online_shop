
// "lat": "-37.3159",
// "long": "81.1496"

class GeolocationModel{
  final String lat;
  final String long;

  GeolocationModel({
    required this.lat,
    required this.long,
  });

  factory GeolocationModel.fromJson(Map<String,dynamic> json){
    return GeolocationModel(
      lat: json["lat"] as String? ?? '',
      long: json["long"] as String? ?? '',
    );
  }
}