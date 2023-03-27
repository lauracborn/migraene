import 'package:flutter/material.dart';
import 'package:migraene/screens/plus_screen.dart';

import '../../services/ma_service.dart';
import '../../services/mabackend_service_provider.dart';
import '../../services/model/migraeneanfall.dart';

class MedicationScreen extends StatefulWidget {
  const MedicationScreen({Key? key}) : super(key: key);

  static String medication = 'keine';

  @override
  _MedicationScreenState createState() =>
      _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {

TextEditingController nameController = TextEditingController();

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
                onPressed: () => Navigator.of(context).pop(),
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
                    Text('Medikamente',
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 38,
                          color: Color(0xFF000000),
                          //fontWeight: FontWeight.bold,
                        )),
                    Text('Was hast du dagegen genommen?',
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
            child: Stack(children: <Widget>[
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
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 80,
                        child: TextFormField(
                          controller: nameController,
                          maxLines: 7,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins-SemiBold'),
                            hintText: 'Medikamente eingeben...',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: Color(0xffffffff),
                                width: 3,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: Color(0xffffffff),
                                width: 3,
                              ),
                            ),
                          ),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins-SemiBold'),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 35,
                        width: 130,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle:
                            const TextStyle(fontFamily: 'Poppins-SemiBold'),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(18), // <-- Radius
                            ),
                            backgroundColor: Colors.black,
                            side:
                            BorderSide(color: Color(0xffffffff), width: 3),
                          ),
                          onPressed: () async {
                            MedicationScreen.medication = nameController.text;
                            Navigator.of(context).pop();
                          },
                          child: Text("Speichern"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}



