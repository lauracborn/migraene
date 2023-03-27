import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1, 1),
                end: Alignment(1, -1),
                colors: <Color>[
                  Color(0xff90f9ff),
                  Color(0xff9df4ff),
                  Color(0xffb9edff),
                  Color(0xffd7e5ff),
                  Color(0xffefdeff),
                  Color(0xffffdaf6),
                ],
              ),
            ),
          ),
          Container(
            width: 400,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0, left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Hallo ',
                            style: TextStyle(
                              fontFamily: 'Poppins-Thin',
                              fontSize: 38,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        Text('Hannah',
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 38,
                              color: Color(0xFF000000),

                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          height: 70,
                          decoration: new BoxDecoration(
                            color: Color(0xff000000),
                            border: Border.all(
                              width:3,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.only(left: 55, right: 55),
                          width: 300.0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13.0),
                            child: new Text('persönliche Daten',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins-Thin',
                                fontSize: 23,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          height: 70,
                          decoration: new BoxDecoration(
                            color: Color(0xff000000),
                            border: Border.all(
                              width:3,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.only(left: 55, right: 55),
                          width: 300.0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13.0),
                            child: new Text('Einstellungen',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins-Thin',
                                fontSize: 23,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          height: 70,
                          decoration: new BoxDecoration(
                            color: Color(0xff000000),
                            border: Border.all(
                              width:3,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.only(left: 55, right: 55),
                          width: 300.0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13.0),
                            child: new Text('Hilfe',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins-Thin',
                                fontSize: 23,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          height: 70,
                          decoration: new BoxDecoration(
                            color: Color(0xff000000),
                            border: Border.all(
                              width:3,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.only(left: 55, right: 55),
                          width: 300.0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13.0),
                            child: new Text('Abmelden',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins-Thin',
                                fontSize: 23,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}