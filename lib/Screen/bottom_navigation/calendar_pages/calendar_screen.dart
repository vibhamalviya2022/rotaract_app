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

  Map<DateTime, List> _visibleEvents = {};
  Map<DateTime, List> _events = {};
  List? _selectedEvents;
  CalendarController tableController = CalendarController();
  AnimationController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _events = {};
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

    ///ClenderShow in Event show
    providerNotifier.getAllEventCalenderShowNotifier().whenComplete(() {
      getDashboardData();
    });

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

  getDashboardData() async {
    print("getDashboardData is call");
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    try {
      print("getDashboardData try");

      setState(() {
        isLoading = true;
      });

      if (providerNotifier.getCalenderList.isNotEmpty &&
          providerNotifier.getCalenderList.length > 0) {
        print("getDashboardData is providerNotifier.getCalenderList.isNotEmpty");

        _events = {};
        for (int i = 0;
            i < providerNotifier.getCalenderList.length;
            i++) {
          print("getDashboardData is providerNotifier.getCalenderList.isNotEmpty for loop${providerNotifier.getCalenderList[i]!.date!}");
          var dateFormate = DateFormat('yyyy-mm-dd').format(DateTime.parse(providerNotifier.getCalenderList[i]!.date.toString()));
          print("getDashboardData is date :" + dateFormate.toString());
          print("getDashboardData is date : date formate" + dateFormate.toString());
          _events.addAll({DateTime.parse(dateFormate) : providerNotifier.getCalenderList[i]!.event
          });
          print("getDashboardData is providerNotifier.getCalenderList.isNotEmpty for loop klejeriuiubijsdbjio "+ _events.toString());

        }
        _selectedEvents = _events[_selectedDay] ?? [];
        print("getDashboardData _selectedEvents id is : " + _selectedEvents.toString());
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
                initialCalendarFormat: CalendarFormat.month,
                formatAnimation: FormatAnimation.slide,
                startingDayOfWeek: StartingDayOfWeek.monday,
                availableGestures: AvailableGestures.all,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                  /*CalendarFormat.twoWeeks: '2 weeks',
                  CalendarFormat.week: 'Week',*/
                },
                calendarStyle: CalendarStyle(
                  selectedColor: ColorsConstData.appBaseColor,
                  markersColor: ColorsConstData.appBaseColor,
                  todayStyle: TextStyle(color: Colors.white, fontSize: 18),
                  //markersMaxAmount: 7,
                ),
                // enabledDayPredicate: _getEventsfromDay(),
                calendarController: tableController,
                locale: 'en_US',
                headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(
                        color: ColorsConstData.appBaseColor, fontSize: 18)),
                startDay: DateTime.utc(2010, 10, 16),
                endDay: DateTime.utc(2030, 3, 14),
                initialSelectedDay: DateTime.now(),
                onDaySelected: _onDaySelected,
                onVisibleDaysChanged: _onVisibleDaysChanged,

                // sixWeekMonthsEnforced: false,

                //startingDayOfWeek: StartingDayOfWeek.monday,

              ),
            ),
          ],
        ),
      ),
    ));
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      print(first);
      print(last);

      /*getDashboardData(chapterId == "null" ? "0" : chapterId,
          first.toString().substring(0, 10), last.toString().substring(0, 10));

      _visibleEvents = Map.fromEntries(
        _events.entries.where(
          (entry) =>
              entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
              entry.key.isBefore(last.add(const Duration(days: 1))),
        ),
      );

      _visibleHolidays = Map.fromEntries(
        _holidays.entries.where(
          (entry) =>
              entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
              entry.key.isBefore(last.add(const Duration(days: 1))),
        ),
      );*/
    });
  }

  void _onDaySelected(DateTime day, List events,List formality) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
    print("selectedDay and event");
    print(_selectedDay);
    print(_selectedEvents);
    if (events.length > 0) {
      String selectedDate = day.toString().substring(0, 10);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => MultipleEventList(
      //       date: selectedDate,
      //       chapterId: chapterId,
      //       memberId: memberId,
      //     ),
      //   ),
      // );
    }
    /*ifx (events.length == 1) {
      showEventDialog(_selectedEvents);
    } else if (events.length > 1) {
      Navigator.pushNamed(context, '/MultipleEventList');
    }*/
  }
}
