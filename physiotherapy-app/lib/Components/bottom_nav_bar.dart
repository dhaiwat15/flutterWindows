import 'package:flutter/material.dart';
import 'package:physiotherapy/Screens/add_patient_page.dart';
import 'package:physiotherapy/Screens/add_treatment_page.dart';
import 'package:physiotherapy/Screens/export_import_%20page.dart';
import 'package:physiotherapy/Screens/view_all_case_page.dart';
import 'package:physiotherapy/Screens/view_patient_page.dart';
import 'package:sizer/sizer.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: checkIndexAndReturnPage(index: _selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add),
                label: 'ADD PATIENT',
                backgroundColor: Colors.teal),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: 'VIEW PATIENT',
                backgroundColor: Colors.cyan),
            BottomNavigationBarItem(
              icon: Icon(Icons.preview),
              label: 'VIEW ALL CASE',
              backgroundColor: Colors.lightBlue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.preview),
              label: 'ADD TREATMENTS',
              backgroundColor: Colors.lightBlue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.import_export),
              label: 'IMPORT/EXPORT',
              backgroundColor: Colors.lightBlue,
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.preview),
            //   label: 'Add TreatmentPlan',
            //   backgroundColor: Colors.lightBlue,
            // ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black38,
          iconSize: 4.w,
          onTap: _onItemTap,
          elevation: 5),
    );
  }

  checkIndexAndReturnPage({required int index}) {
    if (index == 0) {
      return AddPatientPage();
    }
    if (index == 1) {
      return ViewPatientPage();
    }
    if (index == 2) {
      return ViewAllCasePage();
    }
    if (index == 3) {
      return AddTreatmentPlan();
    }
    if (index == 4) {
      return ExportImportPage();
    }
  }
}
