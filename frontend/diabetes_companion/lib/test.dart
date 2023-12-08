// import 'package:dropdown_textfield/dropdown_textfield.dart';
// import 'package:flutter/material.dart';

// class TestPage extends StatefulWidget {
//   const TestPage({Key? key}) : super(key: key);

//   @override
//   State<TestPage> createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   FocusNode searchFocusNode = FocusNode();
//   FocusNode textFieldFocusNode = FocusNode();
//   late SingleValueDropDownController _cnt;
//   late MultiValueDropDownController _cntMulti;

//   @override
//   void initState() {
//     _cnt = SingleValueDropDownController();
//     _cntMulti = MultiValueDropDownController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _cnt.dispose();
//     _cntMulti.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 const Text(
//                   "Single selection dropdown with search option",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 DropDownTextField(
//                   // initialValue: "name4",
//                   controller: _cnt,
//                   clearOption: true,
//                   // enableSearch: true,
//                   // dropdownColor: Colors.green,
//                   searchDecoration: const InputDecoration(
//                       hintText: "enter your custom hint text here"),
//                   validator: (value) {
//                     if (value == null) {
//                       return "Required field";
//                     } else {
//                       return null;
//                     }
//                   },
//                   dropDownItemCount: 6,

//                   dropDownList: const [
//                     DropDownValueModel(name: 'name1', value: "value1"),
//                     DropDownValueModel(
//                         name: 'name2',
//                         value: "value2",
//                         toolTipMsg:
//                             "DropDownButton is a widget that we can use to select one unique value from a set of values"),
//                     DropDownValueModel(name: 'name3', value: "value3"),
//                     DropDownValueModel(
//                         name: 'name4',
//                         value: "value4",
//                         toolTipMsg:
//                             "DropDownButton is a widget that we can use to select one unique value from a set of values"),
//                     DropDownValueModel(name: 'name5', value: "value5"),
//                     DropDownValueModel(name: 'name6', value: "value6"),
//                     DropDownValueModel(name: 'name7', value: "value7"),
//                     DropDownValueModel(name: 'name8', value: "value8"),
//                   ],
//                   onChanged: (val) {},
//                 ),
//                 const SizedBox(
//                   height: 500,
//                 ),
//                 const Text(
//                   "Single selection dropdown with search option",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 DropDownTextField(
//                   clearOption: false,
//                   textFieldFocusNode: textFieldFocusNode,
//                   searchFocusNode: searchFocusNode,
//                   // searchAutofocus: true,
//                   dropDownItemCount: 8,
//                   searchShowCursor: false,
//                   enableSearch: true,
//                   searchKeyboardType: TextInputType.number,
//                   dropDownList: const [
//                     DropDownValueModel(name: 'name1', value: "value1"),
//                     DropDownValueModel(
//                         name: 'name2',
//                         value: "value2",
//                         toolTipMsg:
//                             "DropDownButton is a widget that we can use to select one unique value from a set of values"),
//                     DropDownValueModel(name: 'name3', value: "value3"),
//                     DropDownValueModel(
//                         name: 'name4',
//                         value: "value4",
//                         toolTipMsg:
//                             "DropDownButton is a widget that we can use to select one unique value from a set of values"),
//                     DropDownValueModel(name: 'name5', value: "value5"),
//                     DropDownValueModel(name: 'name6', value: "value6"),
//                     DropDownValueModel(name: 'name7', value: "value7"),
//                     DropDownValueModel(name: 'name8', value: "value8"),
//                   ],
//                   onChanged: (val) {},
//                 ),
//                 const SizedBox(
//                   height: 500,
//                 ),
//                 const Text(
//                   "multi selection dropdown",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 DropDownTextField.multiSelection(
//                   // controller: _cntMulti,
//                   displayCompleteItem: true,
//                   initialValue: const ["name1", "name2", "name8", "name3"],
//                   dropDownList: const [
//                     DropDownValueModel(name: 'name1', value: "value1"),
//                     DropDownValueModel(
//                         name: 'name2',
//                         value: "value2",
//                         toolTipMsg:
//                             "DropDownButton is a widget that we can use to select one unique value from a set of values"),
//                     DropDownValueModel(name: 'name3', value: "value3"),
//                     DropDownValueModel(
//                         name: 'name4',
//                         value: "value4",
//                         toolTipMsg:
//                             "DropDownButton is a widget that we can use to select one unique value from a set of values"),
//                     DropDownValueModel(name: 'name5', value: "value5"),
//                     DropDownValueModel(name: 'name6', value: "value6"),
//                     DropDownValueModel(name: 'name7', value: "value7"),
//                     DropDownValueModel(name: 'name8', value: "value8"),
//                   ],
//                   onChanged: (val) {
//                     setState(() {});
//                   },
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 const Text(
//                   "Single selection dropdown",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 DropDownTextField(
//                   // initialValue: "name4",
//                   listSpace: 20,
//                   listPadding: ListPadding(top: 20),
//                   enableSearch: true,
//                   validator: (value) {
//                     if (value == null) {
//                       return "Required field";
//                     } else {
//                       return null;
//                     }
//                   },
//                   dropDownList: const [
//                     DropDownValueModel(name: 'name1', value: "value1"),
//                     DropDownValueModel(name: 'name2', value: "value2"),
//                     DropDownValueModel(name: 'name3', value: "value3"),
//                     DropDownValueModel(name: 'name4', value: "value4"),
//                     DropDownValueModel(name: 'name5', value: "value5"),
//                     DropDownValueModel(name: 'name6', value: "value6"),
//                     DropDownValueModel(name: 'name7', value: "value7"),
//                     DropDownValueModel(name: 'name8', value: "value8"),
//                   ],
//                   listTextStyle: const TextStyle(color: Colors.red),
//                   dropDownItemCount: 8,

//                   onChanged: (val) {},
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           setState(() {});
//         },
//         label: const Text("Submit"),
//       ),
//     );
//   }
// }

// class TestPage2 extends StatefulWidget {
//   const TestPage2({Key? key}) : super(key: key);

//   @override
//   State<TestPage2> createState() => _TestPage2State();
// }

// class _TestPage2State extends State<TestPage2> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   FocusNode searchFocusNode = FocusNode();
//   FocusNode textFieldFocusNode = FocusNode();
//   late SingleValueDropDownController _cnt;
//   late MultiValueDropDownController _cntMulti;
//   final formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     _cnt = SingleValueDropDownController();
//     _cntMulti = MultiValueDropDownController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _cnt.dispose();
//     _cntMulti.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 const Text(
//                   "Single selection dropdown with search option",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Form(
//                   key: formKey,
//                   child: DropDownTextField(
//                     // initialValue: "name4",
//                     // readOnly: false,
//                     controller: _cnt,
//                     clearOption: true,

//                     keyboardType: TextInputType.number,
//                     autovalidateMode: AutovalidateMode.always,
//                     clearIconProperty: IconProperty(color: Colors.green),
//                     searchDecoration: const InputDecoration(
//                         hintText: "enter your custom hint text here"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Required field";
//                       } else {
//                         return null;
//                       }
//                     },
//                     dropDownItemCount: 6,

//                     dropDownList: const [
//                       DropDownValueModel(name: 'name1', value: "value1"),
//                       DropDownValueModel(
//                           name: 'name2',
//                           value: "value2",
//                           toolTipMsg:
//                               "DropDownButton is a widget that we can use to select one unique value from a set of values"),
//                       DropDownValueModel(name: 'name3', value: "value3"),
//                       DropDownValueModel(
//                           name: 'name4',
//                           value: "value4",
//                           toolTipMsg:
//                               "DropDownButton is a widget that we can use to select one unique value from a set of values"),
//                       DropDownValueModel(name: 'name5', value: "value5"),
//                       DropDownValueModel(name: 'name6', value: "value6"),
//                       DropDownValueModel(name: 'name7', value: "value7"),
//                       DropDownValueModel(name: 'name8', value: "value8"),
//                     ],
//                     onChanged: (val) {},
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           formKey.currentState!.validate();
//         },
//         label: const Text("Submit"),
//       ),
//     );
//   }
// }

// // import 'dart:convert';
// // // import '/view/widget/testwidget.dart';

// // // import '/view/widget/advicecard.dart';
// // import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;
// // import '/core/functions/checkinternet.dart';
// // import 'package:flutter/material.dart';

// // class Test extends StatefulWidget {
// //   const Test({super.key});

// //   @override
// //   State<Test> createState() => _TestState();
// // }

// // class _TestState extends State<Test> {
// //   var res;

// //   getAdvices() async {
// //     try {
// //       var result = await http
// //           .get(Uri.parse('https://da53-193-223-252-161.ngrok.io/advices'));
// //       if (result.statusCode == 200) {
// //         var jsonObj = jsonDecode(result.body);
// //         print("result from Database ==>\n");
// //         print(jsonObj['result']);
// //         return jsonObj['result'];
// //       } else {
// //         print("NO DATE from Database ==>\n");
// //         return Null;
// //       }
// //     } catch (e) {
// //       print('CATCH');
// //       print(e);
// //       print('CATCH');
// //       return "ERROR";
// //       // printError();
// //     }
// //   }

// //   // initData() async {
// //   //   res = await checkInternet();
// //   //   print(res);
// //   // }

// //   @override
// //   void initState() {
// //     // initData();
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('للتجربة ')),
// //       body: FutureBuilder<String>(
// //         future: getAdvices(), // a previously-obtained Future<String> or null
// //         builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
// //           List<Widget> children;
// //           if (snapshot.data != null) {
// //             children = <Widget>[
// //               const Icon(
// //                 Icons.check_circle_outline,
// //                 color: Colors.green,
// //                 size: 60,
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 16),
// //                 child: Text('Result: ${snapshot.data}'),
// //               ),
// //             ];
// //           } else if (snapshot.hasError) {
// //             children = <Widget>[
// //               const Icon(
// //                 Icons.error_outline,
// //                 color: Colors.red,
// //                 size: 60,
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 16),
// //                 child: Text('Error: ${snapshot.error}'),
// //               ),
// //             ];
// //           } else {
// //             children = const <Widget>[
// //               SizedBox(
// //                 width: 60,
// //                 height: 60,
// //                 child: CircularProgressIndicator(),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.only(top: 16),
// //                 child: Text('Awaiting result...'),
// //               ),
// //             ];
// //           }
// //           return Center(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: children,
// //             ),
// //           );
// //         },
// //       ),

// //       // FutureBuilder(
// //       //   initialData: const [],
// //       //   future: getAdvices(),
// //       //   builder: (context, snapshot) {
// //       //     if (snapshot.data != null) {
// //       //       return ListView.builder(
// //       //           itemCount: snapshot.data!.length,
// //       //           itemBuilder: (context, index) {
// //       //             return Card(
// //       //               elevation: 4,
// //       //               child: ListTile(
// //       //                 title: Text(snapshot.data![index]['text']),
// //       //                 subtitle: Text(snapshot.data![index]['description']),
// //       //               ),
// //       //             );
// //       //           });
// //       //     } else {
// //       //       return const CircularProgressIndicator();
// //       //     }
// //       //   },
// //       // ),
// //       // AdviceCard(text: "text"),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

// void main() {
//   initializeDateFormatting()
//       .then((_) => runApp(const BookingCalendarDemoApp()));
// }

class BookingCalendarDemoApp extends StatefulWidget {
  const BookingCalendarDemoApp({Key? key}) : super(key: key);

  @override
  State<BookingCalendarDemoApp> createState() => _BookingCalendarDemoAppState();
}

class _BookingCalendarDemoAppState extends State<BookingCalendarDemoApp> {
  final now = DateTime.now();
  late BookingService mockBookingService;

  @override
  void initState() {
    super.initState();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    print('${newBooking.toJson()} has been uploaded');
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    ///take care this is only mock, so if you add today as disabledDays it will still be visible on the first load
    ///disabledDays will properly work with real data
    DateTime first = now;
    DateTime tomorrow = now.add(Duration(days: 1));
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(
        DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));

    //book whole day example
    converted.add(DateTimeRange(
        start: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 5, 0),
        end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 0)));
    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Booking Calendar Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Booking Calendar Demo'),
          ),
          body: Center(
            child: BookingCalendar(
              bookingService: mockBookingService,
              convertStreamResultToDateTimeRanges: convertStreamResultMock,
              getBookingStream: getBookingStreamMock,
              uploadBooking: uploadBookingMock,
              pauseSlots: generatePauseSlots(),
              pauseSlotText: 'LUNCH',
              hideBreakTime: false,
              loadingWidget: const Text('Fetching data...'),
              uploadingWidget: const CircularProgressIndicator(),
              locale: 'hu_HU',
              startingDayOfWeek: StartingDayOfWeek.tuesday,
              wholeDayIsBookedWidget:
                  const Text('Sorry, for this day everything is booked'),
              //disabledDates: [DateTime(2023, 1, 20)],
              //disabledDays: [6, 7],
            ),
          ),
        ));
  }
}
