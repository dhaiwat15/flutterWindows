import 'package:flutter/material.dart';
import 'package:physiotherapy/Components/text_components.dart';
import 'package:physiotherapy/Components/view_case_data_card.dart';
import 'package:physiotherapy/Database/add_case_database_components/addCase_database_helper.dart';
import 'package:physiotherapy/Models/add_treatment_model.dart';

class ViewPatientCase extends StatefulWidget {
  var pId;
  var name;
  var number;
  var date;
  bool fromViewPatient;
  TreatmentModel? model;

  ViewPatientCase(
      {this.pId,
        this.name,
        this.number,
        this.date,
        this.fromViewPatient = false,
        this.model});

  @override
  _ViewPatientCaseState createState() => _ViewPatientCaseState();
}

class _ViewPatientCaseState extends State<ViewPatientCase> {
  late CaseDatabaseHelper caseDatabaseHelper;

  int currentIndex = 0;

  bool fetching = true;

  @override
  void initState() {
    getCaseInfo();
    super.initState();
  }

  void getCaseInfo() async {
    caseDatabaseHelper = CaseDatabaseHelper();
    setState(() {
      fetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildCommonText(text: "Name : ${widget.name}"),
              buildCommonText(
                text: "Phone No : ${widget.number}",
              ),
              buildCommonText(
                text: "Case Date:  ${widget.date}",
              ),
            ],
          ),
          titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: FutureBuilder(
            future: caseDatabaseHelper.getPatientsDetail(widget.pId),
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
                      return CaseDataCard(
                        caseData: dataList[index],
                        edit: edit,
                        index: index,
                        delete: delete,
                        isShowButtons: false,
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  delete(int index) {}

  edit() {}
}
