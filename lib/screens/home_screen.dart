import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:migraene/screens/calendar_screen.dart';
import '../services/ma_service.dart';
import '../services/model/migraeneanfall.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen> {
  MAService service = MAService();
  List<Migraeneanfall> anfaelle = [];
  double hasAmount = 0;

  String currentMonth = DateFormat.MMMM('de').format(DateTime.now());

  //Wie viele anfälle im aktuellen Monat?
  Future<double> amountMonth() async {
    anfaelle = await service.getMigraeneanfallList();
    double result = 0;
    DateTime today = DateTime.now();
    String currentMonth = today.month.toString();
    for(int i = 0; i < anfaelle.length; i++) {
      DateTime anfallDate = anfaelle[i].datum;
      String anfallMonth = anfallDate.month.toString();
      if(currentMonth == anfallMonth) {
        result++;
      }
    }
    return result;
  }

  //Wie viele Tage hat der aktuelle Monat?
  int getDaysInMonth() { //Code von https://api.flutter.dev/flutter/material/DateUtils/getDaysInMonth.html (Abrufdatum: 15.03.23)
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    if (month == DateTime.february) {
      final bool isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    print(daysInMonth[month - 1]);
    return daysInMonth[month - 1];
  }

  //Legende Diagramm
  final dataMap = <String, double>{
  };

  //Farben Diagramm
  final colorList = <Color>[
    Color(0xffdca1d1),
    Color(0xbffffffff),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: <Color>[
                  Color(0xffffdaf6),
                  Color(0xfff5ddff),
                  Color(0xffe6e1ff),
                  Color(0xffd3e6ff),
                  Color(0xffbdecff),
                  Color(0xffa8f1ff),
                  Color(0xff97f6ff),
                  Color(0xff90f9ff),
                ],
              ),
            ),
          ),
          FutureBuilder<double>(
            future: amountMonth(),
            builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: Color(0xffdca1d1),
                      )
                  ),
                );
              }
              hasAmount = snapshot.data!;
              dataMap["Migräne"] = hasAmount;
              dataMap["ohne Symptome"] = getDaysInMonth().toDouble()-hasAmount;
              //print(hasAmount);
              return Stack(
                  children: <Widget>[
                    Container(
                      width: 400,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 110, left: 50),
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
                              Text('schön dich wieder zu sehen',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Thin',
                                    fontSize: 23,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.bold,
                                    height: 0.9,
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 35.0),
                                child: Text(
                                    currentMonth,
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 23,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.bold,
                                      height: 0.9,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: PieChart(
                          chartRadius: MediaQuery.of(context).size.width / 1.5,
                          legendOptions: LegendOptions(
                            legendPosition: LegendPosition.bottom,
                            legendTextStyle: TextStyle(
                              fontFamily: 'Poppns-Thin',
                            ),
                          ),
                          dataMap: dataMap,
                          chartType: ChartType.ring,
                          baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                          colorList: colorList,
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                            showChartValueBackground: false,
                            decimalPlaces: 0,
                            showChartValuesOutside: false,
                          ),
                          totalValue: getDaysInMonth().toDouble(), //TODO: Anzahl der Tage des aktuellen Monats
                        ),
                      ),
                    ),
                  ],
              );
            }
          ),
        ],
      )

    );
  }

}

