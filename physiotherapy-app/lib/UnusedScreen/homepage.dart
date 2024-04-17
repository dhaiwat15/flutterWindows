import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physiotherapy/UnusedScreen/dashboard.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _loginkey = GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = false;
  var _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _loginkey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/white.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hospital Records",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 90,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(55.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.white70,
                              offset: Offset(5.0, 5.0),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Card(
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              controller: _username,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.account_circle,
                                    color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: "Username",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              controller: _password,
                              obscureText: true,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                prefixIcon:
                                    Icon(Icons.vpn_key, color: Colors.black),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = false;
                                      });
                                    }),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: "Password",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Are you Admin ? ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black12,
                                          offset: Offset(5.0, 5.0),
                                        )
                                      ]),
                                ),
                                Radio(
                                    activeColor: Colors.black,
                                    value: "True",
                                    groupValue: _selectedGender,
                                    onChanged: (val) {
                                      setState(() {
                                        print(val);
                                        _selectedGender = val;
                                      });
                                    }),
                                Text('Yes'),
                                Radio(
                                    activeColor: Colors.black,
                                    value: "False",
                                    groupValue: _selectedGender,
                                    onChanged: (val) {
                                      setState(() {
                                        print(val);
                                        _selectedGender = val;
                                      });
                                    }),
                                Text("No"),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            height: 45,
                            width: 150,
                            child: Card(
                              elevation: 15,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('Login'),
                                textColor: Colors.white,
                                color: Colors.black,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DashBoard()));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
