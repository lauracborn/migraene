import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../../services/ma_service.dart';
import '../../services/model/migraeneanfall.dart';
import '../services/model/symptome.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  MAService service = MAService();
  List<Migraeneanfall> anfaelle = [];
  List<Symptome> symptome = [];

  var enDatesFuture = initializeDateFormatting('de', null);
  String monthname = DateFormat.MMMM('de').format(DateTime.now());
  Color colorOutline = Colors.white;

  final List<String> entries = <String>[
    'Januar',
    'Februar',
    'März',
    'April',
    'Mai',
    'Juni',
    'Juli',
    'August',
    'September',
    'Oktober',
    'November',
    'Dezember'
  ];

  int selectedIndex = DateTime.now().month - 1;
  Color lila = Color(0xffdca1d1);

  Future<bool> _loadUsers() async {
    anfaelle = await service.getMigraeneanfallList();
    symptome = await service.getSymptomeList();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Stack(
        children: [
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
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.only(top: 25, bottom: 25, left: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Einträge',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins-Thin',
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'vom',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins-Thin',
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              height: 1.2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              '${monthname}',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins-Regular',
                                fontSize: 40,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 37,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: entries.length,
                      itemBuilder: (context, index) {
                        return Container(
                          //margin: const EdgeInsets.only(right: 3),
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedIndex = index;
                                  monthname = entries[index];
                                });
                              },
                              style: TextButton.styleFrom(
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                              child: Text(
                                '${entries[index]}',
                                style: TextStyle(
                                  color: selectedIndex == index
                                      ? Colors.black
                                      : Color(0xff8e8d99),
                                  fontSize: 17,
                                  fontFamily: selectedIndex == index
                                      ? 'Poppins-SemiBold'
                                      : 'Poppins-Regular',
                                ),
                              )),
                        );
                      }),
                ),
              ),
              FutureBuilder<bool>(
                future: _loadUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _buildListView(snapshot, monthname);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 2.3,
                    child: Align(
                      alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: Color(0xffdca1d1),
                        )
                    ),
                  );
                },
              ),
            ],
          ),
        ),
          ],
      ),
    );
  }

  Widget _buildListView(AsyncSnapshot<bool> snapshot, String dropdownvalue) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 35),
        width: MediaQuery.of(context).size.width - 40,
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: anfaelle.length,
              itemBuilder: (context, index) {
                initializeDateFormatting();
                String monthEintrag =
                DateFormat.MMMM('de').format(anfaelle[index].datum);
                if (monthEintrag == dropdownvalue) {
                  final user = anfaelle[index];
                  return _buildCard(user);
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(Migraeneanfall anfall) {
    double schmerzen = double.parse(anfall.schmerzen);
    int schmerzenInt = schmerzen.toInt();
    double skalaSchmerzen = schmerzenInt / 10;
    String inputFormat = DateFormat('dd. MMM yyyy', 'de').format(anfall.datum);

    return Card(
      margin: EdgeInsets.only(bottom: 12),
      color: Color(0xff000000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
        //side: new BorderSide(color: Colors.black, width: 3.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 100.0, left: 6.0, right: 6.0, bottom: 6.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            unselectedWidgetColor: colorOutline,
            iconTheme: IconThemeData(
              size: 35.0,
            ),
            colorScheme: ColorScheme.light(
              primary: colorOutline,
            ),
          ),
          child: ExpansionTile(
            title: Row(
              children: [
                Text(
                  inputFormat,
                  style: TextStyle(
                    color: colorOutline,
                    fontSize: 25,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ],
            ),
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.77,
                margin: const EdgeInsets.only(top: 20, bottom: 50),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Schmerzen',
                        style: TextStyle(
                          color: colorOutline,
                          fontFamily: 'Poppins-SemiBold',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 33),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: lila,
                      ),
                      width: MediaQuery.of(context).size.width *
                          0.77 *
                          skalaSchmerzen,
                      height: 45,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 33),
                      decoration: new BoxDecoration(
                        border: Border.all(
                          color: colorOutline,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 45,
                    ),
                  ],
                ),
              ),
              Container(
                height: 210,
                margin: const EdgeInsets.only(bottom: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                        border: Border.all(
                          color: colorOutline,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.only(left: 18),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Stack(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'Symptome',
                              style: TextStyle(
                                color: colorOutline,
                                fontSize: 18,
                                fontFamily: 'Poppins-SemiBold',
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                symptomeList(anfall),
                                style: TextStyle(
                                  color: colorOutline,
                                  fontSize: 15,
                                  fontFamily: 'Poppins-Regular',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: new BoxDecoration(
                        border: Border.all(
                          color: colorOutline,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.only(left: 18),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Stack(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'Trigger',
                              style: TextStyle(
                                color: colorOutline,
                                fontSize: 18,
                                fontFamily: 'Poppins-SemiBold',
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                '${anfall.trigger}',
                                style: TextStyle(
                                  color: colorOutline,
                                  fontSize: 15,
                                  fontFamily: 'Poppins-Regular',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: new BoxDecoration(
                        border: Border.all(
                          color: colorOutline,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.only(left: 18),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Stack(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'Lokalisation',
                              style: TextStyle(
                                color: colorOutline,
                                fontSize: 18,
                                fontFamily: 'Poppins-SemiBold',
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                '${anfall.lokalisation}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: colorOutline,
                                  fontFamily: 'Poppins-Regular',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: new BoxDecoration(
                        border: Border.all(
                          color: colorOutline,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.only(left: 18, right: 18),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Stack(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'Medikamente',
                              style: TextStyle(
                                color: colorOutline,
                                fontSize: 18,
                                fontFamily: 'Poppins-SemiBold',
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                '${anfall.medikamente}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: colorOutline,
                                  fontFamily: 'Poppins-Regular',
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
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () async {
                    bool result =
                    await service.deleteMigraeneanfallById(id: anfall.id);
                    setState(() {});
                  },
                  icon: new Image.asset('assets/icons/mull.png', height: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String symptomeList(Migraeneanfall anfall) {
    String symptomeString = '';
    int k = anfall.hasSymptome.length;
    // Läuft 8 mal durch
    for (Symptome a in symptome) {
      for (int i = 0; i < k; i++) {
        if (a.id == anfall.hasSymptome[i]) {
          if (i == k - 1) {
            symptomeString += a.bezeichnung;
          } else {
            symptomeString += a.bezeichnung + '\n';
          }
        }
      }
    }
    return symptomeString;
  }
}
