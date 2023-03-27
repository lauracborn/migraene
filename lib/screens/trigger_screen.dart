import 'package:flutter/material.dart';
import 'package:migraene/bottom_menu.dart';
import 'package:migraene/screens/plus_screen.dart';

class TriggerScreen extends StatefulWidget {
  const TriggerScreen({Key? key}) : super(key: key);

  static String trigger = 'keine';

  @override
  State<TriggerScreen> createState() => _TriggerScreenState();
}

class _TriggerScreenState extends State<TriggerScreen> {
  Color lila = Color(0xffdca1d1);

  Color _containerColor1 = Color(0xffffffff);
  Color _containerColor2 = Color(0xffffffff);
  Color _containerColor3 = Color(0xffffffff);
  Color _containerColor4 = Color(0xffffffff);
  Color _containerColor5 = Color(0xffffffff);
  bool tapped1 = false;
  bool tapped2 = false;
  bool tapped3 = false;
  bool tapped4 = false;
  bool tapped5 = false;

  bool oneistapped = false;

  @override
  Widget build(BuildContext context) {
    if(PlusScreen.whatTriggertapped == 'Stress') {
      _containerColor1 = lila;
      oneistapped = true;
      tapped1 = true;
      PlusScreen.whatTriggertapped = ''; //sonst wäre die if bei jedem build up der Seite true und Kastenfarbe würde bei lila bleiben
    }
    if(PlusScreen.whatTriggertapped == 'Wetter') {
      _containerColor2 = lila;
      oneistapped = true;
      tapped2 = true;
      PlusScreen.whatTriggertapped = '';
    }
    if(PlusScreen.whatTriggertapped == 'Schlafmangel') {
      _containerColor3 = lila;
      oneistapped = true;
      tapped3 = true;
      PlusScreen.whatTriggertapped = '';
    }
    if(PlusScreen.whatTriggertapped == 'Alkohol') {
      _containerColor4 = lila;
      oneistapped = true;
      tapped4 = true;
      PlusScreen.whatTriggertapped = '';
    }
    if(PlusScreen.whatTriggertapped == 'Ernährung') {
      _containerColor5 = lila;
      oneistapped = true;
      tapped5 = true;
      PlusScreen.whatTriggertapped = '';
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Transform.scale(
            scale: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: IconButton(
                icon: new Image.asset(
                  'assets/icons/back.jpg',
                  height: 15,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  if(tapped1 == true) {
                    TriggerScreen.trigger = 'Stress';
                    PlusScreen.whatTriggertapped = 'Stress';
                  }
                  if(tapped2 == true) {
                    TriggerScreen.trigger = 'Wetter';
                    PlusScreen.whatTriggertapped= 'Wetter';
                  }
                  if(tapped3 == true) {
                    TriggerScreen.trigger = 'Schlafmangel';
                    PlusScreen.whatTriggertapped= 'Schlafmangel';
                  }
                  if(tapped4 == true) {
                    TriggerScreen.trigger = 'Alkohol';
                    PlusScreen.whatTriggertapped = 'Alkohol';
                  }
                  if(tapped5 == true) {
                    TriggerScreen.trigger = 'Ernährung';
                    PlusScreen.whatTriggertapped = 'Ernährung';
                  }
                }
              ),
            )),
      ),
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
                padding: const EdgeInsets.only(top: 140.0, left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Trigger',
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 38,
                          color: Color(0xFF000000),
                          //fontWeight: FontWeight.bold,
                        )),
                    Text('Was ist Schuld?',
                        style: TextStyle(
                          fontFamily: 'Poppins-Thin',
                          fontSize: 23,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        )),
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
                  height: 520,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    color: Color(0xff000000),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      children: <Widget>[
                        Ink(
                          child: InkWell(
                            child: Container(
                              height: 70,
                              decoration: new BoxDecoration(
                                border: Border.all(
                                  color: _containerColor1,
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(top: 80, left: 55, right: 55),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Stress',
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
                            onTap: () {
                              if(oneistapped == false) {
                                if(tapped1 == false) {
                                  tapped1 = true;
                                  oneistapped = true;
                                  setState(() {
                                    _containerColor1 = lila;
                                  });
                                }
                              } else {
                                if(tapped1 == true) {
                                  oneistapped = false;
                                  tapped1 = false;
                                  setState(() {
                                    _containerColor1 = Color(0xffffffff);
                                  });
                                }
                              }
                            },
                          ),
                        ),
                        Ink(
                          child: InkWell(
                            child: Container(
                              height: 70,
                              decoration: new BoxDecoration(
                                border: Border.all(
                                  color: _containerColor2,
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Wetter',
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
                            onTap: () {
                              if(oneistapped == false) {
                                if(tapped2 == false) {
                                  tapped2 = true;
                                  oneistapped = true;
                                  setState(() {
                                    _containerColor2 = lila;
                                  });
                                }
                              } else {
                                if(tapped2 == true) {
                                  oneistapped = false;
                                  tapped2 = false;
                                  setState(() {
                                    _containerColor2 = Color(0xffffffff);
                                  });
                                }
                              }
                            },
                          ),
                        ),
                        Ink(
                          child: InkWell(
                            child: Container(
                              height: 70,
                              decoration: new BoxDecoration(
                                border: Border.all(
                                  color: _containerColor3,
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Schlafmangel',
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
                            onTap: () {
                              if(oneistapped == false) {
                                if(tapped3 == false) {
                                  tapped3 = true;
                                  oneistapped = true;
                                  setState(() {
                                    _containerColor3 = lila;
                                  });
                                }
                              } else {
                                if(tapped3 == true) {
                                  oneistapped = false;
                                  tapped3 = false;
                                  setState(() {
                                    _containerColor3 = Color(0xffffffff);
                                  });
                                }
                              }
                            },
                          ),
                        ),
                        Ink(
                          child: InkWell(
                            child: Container(
                              height: 70,
                              decoration: new BoxDecoration(
                                border: Border.all(
                                  color: _containerColor4,
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Alkohol',
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
                            onTap: () {
                              if(oneistapped == false) {
                                if(tapped4 == false) {
                                  tapped4 = true;
                                  oneistapped = true;
                                  setState(() {
                                    _containerColor4 = lila;
                                  });
                                }
                              } else {
                                if(tapped4 == true) {
                                  oneistapped = false;
                                  tapped4 = false;
                                  setState(() {
                                    _containerColor4 = Color(0xffffffff);
                                  });
                                }
                              }
                            },
                          ),
                        ),
                        Ink(
                          child: InkWell(
                            child: Container(
                              height: 70,
                              decoration: new BoxDecoration(
                                border: Border.all(
                                  color: _containerColor5,
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18, bottom: 50),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Ernährung',
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
                            onTap: () {
                              if(oneistapped == false) {
                                if(tapped5 == false) {
                                  tapped5 = true;
                                  oneistapped = true;
                                  setState(() {
                                    _containerColor5 = lila;
                                  });
                                }
                              } else {
                                if(tapped5 == true) {
                                  oneistapped = false;
                                  tapped5 = false;
                                  setState(() {
                                    _containerColor5 = Color(0xffffffff);
                                  });
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
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
