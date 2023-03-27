import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:migraene/screens/plus_screen.dart';

class SchmerzScreen extends StatefulWidget {
  const SchmerzScreen({Key? key}) : super(key: key);

  static String schmerzen = '0';

  @override
  State<SchmerzScreen> createState() => _SchmerzScreenState();
}

class _SchmerzScreenState extends State<SchmerzScreen> {
  double _currentValue = 5;

  @override
  Widget build(BuildContext context) {
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
                  SchmerzScreen.schmerzen = _currentValue.toString();
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
                    Text('Schmerzen',
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 38,
                          color: Color(0xFF000000),
                          //fontWeight: FontWeight.bold,
                        )),
                    Text('Wie doll tuts weh?',
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
          Stack(children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 520,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  color: Color(0xff000000),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Text(_currentValue.toString(),
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xffffffff),
                              fontFamily: 'Poppins-SemiBold')),
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 10,
                        thumbColor: Color(0xffffffff),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 20),
                        activeTrackColor: Colors.black,
                        inactiveTrackColor: Colors.black,
                        activeTickMarkColor: Color(0xff000000),
                        inactiveTickMarkColor: Color(0xff000000),
                      ),
                      child: Container(
                        decoration: new BoxDecoration(
                          border: Border.all(
                            color: Color(0xffffffff),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        width: MediaQuery.of(context).size.width - 60,
                        child: Slider(
                            min: 0,
                            max: 10,
                            divisions: 10,
                            //activeColor: Color(0xff000000),
                            //inactiveColor: Color(0xff000000),
                            value: _currentValue,
                            onChanged: (value) {
                              setState(() {
                                _currentValue = value;
                              });
                            }),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
