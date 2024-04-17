import 'package:flutter/material.dart';
import 'package:physiotherapy/Components/textfield_component.dart';
import 'package:physiotherapy/Components/view_patient_data_card.dart';
import 'package:physiotherapy/Database/add_case_database_components/addCase_database_helper.dart';
import 'package:physiotherapy/Database/patient_%20database_component/patient_database_helper.dart';
import 'package:physiotherapy/Models/add_patient_model.dart';
import 'package:sizer/sizer.dart';

class ViewPatientPage extends StatefulWidget {
  const ViewPatientPage({Key? key}) : super(key: key);

  @override
  _ViewPatientPageState createState() => _ViewPatientPageState();
}

class _ViewPatientPageState extends State<ViewPatientPage> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _occupation = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _searchBarController = TextEditingController();
  TextEditingController _middleName = TextEditingController();
  TextEditingController _alternativeNumber = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _pincode = TextEditingController();

  List<PatientModel> datas = [];

  String keyword = "";

  late PatientDatabaseHelper patientDatabaseHelper;

  late CaseDatabaseHelper caseDatabaseHelper;

  int currentIndex = 0;
  bool fetching = true;

  @override
  void initState() {
    super.initState();
    getData2();
  }

  void getData2() async {
    patientDatabaseHelper = PatientDatabaseHelper();
    datas = await patientDatabaseHelper.getData();
    setState(() {
      fetching = false;
    });
  }

  String dropdownValue = "";

  var items = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            maxLength: 25,
            controller: _searchBarController,
            onChanged: (value) {
              setState(() {
                keyword = value;
              });
            },
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                counterText: ""),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: patientDatabaseHelper.searchPatient(keyword),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error Occurred"));
          } else if (snapshot.hasData) {
            final List dataList;
            if ((snapshot.data != null && snapshot.data is List)) {
              dataList = (snapshot.data! as List);
            } else {
              dataList = [];
            }
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.w)),
                  elevation: 2,
                  child: PatientDataCard(
                    data: dataList[index],
                    edit: edit,
                    index: index,
                    delete: delete,
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  delete(int index) {
    patientDatabaseHelper.delete(datas[index].patientId!);
    setState(() {
      datas.removeAt(index);
    });
  }

  void edit(index) {
    currentIndex = index;
    var data = datas[index];
    _firstName.text = data.firstname;
    _lastName.text = data.lastname;
    _age.text = data.age;
    _mobileNumber.text = data.number;
    _address.text = data.address;
    _gender.text = data.gender;
    _occupation.text = data.occupation;
    _pincode.text = data.pincode;
    _middleName.text = data.middlename;
    _alternativeNumber.text = data.alternativenumber;
    _city.text = data.city;
    showUpdateDialog();
  }

  void showUpdateDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(14),
            content: SingleChildScrollView(
              child: Container(
                height: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextFormField(
                      controller: _firstName,
                      labelText: "Enter First Name",
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      controller: _middleName,
                      labelText: 'Enter Middle Name',
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      controller: _lastName,
                      labelText: 'enter last name',
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      controller: _age,
                      labelText: 'enter your Age',
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      controller: _mobileNumber,
                      labelText: 'enter your Mobile '
                          'Number',
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      controller: _address,
                      labelText: 'enter your Address',
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      controller: _pincode,
                      labelText: 'enter your Pincode',
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      controller: _city,
                      labelText: 'enter your City',
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      controller: _gender,
                      labelText: 'enter your Gender',
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      controller: _alternativeNumber,
                      labelText: "enter your Alternative Number",
                      height: 5.h,
                    ),
                    CustomTextFormField(
                      controller: _occupation,
                      labelText: "enter your "
                          "Occupation",
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      PatientModel patientData = datas[currentIndex];
                      patientData.firstname = _firstName.text;
                      patientData.lastname = _lastName.text;
                      patientData.age = _age.text;
                      patientData.gender = _gender.text;
                      patientData.address = _address.text;
                      patientData.number = _mobileNumber.text;
                      patientData.occupation = _occupation.text;
                      patientData.city = _city.text;
                      patientData.alternativenumber = _alternativeNumber.text;
                      patientData.pincode = _pincode.text;
                      patientData.middlename = _middleName.text;
                      patientDatabaseHelper.update(
                          patientData, patientData.patientId!);

                      Navigator.pop(context);
                    });
                  },
                  child: Text("Save New Details"))
            ],
          );
        });
  }
}
