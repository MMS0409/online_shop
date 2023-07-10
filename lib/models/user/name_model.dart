
// "firstname": "john",
// "lastname": "doe"

class NameModel{
  final String firstname;
  final String lastname;

  NameModel({
    required this.firstname,
    required this.lastname
  });

  factory NameModel.fromJson(Map<String,dynamic> json){
    return NameModel(firstname: json["firstname"], lastname: json["lastname"]);
  }
}