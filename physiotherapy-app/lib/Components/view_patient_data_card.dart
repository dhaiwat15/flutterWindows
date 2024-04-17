import 'package:flutter/material.dart';
import 'package:physiotherapy/Components/text_components.dart';
import 'package:physiotherapy/Models/add_patient_model.dart';
import 'package:physiotherapy/Screens/add_case_page.dart';
import 'package:physiotherapy/Screens/view_case_page.dart';
import 'package:sizer/sizer.dart';

class PatientDataCard extends StatefulWidget {
  PatientDataCard({
    Key? key,
    required this.data,
    required this.edit,
    required this.delete,
    required this.index,
  }) : super(key: key);
  final PatientModel data;
  final Function edit;
  final Function delete;
  final int index;

  @override
  State<PatientDataCard> createState() => _PatientDataCardState();
}

class _PatientDataCardState extends State<PatientDataCard> {
  TextStyle textStyle = TextStyle(fontWeight: FontWeight.w500);

  TextStyle textStyleBold = TextStyle(fontWeight: FontWeight.bold);

  String userSelectedPath = "";

  final pdfName = "";

  String documentPath = "";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildTitleText(
              text:
                  "${widget.data.abbreviation} ${widget.data.firstname} ${widget.data.lastname}",
              underlineText: true),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: DataTable(
                  dataRowHeight: 5.h,
                  columnSpacing: 2.w,
                  columns: [
                    DataColumn(label: Text("")),
                    DataColumn(label: Text("")),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(buildCommonText(text: "name")),
                      DataCell(
                        Text(
                            "${widget.data.firstname} ${widget.data.middlename} ${widget.data.lastname}",
                            style: textStyle),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(buildCommonText(text: "age")),
                      DataCell(
                        Text("${widget.data.age}", style: textStyle),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(buildCommonText(text: "gender")),
                      DataCell(
                        Text("${widget.data.gender}", style: textStyle),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(buildCommonText(text: "address")),
                      DataCell(
                        Text("${widget.data.address}", style: textStyle),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(buildCommonText(text: "city")),
                      DataCell(
                        Text("${widget.data.city}", style: textStyle),
                      ),
                    ]),
                  ],
                ),
              ),
              Expanded(
                child: DataTable(
                  dataRowHeight: 5.h,
                  columnSpacing: 2.w,
                  columns: [
                    DataColumn(label: Text("", style: textStyleBold)),
                    DataColumn(label: Text("", style: textStyleBold)),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(buildCommonText(text: "pincode")),
                      DataCell(
                        Text("${widget.data.pincode}", style: textStyle),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(buildCommonText(text: "number")),
                      DataCell(
                        Text("${widget.data.number}", style: textStyle),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(buildCommonText(text: "Alternative Number")),
                      DataCell(
                        Text("${widget.data.alternativenumber}",
                            style: textStyle),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(buildCommonText(text: "occupation")),
                      DataCell(
                        Text("${widget.data.occupation}", style: textStyle),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(buildCommonText(text: "Date")),
                      DataCell(
                        Text("${widget.data.date}", style: textStyle),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          )
        ],
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tooltip(
            message: "Edit Patient details",
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    widget.edit(widget.index);
                  },
                  icon: Icon(Icons.edit)),
            ),
          ),
          SizedBox(width: 5.w),
          Tooltip(
            message: "View Cases",
            child: CircleAvatar(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewPatientCase(
                              pId: "${widget.data.patientId}",
                              name:
                                  "${widget.data.firstname} ${widget.data.lastname}",
                              number: widget.data.number,
                              date: widget.data.date,
                            )),
                  );
                },
                icon: Icon(Icons.view_module),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Tooltip(
            message: "Add new Case",
            child: CircleAvatar(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddCaseScreen(
                              id: widget.data.patientId,
                            )),
                  );
                },
                icon: Icon(Icons.person_add_alt),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Tooltip(
            message: "Delete details",
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: IconButton(
                onPressed: () {
                  showConfirmationDialogue(context);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showConfirmationDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Are you sure ?\nYou want to delete the record.",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          actions: [
            Tooltip(
              message: "Agree",
              child: TextButton(
                  onPressed: () {
                    widget.delete(widget.index);
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes")),
            ),
            Tooltip(
              message: "Disagree",
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
            ),
          ],
        );
      },
    );
  }
}
