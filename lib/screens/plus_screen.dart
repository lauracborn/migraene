import 'package:flutter/material.dart';
import 'package:migraene/bottom_menu.dart';
import 'package:migraene/screens/schmerz_screen.dart';
import 'package:migraene/screens/symptoms_screen.dart';
import 'package:migraene/screens/trigger_screen.dart';
import 'package:migraene/screens/lokalisation_screen.dart';
import 'package:migraene/screens/medication_screen.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../services/mabackend_service_provider.dart';
import '../services/model/migraeneanfall.dart';
import 'lokalisation_screen.dart';
import 'medication_screen.dart';

class PlusScreen extends StatefulWidget {
  const PlusScreen({Key? key}) : super(key: key);
  static String whatTriggertapped = ''; //dort angeklcikter Trigger gespeichert
  static String whatLokaltapped = '';
  static List<int> whatSymptomstapped = [];

  @override
  State<PlusScreen> createState() => _PlusScreenState();
}

class _PlusScreenState extends State<PlusScreen> {
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();
  var date = DateTime.now();
  var enDatesFuture = initializeDateFormatting('de', null);

  String setMedication = '';
  List<int> setSymptoms = [];
  String setTrigger = '';
  String setSchmerzen = '';
  String setLokalisation = '';
  Color lila = Color(0xff8867ce);

  @override
  Widget build(BuildContext context) {
    String dateFormat = DateFormat('dd. MMMM', 'de').format(date);
    return Scaffold(
      body: Stack(children: <Widget>[
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
                  Text('Nicht schon',
                      style: TextStyle(
                        fontFamily: 'Poppins-Thin',
                        fontSize: 35,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                      )),
                  Text('wieder Migräne...',
                      style: TextStyle(
                        fontFamily: 'Poppins-Thin',
                        fontSize: 35,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      )),
                ],
              ),
            ),
          ),
        ),

        // Einfügen Start
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: <Widget>[
              Container(
                height: 445,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0), //geändert
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 38, left: 33),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: () async {
                                DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2024),
                                  locale: Locale('de'),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: Colors.black,
                                          onPrimary: Colors.white,
                                          onSurface: Color(0xff8e8d99),
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            primary: Color(0xffdca1d1), // button text color
                                          ),
                                        ),
                                        dialogTheme: const DialogTheme(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)))),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (newDate == null) return;

                                setState(() {
                                  date = newDate;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    dateFormat,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Poppins-Regular',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, bottom: 0),
                                    child: Image.asset(
                                      'assets/icons/calendar_outlines_white.png',
                                      scale: 2.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Container(
                            margin: const EdgeInsets.only(top: 35.0, bottom: 40.0, left: 15),
                            height: 230.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                        PageTransition(
                                          duration: Duration(milliseconds: 320),
                                          type: PageTransitionType.bottomToTop,
                                          child: SchmerzScreen(),
                                        )
                                    );
                                  },
                                  child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffffffff),
                                        width: 4,
                                      ),
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    margin: const EdgeInsets.only(left: 35),
                                    width: 190.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        new Image.asset(
                                          'assets/categories/schmerzen.png',
                                          scale: 1.6,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text(
                                            'Schmerzen',
                                            style: const TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        duration: Duration(milliseconds: 320),
                                        type: PageTransitionType.bottomToTop,
                                        child: SymptomsScreen(),
                                      )
                                    );
                                  },
                                  child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffffffff),
                                        width: 4,
                                      ),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    margin: const EdgeInsets.only(left: 20),
                                    width: 190.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        new Image.asset(
                                          'assets/categories/symptome.png',
                                          scale: 1.6,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text(
                                            'Symptome',
                                            style: const TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        duration: Duration(milliseconds: 320),
                                        type: PageTransitionType.bottomToTop,
                                        child: TriggerScreen(),
                                      )
                                    );
                                  },
                                  child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffffffff),
                                        width: 4,
                                      ),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    margin: const EdgeInsets.only(left: 20),
                                    width: 190.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        new Image.asset(
                                          'assets/categories/trigger.png',
                                          scale: 1.6,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text(
                                            'Trigger',
                                            style: const TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        duration: Duration(milliseconds: 320),
                                        type: PageTransitionType.bottomToTop,
                                        child: LokalisationScreen(),
                                      )
                                    );
                                  },
                                  child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffffffff),
                                        width: 4,
                                      ),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    margin: const EdgeInsets.only(left: 20),
                                    width: 190.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        new Image.asset(
                                          'assets/categories/lokalisation.png',
                                          scale: 1.6,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text(
                                            'Lokalisation',
                                            style: const TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        duration: Duration(milliseconds: 320),
                                        type: PageTransitionType.bottomToTop,
                                        child: MedicationScreen(),
                                      )
                                    );
                                  },
                                  child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffffffff),
                                        width: 4,
                                      ),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 35),
                                    width: 190.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        new Image.asset(
                                          'assets/categories/medikamente.png',
                                          scale: 1.6,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text(
                                            'Medikamente',
                                            style: const TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Einfügen Ende

                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                            height: 35,
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontFamily: 'Poppins-SemiBold'),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(18), // <-- Radius
                                ),
                                backgroundColor: Colors.black,
                                side: BorderSide(
                                    color: Color(0xffffffff), width: 3),
                              ),
                              onPressed: () async {
                                setMedication = MedicationScreen.medication;
                                setSymptoms = SymptomsScreen.symptoms;
                                setTrigger = TriggerScreen.trigger;
                                setSchmerzen = SchmerzScreen.schmerzen;
                                setLokalisation =
                                    LokalisationScreen.lokalisation;

                                Migraeneanfall anfall = Migraeneanfall(
                                  id: 0,
                                  datum: date,
                                  // Einfügen
                                  hasSymptome: setSymptoms,
                                  lokalisation: setLokalisation,
                                  medikamente: setMedication,
                                  schmerzen: setSchmerzen,
                                  trigger: setTrigger,
                                );

                                if (setSymptoms.length == 0) {
                                  setSymptoms.add(11);
                                }

                                setSymptoms = [];
                                setTrigger = '';
                                setLokalisation = '';

                                SymptomsScreen.symptoms = [];
                                LokalisationScreen.lokalisation = 'keine';
                                TriggerScreen.trigger = 'keine';

                                PlusScreen.whatSymptomstapped = [];
                                PlusScreen.whatTriggertapped = '';
                                PlusScreen.whatLokaltapped = '';

                                bool result = await MABackendServiceProvider
                                    .createObject<Migraeneanfall>(
                                  data: anfall,
                                  toJson: migraeneanfallToJson,
                                  resourcePath: "migraeneanfall.json",
                                );

                                setState(() {
                                  // update der Liste
                                });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomMenu()),
                                );
                              },
                              child: Text("Speichern"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
