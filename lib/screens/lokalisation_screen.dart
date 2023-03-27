import 'package:flutter/material.dart';
import 'package:migraene/screens/plus_screen.dart';

class LokalisationScreen extends StatefulWidget {
  const LokalisationScreen({Key? key}) : super(key: key);

  static String lokalisation = 'keine';

  @override
  State<LokalisationScreen> createState() => _LokalisationScreenState();
}

class _LokalisationScreenState extends State<LokalisationScreen> {
  Color lila = Color(0xffdca1d1);

  Color _containerColor1 = Color(0xffffffff);
  Color _containerColor2 = Color(0xffffffff);
  Color _containerColor3 = Color(0xffffffff);
  Color _containerColor4 = Color(0xffffffff);
  Color _containerColor5 = Color(0xffffffff);
  Color _containerColor6 = Color(0xffffffff);
  Color _containerColor7 = Color(0xffffffff);
  Color _containerColor8 = Color(0xffffffff);
  Color _containerColor9 = Color(0xffffffff);
  bool tapped1 = false;
  bool tapped2 = false;
  bool tapped3 = false;
  bool tapped4 = false;
  bool tapped5 = false;
  bool tapped6 = false;
  bool tapped7 = false;
  bool tapped8 = false;
  bool tapped9 = false;

  bool oneistapped = false;

  @override
  Widget build(BuildContext context) {
    if(PlusScreen.whatLokaltapped == 'Stirn') {
      _containerColor1 = lila;
      oneistapped = true;
      tapped1 = true;
      PlusScreen.whatLokaltapped = ''; //sonst wäre die if bei jedem build up der Seite true und Kastenfarbe würde bei lila bleiben
    }
    if(PlusScreen.whatLokaltapped == 'Schläfe') {
      _containerColor2 = lila;
      oneistapped = true;
      tapped2 = true;
      PlusScreen.whatLokaltapped = '';
    }
    if(PlusScreen.whatLokaltapped == 'Auge l') {
      _containerColor3 = lila;
      oneistapped = true;
      tapped3 = true;
      PlusScreen.whatLokaltapped = '';
    }
    if(PlusScreen.whatLokaltapped == 'Auge r') {
      _containerColor4 = lila;
      oneistapped = true;
      tapped4 = true;
      PlusScreen.whatLokaltapped = '';
    }
    if(PlusScreen.whatLokaltapped == 'Oberkopf') {
      _containerColor5 = lila;
      oneistapped = true;
      tapped5 = true;
      PlusScreen.whatLokaltapped = '';
    }
    if(PlusScreen.whatLokaltapped == 'Hinterkopf') {
      _containerColor6 = lila;
      oneistapped = true;
      tapped6 = true;
      PlusScreen.whatLokaltapped = '';
    }
    if(PlusScreen.whatLokaltapped == 'Ringförmig') {
      _containerColor7 = lila;
      oneistapped = true;
      tapped7 = true;
      PlusScreen.whatLokaltapped = '';
    }
    if(PlusScreen.whatLokaltapped == 'Einseitig r') {
      _containerColor8 = lila;
      oneistapped = true;
      tapped8 = true;
      PlusScreen.whatLokaltapped = '';
    }
    if(PlusScreen.whatLokaltapped == 'Einseitig l') {
      _containerColor9 = lila;
      oneistapped = true;
      tapped9 = true;
      PlusScreen.whatLokaltapped = '';
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
                    LokalisationScreen.lokalisation = 'Stirn';
                    PlusScreen.whatLokaltapped = 'Stirn';
                  }
                  if(tapped2 == true) {
                    LokalisationScreen.lokalisation = 'Schläfe';
                    PlusScreen.whatLokaltapped = 'Schläfe';
                  }
                  if(tapped3 == true) {
                    LokalisationScreen.lokalisation = 'Auge l';
                    PlusScreen.whatLokaltapped = 'Auge l';
                  }
                  if(tapped4 == true) {
                    LokalisationScreen.lokalisation = 'Auge r';
                    PlusScreen.whatLokaltapped = 'Auge r';
                  }
                  if(tapped5 == true) {
                    LokalisationScreen.lokalisation = 'Oberkopf';
                    PlusScreen.whatLokaltapped = 'Oberkopf';
                  }
                  if(tapped6 == true) {
                    LokalisationScreen.lokalisation = 'Hinterkopf';
                    PlusScreen.whatLokaltapped = 'Hinterkopf';
                  }
                  if(tapped7 == true) {
                    LokalisationScreen.lokalisation = 'Ringförmig';
                    PlusScreen.whatLokaltapped = 'Ringförmig';
                  }
                  if(tapped8 == true) {
                    LokalisationScreen.lokalisation = 'Einseitig r';
                    PlusScreen.whatLokaltapped = 'Einseitig r';
                  }
                  if(tapped9 == true) {
                    LokalisationScreen.lokalisation = 'Einseitig l';
                    PlusScreen.whatLokaltapped = 'Einseitig l';
                  }
                }
              ),
            )
        ),
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
                    Text('Lokalisation',
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 38,
                          color: Color(0xFF000000),
                          //fontWeight: FontWeight.bold,
                        )),
                    Text('Wo tuts weh?',
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
                                child: new Text('Stirn',
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
                                child: new Text('Schläfe',
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
                                child: new Text('Auge l',
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
                                child: new Text('Auge r',
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
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Oberkopf',
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
                        Ink(
                          child: InkWell(
                            child: Container(
                              height: 70,
                              decoration: new BoxDecoration(
                                border: Border.all(
                                  color: _containerColor6,
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Hinterkopf',
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
                                if(tapped6 == false) {
                                  tapped6 = true;
                                  oneistapped = true;
                                  setState(() {
                                    _containerColor6 = lila;
                                  });
                                }
                              } else {
                                if(tapped6 == true) {
                                  oneistapped = false;
                                  tapped6 = false;
                                  setState(() {
                                    _containerColor6 = Color(0xffffffff);
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
                                  color: _containerColor7,
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Ringförmig',
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
                                if(tapped7 == false) {
                                  tapped7 = true;
                                  oneistapped = true;
                                  setState(() {
                                    _containerColor7 = lila;
                                  });
                                }
                              } else {
                                if(tapped7 == true) {
                                  oneistapped = false;
                                  tapped7 = false;
                                  setState(() {
                                    _containerColor7 = Color(0xffffffff);
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
                                  color: _containerColor8,
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Einseitig r',
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
                                if(tapped8 == false) {
                                  tapped8 = true;
                                  oneistapped = true;
                                  setState(() {
                                    _containerColor8 = lila;
                                  });
                                }
                              } else {
                                if(tapped8 == true) {
                                  oneistapped = false;
                                  tapped8 = false;
                                  setState(() {
                                    _containerColor8 = Color(0xffffffff);
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
                                  color: _containerColor9,
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18, bottom: 50),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Einseitig l',
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
                                if(tapped9 == false) {
                                  tapped9 = true;
                                  oneistapped = true;
                                  setState(() {
                                    _containerColor9 = lila;
                                  });
                                }
                              } else {
                                if(tapped9 == true) {
                                  oneistapped = false;
                                  tapped9 = false;
                                  setState(() {
                                    _containerColor9 = Color(0xffffffff);
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
