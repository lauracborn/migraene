import 'package:flutter/material.dart';
import 'package:migraene/bottom_menu.dart';
import 'package:slider_button/slider_button.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xff000000),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 70.0, top: 80),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 1.3,
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/icons/logo.png"), fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 130.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SliderButton(
                height: 60,
                width: 270,
                baseColor: Color(0xffdca1d1),
                highlightedColor: Color(0xff000000),
                buttonColor: Color(0xffffffff),
                backgroundColor: Color(0xff000000),
                action: () {
                  ///Do something here
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const BottomMenu()));
                },
                label: Text(
                  "slide to get started",
                  style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      color: Color(0xff4a4a4a), fontSize: 19),
                ),
                /*icon: Text(
                  "x",
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 44,
                  ),
                ),*/
              ),
            ),
          ),
        ],
      ),
    );
  }
}