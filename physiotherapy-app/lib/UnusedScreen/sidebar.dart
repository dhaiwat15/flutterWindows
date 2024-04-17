import 'package:flutter/material.dart';
import 'package:physiotherapy/Screens/add_patient_page.dart';

class SideBar extends StatelessWidget {
  PageController pageController = PageController(initialPage: 0);

   SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 200.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SideMenuButton(
            title: 'Add Patient',
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddPatientPage()));
            },
          ),
          _SideMenuButton(
            title: 'View Patient',
            onPressed: () {
            },
          ),
          _SideMenuButton(
            title: 'Make Appointment',
            onPressed: ()
            {
              Navigator.pushNamed(context, 'appointment',);
            },
          ),
          _SideMenuButton(
            title: 'View Appointment',
            onPressed: ()
            {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => ViewPage()));

            },
          ),
          _SideMenuButton(
            title: 'Logout',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _SideMenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;


  const _SideMenuButton({
    Key? key,
    required this.title,
    required this.onPressed,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 150,
        height: 60,
        child: MaterialButton(
            child: Text(title), color: Colors.white, onPressed: onPressed),
      ),
    );
  }
}
