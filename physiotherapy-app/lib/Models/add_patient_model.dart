class PatientModel {
  int? patientId;
  String abbreviation;
  String firstname;
  String middlename;
  String lastname;
  String age;
  String address;
  String city;
  String pincode;
  String gender;
  String number;
  String alternativenumber;
  String occupation;
  String? date;

  PatientModel(
      {this.patientId,
      required this.abbreviation,
      required this.firstname,
      required this.middlename,
      required this.lastname,
      required this.age,
      required this.address,
      required this.city,
      required this.pincode,
      required this.gender,
      required this.number,
      required this.alternativenumber,
      required this.occupation,
      this.date}); //
  // PatientModel(
  //     {this.patientId,
  //     this.date,
  //     required this.firstname,
  //     required this.lastname,
  //     required this.age,
  //     required this.address,
  //     required this.gender,
  //     required this.number,
  //     required this.occupation,
  //     });

  factory PatientModel.fromMap(Map<String, dynamic> json) => PatientModel(
        patientId: json['patientId'],
        firstname: json['firstname'],
        age: json['age'],
        gender: json['gender'],
        occupation: json['occupation'],
        number: json['number'],
        lastname: json['lastname'],
        date: json['date'],
        address: json['address'],
        alternativenumber: json['alternative_Number'],
        pincode: json['pincode'],
        middlename: json['middlename'],
        city: json['city'],
        abbreviation: json['abbreviation'],
      );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "patientId": patientId,
      "firstname": firstname,
      "lastname": lastname,
      "age": age,
      "address": address,
      "gender": gender,
      "number": number,
      "date": date,
      "occupation": occupation,
      "abbreviation" : abbreviation,
      "middlename" : middlename,
      "city" : city,
      "pincode" : pincode,
      "alternative_Number" : alternativenumber,

    };

    return map;
  }
}
