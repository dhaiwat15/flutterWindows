import 'package:flutter/material.dart';
import 'package:physiotherapy/Screens/add_patient_page.dart';
import 'package:physiotherapy/Screens/view_all_case_page.dart';
import 'package:physiotherapy/Screens/view_patient_page.dart';

class MasterFlow extends StatefulWidget {
  @override
  _MasterFlowState createState() => _MasterFlowState();
}

class _MasterFlowState extends State<MasterFlow> {
  int _selectedIndex = 0;
  TextStyle textStyle = TextStyle(color: Colors.blue,fontWeight: FontWeight
      .bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Row(
            children: [
              NavigationRail(

              selectedIconTheme: IconThemeData(
                color: Colors.blue[700]
              ),
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.all,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.person_add, size: 25),
                    selectedIcon: Icon(Icons.person_add),
                    label: Text('Add Patient',style: textStyle,),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 25,
                    ),
                    selectedIcon: Icon(Icons.add_circle_outline),
                    label: Text('View Patient',style: textStyle,),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.preview,
                      size: 25,
                    ),
                    selectedIcon: Icon(Icons.preview),
                    label: Text('  View All Case   ',style: textStyle,),
                  ),
                  // NavigationRailDestination(
                  //   icon: Icon(Icons.preview,size: 25,),
                  //   selectedIcon: Icon(Icons.preview),
                  //   label: Text('Export/Import Data'),
                  // ),
                ],
              ),
              VerticalDivider(thickness: 1, width: 1),
              // This is the main content.
              Expanded(
                child: Center(
                  child: checkIndexAndReturnPage(index: _selectedIndex),
                  // child: _selectedIndex == 1
                  //     ? InsertDataPage()
                  //     : Text('selectedIndex: $_selectedIndex'),
                ),
              )
            ],
          ),
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
     // if (index == 3) {
     //   return ExportImportPage();
     // }
  }
}
