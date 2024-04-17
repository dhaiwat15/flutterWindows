import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:physiotherapy/Components/category_list_components.dart';
import 'package:physiotherapy/Components/text_components.dart';
import 'package:physiotherapy/Components/textfield_component.dart';
import 'package:physiotherapy/Database/patient_%20database_component/patient_database_helper.dart';
import 'package:physiotherapy/Models/add_patient_model.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite/sqflite.dart';

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({Key? key}) : super(key: key);

  @override
  _AddPatientPageState createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  List<PatientModel> datas = [];

  late PatientDatabaseHelper patientDatabaseHelper;

  int currentIndex = 1;

  DateTime now = DateTime.now();

  // DateFormat dateFormat = DateFormat("dd-MM-yyyy-(kk:mm)");

  String dropdownGender = "MALE";
  String dropdownAbbreviation = 'MR';

  var itemsForGender = ListComponents.genderList;

  var itemsForAbbreviation = ListComponents.abbreviations;

  late String dateAndTime;

  Future<String> getMyDatabasePath()async{
    String path = await getDatabasesPath();
    return path;
  }

  @override
  void initState() {
    super.initState();

    patientDatabaseHelper = PatientDatabaseHelper();
    dateAndTime = formatDate(now.toString());
    print("Database path: ");

  }

  var _selectedGender;

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _occupation = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController _alternativeNumber = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _pincode = TextEditingController();

  TextEditingController dateTimeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: buildTitleText(text: "ADD PATIENT PAGE"),
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.all(1.0.w),
                child: buildTitleText(text: "ENTER NAME"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 2.0.w),
                  Container(
                    height: 7.6.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: DropdownButton(
                        value: dropdownAbbreviation,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: itemsForAbbreviation.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownAbbreviation = value!;
                            debugPrint('${dropdownAbbreviation}');
                          });
                        },
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    controller: _firstName,
                    labelText: "FIRST NAME",
                    maxNumberLength: 25,
                    height: 8.5.h,
                    width: 40.w,
                    inputType: TextInputType.name,
                    validate: true,
                  ),
                  CustomTextFormField(
                    controller: middleName,
                    labelText: "MIDDLE NAME",
                    maxNumberLength: 25,
                    height: 8.5.h,
                    width: 40.w,
                    inputType: TextInputType.name,
                    validate: false,
                  ),
                  CustomTextFormField(
                    controller: _lastName,
                    labelText: "LAST NAME",
                    maxNumberLength: 25,
                    height: 8.5.h,
                    width: 40.w,
                    inputType: TextInputType.name,
                    validate: true,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(1.0.w),
                child: buildTitleText(text: 'OTHER INFORMATION'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 2.0.w),
                  Container(
                    height: 7.6.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: DropdownButton(
                        value: dropdownGender,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: itemsForGender.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownGender = value!;
                            debugPrint('${dropdownGender}');
                          });
                        },
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    controller: _occupation,
                    labelText: "OCCUPATION",
                    maxNumberLength: 25,
                    height: 8.5.h,
                    validate: true,
                    width: 40.w,
                  ),
                  CustomTextFormField(
                    controller: _age,
                    labelText: "AGE",
                    width: 40.w,
                    inputType: TextInputType.number,
                    height: 8.5.h,
                    maxNumberLength: 2,
                    validate: true,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(1.0.w),
                child: buildTitleText(text: 'CONTACT INFORMATION'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 2.0.w),
                  CustomTextFormField(
                    controller: _address,
                    labelText: "HOUSE/FLAT NUMBER",
                    height: 8.5.h,
                    inputType: TextInputType.streetAddress,
                    maxInputLine: 6,
                    maxNumberLength: 200,
                    validate: true,
                    width: 40.w,
                  ),
                  CustomTextFormField(
                    controller: _city,
                    labelText: "CITY",
                    height: 8.5.h,
                    inputType: TextInputType.streetAddress,
                    maxInputLine: 6,
                    maxNumberLength: 200,
                    validate: true,
                    width: 40.w,
                  ),
                  CustomTextFormField(
                    controller: _pincode,
                    labelText: "PIN CODE",
                    height: 8.5.h,
                    inputType: TextInputType.streetAddress,
                    maxInputLine: 6,
                    maxNumberLength: 200,
                    validate: false,
                    width: 40.w,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 2.0.w),
                  CustomTextFormField(
                    controller: _mobileNumber,
                    labelText: "PHONE NUMBER",
                    inputType: TextInputType.phone,
                    maxNumberLength: 10,
                    validate: true,
                    height: 8.5.h,
                    width: 40.w,
                  ),
                  CustomTextFormField(
                    controller: _alternativeNumber,
                    labelText: "ALTERNATIVE NUMBER",
                    inputType: TextInputType.phone,
                    maxNumberLength: 10,
                    validate: false,
                    height: 8.5.h,
                    width: 40.w,
                  ),
                  SizedBox(
                      width: 40.w,
                      child: Padding(
                        padding:EdgeInsets.all(1.0.w),
                        child: DateTimePicker(
                            // controller: dateTimeController,
                            type: DateTimePickerType.dateTimeSeparate,
                            dateMask: 'dd, MM, yyyy',
                            initialValue: DateTime.now().toString(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2100),
                            dateLabelText: 'Case Date',
                            timeLabelText: "Hour",
                            selectableDayPredicate: (date) {
                              // // Disable weekend days to select
                              // // from the calendar
                              //  if (date.weekday == 6 || date.weekday == 7) {
                              //    return false;
                              //  }
                              return true;
                            },
                            onChanged: (pickedDateTime) {
                              dateAndTime = formatDate(pickedDateTime);
                              print(dateAndTime);
                              formatDate(pickedDateTime);
                            },
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (savedDateTime) {
                              dateAndTime = formatDate(savedDateTime!);
                              print(dateAndTime);
                            }),
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50.w, 2.5.h, 50.w, 2.5.h),
                child: SizedBox(
                  height: 5.h,
                  width: 75.w,
                  child: MaterialButton(
                    color: Colors.black,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    splashColor: Colors.white70,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        PatientModel patientModelLocal = PatientModel(
                            firstname: _firstName.text.toUpperCase(),
                            lastname: _lastName.text.toUpperCase(),
                            age: _age.text,
                            number: _mobileNumber.text.toUpperCase(),
                            address: _address.text.toUpperCase(),
                            gender: dropdownGender.toUpperCase(),
                            occupation: _occupation.text.toUpperCase(),
                            date: dateAndTime,
                            alternativenumber:
                                _alternativeNumber.text.toUpperCase(),
                            pincode: _pincode.text,
                            middlename: middleName.text.toUpperCase(),
                            city: _city.text.toUpperCase(),
                            abbreviation: dropdownAbbreviation.toUpperCase());
                        patientDatabaseHelper
                            .insert(patientModelLocal)
                            .then((value) {
                          _firstName.clear();
                          _lastName.clear();
                          _age.clear();
                          _address.clear();
                          _mobileNumber.clear();
                          _occupation.clear();
                          _alternativeNumber.clear();
                          _city.clear();
                          middleName.clear();
                          _pincode.clear();
                          _selectedGender = null;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Patient added successfully"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        });
                      } else {
                        return null;
                      }
                      //   patientDatabaseHelp   er.insert(patientModelLocal);
                      //   // patientModelLocal.id = datas[datas.length - 1].id! + 1;
                      //   datas.add(patientModelLocal);
                      //
                      // setState(() {
                      //   datas.add(patientModelLocal);
                      //   }
                      //  });
                    },
                    child: Text("REGISTER PATIENT"),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  String formatDate(String dateTime) {
    DateTime _datetime = DateTime.parse(dateTime);
    String formattedDate = DateFormat('dd-MM-yyyy').format(_datetime);
    return formattedDate;
  }
}
