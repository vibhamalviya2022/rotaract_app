import 'dart:collection';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../provider/providerNotifier.dart';
import 'event_date_screen.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with TickerProviderStateMixin {
  DateTime? _selectedDay;
  bool isLoading = false;

  Map<DateTime, List<dynamic>> _visibleEvents = {};
  Map<DateTime, List<dynamic>> _events = {};
  List? _selectedEvents;
  CalendarController tableController = CalendarController();
  AnimationController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _visibleEvents = _events;
    _selectedEvents = _events[_selectedDay] ?? [];
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _controller!.forward();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllEventShowinCalanderNotifier();
    providerNotifier.getAllDateEventShowinNotifier(
        (DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()));
  }

  // Map<DateTime ,List<dynamic>> _gruopEvents(var events){
  //   Map<DateTime,List<dynamic>>data = {};
  //   events.forEach((event){
  //      DateTime date = DateTime(event.eventDate.year,event.eventDate.month,event.eventDate.day,12);
  //      if(data[date] == null) data[date] = [];
  //      data[date]!.add(event);
  //   });
  //   return data;
  // }

  getDashboardData(String chapterId, String sdate, String edate) async {
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    // print(chapterId);
    try {
      //check Internet Connection

      setState(() {
        isLoading = true;
      });

      // res.then((data) async {
      //   setState(() {
      //     isLoading = false;
      //   });
      if (providerNotifier.getAllEventDataEventList.isNotEmpty &&
          providerNotifier.getAllEventDataEventList.length > 0) {
        _events = {};
        for (int i = 0;
            i < providerNotifier.getAllEventDataEventList.length;
            i++) {
          _events.addAll({
            DateTime.parse(providerNotifier.getAllEventDataEventList[i].date
                    .toString()):
                providerNotifier.getAllEventDataEventList[i].title
                    as List<dynamic>
          });
        }
        _selectedEvents = _events[_selectedDay] ?? [];
        _visibleEvents = _events;
        print("printg visibale Event Show in flutter$_visibleEvents");
        // _visibleHolidays = _holidays;

        _controller = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 100),
        );
        _controller!.forward();
      } else {
        setState(() {
          isLoading = false;
          _events.clear();
        });
        //showMsg("Try Again.");
      }
      // }, onError: (e) {
      //   print("Error : on getDashboardData $e");
      //   showMsg("Something went wrong.Please try agian.");
      //   setState(() {
      //     isLoading = false;
      //   });
      // });

    } on SocketException catch (_) {
      print("No Internet Connection.");
    }
  }

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    // print("print Calander email${providerNotifier.getAllEventData?.data!.first.email}");
    Size size = MediaQuery.of(context).size;
    DateTime now;
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            providerNotifier.getAllDateEventCurrentDateNP!.isEmpty
                ? Container(
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(),
                    )),
                  )
                : Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: ColorsConstData.appBaseColor,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: providerNotifier
                              .getAllDateEventCurrentDateNP!.isEmpty
                          ? () {}
                          : () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EventDateScreen()));
                            },
                      child: Container(
                        width: size.width * 0.90,
                        height: size.height * 0.15,
                        child: providerNotifier
                                .getAllDateEventCurrentDateNP!.isEmpty
                            ? Center(
                                child:
                                    Text("Today You dont have any events..!!"),
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('dd/MM/yyyy')
                                        .format(DateTime.now()),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: SizedBox(
                                      height: 80,
                                      child: VerticalDivider(
                                        color: ColorsConstData.appBaseColor,
                                        thickness: 2,
                                        indent: 5,
                                        endIndent: 0,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Events',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
              child: TableCalendar(
                events: _visibleEvents,
                // enabledDayPredicate: _getEventsfromDay(),
                calendarController: tableController,
                locale: 'en_US',
                headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(
                        color: ColorsConstData.appBaseColor, fontSize: 18)),
                startDay: DateTime.utc(2010, 10, 16),
                endDay: DateTime.utc(2030, 3, 14),
                initialSelectedDay: DateTime.now(),
                // sixWeekMonthsEnforced: false,
                availableCalendarFormats: {
                  CalendarFormat.month: 'Month',
                },
                //startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                  todayStyle: TextStyle(color: Colors.white, fontSize: 18),

                  // isTodayHighlighted: true,
                  // contentDecoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20),
                  //   color: ColorsConstData.appBaseColor
                  // ),
                  //    s:
                  // TextStyle(color: Colors.black, fontSize: 16)
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
