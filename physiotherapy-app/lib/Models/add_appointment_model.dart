class AppointmentModel {
  int? id;
  String name;
  String age;
  String address;
  String gender;
  String number;
  String description;
  String datetime;

  AppointmentModel(
      {this.id,
      required this.name,
      required this.age,
      required this.address,
      required this.gender,
      required this.number,
      required this.description,
      required this.datetime});

  factory AppointmentModel.fromMap(Map<String, dynamic> json) =>
      AppointmentModel(
          id: json['id'],
          name: json['name'],
          age: json['age'],
          gender: json['gender'],
          description: json['description'],
          number: json['number'],
          address: json['address'],
          datetime: json['datetime']);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "name": name,
      "age": age,
      "address": address,
      "gender": gender,
      "number": number,
      "description": description,
      "datetime": datetime
    };
    return map;
  }
}
