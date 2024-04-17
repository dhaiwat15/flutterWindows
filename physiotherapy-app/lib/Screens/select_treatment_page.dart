import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:physiotherapy/Components/bottom_nav_bar.dart';
import 'package:physiotherapy/Components/category_list_components.dart';
import 'package:physiotherapy/Components/text_components.dart';
import 'package:physiotherapy/Components/textfield_component.dart';
import 'package:physiotherapy/Database/add_case_treatment_plan/add_case_treatment_helper.dart';
import 'package:physiotherapy/Database/treatment_database_components/treatment_database_helper.dart';
import 'package:physiotherapy/Models/add_case_treatment_model.dart';
import 'package:physiotherapy/Models/add_treatment_model.dart';
import 'package:sizer/sizer.dart';


class SelectTreatmentPage extends StatefulWidget {
  var caseId;

  SelectTreatmentPage({this.caseId}) {
    debugPrint("Received data from treatment plan page :- ${caseId}");
  }

  @override
  _SelectTreatmentPageState createState() => _SelectTreatmentPageState();
}

class _SelectTreatmentPageState extends State<SelectTreatmentPage> {
  List<TreatmentModel> treatmentModel = [];
  late TreatmentHelper treatmentHelper;
  bool isLoading = true;

  TreatmentModel? dropDownValueOption1;
  TreatmentModel? dropDownValueOption2;
  TreatmentModel? dropDownValueOption3;
  TreatmentModel? dropDownValueOption4;

  TextEditingController _treatmentDescription1 = TextEditingController();
  TextEditingController _treatmentDescription2 = TextEditingController();
  TextEditingController _treatmentDescription3 = TextEditingController();
  TextEditingController _treatmentDescription4 = TextEditingController();

  CaseTreatmentHelper caseTreatmentHelper = CaseTreatmentHelper();
  var dropDownValue = ListComponents.exerciseList;
  Map<int, AddCaseTreatmentModel> selectedTreatmentMap = new HashMap();

  @override
  void initState() {
    super.initState();
    getTreatmentPlan();
  }

  Future<void> getTreatmentPlan() async {
    treatmentHelper = TreatmentHelper();
    treatmentModel = await treatmentHelper.getData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.w),
                    child:
                        buildTitleText(text: "Add Required Treatment Options"),
                  ),
                  buildDropdownWithTextField(
                      descriptionController: _treatmentDescription1,
                      dropdownItemList: treatmentModel,
                      hintText: "Description",
                      index: 1,
                      onChanged: (_treatmentModel) {
                        if (_treatmentModel != null) {
                          setState(() {
                            dropDownValueOption1 = _treatmentModel;
                          });
                          updateSelectedValueInMap(_treatmentModel, 1);
                        }
                      },
                      value: dropDownValueOption1),
                  buildDropdownWithTextField(
                    descriptionController: _treatmentDescription2,
                    dropdownItemList: treatmentModel,
                    hintText: "Description",
                    index: 2,
                    onChanged: (_treatmentModel) {
                      if (_treatmentModel != null) {
                        setState(() {
                          dropDownValueOption2 = _treatmentModel;
                        });
                        updateSelectedValueInMap(_treatmentModel, 2);
                      }
                    },
                    value: dropDownValueOption2,
                  ),
                  buildDropdownWithTextField(
                    descriptionController: _treatmentDescription3,
                    dropdownItemList: treatmentModel,
                    hintText: "Description",
                    index: 3,
                    onChanged: (_treatmentModel) {
                      if (_treatmentModel != null) {
                        setState(() {
                          dropDownValueOption3 = _treatmentModel;
                        });
                        updateSelectedValueInMap(_treatmentModel, 3);
                      }
                    },
                    value: dropDownValueOption3,
                  ),
                  buildDropdownWithTextField(
                    descriptionController: _treatmentDescription4,
                    dropdownItemList: treatmentModel,
                    hintText: "Description",
                    index: 4,
                    onChanged: (_treatmentModel) {
                      if (_treatmentModel != null) {
                        setState(() {
                          dropDownValueOption4 = _treatmentModel;
                        });
                        updateSelectedValueInMap(_treatmentModel, 4);
                      }
                    },
                    value: dropDownValueOption4,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Container(
                    width: 25.w,
                    height: 3.0.h,
                    child: MaterialButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      splashColor: Colors.white70,
                      child: Text("Save Case"),
                      onPressed: () {
                        selectedTreatmentMap.forEach(
                          (key, value) {
                            caseTreatmentHelper.insert(value);
                          },
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Treatment Added successfully"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyNavigationBar(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  updateSelectedValueInMap(TreatmentModel _treatmentValue, int index) {
    if (_treatmentValue.treatmentId != null) {
      selectedTreatmentMap.update(
        index,
        (_treatmentModel) {
          AddCaseTreatmentModel addTreatmentModel = _treatmentModel;
          addTreatmentModel.treatmentTableID = _treatmentValue.treatmentId;
          return addTreatmentModel;
        },
        ifAbsent: () {
          AddCaseTreatmentModel addTreatmentModel = AddCaseTreatmentModel(
            treatmentTableID: _treatmentValue.treatmentId,
            treatmentCaseID: widget.caseId,
          );
          return addTreatmentModel;
        },
      );
    }
  }

  buildDropdownWithTextField({
    required TextEditingController descriptionController,
    required List<TreatmentModel> dropdownItemList,
    required String hintText,
    required int index,
    required ValueChanged<TreatmentModel?>? onChanged,
    required TreatmentModel? value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(0.5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(color: Colors.black),
          ),
          width: 45.w,
          height: 5.5.h,
          child: DropdownButton<TreatmentModel>(
            underline: Container(
              height: 0,
            ),
            isExpanded: true,
            hint: Text("Select"),
            value: value,
            items: dropdownItemList.map((TreatmentModel _treatmentModel) {
              return DropdownMenuItem<TreatmentModel>(
                  child: Text(_treatmentModel.treatmentCategory +
                      " - " +
                      _treatmentModel.treatmentSubCategory),
                  value: _treatmentModel);
            }).toList(),
            onChanged: onChanged,
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        CustomTextFormField(
          onChanged: (description) {
            if (selectedTreatmentMap.containsKey(index) == true) {
              selectedTreatmentMap.update(index, (caseModel) {
                AddCaseTreatmentModel addTreatmentModel = caseModel;
                addTreatmentModel.treatmentDescription = description;
                return addTreatmentModel;
              });
            } else {
              selectedTreatmentMap.putIfAbsent(
                index,
                () => AddCaseTreatmentModel(
                  treatmentCaseID: widget.caseId,
                  treatmentDescription: description,
                ),
              );
            }
          },
          height: 6.h,
          controller: descriptionController,
          labelText: hintText,
        )
      ],
    );
  }
}
