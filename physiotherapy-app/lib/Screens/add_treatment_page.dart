import 'package:flutter/material.dart';
import 'package:physiotherapy/Components/textfield_component.dart';
import 'package:physiotherapy/Components/treatment_data_card.dart';
import 'package:physiotherapy/Database/treatment_database_components/treatment_database_helper.dart';
import 'package:physiotherapy/Models/add_treatment_model.dart';
import 'package:sizer/sizer.dart';

class AddTreatmentPlan extends StatefulWidget {
  const AddTreatmentPlan({Key? key}) : super(key: key);

  @override
  _AddTreatmentPlanState createState() => _AddTreatmentPlanState();
}

class _AddTreatmentPlanState extends State<AddTreatmentPlan> {
  List<TreatmentModel> treatmentModel = [];

  late TreatmentHelper treatmentHelper;

  String dropDownValue = "Select";
  bool fetching = true;
  int currentIndex = 1;

  var items = [
    "Select",
    "Knee",
    "Shoulder",
    "Elbow",
    "Lumbar",
    "Neuro Rehab",
    "Cervical",
    "Heel"
  ];

  // TextEditingController _treatmentCategory = TextEditingController();
  TextEditingController _treatmentSubCategory = TextEditingController();

  @override
  void initState() {
    super.initState();
    getTreatmentPlan();
  }

  void getTreatmentPlan() async {
    treatmentHelper = TreatmentHelper();
    treatmentModel = await treatmentHelper.getData();
    setState(() {
      fetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(0.5.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(color: Colors.black)),
                width: 40.w,
                height: 5.h,
                child: DropdownButton(
                  focusColor: Colors.transparent,
                  underline: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.transparent))),
                  ),
                  isExpanded: true,
                  value: dropDownValue,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropDownValue = value!;
                    });
                    debugPrint('The value is  :- ${dropDownValue}');
                  },
                ),
              ),
              CustomTextFormField(
                width: 45.w,
                height: 6.h,
                labelText: 'Enter Sub Category',
                controller: _treatmentSubCategory,
              ),
              ElevatedButton(
                  onPressed: () {
                    TreatmentModel treatmentModel = TreatmentModel(
                      treatmentCategory: dropDownValue,
                      treatmentSubCategory: _treatmentSubCategory.text,
                    );
                    treatmentHelper.insert(treatmentModel).then((value) {
                      _treatmentSubCategory.clear();
                      setState(() {
                        dropDownValue = "Select";
                        fetching = true;
                      });
                    }).then((value) {
                      getTreatmentPlan();
                      setState(() {
                        fetching = false;
                      });
                    });
                  },
                  child: Text("Add Treatment")),
            ],
          ),
          Divider(),
          Expanded(
            child: fetching == true
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: treatmentModel.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Card(
                            child: TreatmentDataCard(
                                treatmentModel: treatmentModel[index],
                                edit: edit,
                                delete: delete,
                                index: index),
                          ),
                        )),
          )
        ],
      ),
    );
  }

  void showUpdateDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext, StateSetter state) {
            return AlertDialog(
              content: Column(
                children: [
                  DropdownButton(
                    focusColor: Colors.black,
                    underline: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.transparent))),
                    ),
                    isExpanded: true,
                    value: dropDownValue,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        dropDownValue = value!;
                      });
                    },
                  ),
                  CustomTextFormField(
                    controller: _treatmentSubCategory,
                    labelText: "Sub "
                        "Category",
                  )
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      TreatmentModel treatment = treatmentModel[currentIndex];
                      treatment.treatmentCategory = dropDownValue;
                      treatment.treatmentSubCategory =
                          _treatmentSubCategory.text;
                      setState(() {
                        treatmentHelper.update(
                            treatment, treatment.treatmentId!);
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Update Treatment"))
              ],
            );
          });
        });
  }

  void edit(index) {
    currentIndex = index;
    var data = treatmentModel[index];
    dropDownValue = data.treatmentCategory;
    _treatmentSubCategory.text = data.treatmentSubCategory;
    showUpdateDialog();
  }

  delete(int index) {
    treatmentHelper.delete(treatmentModel[index].treatmentId!);
    setState(() {
      treatmentModel.removeAt(index);
    });
  }
}
