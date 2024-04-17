import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physiotherapy/UnusedScreen/add_appointment_page.dart';
import 'package:physiotherapy/Screens/add_patient_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DashBoard',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            SizedBox(
              height: 80,
              width: 180,
              child: Card(
                elevation: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddPatientPage()));
                  },
                  child: Text(
                    "Insert Patient Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 80,
              width: 180,
              child: Card(
                elevation: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                  },
                  child: Text(
                    "View Patient Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 10),
            // SizedBox(
            //   height: 80,
            //   width: 180,
            //   child: Card(
            //     elevation: 10,
            //     child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(primary: Colors.black),
            //       onPressed: () {
            //         Navigator.of(context).push(
            //             MaterialPageRoute(builder: (context) => ViewPage()));
            //       },
            //       child: Text(
            //         "Doctor's Details",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 10),
            SizedBox(
              height: 80,
              width: 180,
              child: Card(
                elevation: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AppointmentPage()));
                  },
                  child: Text(
                    "Appointments",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 80,
              width: 180,
              child: Card(
                elevation: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                  },
                  child: Text(
                    "Staff Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            // Divider(
            //   indent: 0,
            //   endIndent: 1300,
            //   thickness: 2,
            // ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: SizedBox(
                height: 50,
                width: 150,
                child: Card(
                  elevation: 10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
            // SizedBox(height: 10),
            // Card(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).push(
            //           MaterialPageRoute(builder: (context) => UpdatePage()));
            //     },
            //     child: Text("Update"),
            //   ),
            // ),
            // SizedBox(height: 10),
            // Card(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).push(
            //           MaterialPageRoute(builder: (context) => DeletePage()));
            //     },
            //     child: Text("Delete"),
            //   ),
            // ),
            // SizedBox(height: 10),
            // Card(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).push(
            //           MaterialPageRoute(builder: (context) => UserDetails()));
            //     },
            //     child: Text("User Page"),
            //   ),
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return AlertDialog(
      //           title: Text("hello"),
      //           content: Text("Dialog Content"),
      //         );
      //       },
      //     );
      //   },
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   backgroundColor: Colors.black,
      // ),
    );
  }
}
