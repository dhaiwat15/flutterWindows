// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:physiotherapy/Components/text_components.dart';
// import 'package:physiotherapy/Components/textfield_component.dart';
// import 'package:physiotherapy/Database/patient_%20database_component/patient_constants.dart';
// import 'package:physiotherapy/Database/pdf_helper.dart';
// import 'package:physiotherapy/Database/treatment_database_components/treatment_database_helper.dart';
// import 'package:physiotherapy/Models/add_case_model.dart';
// import 'package:physiotherapy/Models/add_treatment_model.dart';
// import 'package:sizer/sizer.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
//
// import 'pdf_generator.dart';
//
// class CaseDataCard extends StatefulWidget {
//   var name;
//   bool showFields = false;
//
//   CaseDataCard(
//       {Key? key,
//       required this.caseData,
//       required this.edit,
//       required this.delete,
//       required this.index,
//       this.addTreatment,
//       this.showTreatment,
//       this.name,
//       required this.isShowButtons})
//       : super(key: key);
//   final bool isShowButtons;
//   final CaseModel caseData;
//   final Function edit;
//   final Function delete;
//   final int index;
//   final Function? addTreatment;
//   final Function? showTreatment;
//
//   @override
//   State<CaseDataCard> createState() => _CaseDataCardState();
// }
//
// class _CaseDataCardState extends State<CaseDataCard> {
//   TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold);
//
//   TextEditingController categorycontroller = TextEditingController();
//   TextEditingController subCategorycontroller = TextEditingController();
//
//   TreatmentHelper treatmentHelper = TreatmentHelper();
//
//   String categoryData = "";
//   String subCategoryData = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buildCustomRow(
//                   title: "patient Id ",
//                   subtitle: "${widget.caseData.patientId}"),
//               buildCustomRow(
//                   title: "Case Id ", subtitle: "${widget.caseData.caseId}"),
//               buildCustomRow(
//                   title: "Date Of Case ",
//                   subtitle: "${widget.caseData.dateTime}"),
//               buildCustomRow(
//                   title: "Case treated by",
//                   subtitle: "${widget.caseData.caseTreatedBy}"),
//               buildCustomRow(
//                   title: "chief complaint",
//                   subtitle: "${widget.caseData.chiefComplaint}"),
//               buildCustomRow(
//                   title: "Symptoms",
//                   subtitle: "${widget.caseData.caseSymptoms}"),
//               buildCustomRow(
//                   title: "aggravating factor",
//                   subtitle: "${widget.caseData.caseAggravating}"),
//               buildCustomRow(
//                   title: "relieving factor",
//                   subtitle: "${widget.caseData.caseRelieving}"),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buildCustomRow(
//                   title: "Referred By",
//                   subtitle: "${widget.caseData.caseReference}"),
//               buildCustomRow(
//                   title: "Present History",
//                   subtitle: "${widget.caseData.casePresentHistory}"),
//               buildCustomRow(
//                   title: "Past History",
//                   subtitle: "${widget.caseData.casePastHistory}"),
//               buildCustomRow(
//                   title: "Medical History",
//                   subtitle: "${widget.caseData.caseMedicalHistory}"),
//               buildCustomRow(
//                   title: "Surgical History",
//                   subtitle: "${widget.caseData.caseSurgicalHistory}"),
//               buildCustomRow(
//                   title: "Family History",
//                   subtitle: "${widget.caseData.caseFamilyHistory}"),
//               buildCustomRow(
//                   title: "Posture",
//                   subtitle: "${widget.caseData.caseObservationPosture}"),
//               buildCustomRow(
//                   title: "Wasting",
//                   subtitle: "${widget.caseData.caseObservationWasting}"),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buildCustomRow(
//                   title: "Oedema",
//                   subtitle: "${widget.caseData.caseObservationOedema}"),
//               buildCustomRow(
//                   title: "Swelling",
//                   subtitle: "${widget.caseData.caseObservationSwelling}"),
//               buildCustomRow(
//                   title: "Scar",
//                   subtitle: "${widget.caseData.caseObservationScar}"),
//               buildCustomRow(
//                   title: "Deformity",
//                   subtitle: "${widget.caseData.caseObservationDeformity}"),
//               buildCustomRow(
//                   title: "GAIT",
//                   subtitle: "${widget.caseData.caseObservationGait}"),
//               buildCustomRow(
//                   title: "Tenderness",
//                   subtitle: "${widget.caseData.casePalpationTenderness}"),
//               buildCustomRow(
//                   title: "Spasm",
//                   subtitle: "${widget.caseData.casePalpationSpasm}"),
//               buildCustomRow(
//                   title: "Abnormal Sound",
//                   subtitle: "${widget.caseData.casePalpationAbnormalSound}"),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buildCustomRow(
//                   title: "Temperature",
//                   subtitle: "${widget.caseData.casePalpationTemperature}"),
//               buildCustomRow(
//                   title: "ROM",
//                   subtitle: "${widget.caseData.caseOnExaminationRom}"),
//               buildCustomRow(
//                   title: "MMT",
//                   subtitle: "${widget.caseData.caseOnExaminationMmt}"),
//               buildCustomRow(
//                   title: "X-Ray",
//                   subtitle: "${widget.caseData.caseOnInvestigationXray}"),
//               buildCustomRow(
//                   title: "MRI",
//                   subtitle: "${widget.caseData.caseOnInvestigationMri}"),
//               buildCustomRow(
//                   title: "Other Reports",
//                   subtitle: "${widget.caseData.caseOtherInfoReports}"),
//               buildCustomRow(
//                   title: "Clinical Reports",
//                   subtitle: "${widget.caseData.caseOtherInfoClinical}"),
//             ],
//           ),
//         ],
//       ),
//       // title: Row(
//       //   crossAxisAlignment: CrossAxisAlignment.start,
//       //   children: [
//       //     Expanded(
//       //       child: DataTable(
//       //           dataRowHeight: 5.h,
//       //           columnSpacing: 1.w,
//       //           dividerThickness: 0.5,
//       //           columns: [
//       //             DataColumn(label: Text("")),
//       //             DataColumn(label: Text("")),
//       //           ],
//       //           rows: [
//       //             buildDataRow(
//       //                 textOne: "Patient_Id",
//       //                 textTwo: "${widget.caseData.patientId}"),
//       //             buildDataRow(
//       //                 textOne: "Case_ID", textTwo: "${widget.caseData.caseId}"),
//       //             buildDataRow(
//       //                 textOne: "Case Add Date",
//       //                 textTwo: "${widget.caseData.dateTime}"),
//       //             buildDataRow(
//       //                 textOne: "Treated By",
//       //                 textTwo: "${widget.caseData.caseTreatedBy}"),
//       //             buildDataRow(
//       //                 textOne: "Chief Complaint",
//       //                 textTwo: "${widget.caseData.chiefComplaint}"),
//       //             buildDataRow(
//       //                 textOne: "Symptoms Behaviour",
//       //                 textTwo: "${widget.caseData.caseSymptoms}"),
//       //             buildDataRow(
//       //                 textOne: "Case Aggravating",
//       //                 textTwo: "${widget.caseData.caseAggravating}"),
//       //             buildDataRow(
//       //                 textOne: "Reliving Factor",
//       //                 textTwo: "${widget.caseData.caseRelieving}"),
//       //           ]),
//       //     ),
//       //     Expanded(
//       //       child: DataTable(
//       //           dataRowHeight: 5.h,
//       //           columnSpacing: 1.w,
//       //           dividerThickness: 0.5,
//       //           columns: [
//       //             DataColumn(label: Text("")),
//       //             DataColumn(label: Text("")),
//       //           ],
//       //           rows: [
//       //             buildDataRow(
//       //                 textOne: "Referred By",
//       //                 textTwo: "${widget.caseData.caseReference}"),
//       //             buildDataRow(
//       //                 textOne: "Present History",
//       //                 textTwo: "${widget.caseData.casePresentHistory}"),
//       //             buildDataRow(
//       //                 textOne: "Past History",
//       //                 textTwo: "${widget.caseData.casePastHistory}"),
//       //             buildDataRow(
//       //                 textOne: "Medical History",
//       //                 textTwo: "${widget.caseData.caseMedicalHistory}"),
//       //             buildDataRow(
//       //                 textOne: "Surgical History",
//       //                 textTwo: "${widget.caseData.caseSurgicalHistory}"),
//       //             buildDataRow(
//       //                 textOne: "Family History",
//       //                 textTwo: "${widget.caseData.caseFamilyHistory}"),
//       //             buildDataRow(
//       //                 textOne: "Posture",
//       //                 textTwo: "${widget.caseData.caseObservationPosture}"),
//       //             buildDataRow(
//       //                 textOne: "Wasting",
//       //                 textTwo: "${widget.caseData.caseObservationWasting}"),
//       //           ]),
//       //     ),
//       //     DataTable(
//       //         dataRowHeight: 5.h,
//       //         columnSpacing: 1.w,
//       //         dividerThickness: 0.5,
//       //         columns: [
//       //           DataColumn(label: Text("")),
//       //           DataColumn(label: Text("")),
//       //         ],
//       //         rows: [
//       //           buildDataRow(
//       //               textOne: "Oedema",
//       //               textTwo: "${widget.caseData.caseObservationOedema}"),
//       //           buildDataRow(
//       //               textOne: "Swelling",
//       //               textTwo: " ${widget.caseData.caseObservationSwelling}"),
//       //           buildDataRow(
//       //               textOne: "Scar",
//       //               textTwo: "${widget.caseData.caseObservationScar}"),
//       //           buildDataRow(
//       //               textOne: "Deformity",
//       //               textTwo: "${widget.caseData.caseObservationDeformity}"),
//       //           buildDataRow(
//       //               textOne: "GAIT",
//       //               textTwo: "${widget.caseData.caseObservationGait}"),
//       //           buildDataRow(
//       //               textOne: "Tenderness",
//       //               textTwo: "${widget.caseData.casePalpationTenderness}"),
//       //           buildDataRow(
//       //               textOne: "Spasm",
//       //               textTwo: "${widget.caseData.casePalpationSpasm}"),
//       //           buildDataRow(
//       //               textOne: "Abnormal Sound",
//       //               textTwo: "${widget.caseData.casePalpationAbnormalSound}"),
//       //         ]),
//       //     Expanded(
//       //       child: DataTable(
//       //           dataRowHeight: 5.h,
//       //           columnSpacing: 1.w,
//       //           dividerThickness: 0.5,
//       //           columns: [
//       //             DataColumn(label: Text("")),
//       //             DataColumn(label: Text("")),
//       //           ],
//       //           rows: [
//       //             buildDataRow(
//       //                 textOne: "Temperature",
//       //                 textTwo: "${widget.caseData.casePalpationTemperature}"),
//       //             buildDataRow(
//       //                 textOne: 'ROM',
//       //                 textTwo: "${widget.caseData.caseOnExaminationRom}"),
//       //             buildDataRow(
//       //                 textOne: "MMT",
//       //                 textTwo: "${widget.caseData.caseOnExaminationMmt}"),
//       //             buildDataRow(
//       //                 textOne: "X-Ray",
//       //                 textTwo: "${widget.caseData.caseOnInvestigationXray}"),
//       //             buildDataRow(
//       //                 textOne: "MRI",
//       //                 textTwo: "${widget.caseData.caseOnInvestigationMri}"),
//       //             buildDataRow(
//       //                 textOne: "Other Reports",
//       //                 textTwo: "${widget.caseData.caseOtherInfoReports}"),
//       //             buildDataRow(
//       //                 textOne: "Clinical Reports",
//       //                 textTwo: "${widget.caseData.caseOtherInfoClinical}"),
//       //           ]),
//       //     ),
//       //   ],
//       // ),
//       subtitle: Padding(
//         padding: EdgeInsets.all(1.0.w),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Tooltip(
//               message: "Generate PDF",
//               child: CircleAvatar(
//                 child: IconButton(
//                   onPressed: () {
//                     _createPDF(id: widget.caseData.patientId as int);
//
//                     print('${widget.caseData.patientId}');
//                   },
//                   icon: Icon(Icons.picture_as_pdf),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 7,
//             ),
//             Tooltip(
//               message: "Edit Case",
//               child: widget.isShowButtons
//                   ? CircleAvatar(
//                       child: IconButton(
//                           onPressed: () {
//                             widget.edit(widget.index);
//                           },
//                           icon: Icon(Icons.edit)),
//                     )
//                   : SizedBox(),
//             ),
//             SizedBox(
//               width: 7,
//             ),
//             Tooltip(
//                 message: "Delete Case",
//                 child: widget.isShowButtons
//                     ? CircleAvatar(
//                         child: IconButton(
//                           onPressed: () {
//                             showConfirmationDialogue(context);
//                           },
//                           icon: Icon(
//                             Icons.delete,
//                             color: Colors.white,
//                           ),
//                         ),
//                       )
//                     : SizedBox()),
//             // Tooltip(
//             //     message: "Add Treatment Plan",
//             //     child: CircleAvatar(
//             //       child: IconButton(
//             //           onPressed: () {
//             //             showDialogForAddTreatment(context);
//             //           },
//             //           icon: Icon(Icons.next_plan_outlined)),
//             //     )),
//             // SizedBox(
//             //   width: 7,
//             // ),
//             // Tooltip(
//             //     message: "Show Treatment Plan",
//             //     child: CircleAvatar(
//             //       child: IconButton(
//             //           onPressed: () async {
//             //             Map<String, dynamic> getCategories =
//             //                 await GetTreatmentHelper().getSpecificDetails(
//             //                     widget.caseData.caseId as int);
//             //
//             //             categoryData = getCategories[
//             //                 TreatmentConstants.treatmentCategory] as String;
//             //             subCategoryData = getCategories[TreatmentConstants
//             //                 .treatmentSubCategory] as String;
//             //
//             //             showDailogForShowTreatment(context);
//             //           },
//             //           icon: Icon(Icons.next_plan)),
//             //     )),
//             // SizedBox(
//             //   width: 7,
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _createPDF({required int id}) async {
//     Map<String, dynamic> patientDetails = await PdfHelper().getAllDetails(id);
//
//     PdfDocument document = PdfDocument();
//     final page = document.pages.add();
//
//     //Create the header with specific bounds
//     PdfPageTemplateElement header = PdfPageTemplateElement(
//         Rect.fromLTWH(0, 0, document.pages[0].getClientSize().width, 100));
//
//     document.template.top = header;
// //Create font
//     PdfFont font = PdfStandardFont(
//       PdfFontFamily.helvetica,
//       15,
//     );
//
//     PdfFont unOrderedFont = PdfStandardFont(PdfFontFamily.helvetica, 12);
//
//     PdfListItemCollection item = PdfListItemCollection([
//       'PERSONAL DETAILS : ',
//       'RELEVANT PATIENT HISTORY : ',
//       'ON OBSERVATION : ',
//       'ON PALPATION : ',
//       'ON EXAMINATION : ',
//       'ON INVESTIGATION : ',
//       'CLINICAL DIAGNOSIS : '
//     ]);
//
//     PdfListItemCollection item_2 = PdfListItemCollection([
//       '${(patientDetails[PatientConstants.columnAbbreviation] as String)} '
//           ""
//           'NAME :  ${(patientDetails[PatientConstants.columnFirstName] as String)} ',
//       'MIDDLE NAME : ${(patientDetails[PatientConstants.columnMiddleName] as String)}',
//       'LAST NAME: ${(patientDetails[PatientConstants.columnLastName] as String)} ',
//       'AGE :  ${(patientDetails[PatientConstants.columnAge] as String)}',
//       'GENDER : ${(patientDetails[PatientConstants.columnGender] as String)}',
//       'NUMBER : ${(patientDetails[PatientConstants.columnNumber] as String)}',
//       'ALT-NUMBER : ${(patientDetails[PatientConstants.columnAlternativeNumber] as String)}',
//       'OCCUPATION : ${(patientDetails[PatientConstants.columnOccupation] as String)}',
//       'CITY : ${(patientDetails[PatientConstants.columnCity] as String)}',
//       'PIN-CODE : ${(patientDetails[PatientConstants.columnPincode] as String)}',
//       'Treated By : ${widget.caseData.caseTreatedBy}',
//       'Date : ${widget.caseData.dateTime}',
//       'SYMPTOMS BEHAVIOUR : ${widget.caseData.caseSymptoms}',
//       'CHIEF COMPLAINT : ${widget.caseData.chiefComplaint}',
//       'AGGRAVATING FACTOR : ${widget.caseData.caseAggravating}',
//       'RELIVING FACTOR : ${widget.caseData.caseRelieving}',
//       'REFERRED BY : ${widget.caseData.caseReference}',
//     ]);
//     PdfListItemCollection item_3 = PdfListItemCollection([
//       'PRESENT  : ${widget.caseData.casePresentHistory}',
//       'PAST : ${widget.caseData.casePastHistory}',
//       'MEDICAL  : ${widget.caseData.caseMedicalHistory}',
//       'SURGICAL : ${widget.caseData.caseSurgicalHistory}',
//       'FAMILY  : ${widget.caseData.caseFamilyHistory}',
//     ]);
//
//     PdfListItemCollection item_4 = PdfListItemCollection([
//       'POSTURE : ${widget.caseData.caseObservationPosture}',
//       'WASTING : ${widget.caseData.caseObservationWasting}',
//       'OEDEMA : ${widget.caseData.caseObservationOedema}',
//       'SWELLING : ${widget.caseData.caseObservationSwelling}',
//       'SCAR : ${widget.caseData.caseObservationScar}',
//       'DEFORMITY : ${widget.caseData.caseObservationDeformity}',
//       'GAIT : ${widget.caseData.caseObservationGait}',
//     ]);
//
//     PdfListItemCollection item_5 = PdfListItemCollection([
//       'TENDERNESS : ${widget.caseData.casePalpationTenderness}',
//       'SPASM : ${widget.caseData.casePalpationSpasm}',
//       'TEMPERATURE : ${widget.caseData.casePalpationTemperature}',
//       'ABNORMAL SOUND : ${widget.caseData.casePalpationAbnormalSound}',
//     ]);
//
//     PdfListItemCollection item_6 = PdfListItemCollection([
//       'ROM : ${widget.caseData.caseOnExaminationRom}',
//       'MMT : ${widget.caseData.caseOnExaminationMmt}',
//     ]);
//
//     PdfListItemCollection item_7 = PdfListItemCollection([
//       'X-ray :  ${widget.caseData.caseOnInvestigationXray}',
//       'MRI :  ${widget.caseData.caseOnInvestigationMri}',
//     ]);
//     PdfListItemCollection item_8 = PdfListItemCollection([
//       'CLINICAL REPORTS : ${widget.caseData.caseOtherInfoClinical}',
//       'OTHER REPORTS : ${widget.caseData.caseOtherInfoReports}',
//     ]);
//
// //Create a string format
//     PdfStringFormat format = PdfStringFormat(lineSpacing: 10);
//
// //Create ordered list
//     PdfOrderedList oList = PdfOrderedList(
//       items: item,
//       font: font,
//       format: format,
//       markerHierarchy: false,
//     );
//
//     PdfUnorderedList uList = PdfUnorderedList(
//       items: item,
//       font: unOrderedFont,
//       format: format,
//     );
//
//     uList.items[0].subList = PdfUnorderedList(
//         items: item_2,
//         font: unOrderedFont,
//         format: format,
//         style: PdfUnorderedMarkerStyle.none);
//
//     uList.items[1].subList = PdfUnorderedList(
//         items: item_3,
//         font: unOrderedFont,
//         format: format,
//         style: PdfUnorderedMarkerStyle.none);
//
//     uList.items[2].subList = PdfUnorderedList(
//         items: item_4,
//         font: unOrderedFont,
//         format: format,
//         style: PdfUnorderedMarkerStyle.none);
//     uList.items[3].subList = PdfUnorderedList(
//         items: item_5,
//         font: unOrderedFont,
//         format: format,
//         style: PdfUnorderedMarkerStyle.none);
//     uList.items[4].subList = PdfUnorderedList(
//         items: item_6,
//         font: unOrderedFont,
//         format: format,
//         style: PdfUnorderedMarkerStyle.none);
//     uList.items[5].subList = PdfUnorderedList(
//         items: item_7,
//         font: unOrderedFont,
//         format: format,
//         style: PdfUnorderedMarkerStyle.none);
//     uList.items[6].subList = PdfUnorderedList(
//         items: item_8,
//         font: unOrderedFont,
//         format: format,
//         style: PdfUnorderedMarkerStyle.none);
//
// // Draw ordered list with sub list
//     oList.draw(
//       page: page,
//       bounds: Rect.fromLTWH(
//           0, 0, page.getClientSize().width, page.getClientSize().height),
//     );
//
//     //Create the footer with specific bounds
//     PdfPageTemplateElement footer = PdfPageTemplateElement(
//         Rect.fromLTWH(0, 0, document.pages[0].getClientSize().width, 100));
//
//     document.template.bottom = footer;
//
//     List<int> bytes = document.save();
//
//     document.dispose();
//
//     // saveAndLaunchFile(, file, filename)
//
//     saveAndLaunchFile(
//       bytes,
//       '${patientDetails[PatientConstants.columnFirstName]}.pdf',
//     );
//   }
//
//   // buildTable(invoice) {}
//   DataRow buildDataRow({required String textOne, required String textTwo}) {
//     return DataRow(cells: [
//       DataCell(
//         buildCommonText(text: textOne),
//       ),
//       DataCell(Text(textTwo)),
//     ]);
//   }
//
//   Padding buildCustomRow({required String title, required String subtitle}) {
//     return Padding(
//       padding: EdgeInsets.all(1.w),
//       child: Row(
//         children: [
//           buildCommonText(text: title),
//           SizedBox(
//             width: 1.2.w,
//           ),
//           Container(
//             width: 10.w,
//             child: Text(
//               subtitle,
//               overflow: TextOverflow.ellipsis,
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Future<dynamic> showConfirmationDialogue(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Are you sure ?\n You want to delete the record."),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   widget.delete(widget.index);
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("Yes")),
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("No")),
//           ],
//         );
//       },
//     );
//   }
//
//   Future<dynamic> showDialogForAddTreatment(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return SingleChildScrollView(
//             child: AlertDialog(
//               title: Text("Add Treatment "),
//               content: Column(
//                 children: [
//                   CustomTextFormField(
//                     labelText: "Add Category",
//                     controller: categorycontroller,
//                   ),
//                   CustomTextFormField(
//                     labelText: "Add SubCategory",
//                     controller: subCategorycontroller,
//                   ),
//                 ],
//               ),
//               actions: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(
//                         onPressed: () {
//                           TreatmentModel treatmentModel = TreatmentModel(
//                             treatmentCategory: categorycontroller.text,
//                             treatmentSubCategory: subCategorycontroller.text,
//                           );
//                           treatmentHelper.insert(treatmentModel);
//                         },
//                         child: Text("Add Treatment")),
//                   ],
//                 )
//               ],
//             ),
//           );
//         });
//   }
//
//   Future<dynamic> showDailogForShowTreatment(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//               title: Text("Show Treatment"),
//               content: Row(
//                 children: [
//                   Text(categoryData),
//                   Text(subCategoryData),
//                 ],
//               ));
//         });
//   }
// }

import 'package:flutter/material.dart';
import 'package:physiotherapy/Components/text_components.dart';
import 'package:physiotherapy/Database/patient_%20database_component/patient_constants.dart';
import 'package:physiotherapy/Database/pdf_helper.dart';
import 'package:physiotherapy/Database/treatment_database_components/treatment_database_helper.dart';
import 'package:physiotherapy/Models/add_case_model.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'pdf_generator.dart';

class CaseDataCard extends StatefulWidget {
  var name;
  bool showFields = false;

  CaseDataCard(
      {Key? key,
        required this.caseData,
        required this.edit,
        required this.delete,
        required this.index,
        this.addTreatment,
        this.showTreatment,
        this.name,
        required this.isShowButtons})
      : super(key: key);
  final bool isShowButtons;
  final CaseModel caseData;
  final Function edit;
  final Function delete;
  final int index;
  final Function? addTreatment;
  final Function? showTreatment;

  @override
  State<CaseDataCard> createState() => _CaseDataCardState();
}

class _CaseDataCardState extends State<CaseDataCard> {
  TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold);

  TextEditingController categorycontroller = TextEditingController();
  TextEditingController subCategorycontroller = TextEditingController();

  TreatmentHelper treatmentHelper = TreatmentHelper();

  String categoryData = "";
  String subCategoryData = "";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCustomRow(
                  title: "patient Id ",
                  subtitle: "${widget.caseData.patientId}"),
              buildCustomRow(
                  title: "Case Id ", subtitle: "${widget.caseData.caseId}"),
              buildCustomRow(
                  title: "Date Of Case ",
                  subtitle: "${widget.caseData.dateTime}"),
              buildCustomRow(
                  title: "Case treated by",
                  subtitle: "${widget.caseData.caseTreatedBy}"),
              buildCustomRow(
                  title: "chief complaint",
                  subtitle: "${widget.caseData.chiefComplaint}"),
              buildCustomRow(
                  title: "Symptoms",
                  subtitle: "${widget.caseData.caseSymptoms}"),
              buildCustomRow(
                  title: "aggravating factor",
                  subtitle: "${widget.caseData.caseAggravating}"),
              buildCustomRow(
                  title: "relieving factor",
                  subtitle: "${widget.caseData.caseRelieving}"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCustomRow(
                  title: "Referred By",
                  subtitle: "${widget.caseData.caseReference}"),
              buildCustomRow(
                  title: "Present History",
                  subtitle: "${widget.caseData.casePresentHistory}"),
              buildCustomRow(
                  title: "Past History",
                  subtitle: "${widget.caseData.casePastHistory}"),
              buildCustomRow(
                  title: "Medical History",
                  subtitle: "${widget.caseData.caseMedicalHistory}"),
              buildCustomRow(
                  title: "Surgical History",
                  subtitle: "${widget.caseData.caseSurgicalHistory}"),
              buildCustomRow(
                  title: "Family History",
                  subtitle: "${widget.caseData.caseFamilyHistory}"),
              buildCustomRow(
                  title: "Posture",
                  subtitle: "${widget.caseData.caseObservationPosture}"),
              buildCustomRow(
                  title: "Wasting",
                  subtitle: "${widget.caseData.caseObservationWasting}"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCustomRow(
                  title: "Oedema",
                  subtitle: "${widget.caseData.caseObservationOedema}"),
              buildCustomRow(
                  title: "Swelling",
                  subtitle: "${widget.caseData.caseObservationSwelling}"),
              buildCustomRow(
                  title: "Scar",
                  subtitle: "${widget.caseData.caseObservationScar}"),
              buildCustomRow(
                  title: "Deformity",
                  subtitle: "${widget.caseData.caseObservationDeformity}"),
              buildCustomRow(
                  title: "GAIT",
                  subtitle: "${widget.caseData.caseObservationGait}"),
              buildCustomRow(
                  title: "Tenderness",
                  subtitle: "${widget.caseData.casePalpationTenderness}"),
              buildCustomRow(
                  title: "Spasm",
                  subtitle: "${widget.caseData.casePalpationSpasm}"),
              buildCustomRow(
                  title: "Abnormal Sound",
                  subtitle: "${widget.caseData.casePalpationAbnormalSound}"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCustomRow(
                  title: "Temperature",
                  subtitle: "${widget.caseData.casePalpationTemperature}"),
              buildCustomRow(
                  title: "ROM",
                  subtitle: "${widget.caseData.caseOnExaminationRom}"),
              buildCustomRow(
                  title: "MMT",
                  subtitle: "${widget.caseData.caseOnExaminationMmt}"),
              buildCustomRow(
                  title: "X-Ray",
                  subtitle: "${widget.caseData.caseOnInvestigationXray}"),
              buildCustomRow(
                  title: "MRI",
                  subtitle: "${widget.caseData.caseOnInvestigationMri}"),
              buildCustomRow(
                  title: "Other Reports",
                  subtitle: "${widget.caseData.caseOtherInfoReports}"),
              buildCustomRow(
                  title: "Clinical Reports",
                  subtitle: "${widget.caseData.caseOtherInfoClinical}"),
            ],
          ),
        ],
      ),
      // title: Row(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Expanded(
      //       child: DataTable(
      //           dataRowHeight: 5.h,
      //           columnSpacing: 1.w,
      //           dividerThickness: 0.5,
      //           columns: [
      //             DataColumn(label: Text("")),
      //             DataColumn(label: Text("")),
      //           ],
      //           rows: [
      //             buildDataRow(
      //                 textOne: "Patient_Id",
      //                 textTwo: "${widget.caseData.patientId}"),
      //             buildDataRow(
      //                 textOne: "Case_ID", textTwo: "${widget.caseData.caseId}"),
      //             buildDataRow(
      //                 textOne: "Case Add Date",
      //                 textTwo: "${widget.caseData.dateTime}"),
      //             buildDataRow(
      //                 textOne: "Treated By",
      //                 textTwo: "${widget.caseData.caseTreatedBy}"),
      //             buildDataRow(
      //                 textOne: "Chief Complaint",
      //                 textTwo: "${widget.caseData.chiefComplaint}"),
      //             buildDataRow(
      //                 textOne: "Symptoms Behaviour",
      //                 textTwo: "${widget.caseData.caseSymptoms}"),
      //             buildDataRow(
      //                 textOne: "Case Aggravating",
      //                 textTwo: "${widget.caseData.caseAggravating}"),
      //             buildDataRow(
      //                 textOne: "Reliving Factor",
      //                 textTwo: "${widget.caseData.caseRelieving}"),
      //           ]),
      //     ),
      //     Expanded(
      //       child: DataTable(
      //           dataRowHeight: 5.h,
      //           columnSpacing: 1.w,
      //           dividerThickness: 0.5,
      //           columns: [
      //             DataColumn(label: Text("")),
      //             DataColumn(label: Text("")),
      //           ],
      //           rows: [
      //             buildDataRow(
      //                 textOne: "Referred By",
      //                 textTwo: "${widget.caseData.caseReference}"),
      //             buildDataRow(
      //                 textOne: "Present History",
      //                 textTwo: "${widget.caseData.casePresentHistory}"),
      //             buildDataRow(
      //                 textOne: "Past History",
      //                 textTwo: "${widget.caseData.casePastHistory}"),
      //             buildDataRow(
      //                 textOne: "Medical History",
      //                 textTwo: "${widget.caseData.caseMedicalHistory}"),
      //             buildDataRow(
      //                 textOne: "Surgical History",
      //                 textTwo: "${widget.caseData.caseSurgicalHistory}"),
      //             buildDataRow(
      //                 textOne: "Family History",
      //                 textTwo: "${widget.caseData.caseFamilyHistory}"),
      //             buildDataRow(
      //                 textOne: "Posture",
      //                 textTwo: "${widget.caseData.caseObservationPosture}"),
      //             buildDataRow(
      //                 textOne: "Wasting",
      //                 textTwo: "${widget.caseData.caseObservationWasting}"),
      //           ]),
      //     ),
      //     DataTable(
      //         dataRowHeight: 5.h,
      //         columnSpacing: 1.w,
      //         dividerThickness: 0.5,
      //         columns: [
      //           DataColumn(label: Text("")),
      //           DataColumn(label: Text("")),
      //         ],
      //         rows: [
      //           buildDataRow(
      //               textOne: "Oedema",
      //               textTwo: "${widget.caseData.caseObservationOedema}"),
      //           buildDataRow(
      //               textOne: "Swelling",
      //               textTwo: " ${widget.caseData.caseObservationSwelling}"),
      //           buildDataRow(
      //               textOne: "Scar",
      //               textTwo: "${widget.caseData.caseObservationScar}"),
      //           buildDataRow(
      //               textOne: "Deformity",
      //               textTwo: "${widget.caseData.caseObservationDeformity}"),
      //           buildDataRow(
      //               textOne: "GAIT",
      //               textTwo: "${widget.caseData.caseObservationGait}"),
      //           buildDataRow(
      //               textOne: "Tenderness",
      //               textTwo: "${widget.caseData.casePalpationTenderness}"),
      //           buildDataRow(
      //               textOne: "Spasm",
      //               textTwo: "${widget.caseData.casePalpationSpasm}"),
      //           buildDataRow(
      //               textOne: "Abnormal Sound",
      //               textTwo: "${widget.caseData.casePalpationAbnormalSound}"),
      //         ]),
      //     Expanded(
      //       child: DataTable(
      //           dataRowHeight: 5.h,
      //           columnSpacing: 1.w,
      //           dividerThickness: 0.5,
      //           columns: [
      //             DataColumn(label: Text("")),
      //             DataColumn(label: Text("")),
      //           ],
      //           rows: [
      //             buildDataRow(
      //                 textOne: "Temperature",
      //                 textTwo: "${widget.caseData.casePalpationTemperature}"),
      //             buildDataRow(
      //                 textOne: 'ROM',
      //                 textTwo: "${widget.caseData.caseOnExaminationRom}"),
      //             buildDataRow(
      //                 textOne: "MMT",
      //                 textTwo: "${widget.caseData.caseOnExaminationMmt}"),
      //             buildDataRow(
      //                 textOne: "X-Ray",
      //                 textTwo: "${widget.caseData.caseOnInvestigationXray}"),
      //             buildDataRow(
      //                 textOne: "MRI",
      //                 textTwo: "${widget.caseData.caseOnInvestigationMri}"),
      //             buildDataRow(
      //                 textOne: "Other Reports",
      //                 textTwo: "${widget.caseData.caseOtherInfoReports}"),
      //             buildDataRow(
      //                 textOne: "Clinical Reports",
      //                 textTwo: "${widget.caseData.caseOtherInfoClinical}"),
      //           ]),
      //     ),
      //   ],
      // ),
      subtitle: Padding(
        padding: EdgeInsets.all(1.0.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tooltip(
              message: "Generate PDF",
              child: CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    _createPDF(id: widget.caseData.patientId as int);

                    print('${widget.caseData.patientId}');
                  },
                  icon: Icon(Icons.picture_as_pdf),
                ),
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Tooltip(
              message: "Edit Case",
              child: widget.isShowButtons
                  ? CircleAvatar(
                child: IconButton(
                    onPressed: () {
                      widget.edit(widget.index);
                    },
                    icon: Icon(Icons.edit)),
              )
                  : SizedBox(),
            ),
            SizedBox(
              width: 7,
            ),
            Tooltip(
                message: "Delete Case",
                child: widget.isShowButtons
                    ? CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      showConfirmationDialogue(context);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                )
                    : SizedBox()),
            // Tooltip(
            //     message: "Add Treatment Plan",
            //     child: CircleAvatar(
            //       child: IconButton(
            //           onPressed: () {
            //             showDialogForAddTreatment(context);
            //           },
            //           icon: Icon(Icons.next_plan_outlined)),
            //     )),
            // SizedBox(
            //   width: 7,
            // ),
            // Tooltip(
            //     message: "Show Treatment Plan",
            //     child: CircleAvatar(
            //       child: IconButton(
            //           onPressed: () async {
            //             Map<String, dynamic> getCategories =
            //                 await GetTreatmentHelper().getSpecificDetails(
            //                     widget.caseData.caseId as int);
            //
            //             categoryData = getCategories[
            //                 TreatmentConstants.treatmentCategory] as String;
            //             subCategoryData = getCategories[TreatmentConstants
            //                 .treatmentSubCategory] as String;
            //
            //             showDailogForShowTreatment(context);
            //           },
            //           icon: Icon(Icons.next_plan)),
            //     )),
            // SizedBox(
            //   width: 7,
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _createPDF({required int id}) async {
    Map<String, dynamic> patientDetails = await PdfHelper().getAllDetails(id)
    ;

    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    //Create the header with specific bounds
    PdfPageTemplateElement header = PdfPageTemplateElement(
        Rect.fromLTWH(0, 0, document.pages[0].getClientSize().width, 100));

    document.template.top = header;
//Create font
    PdfFont font = PdfStandardFont(
      PdfFontFamily.helvetica,
      15,
    );

    String createFullName() {
      String firstName = (patientDetails[PatientConstants.columnFirstName]);
      String middleName = (patientDetails[PatientConstants.columnMiddleName]);
      String lastName = (patientDetails[PatientConstants.columnLastName]);
      String fullName =
          "${firstName.toUpperCase()} ${middleName.toUpperCase()} ${lastName.toUpperCase()}";
      debugPrint("FullName : $fullName");
      return fullName;
    }

    PdfFont unOrderedFont = PdfStandardFont(PdfFontFamily.helvetica, 12);

    PdfListItemCollection item = PdfListItemCollection([
      '',
      'RELEVANT PATIENT HISTORY :',
      'ON OBSERVATION : ',
      'ON PALPATION : ',
      'ON EXAMINATION : ',
      'ON INVESTIGATION : ',
      'CLINICAL DIAGNOSIS : '
    ]);

    PdfListItemCollection item_2 = PdfListItemCollection([
      'NAME : '
          '${(patientDetails[PatientConstants.columnAbbreviation] as String)}'
          "."
          '${createFullName()} ',
      // 'MIDDLE NAME : ${(patientDetails[PatientConstants.columnMiddleName] as String)}',
      // 'LAST NAME: ${(patientDetails[PatientConstants.columnLastName] as String)} ',
      'AGE/GENDER :  ${(patientDetails[PatientConstants.columnAge] as String)}'
          "/"
          '${(patientDetails[PatientConstants.columnGender] as String)}',
      //'GENDER : ${(patientDetails[PatientConstants.columnGender] as String)}',
      // 'NUMBER : ${(patientDetails[PatientConstants.columnNumber] as String)}',
      // 'ALT-NUMBER : ${(patientDetails[PatientConstants.columnAlternativeNumber] as String)}',
      // 'OCCUPATION : ${(patientDetails[PatientConstants.columnOccupation] as String)}',
      // 'CITY : ${(patientDetails[PatientConstants.columnCity] as String)}',
      // 'PIN-CODE : ${(patientDetails[PatientConstants.columnPincode] as String)}',
      // 'Treated By : ${widget.caseData.caseTreatedBy}',
      // 'Date : ${widget.caseData.dateTime}',
      'CHIEF COMPLAINT : ${widget.caseData.chiefComplaint}',
      'SYMPTOMS BEHAVIOUR : ${widget.caseData.caseSymptoms}',
      'AGGRAVATING FACTOR : ${widget.caseData.caseAggravating}',
      'RELIVING FACTOR : ${widget.caseData.caseRelieving}',
      //'REFERRED BY : ${widget.caseData.caseReference}',
    ]);
    PdfListItemCollection item_3 = PdfListItemCollection([
      '* PRESENT  : ${widget.caseData.casePresentHistory}',
      '* PAST : ${widget.caseData.casePastHistory}',
      '* MEDICAL  : ${widget.caseData.caseMedicalHistory}',
      '* SURGICAL : ${widget.caseData.caseSurgicalHistory}',
      '* FAMILY  : ${widget.caseData.caseFamilyHistory}',
    ]);

    PdfListItemCollection item_4 = PdfListItemCollection([
      '- POSTURE : ${widget.caseData.caseObservationPosture}',
      '- WASTING : ${widget.caseData.caseObservationWasting}',
      '- OEDEMA : ${widget.caseData.caseObservationOedema}',
      '- SWELLING : ${widget.caseData.caseObservationSwelling}',
      '- SCAR : ${widget.caseData.caseObservationScar}',
      '- DEFORMITY : ${widget.caseData.caseObservationDeformity}',
      '- GAIT : ${widget.caseData.caseObservationGait}',
    ]);

    PdfListItemCollection item_5 = PdfListItemCollection([
      '* TENDERNESS : ${widget.caseData.casePalpationTenderness}',
      '* SPASM : ${widget.caseData.casePalpationSpasm}',
      '* TEMPERATURE : ${widget.caseData.casePalpationTemperature}',
      '* CREPITUS OR ABNORMAL SOUND : ${widget.caseData.casePalpationAbnormalSound}',
    ]);

    PdfListItemCollection item_6 = PdfListItemCollection([
      '- ROM : ${widget.caseData.caseOnExaminationRom}',
      '- MMT : ${widget.caseData.caseOnExaminationMmt}',
    ]);

    PdfListItemCollection item_7 = PdfListItemCollection([
      '* X-RAY :  ${widget.caseData.caseOnInvestigationXray}',
      '* MRI :  ${widget.caseData.caseOnInvestigationMri}',
      '* OTHER REPORTS : ${widget.caseData.caseOtherInfoReports}',
    ]);
    PdfListItemCollection item_8 = PdfListItemCollection([
      '- CLINICAL DIAGNOSIS: : ${widget.caseData.caseOtherInfoClinical}',
    ]);

//Create a string format
    PdfStringFormat format = PdfStringFormat(lineSpacing: 10);

//Create ordered list
//     PdfOrderedList oList = PdfOrderedList(
//       items: item,
//       font: font,
//       format: format,
//       markerHierarchy: false,
//     );

    PdfOrderedList oList = PdfOrderedList(
      items: item,
      font: unOrderedFont,
      format: format,
      markerHierarchy: true,
      style: PdfNumberStyle.none

    );

    PdfUnorderedList uList = PdfUnorderedList(
      items: item,
      font: unOrderedFont,
      style: PdfUnorderedMarkerStyle.none,
      format: format,
      indent: 20,
      textIndent: 20,
    );

    uList.items[0].subList = PdfUnorderedList(
        items: item_2,
        font: unOrderedFont,
        format: format,
        style: PdfUnorderedMarkerStyle.none);

    uList.items[1].subList = PdfUnorderedList(
        items: item_3,
        font: unOrderedFont,
        format: format,
        style: PdfUnorderedMarkerStyle.none);

    uList.items[2].subList = PdfUnorderedList(
        items: item_4,
        font: unOrderedFont,
        format: format,
        style: PdfUnorderedMarkerStyle.none);
    uList.items[3].subList = PdfUnorderedList(
        items: item_5,
        font: unOrderedFont,
        format: format,
        style: PdfUnorderedMarkerStyle.none);
    uList.items[4].subList = PdfUnorderedList(
        items: item_6,
        font: unOrderedFont,
        format: format,
        style: PdfUnorderedMarkerStyle.none);
    uList.items[5].subList = PdfUnorderedList(
        items: item_7,
        font: unOrderedFont,
        format: format,
        style: PdfUnorderedMarkerStyle.none);
    uList.items[6].subList = PdfUnorderedList(
        items: item_8,
        font: unOrderedFont,
        format: format,
        style: PdfUnorderedMarkerStyle.none);

// Draw ordered list with sub list
    oList.draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 0, page.getClientSize().width, page.getClientSize().height),
    );

    //Create the footer with specific bounds
    PdfPageTemplateElement footer = PdfPageTemplateElement(
        Rect.fromLTWH(0, 0, document.pages[0].getClientSize().width, 100));

    document.template.bottom = footer;

    List<int> bytes = document.save();

    document.dispose();

    // saveAndLaunchFile(, file, filename)

    saveAndLaunchFile(
      bytes,
      '${patientDetails[PatientConstants.columnFirstName]}.pdf',
    );
  }

  // buildTable(invoice) {}
  DataRow buildDataRow({required String textOne, required String textTwo}) {
    return DataRow(cells: [
      DataCell(
        buildCommonText(text: textOne),
      ),
      DataCell(Text(textTwo)),
    ]);
  }

  Padding buildCustomRow({required String title, required String subtitle}) {
    return Padding(
      padding: EdgeInsets.all(1.w),
      child: Row(
        children: [
          buildCommonText(text: title),
          SizedBox(
            width: 1.2.w,
          ),
          Container(
            width: 10.w,
            child: Text(
              subtitle,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> showConfirmationDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are you sure ?\n You want to delete the record."),
          actions: [
            TextButton(
                onPressed: () {
                  widget.delete(widget.index);
                  Navigator.of(context).pop();
                },
                child: Text("Yes")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No")),
          ],
        );
      },
    );
  }

  Future<dynamic> showDailogForShowTreatment(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Show Treatment"),
              content: Row(
                children: [
                  Text(categoryData),
                  Text(subCategoryData),
                ],
              ));
        });
  }
}