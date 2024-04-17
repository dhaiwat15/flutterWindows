import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:physiotherapy/Database/appointment_database_component/appointment_database_helper.dart';
import 'package:physiotherapy/Models/add_appointment_model.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  List<AppointmentModel> datas = [];
  late AppointmentDatabaseHelper appointmentDatabaseHelper;
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    appointmentDatabaseHelper = AppointmentDatabaseHelper();
  }

  var _selectedGender;

  var id = 0;

  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _mobilNumber = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _dateAndTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointments",
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: 840,
          width: 1024,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: SizedBox(
                  height: 52.8,
                  width: 250,
                  child: TextFormField(
                    controller: _name,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Name",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: SizedBox(
                  height: 50,
                  width: 55,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    maxLength: 3,
                    controller: _age,
                    decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Age"),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: SizedBox(
                  width: 515,
                  child: TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    maxLines: 3,
                    maxLength: 200,
                    controller: _address,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Address",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Radio(
                      value: "Male",
                      groupValue: _selectedGender,
                      onChanged: (val) {
                        setState(() {
                          print(val);
                          _selectedGender = val;
                        });
                      }),
                  Text('Male'),
                  Radio(
                      value: "Female",
                      groupValue: _selectedGender,
                      onChanged: (val) {
                        setState(() {
                          _selectedGender = val;
                        });
                      }),
                  Text('Female'),
                  Radio(
                      value: "Other",
                      groupValue: _selectedGender,
                      onChanged: (val) {
                        setState(() {
                          _selectedGender = val;
                        });
                      }),
                  Text('Other'),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 15,
                child: SizedBox(
                  width: 515,
                  child: TextFormField(
                    controller: _mobilNumber,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Mobile Number",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 15,
                child: SizedBox(
                  width: 515,
                  child: TextFormField(
                    controller: _description,
                    keyboardType: TextInputType.text,
                    maxLength: 25,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Description",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: 355,
                  child: DateTimePicker(
                    // controller: _dateAndTime,
                    type: DateTimePickerType.dateTimeSeparate,
                    dateMask: 'dd, MM, yyyy',
                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Date',
                    timeLabelText: "Hour",
                    selectableDayPredicate: (date) {
                      // Disable weekend days to select from the calendar
                      // if (date.weekday == 6 || date.weekday == 7) {
                      //   return false;
                      // }

                      return true;
                    },
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                  )),

              SizedBox
                (
                height: 25,
                ),
              SizedBox(
                height: 35,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    AppointmentModel appointmentModelLocal = AppointmentModel(
                      name: _name.text,
                      age: _age.text,
                      gender: _selectedGender,
                      address: _address.text,
                      description: _description.text,
                      number: _mobilNumber.text,
                      datetime: _dateAndTime.text,
                    );
                    appointmentDatabaseHelper.insert(appointmentModelLocal);
                    setState(() {
                      datas.add(appointmentModelLocal);
                    });
                  },
                  child: Text("Add Appointment"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
