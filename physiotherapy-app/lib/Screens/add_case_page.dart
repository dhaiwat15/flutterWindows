import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:physiotherapy/Components/text_components.dart';
import 'package:physiotherapy/Components/textfield_component.dart';
import 'package:physiotherapy/Database/add_case_database_components/addCase_database_helper.dart';
import 'package:physiotherapy/Models/add_case_model.dart';
import 'package:physiotherapy/Screens/select_treatment_page.dart';
import 'package:sizer/sizer.dart';

class AddCaseScreen extends StatefulWidget {
  var id;

  AddCaseScreen({this.id});

  @override
  _AddCaseScreenState createState() => _AddCaseScreenState();
}

List<CaseModel> caseDatabaseModel = [];

String dateAndTime = "";

late CaseDatabaseHelper caseDatabaseHelper;

TextEditingController _relieving = TextEditingController();
TextEditingController _treatedBy = TextEditingController();
TextEditingController _chiefComplaint = TextEditingController();
TextEditingController _referredBy = TextEditingController();
TextEditingController _symptoms = TextEditingController();
TextEditingController _aggravating = TextEditingController();
TextEditingController _presentHistory = TextEditingController();
TextEditingController _surgicalHistory = TextEditingController();
TextEditingController _pastHistory = TextEditingController();
TextEditingController _medicalHistory = TextEditingController();
TextEditingController _familyHistory = TextEditingController();
TextEditingController _observationPosture = TextEditingController();
TextEditingController _observationWasting = TextEditingController();
TextEditingController _observationOedema = TextEditingController();
TextEditingController _observationSwelling = TextEditingController();
TextEditingController _observationScar = TextEditingController();
TextEditingController _observationDeformity = TextEditingController();
TextEditingController _observationGAIT = TextEditingController();
TextEditingController _palpationTenderness = TextEditingController();
TextEditingController _palpationSpasm = TextEditingController();
TextEditingController _palpationTemperature = TextEditingController();
TextEditingController _palpationAbnormalSound = TextEditingController();
TextEditingController _examinationROM = TextEditingController();
TextEditingController _examinationMMT = TextEditingController();
TextEditingController _investigationXRAY = TextEditingController();
TextEditingController _investigationMRI = TextEditingController();
TextEditingController _otherReports = TextEditingController();
TextEditingController _clinicalReports = TextEditingController();

class _AddCaseScreenState extends State<AddCaseScreen> {
  late String dateAndTime;

  @override
  void initState() {
    super.initState();
    caseDatabaseHelper = CaseDatabaseHelper();
    dateAndTime = formatDate(now.toString());
  }

  DateTime now = DateTime.now();
  GlobalKey<FormState> _caseFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Add Case",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _caseFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: buildTitleText(text: "Case Details"),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: _treatedBy,
                      labelText: "Treated By",
                      validate: true,
                    ),
                    CustomTextFormField(
                      validate: true,
                      controller: _chiefComplaint,
                      labelText: "Chief Complaint",
                    ),
                    CustomTextFormField(
                        validate: true,
                        controller: _symptoms,
                        labelText: 'Symptoms '
                            'Behaviour'),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                        validate: true,
                        controller: _aggravating,
                        labelText: "Aggravating Factor "),
                    CustomTextFormField(
                        validate: true,
                        controller: _relieving,
                        labelText: "Relieving "
                            "Factor"),
                    CustomTextFormField(
                        controller: _referredBy, labelText: "Referred By"),
                  ],
                ),
                SizedBox(height: 1.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1.0.w),
                      child: buildTitleText(text: "Patient Relevant History"),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                            validate: true,
                            controller: _presentHistory,
                            labelText: "Present"),
                        CustomTextFormField(
                            validate: true,
                            controller: _pastHistory,
                            labelText: "Past"),
                        CustomTextFormField(
                            validate: true,
                            controller: _medicalHistory,
                            labelText: "Medical"),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                            validate: true,
                            controller: _surgicalHistory,
                            labelText: "Surgical"),
                        CustomTextFormField(
                            validate: true,
                            controller: _familyHistory,
                            labelText: "Family"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0.w),
                          child: buildTitleText(text: "On Observation"),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextFormField(
                                validate: true,
                                controller: _observationPosture,
                                labelText: ""
                                    "Posture"),
                            CustomTextFormField(
                                validate: true,
                                controller: _observationWasting,
                                labelText: "Wasting"),
                            CustomTextFormField(
                                validate: true,
                                controller: _observationOedema,
                                labelText: "Oedema"),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextFormField(
                                validate: true,
                                controller: _observationSwelling,
                                labelText: "Swelling"),
                            CustomTextFormField(
                                validate: true,
                                controller: _observationScar,
                                labelText: "Scar"),
                            CustomTextFormField(
                                validate: true,
                                controller: _observationDeformity,
                                labelText: "Deformity"),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        CustomTextFormField(
                            validate: true,
                            controller: _observationGAIT,
                            labelText: "GAIT"),
                        SizedBox(height: 1.h),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 1.0.w),
                                child: buildTitleText(text: "Palpation"),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextFormField(
                                      validate: true,
                                      controller: _palpationTenderness,
                                      labelText: "Tenderness"),
                                  CustomTextFormField(
                                      validate: true,
                                      controller: _palpationSpasm,
                                      labelText: "Spasm"),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextFormField(
                                      validate: true,
                                      controller: _palpationTemperature,
                                      labelText: "Temperature"),
                                  CustomTextFormField(
                                      validate: true,
                                      controller: _palpationAbnormalSound,
                                      labelText: "Abnormal "
                                          "Sound"),
                                ],
                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0.w),
                          child: buildTitleText(text: "On\nInvestigation"),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        CustomTextFormField(
                            validate: true,
                            controller: _investigationXRAY,
                            labelText: "X-RA"
                                "Y"),
                        CustomTextFormField(
                            validate: true,
                            controller: _investigationMRI,
                            labelText: "MRI")
                      ],
                    ),
                    SizedBox(width: 2.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0.w),
                          child: buildTitleText(text: "Other\nInformation"),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        CustomTextFormField(
                            validate: true,
                            controller: _otherReports,
                            labelText: "Oth"
                                "er Reports"),
                        CustomTextFormField(
                            validate: true,
                            controller: _clinicalReports,
                            labelText: "Clinical  Diagnosis"),
                      ],
                    ),
                    SizedBox(width: 2.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0.w),
                          child: buildTitleText(text: "On\nExamination"),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        CustomTextFormField(
                            validate: true,
                            controller: _examinationROM,
                            labelText: "ROM"
                                ""),
                        CustomTextFormField(
                            validate: true,
                            controller: _examinationMMT,
                            labelText: "MMT"),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0.w),
                        child: SizedBox(
                            width: 25.w,
                            child: DateTimePicker(
                                // controller: dateTimeController,
                                type: DateTimePickerType.date,
                                dateMask: 'dd, MM, yyyy',
                                initialValue: DateTime.now().toString(),
                                firstDate: DateTime(2021),
                                lastDate: DateTime(2100),
                                dateLabelText: 'Date',
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
                                })),
                      ),
                      SizedBox(
                        height: 5.h,
                        width: 30.w,
                        child: MaterialButton(
                            color: Colors.black,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            splashColor: Colors.white70,
                            child: Text("Save Case"),
                            onPressed: () {
                              if (_caseFormKey.currentState!.validate()) {
                                CaseModel caseModelLocal = CaseModel(
                                  patientId: widget.id,
                                  dateTime: dateAndTime,
                                  caseTreatedBy: _treatedBy.text.toUpperCase(),
                                  chiefComplaint:
                                      _chiefComplaint.text.toUpperCase(),
                                  caseSymptoms: _symptoms.text.toUpperCase(),
                                  caseAggravating:
                                      _aggravating.text.toUpperCase(),
                                  caseRelieving: _relieving.text.toUpperCase(),
                                  caseReference: _referredBy.text.toUpperCase(),
                                  casePresentHistory:
                                      _presentHistory.text.toUpperCase(),
                                  casePastHistory:
                                      _pastHistory.text.toUpperCase(),
                                  caseMedicalHistory:
                                      _medicalHistory.text.toUpperCase(),
                                  caseSurgicalHistory:
                                      _surgicalHistory.text.toUpperCase(),
                                  caseFamilyHistory:
                                      _familyHistory.text.toUpperCase(),
                                  caseObservationPosture:
                                      _observationPosture.text.toUpperCase(),
                                  caseObservationWasting:
                                      _observationWasting.text.toUpperCase(),
                                  caseObservationOedema:
                                      _observationOedema.text.toUpperCase(),
                                  caseObservationSwelling:
                                      _observationSwelling.text.toUpperCase(),
                                  caseObservationScar:
                                      _observationScar.text.toUpperCase(),
                                  caseObservationDeformity:
                                      _observationDeformity.text.toUpperCase(),
                                  caseObservationGait:
                                      _observationGAIT.text.toUpperCase(),
                                  casePalpationTenderness:
                                      _palpationTenderness.text.toUpperCase(),
                                  casePalpationSpasm:
                                      _palpationSpasm.text.toUpperCase(),
                                  casePalpationTemperature:
                                      _palpationTemperature.text.toUpperCase(),
                                  casePalpationAbnormalSound:
                                      _palpationAbnormalSound.text
                                          .toUpperCase(),
                                  caseOnExaminationRom:
                                      _examinationROM.text.toUpperCase(),
                                  caseOnExaminationMmt:
                                      _examinationMMT.text.toUpperCase(),
                                  caseOnInvestigationXray:
                                      _investigationXRAY.text.toUpperCase(),
                                  caseOnInvestigationMri:
                                      _investigationMRI.text.toUpperCase(),
                                  caseOtherInfoReports:
                                      _otherReports.text.toUpperCase(),
                                  caseOtherInfoClinical:
                                      _clinicalReports.text.toUpperCase(),
                                );
                                caseDatabaseHelper
                                    .insert(caseModelLocal)
                                    .then((value) {
                                  debugPrint("${value}");
                                  caseModelLocal.caseId = value;
                                  _treatedBy.clear();
                                  _chiefComplaint.clear();
                                  _symptoms.clear();
                                  _aggravating.clear();
                                  _relieving.clear();
                                  _referredBy.clear();
                                  _presentHistory.clear();
                                  _pastHistory.clear();
                                  _medicalHistory.clear();
                                  _surgicalHistory.clear();
                                  _familyHistory.clear();
                                  _observationPosture.clear();
                                  _observationWasting.clear();
                                  _observationOedema.clear();
                                  _observationSwelling.clear();
                                  _observationScar.clear();
                                  _observationDeformity.clear();
                                  _observationGAIT.clear();
                                  _palpationAbnormalSound.clear();
                                  _palpationTemperature.clear();
                                  _palpationSpasm.clear();
                                  _palpationTenderness.clear();
                                  _examinationROM.clear();
                                  _examinationMMT.clear();
                                  _investigationMRI.clear();
                                  _investigationXRAY.clear();
                                  _otherReports.clear();
                                  _clinicalReports.clear();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Case added successfully"),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SelectTreatmentPage(
                                                caseId: caseModelLocal.caseId,
                                              )));
                                });
                                // .then((value) => {
                                //   debugPrint("${value}"),
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   SelectTreatmentPage(
                                //                     caseId:
                                //                     caseModelLocal.caseId,
                                //                   )))
                                //     });
                                //  caseDatabaseModel.add(caseModelLocal);
                              }
                            }),
                      ),
                      SizedBox(
                        width: 55,
                      ),
                      SizedBox(
                        height: 5.h,
                        width: 30.w,
                        child: MaterialButton(
                            color: Colors.black,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            splashColor: Colors.white70,
                            height: 45,
                            minWidth: 100,
                            onPressed: () {
                              _treatedBy.clear();
                              _chiefComplaint.clear();
                              _symptoms.clear();
                              _aggravating.clear();
                              _relieving.clear();
                              _referredBy.clear();
                              _presentHistory.clear();
                              _pastHistory.clear();
                              _medicalHistory.clear();
                              _surgicalHistory.clear();
                              _familyHistory.clear();
                              _observationPosture.clear();
                              _observationWasting.clear();
                              _observationOedema.clear();
                              _observationSwelling.clear();
                              _observationScar.clear();
                              _observationDeformity.clear();
                              _observationGAIT.clear();
                              _palpationAbnormalSound.clear();
                              _palpationTemperature.clear();
                              _palpationSpasm.clear();
                              _palpationTenderness.clear();
                              _examinationROM.clear();
                              _examinationMMT.clear();
                              _investigationMRI.clear();
                              _investigationXRAY.clear();
                              _otherReports.clear();
                              _clinicalReports.clear();
                            },
                            child: Text("Clear All Field")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatDate(String dateTime) {
    DateTime _datetime = DateTime.parse(dateTime);
    String formattedDate = DateFormat('dd-MM-yyyy').format(_datetime);
    return formattedDate;
  }
}
