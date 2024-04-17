import 'package:flutter/material.dart';
import 'package:physiotherapy/Components/text_components.dart';
import 'package:physiotherapy/Components/textfield_component.dart';
import 'package:physiotherapy/Components/view_case_data_card.dart';
import 'package:physiotherapy/Database/add_case_database_components/addCase_database_helper.dart';
import 'package:physiotherapy/Models/add_case_model.dart';
import 'package:sizer/sizer.dart';

class ViewAllCasePage extends StatefulWidget {
  @override
  _ViewAllCasePageState createState() => _ViewAllCasePageState();
}

class _ViewAllCasePageState extends State<ViewAllCasePage> {
  TextEditingController _relieving = TextEditingController();
  TextEditingController _treatedBy = TextEditingController();
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
  TextEditingController _searchBarController = TextEditingController();

  List<CaseModel> caseData = [];

  late CaseDatabaseHelper caseDatabaseHelper;

  int currentIndex = 1;

  bool fetching = true;

  String keyword = "";

  @override
  void initState() {
    getCaseInfo();
    super.initState();
  }

  void getCaseInfo() async {
    caseDatabaseHelper = CaseDatabaseHelper();
    caseData = await caseDatabaseHelper.getData();
    setState(() {
      fetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                hintText: "SEARCH ALL CASES ",
                counterText: ""),
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: caseDatabaseHelper.searchCases(keyword),
        builder: (context, AsyncSnapshot<List<CaseModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error Occurred"));
          } else if (snapshot.hasData) {
            final List<CaseModel> caseList;
            if ((snapshot.data != null && snapshot.data?.length != 0)) {
              caseList = snapshot.data!;
            } else {
              caseList = caseData;
            }
            return ListView.builder(
              itemCount: caseList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Card(
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.w)),
                    elevation: 2,
                    child: CaseDataCard(
                      caseData: caseList[index],
                      edit: edit,
                      index: index,
                      delete: delete,
                      isShowButtons: true,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

      // fetching == true
      //     ? Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //     itemCount: caseData.length,
      //     itemBuilder: (context, index) => CaseDataCard(
      //       caseData: caseData[index],
      //       edit: edit,isShowButtons: true,
      //       delete: delete,
      //       index: index,
      //       // patientModel:
      //     )),
    );
  }

  void edit(index) {
    currentIndex = index;
    var data = caseData[index];
    _relieving.text = data.caseRelieving;
    _treatedBy.text = data.caseTreatedBy;
    _referredBy.text = data.caseReference;
    _symptoms.text = data.caseSymptoms;
    _aggravating.text = data.caseAggravating;
    _presentHistory.text = data.casePresentHistory;
    _surgicalHistory.text = data.caseSurgicalHistory;
    _pastHistory.text = data.casePastHistory;
    _medicalHistory.text = data.caseMedicalHistory;
    _familyHistory.text = data.caseFamilyHistory;
    _observationPosture.text = data.caseObservationPosture;
    _observationWasting.text = data.caseObservationWasting;
    _observationOedema.text = data.caseObservationOedema;
    _observationSwelling.text = data.caseObservationSwelling;
    _observationScar.text = data.caseObservationScar;
    _observationDeformity.text = data.caseObservationDeformity;
    _observationGAIT.text = data.caseObservationGait;
    _palpationTenderness.text = data.casePalpationTenderness;
    _palpationSpasm.text = data.casePalpationSpasm;
    _palpationTemperature.text = data.casePalpationTemperature;
    _palpationAbnormalSound.text = data.casePalpationAbnormalSound;
    _examinationROM.text = data.caseOnExaminationRom;
    _examinationMMT.text = data.caseOnExaminationMmt;
    _investigationXRAY.text = data.caseOnInvestigationXray;
    _investigationMRI.text = data.caseOnInvestigationMri;
    _otherReports.text = data.caseOtherInfoReports;
    _clinicalReports.text = data.caseOtherInfoClinical;

    showUpdateDialog();
  }

  delete(int index) {
    caseDatabaseHelper.delete(caseData[index].caseId!);
    setState(() {
      caseData.removeAt(index);
    });
  }

  void showUpdateDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildTitleText(text: "Case Details"),
                            CustomTextFormField(
                              controller: _treatedBy,
                              labelText: "Treated By",
                            ),
                            CustomTextFormField(
                                controller: _symptoms,
                                labelText: 'Symptoms '
                                    'Behaviour'),
                            CustomTextFormField(
                                controller: _aggravating,
                                labelText: "Aggravating Factor "),
                            CustomTextFormField(
                                controller: _relieving,
                                labelText: "Relieving "
                                    "Factor"),
                            CustomTextFormField(
                                controller: _referredBy,
                                labelText: "Referred By")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildTitleText(text: "Relevant Patient History"),
                            CustomTextFormField(
                                controller: _presentHistory,
                                labelText: "Present"),
                            CustomTextFormField(
                                controller: _pastHistory, labelText: "Past"),
                            CustomTextFormField(
                                controller: _medicalHistory,
                                labelText: "Medical"),
                            CustomTextFormField(
                                controller: _surgicalHistory,
                                labelText: "Surgical"),
                            CustomTextFormField(
                                controller: _familyHistory,
                                labelText: "Family"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            buildTitleText(text: "On Observation"),
                            CustomTextFormField(
                                controller: _observationPosture,
                                labelText: ""
                                    "Posture"),
                            CustomTextFormField(
                                controller: _observationWasting,
                                labelText: "Wasting"),
                            CustomTextFormField(
                                controller: _observationOedema,
                                labelText: "Oedema"),
                            CustomTextFormField(
                                controller: _observationSwelling,
                                labelText: "Swelling"),
                            CustomTextFormField(
                                controller: _observationScar,
                                labelText: "Scar"),
                            CustomTextFormField(
                                controller: _observationDeformity,
                                labelText: "Deformity"),
                            CustomTextFormField(
                                controller: _observationGAIT,
                                labelText: "GAIT"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildTitleText(text: "On Palpation"),
                            Column(
                              children: [
                                CustomTextFormField(
                                    controller: _palpationTenderness,
                                    labelText: "Tenderness"),
                                CustomTextFormField(
                                    controller: _palpationSpasm,
                                    labelText: "Spasm"),
                              ],
                            ),
                            CustomTextFormField(
                                controller: _palpationTemperature,
                                labelText: "Temperature"),
                            CustomTextFormField(
                                controller: _palpationAbnormalSound,
                                labelText: "Abnormal "
                                    "Sound"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          buildTitleText(text: "On Examination"),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                              controller: _examinationROM,
                              labelText: "ROM"
                                  ""),
                          CustomTextFormField(
                              controller: _examinationMMT, labelText: "MMT"),
                        ],
                      ),
                      Column(
                        children: [
                          buildTitleText(text: "On Investigation"),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                              controller: _investigationXRAY,
                              labelText: "X-RA"
                                  "Y"),
                          CustomTextFormField(
                              controller: _investigationMRI, labelText: "MRI")
                        ],
                      ),
                      Column(
                        children: [
                          buildTitleText(text: "Other Information"),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                              controller: _otherReports,
                              labelText: "Oth"
                                  "er Reports"),
                          CustomTextFormField(
                              controller: _clinicalReports,
                              labelText: "Clinical Diagnosis"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close")),
              TextButton(
                  onPressed: () {
                    CaseModel caseModel = caseData[currentIndex];
                    caseModel.caseRelieving = _relieving.text;
                    caseModel.caseTreatedBy = _treatedBy.text;
                    caseModel.caseReference = _referredBy.text;
                    caseModel.caseSymptoms = _symptoms.text;
                    caseModel.caseAggravating = _aggravating.text;
                    caseModel.casePresentHistory = _presentHistory.text;
                    caseModel.caseSurgicalHistory = _surgicalHistory.text;
                    caseModel.casePastHistory = _pastHistory.text;
                    caseModel.caseMedicalHistory = _medicalHistory.text;
                    caseModel.caseFamilyHistory = _familyHistory.text;
                    caseModel.caseObservationPosture = _observationPosture.text;
                    caseModel.caseObservationWasting = _observationWasting.text;
                    caseModel.caseObservationOedema = _observationOedema.text;
                    caseModel.caseObservationSwelling =
                        _observationSwelling.text;
                    caseModel.caseObservationScar = _observationScar.text;
                    caseModel.caseObservationDeformity =
                        _observationDeformity.text;
                    caseModel.caseObservationGait = _observationGAIT.text;
                    caseModel.casePalpationTenderness =
                        _palpationTenderness.text;
                    caseModel.casePalpationSpasm = _palpationSpasm.text;
                    caseModel.casePalpationTemperature =
                        _palpationTemperature.text;
                    caseModel.casePalpationAbnormalSound =
                        _palpationAbnormalSound.text;
                    caseModel.caseOnExaminationRom = _examinationROM.text;
                    caseModel.caseOnExaminationMmt = _examinationMMT.text;
                    caseModel.caseOnInvestigationXray = _investigationXRAY.text;
                    caseModel.caseOnInvestigationMri = _investigationMRI.text;
                    caseModel.caseOtherInfoReports = _otherReports.text;
                    caseModel.caseOtherInfoClinical = _clinicalReports.text;
                    setState(() {
                      caseDatabaseHelper.update(caseModel, caseModel.caseId!);
                    });
                    Navigator.pop(context);
                  },
                  child: Text("Update Case"))
            ],
          );
        });
  }
}
