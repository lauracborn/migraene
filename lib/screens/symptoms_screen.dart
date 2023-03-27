import 'package:flutter/material.dart';
import 'package:migraene/screens/plus_screen.dart';

class SymptomsScreen extends StatefulWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

  static List<int> symptoms = [];

  @override
  State<SymptomsScreen> createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  Color lila = Color(0xffdca1d1);

  Color _containerColor1 = Color(0xffffffff);
  Color _containerColor2 = Color(0xffffffff);
  Color _containerColor3 = Color(0xffffffff);
  Color _containerColor4 = Color(0xffffffff);
  Color _containerColor5 = Color(0xffffffff);
  Color _containerColor6 = Color(0xffffffff);
  Color _containerColor7 = Color(0xffffffff);
  Color _containerColor8 = Color(0xffffffff);
  bool tapped1 = false;
  bool tapped2 = false;
  bool tapped3 = false;
  bool tapped4 = false;
  bool tapped5 = false;
  bool tapped6 = false;
  bool tapped7 = false;
  bool tapped8 = false;

  bool oneistapped = false;

  @override
  Widget build(BuildContext context) {
    for(int i = 0; i < PlusScreen.whatSymptomstapped.length; i++) {
      if(PlusScreen.whatSymptomstapped[i] == 4) {
        _containerColor1 = lila;
        oneistapped = true;
        tapped1 = true;
        PlusScreen.whatSymptomstapped[i] = 11; //sonst wäre die if bei jedem build up der Seite true und Kastenfarbe würde bei lila bleiben
      }
      if(PlusScreen.whatSymptomstapped[i] == 5) {
        _containerColor2 = lila;
        oneistapped = true;
        tapped2 = true;
        PlusScreen.whatSymptomstapped[i] = 11;
      }
      if(PlusScreen.whatSymptomstapped[i] == 6) {
        _containerColor3 = lila;
        oneistapped = true;
        tapped3 = true;
        PlusScreen.whatSymptomstapped[i] = 11;
      }
      if(PlusScreen.whatSymptomstapped[i] == 7) {
        _containerColor4 = lila;
        oneistapped = true;
        tapped4 = true;
        PlusScreen.whatSymptomstapped[i] = 11;
      }
      if(PlusScreen.whatSymptomstapped[i] == 8) {
        _containerColor5 = lila;
        oneistapped = true;
        tapped5 = true;
        PlusScreen.whatSymptomstapped[i] = 11; //sonst wäre die if bei jedem build up der Seite true und Kastenfarbe würde bei lila bleiben
      }
      if(PlusScreen.whatSymptomstapped[i] == 9) {
        _containerColor6 = lila;
        oneistapped = true;
        tapped6 = true;
        PlusScreen.whatSymptomstapped[i] = 11; //sonst wäre die if bei jedem build up der Seite true und Kastenfarbe würde bei lila bleiben
      }
      if(PlusScreen.whatSymptomstapped[i] == 10) {
        _containerColor7 = lila;
        oneistapped = true;
        tapped7 = true;
        PlusScreen.whatSymptomstapped[i] = 11; //sonst wäre die if bei jedem build up der Seite true und Kastenfarbe würde bei lila bleiben
      }
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
                  //ist das erste Feld angekreuzt, dann wird Sehstörungen an PlusScreen gesendet, ansonsten bleibt es bei default
                    if(tapped1 == true) {
                      oneistapped = true;
                      SymptomsScreen.symptoms.add(4);
                      PlusScreen.whatSymptomstapped.add(4);
                      tapped1 = false;
                    }
                    if(tapped2 == true) {
                      oneistapped = true;
                      SymptomsScreen.symptoms.add(5);
                      PlusScreen.whatSymptomstapped.add(5);
                      tapped2 = false;
                    }
                    if(tapped3 == true) {
                      oneistapped = true;
                      SymptomsScreen.symptoms.add(6);
                      PlusScreen.whatSymptomstapped.add(6);
                      tapped3 = false;
                    }
                    if(tapped4 == true) {
                      oneistapped = true;
                      SymptomsScreen.symptoms.add(7);
                      PlusScreen.whatSymptomstapped.add(7);
                      tapped4 = false;
                    }
                    if(tapped5 == true) {
                      oneistapped = true;
                      SymptomsScreen.symptoms.add(8);
                      PlusScreen.whatSymptomstapped.add(8);
                      tapped5 = false;
                    }
                    if(tapped6 == true) {
                      oneistapped = true;
                      SymptomsScreen.symptoms.add(9);
                      PlusScreen.whatSymptomstapped.add(9);
                      tapped6 = false;
                    }
                    if(tapped7 == true) {
                      oneistapped = true;
                      SymptomsScreen.symptoms.add(10);
                      PlusScreen.whatSymptomstapped.add(10);
                      tapped7 = false;
                    }
                    if(oneistapped == false) {
                      SymptomsScreen.symptoms.add(11);
                      PlusScreen.whatSymptomstapped.add(11);
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
                    Text('Symptome',
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 38,
                          color: Color(0xFF000000),
                          //fontWeight: FontWeight.bold,
                        )),
                    Text('Wo drückt der Schuh?',
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
                                  //color: Color(0xffffffff),
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(top: 80, left: 55, right: 55),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Sehstörungen',
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
                              if(tapped1 == false) {
                                tapped1 = true;
                                setState(() {
                                  _containerColor1 = lila;
                                });
                              } else {
                                for(int i = 0; i < SymptomsScreen.symptoms.length; i++) {  //prüfen, ob bereits angekreuzter und wieder entfernter Eintrag in der Liste ist, wenn ja löschen
                                  if(SymptomsScreen.symptoms[i] == 4) {
                                    SymptomsScreen.symptoms.removeAt(i);
                                  }
                                }
                                setState(() {
                                  _containerColor1 = Color(0xffffffff);
                                });
                                tapped1 = false;
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
                                  //color: Color(0xffffffff),
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Lichtempfindlich',
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
                              if(tapped2 == false) {
                                tapped2 = true;
                                setState(() {
                                  _containerColor2 = lila;
                                });
                              } else {
                                for(int i = 0; i < SymptomsScreen.symptoms.length; i++) {  //prüfen, ob bereits angekreuzter und wieder entfernter Eintrag in der Liste ist, wenn ja löschen
                                  if(SymptomsScreen.symptoms[i] == 5) {
                                    SymptomsScreen.symptoms.removeAt(i);
                                  }
                                }
                                setState(() {
                                  _containerColor2 = Color(0xffffffff);
                                });
                                tapped2 = false;
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
                                  //color: Color(0xffffffff),
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Geräuschempfindlich',
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
                              if(tapped3 == false) {
                                tapped3 = true;
                                setState(() {
                                  _containerColor3 = lila;
                                });
                              } else {
                                for(int i = 0; i < SymptomsScreen.symptoms.length; i++) {  //prüfen, ob bereits angekreuzter und wieder entfernter Eintrag in der Liste ist, wenn ja löschen
                                  if(SymptomsScreen.symptoms[i] == 6) {
                                    SymptomsScreen.symptoms.removeAt(i);
                                  }
                                }
                                setState(() {
                                  _containerColor3 = Color(0xffffffff);
                                });
                                tapped3 = false;
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
                                  //color: Color(0xffffffff),
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Geruchsempfindlich',
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
                              if(tapped4 == false) {
                                tapped4 = true;
                                setState(() {
                                  _containerColor4 = lila;
                                });
                              } else {
                                for(int i = 0; i < SymptomsScreen.symptoms.length; i++) {  //prüfen, ob bereits angekreuzter und wieder entfernter Eintrag in der Liste ist, wenn ja löschen
                                  if(SymptomsScreen.symptoms[i] == 7) {
                                    SymptomsScreen.symptoms.removeAt(i);
                                  }
                                }
                                setState(() {
                                  _containerColor4 = Color(0xffffffff);
                                });
                                tapped4 = false;
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
                                  //color: Color(0xffffffff),
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Übelkeit',
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
                              if(tapped5 == false) {
                                tapped5 = true;
                                setState(() {
                                  _containerColor5 = lila;
                                });
                              } else {
                                for(int i = 0; i < SymptomsScreen.symptoms.length; i++) {  //prüfen, ob bereits angekreuzter und wieder entfernter Eintrag in der Liste ist, wenn ja löschen
                                  if(SymptomsScreen.symptoms[i] == 8) {
                                    SymptomsScreen.symptoms.removeAt(i);
                                  }
                                }
                                setState(() {
                                  _containerColor5 = Color(0xffffffff);
                                });
                                tapped5 = false;
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
                                  //color: Color(0xffffffff),
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Schüttelfrost',
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
                              if(tapped6 == false) {
                                tapped6 = true;
                                setState(() {
                                  _containerColor6 = lila;
                                });
                              } else {
                                for(int i = 0; i < SymptomsScreen.symptoms.length; i++) {  //prüfen, ob bereits angekreuzter und wieder entfernter Eintrag in der Liste ist, wenn ja löschen
                                  if(SymptomsScreen.symptoms[i] == 9) {
                                    SymptomsScreen.symptoms.removeAt(i);
                                  }
                                }
                                setState(() {
                                  _containerColor6 = Color(0xffffffff);
                                });
                                tapped6 = false;
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
                                  //color: Color(0xffffffff),
                                  width:3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(left: 55, right: 55, top: 18, bottom: 50),
                              width: 300.0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: new Text('Schwindel',
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
                              if(tapped7 == false) {
                                tapped7 = true;
                                setState(() {
                                  _containerColor7 = lila;
                                });
                              } else {
                                for(int i = 0; i < SymptomsScreen.symptoms.length; i++) {  //prüfen, ob bereits angekreuzter und wieder entfernter Eintrag in der Liste ist, wenn ja löschen
                                  if(SymptomsScreen.symptoms[i] == 10) {
                                    SymptomsScreen.symptoms.removeAt(i);
                                  }
                                }
                                setState(() {
                                  _containerColor7 = Color(0xffffffff);
                                });
                                tapped7 = false;
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
