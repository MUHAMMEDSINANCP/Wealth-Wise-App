// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wealth_wise_app/lists.dart';
import 'package:wealth_wise_app/mainPages/upcomingTransactionsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/background.png'))),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 60, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const CircleAvatar(
                        minRadius: 25,
                        backgroundImage: AssetImage('assets/profileImage.webp'),
                      ),
                      ElevatedButton(
                        onPressed: (() => {}),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Payday in a week",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent),
                            )),
                      )
                    ],
                  )),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30, bottom: 20, top: 15),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Total Balance To Spend",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "€5785.55",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 20, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Planning Ahead",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const TransactionPage())));
                      },
                      child: Text(
                        "-€540.26",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: upcomingTransactions.length,
                  itemBuilder: (context, int index) {
                    return SizedBox(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                upcomingTransactions[index][0],
                                Text(
                                  upcomingTransactions[index][1],
                                  style: const TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "In ${upcomingTransactions[index][2].difference(DateTime.now()).inDays.toString()} days",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 20, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Last Week's Expenses",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "-1592.13",
                      style: TextStyle(
                          color: Colors.grey[700], fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    )
                  ],
                )
              ],
            ),
          ),
          const CalendarWeeklyView()
        ],
      ),
    ]));
  }
}

class CalendarWeeklyView extends StatefulWidget {
  const CalendarWeeklyView({super.key});

  @override
  State<CalendarWeeklyView> createState() => _CalendarWeeklyViewState();
}

class _CalendarWeeklyViewState extends State<CalendarWeeklyView> {
  int? groupValue = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    DateTime today = DateTime.fromMicrosecondsSinceEpoch(
        DateTime.now().microsecondsSinceEpoch);

    Widget buildSegment(
        String dateAbr, String datenumber, BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * 0.9,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            dateAbr[0] + dateAbr[1].toUpperCase(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(datenumber, style: const TextStyle(fontSize: 14)),
        ]),
      );
    }

    DateTime now = DateTime.now();

    List<DateTime> dates = [
      now,
      now.subtract(const Duration(days: 8)),
      now.subtract(const Duration(days: 7)),
      now.subtract(const Duration(days: 6)),
      now.subtract(const Duration(days: 5)),
      now.subtract(const Duration(days: 4)),
      now.subtract(const Duration(days: 3))
    ];

    DateTime start = DateTime(dates[groupValue!.toInt()].year,
        dates[groupValue!.toInt()].month, dates[groupValue!.toInt()].day, 0, 0);
    DateTime end = DateTime(
        dates[groupValue!.toInt()].year,
        dates[groupValue!.toInt()].month,
        dates[groupValue!.toInt()].day,
        23,
        59,
        59);

    Widget calendarBox(BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Container(
            alignment: Alignment.center,
            child: CupertinoSlidingSegmentedControl<int>(
                backgroundColor: Colors.transparent,
                thumbColor: Colors.greenAccent,
                padding: const EdgeInsets.all(5),
                groupValue: groupValue,
                children: {
                  0: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 8)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 8)))
                          .toString(),
                      context),
                  1: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 7)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 7)))
                          .toString(),
                      context),
                  2: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 6)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 6)))
                          .toString(),
                      context),
                  3: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 5)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 5)))
                          .toString(),
                      context),
                  4: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 4)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 4)))
                          .toString(),
                      context),
                  5: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 3)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 3)))
                          .toString(),
                      context),
                  6: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 2)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 2)))
                          .toString(),
                      context),
                },
                onValueChanged: (value) {
                  setState(() {
                    groupValue = value;
                    // ignore: avoid_print
                    print(groupValue);
                  });
                })),
      );
    }

    return Column(
      children: [
        calendarBox(context),
        VerticalList(date: dates[groupValue!.toInt()])
      ],
    );
  }
}

// ignore: must_be_immutable
class VerticalList extends StatefulWidget {
  VerticalList({super.key, required this.date});
  late DateTime date;

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 5),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: pastTransactions.length,
        itemBuilder: (context, int index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.greenAccent, width: 0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: pastTransactions[index][0],
              title: Text(
                pastTransactions[index][1],
                style: const TextStyle(color: Colors.greenAccent),
              ),
              subtitle: Text(pastTransactions[index][3]),
              trailing: Text(DateFormat.MMMMEEEEd()
                  .format(pastTransactions[index][2])
                  .toString()),
            ),
          );
        });
  }
}
