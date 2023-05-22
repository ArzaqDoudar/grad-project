// import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/services.dart';
// import 'package:date_field/date_field.dart
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../../controller/patient/maincontrollers/addlogscontroller.dart';
import '../../../../core/constant/color.dart';
// import '../../../../core/constant/imageasset.dart';
import 'package:intl/intl.dart';
// import 'package:timezone/timezone.dart' as tz;
// import '../../../widget/dropdownalarm.dart';
import 'alarmhelper.dart';
import 'alarminfo.dart';

class AlarmPage extends StatelessWidget {
  final AddLogsControllerImp controller;
  AlarmPage({super.key, required this.controller});

//   @override
//   AlarmPageState createState() => AlarmPageState();
// }

// class AlarmPageState extends State<AlarmPage> {
  bool isCheckedSaturday = false;
  bool isCheckedSunday = false;
  bool isCheckedMonday = false;
  bool isCheckedTuesday = false;
  bool isCheckedWednesday = false;
  bool isCheckedThursday = false;
  bool isCheckedFriday = false;
  bool isCheckedTakeMedicine = false;
  bool isCheckedGlucose = false;
  bool isCheckedAppointment = false;

  DateTime? alarmTime;
  late String alarmTimeString;
  bool isRepeatSelected = false;
  AlarmHelper alarmHelper = AlarmHelper();
  // Future<List<AlarmInfo>>? alarms;
  List<AlarmInfo>? currentAlarms;

  // @override
  // void initState() {
  //   alarmTime = DateTime.now();
  //   // _alarmHelper.initializeDatabase().then((value) {
  //   //   print('------database intialized');
  //   //   loadAlarms();
  //   // });
  // super.initState();
  // }

  void loadAlarms() {
    // _alarms = _alarmHelper.getAlarms();
    // if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorApp.blue;
      }
      return Colors.red;
    }

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListView(
                children: alarms.map<Widget>(
                  (alarm) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xFF005A8D), Color(0xFF5FC6FF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          boxShadow: [
                            BoxShadow(
                              color: ColorApp.blue.withOpacity(0.4),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: const Offset(4, 4),
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: const <Widget>[
                                    Icon(
                                      Icons.label,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Office',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Amiri'),
                                    ),
                                  ],
                                ),
                                Switch(
                                  onChanged: (value) {
                                    // setModalState(() {
                                    //   isRepeatSelected = value;
                                    // });
                                  },
                                  value: true,
                                  activeColor: Colors.white,
                                ),
                              ],
                            ),
                            const Text(
                              'Mon-Fri',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Amiri'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  '07:00 AM',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Amiri',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FilledButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    textStyle: const TextStyle(fontSize: 20),
                                    alignment: const Center().alignment,
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      useRootNavigator: true,
                                      context: context,
                                      clipBehavior: Clip.antiAlias,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(24),
                                        ),
                                      ),
                                      builder: (context) {
                                        return StatefulBuilder(
                                          builder: (context, setModalState) {
                                            return Container(
                                              padding: const EdgeInsets.all(32),
                                              child: Column(
                                                children: [
                                                  TextButton(
                                                    onPressed: () async {
                                                      var selectedTime =
                                                          await showTimePicker(
                                                        context: context,
                                                        initialTime:
                                                            TimeOfDay.now(),
                                                      );
                                                      if (selectedTime !=
                                                          null) {
                                                        final now =
                                                            DateTime.now();
                                                        var selectedDateTime =
                                                            DateTime(
                                                                now.year,
                                                                now.month,
                                                                now.day,
                                                                selectedTime
                                                                    .hour,
                                                                selectedTime
                                                                    .minute);
                                                        alarmTime =
                                                            selectedDateTime;
                                                        setModalState(() {
                                                          alarmTimeString =
                                                              DateFormat(
                                                                      'HH:mm')
                                                                  .format(
                                                                      selectedDateTime);
                                                        });
                                                      }
                                                    },
                                                    child: Text(
                                                      alarmTimeString,
                                                      style: const TextStyle(
                                                          fontSize: 32),
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: const Text(
                                                      'اعادة',
                                                      style: TextStyle(
                                                          color: ColorApp.blue,
                                                          fontFamily: 'Amiri',
                                                          fontSize: 24),
                                                    ),
                                                    trailing: FilledButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 20),
                                                        alignment:
                                                            const Center()
                                                                .alignment,
                                                      ),
                                                      onPressed: () {
                                                        showModalBottomSheet(
                                                          useRootNavigator:
                                                              true,
                                                          context: context,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .vertical(
                                                              top: Radius
                                                                  .circular(24),
                                                            ),
                                                          ),
                                                          builder: (context) {
                                                            return StatefulBuilder(
                                                              builder: (context,
                                                                  setModalState) {
                                                                return Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(20),
                                                                  child: Column(
                                                                    children: [
                                                                      ListTile(
                                                                          title:
                                                                              const Text(
                                                                            'كل سبت',
                                                                            style: TextStyle(
                                                                                color: ColorApp.blue,
                                                                                fontFamily: 'Amiri',
                                                                                fontSize: 24),
                                                                          ),
                                                                          trailing:
                                                                              Checkbox(
                                                                            checkColor:
                                                                                Colors.white,
                                                                            fillColor:
                                                                                MaterialStateProperty.resolveWith(getColor),
                                                                            value:
                                                                                isCheckedSaturday,
                                                                            onChanged:
                                                                                (value) {
                                                                              // setState(() {
                                                                              //   isCheckedSaturday = value!;
                                                                              // });
                                                                            },
                                                                          )),
                                                                      ListTile(
                                                                          title:
                                                                              const Text(
                                                                            'كل أحد',
                                                                            style: TextStyle(
                                                                                color: ColorApp.blue,
                                                                                fontFamily: 'Amiri',
                                                                                fontSize: 24),
                                                                          ),
                                                                          trailing:
                                                                              Checkbox(
                                                                            checkColor:
                                                                                Colors.white,
                                                                            fillColor:
                                                                                MaterialStateProperty.resolveWith(getColor),
                                                                            value:
                                                                                isCheckedSunday,
                                                                            onChanged:
                                                                                (value) {
                                                                              // setState(() {
                                                                              //   isCheckedSunday = value!;
                                                                              // });
                                                                            },
                                                                          )),
                                                                      ListTile(
                                                                          title:
                                                                              const Text(
                                                                            'كل اثنين',
                                                                            style: TextStyle(
                                                                                color: ColorApp.blue,
                                                                                fontFamily: 'Amiri',
                                                                                fontSize: 24),
                                                                          ),
                                                                          trailing:
                                                                              Checkbox(
                                                                            checkColor:
                                                                                Colors.white,
                                                                            fillColor:
                                                                                MaterialStateProperty.resolveWith(getColor),
                                                                            value:
                                                                                isCheckedMonday,
                                                                            onChanged:
                                                                                (value) {
                                                                              // setState(() {
                                                                              //   isCheckedMonday = value!;
                                                                              // });
                                                                            },
                                                                          )),
                                                                      ListTile(
                                                                          title:
                                                                              const Text(
                                                                            'كل ثلاثاء',
                                                                            style: TextStyle(
                                                                                color: ColorApp.blue,
                                                                                fontFamily: 'Amiri',
                                                                                fontSize: 24),
                                                                          ),
                                                                          trailing:
                                                                              Checkbox(
                                                                            checkColor:
                                                                                Colors.white,
                                                                            fillColor:
                                                                                MaterialStateProperty.resolveWith(getColor),
                                                                            value:
                                                                                isCheckedTuesday,
                                                                            onChanged:
                                                                                (value) {
                                                                              // setState(() {
                                                                              //   isCheckedTuesday = value!;
                                                                              // });
                                                                            },
                                                                          )),
                                                                      ListTile(
                                                                          title:
                                                                              const Text(
                                                                            'كل أربعاء',
                                                                            style: TextStyle(
                                                                                color: ColorApp.blue,
                                                                                fontFamily: 'Amiri',
                                                                                fontSize: 24),
                                                                          ),
                                                                          trailing:
                                                                              Checkbox(
                                                                            checkColor:
                                                                                Colors.white,
                                                                            fillColor:
                                                                                MaterialStateProperty.resolveWith(getColor),
                                                                            value:
                                                                                isCheckedWednesday,
                                                                            onChanged:
                                                                                (value) {
                                                                              // setState(() {
                                                                              //   isCheckedWednesday = value!;
                                                                              // });
                                                                            },
                                                                          )),
                                                                      ListTile(
                                                                          title:
                                                                              const Text(
                                                                            'كل خميس',
                                                                            style: TextStyle(
                                                                                color: ColorApp.blue,
                                                                                fontFamily: 'Amiri',
                                                                                fontSize: 24),
                                                                          ),
                                                                          trailing:
                                                                              Checkbox(
                                                                            checkColor:
                                                                                Colors.white,
                                                                            fillColor:
                                                                                MaterialStateProperty.resolveWith(getColor),
                                                                            value:
                                                                                isCheckedThursday,
                                                                            onChanged:
                                                                                (value) {
                                                                              // setState(() {
                                                                              //   isCheckedThursday = value!;
                                                                              // });
                                                                            },
                                                                          )),
                                                                      ListTile(
                                                                          title:
                                                                              const Text(
                                                                            'كل جمعة',
                                                                            style: TextStyle(
                                                                                color: ColorApp.blue,
                                                                                fontFamily: 'Amiri',
                                                                                fontSize: 24),
                                                                          ),
                                                                          trailing:
                                                                              Checkbox(
                                                                            checkColor:
                                                                                Colors.white,
                                                                            fillColor:
                                                                                MaterialStateProperty.resolveWith(getColor),
                                                                            value:
                                                                                isCheckedFriday,
                                                                            onChanged:
                                                                                (value) {
                                                                              // setState(() {
                                                                              //   isCheckedFriday = value!;
                                                                              // });
                                                                            },
                                                                          )),
                                                                      FloatingActionButton
                                                                          .extended(
                                                                        backgroundColor:
                                                                            ColorApp.blue,
                                                                        onPressed:
                                                                            () {
                                                                          // onSaveAlarm(_isRepeatSelected);
                                                                        },
                                                                        icon: const Icon(
                                                                            Icons.alarm),
                                                                        label:
                                                                            const Text(
                                                                          'حفظ',
                                                                          style: TextStyle(
                                                                              fontFamily: 'Amiri',
                                                                              fontSize: 24),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: const Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: ColorApp.blue,
                                                      ),
                                                    ),
                                                  ),
                                                  ListTile(
                                                    // DropdownAlarm()
                                                    title: const Text(
                                                      'تذكير بـ',
                                                      style: TextStyle(
                                                          color: ColorApp.blue,
                                                          fontFamily: 'Amiri',
                                                          fontSize: 24),
                                                    ),
                                                    trailing: FilledButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 20),
                                                        alignment:
                                                            const Center()
                                                                .alignment,
                                                      ),
                                                      onPressed: () {
                                                        showModalBottomSheet(
                                                          useRootNavigator:
                                                              true,
                                                          context: context,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .vertical(
                                                              top: Radius
                                                                  .circular(24),
                                                            ),
                                                          ),
                                                          builder: (context) {
                                                            return StatefulBuilder(
                                                              builder: (context,
                                                                  setModalState) {
                                                                return Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(20),
                                                                  child: Column(
                                                                    children: [
                                                                      ListTile(
                                                                          title:
                                                                              const Text(
                                                                            'تناول جرعة دواء',
                                                                            style: TextStyle(
                                                                                color: ColorApp.blue,
                                                                                fontFamily: 'Amiri',
                                                                                fontSize: 24),
                                                                          ),
                                                                          trailing:
                                                                              Checkbox(
                                                                            checkColor:
                                                                                Colors.white,
                                                                            fillColor:
                                                                                MaterialStateProperty.resolveWith(getColor),
                                                                            value:
                                                                                isCheckedTakeMedicine,
                                                                            onChanged:
                                                                                (value) {
                                                                              // setState(() {
                                                                              //   isCheckedTakeMedicine = value!;
                                                                              // });
                                                                            },
                                                                          )),
                                                                      ListTile(
                                                                          title:
                                                                              const Text(
                                                                            'فحص نسبة السكر',
                                                                            style: TextStyle(
                                                                                color: ColorApp.blue,
                                                                                fontFamily: 'Amiri',
                                                                                fontSize: 24),
                                                                          ),
                                                                          trailing:
                                                                              Checkbox(
                                                                            checkColor:
                                                                                Colors.white,
                                                                            fillColor:
                                                                                MaterialStateProperty.resolveWith(getColor),
                                                                            value:
                                                                                isCheckedGlucose,
                                                                            onChanged:
                                                                                (value) {
                                                                              // setState(() {
                                                                              //   isCheckedGlucose = value!;
                                                                              // });
                                                                            },
                                                                          )),
                                                                      ListTile(
                                                                          title:
                                                                              const Text(
                                                                            'موعد طبيب',
                                                                            style: TextStyle(
                                                                                color: ColorApp.blue,
                                                                                fontFamily: 'Amiri',
                                                                                fontSize: 24),
                                                                          ),
                                                                          trailing:
                                                                              Checkbox(
                                                                            checkColor:
                                                                                Colors.white,
                                                                            fillColor:
                                                                                MaterialStateProperty.resolveWith(getColor),
                                                                            value:
                                                                                isCheckedAppointment,
                                                                            onChanged:
                                                                                (value) {
                                                                              // setState(() {
                                                                              //   isCheckedAppointment = value!;
                                                                              // });
                                                                            },
                                                                          )),
                                                                      FloatingActionButton
                                                                          .extended(
                                                                        backgroundColor:
                                                                            ColorApp.blue,
                                                                        onPressed:
                                                                            () {
                                                                          // onSaveAlarm(_isRepeatSelected);
                                                                        },
                                                                        icon: const Icon(
                                                                            Icons.alarm),
                                                                        label:
                                                                            const Text(
                                                                          'حفظ',
                                                                          style: TextStyle(
                                                                              fontFamily: 'Amiri',
                                                                              fontSize: 24),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: const Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: ColorApp.blue,
                                                      ),
                                                    ),
                                                  ),
                                                  FloatingActionButton.extended(
                                                    backgroundColor:
                                                        ColorApp.blue,
                                                    onPressed: () {
                                                      // onSaveAlarm(_isRepeatSelected);
                                                    },
                                                    icon:
                                                        const Icon(Icons.alarm),
                                                    label: const Text(
                                                      'حفظ',
                                                      style: TextStyle(
                                                          fontFamily: 'Amiri',
                                                          fontSize: 24),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  FloatingActionButton.extended(
                                                    backgroundColor:
                                                        ColorApp.red,
                                                    onPressed: () {
                                                      // onSaveAlarm(_isRepeatSelected);
                                                    },
                                                    icon: const Icon(
                                                        Icons.delete),
                                                    label: const Text(
                                                      'حذف',
                                                      style: TextStyle(
                                                          fontFamily: 'Amiri',
                                                          fontSize: 24),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    );
                  },
                ).followedBy([
                  DottedBorder(
                    strokeWidth: 3,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(24),
                    dashPattern: const [5, 4],
                    color: ColorApp.lightblue,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          // color: ColorApp.blue,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          )),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16)),
                          backgroundColor:
                              const MaterialStatePropertyAll(ColorApp.white),
                        ),
                        onPressed: () {
                          alarmTimeString =
                              DateFormat('HH:mm').format(DateTime.now());
                          showModalBottomSheet(
                            useRootNavigator: true,
                            context: context,
                            clipBehavior: Clip.antiAlias,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                            ),
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setModalState) {
                                  return Container(
                                    padding: const EdgeInsets.all(32),
                                    child: Column(
                                      children: [
                                        TextButton(
                                          onPressed: () async {
                                            var selectedTime =
                                                await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                            );
                                            if (selectedTime != null) {
                                              final now = DateTime.now();
                                              var selectedDateTime = DateTime(
                                                  now.year,
                                                  now.month,
                                                  now.day,
                                                  selectedTime.hour,
                                                  selectedTime.minute);
                                              alarmTime = selectedDateTime;
                                              setModalState(() {
                                                alarmTimeString =
                                                    DateFormat('HH:mm').format(
                                                        selectedDateTime);
                                              });
                                            }
                                          },
                                          child: Text(
                                            alarmTimeString,
                                            style:
                                                const TextStyle(fontSize: 32),
                                          ),
                                        ),
                                        ListTile(
                                          title: const Text(
                                            'اعادة',
                                            style: TextStyle(
                                                color: ColorApp.blue,
                                                fontFamily: 'Amiri',
                                                fontSize: 24),
                                          ),
                                          trailing: FilledButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              padding: const EdgeInsets.all(10),
                                              textStyle:
                                                  const TextStyle(fontSize: 20),
                                              alignment:
                                                  const Center().alignment,
                                            ),
                                            onPressed: () {
                                              alarmTimeString =
                                                  DateFormat('HH:mm')
                                                      .format(DateTime.now());
                                              showModalBottomSheet(
                                                useRootNavigator: true,
                                                context: context,
                                                clipBehavior: Clip.antiAlias,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(24),
                                                  ),
                                                ),
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                    builder: (context,
                                                        setModalState) {
                                                      return Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20),
                                                        child: Column(
                                                          children: [
                                                            ListTile(
                                                                title:
                                                                    const Text(
                                                                  'كل سبت',
                                                                  style: TextStyle(
                                                                      color: ColorApp
                                                                          .blue,
                                                                      fontFamily:
                                                                          'Amiri',
                                                                      fontSize:
                                                                          24),
                                                                ),
                                                                trailing:
                                                                    Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  fillColor: MaterialStateProperty
                                                                      .resolveWith(
                                                                          getColor),
                                                                  value:
                                                                      isCheckedSaturday,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(
                                                                    //     () {
                                                                    //   isCheckedSaturday =
                                                                    //       value!;
                                                                    // });
                                                                  },
                                                                )),
                                                            ListTile(
                                                                title:
                                                                    const Text(
                                                                  'كل أحد',
                                                                  style: TextStyle(
                                                                      color: ColorApp
                                                                          .blue,
                                                                      fontFamily:
                                                                          'Amiri',
                                                                      fontSize:
                                                                          24),
                                                                ),
                                                                trailing:
                                                                    Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  fillColor: MaterialStateProperty
                                                                      .resolveWith(
                                                                          getColor),
                                                                  value:
                                                                      isCheckedSunday,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(
                                                                    //     () {
                                                                    //   isCheckedSunday =
                                                                    //       value!;
                                                                    // });
                                                                  },
                                                                )),
                                                            ListTile(
                                                                title:
                                                                    const Text(
                                                                  'كل اثنين',
                                                                  style: TextStyle(
                                                                      color: ColorApp
                                                                          .blue,
                                                                      fontFamily:
                                                                          'Amiri',
                                                                      fontSize:
                                                                          24),
                                                                ),
                                                                trailing:
                                                                    Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  fillColor: MaterialStateProperty
                                                                      .resolveWith(
                                                                          getColor),
                                                                  value:
                                                                      isCheckedMonday,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(
                                                                    //     () {
                                                                    //   isCheckedMonday =
                                                                    //       value!;
                                                                    // });
                                                                  },
                                                                )),
                                                            ListTile(
                                                                title:
                                                                    const Text(
                                                                  'كل ثلاثاء',
                                                                  style: TextStyle(
                                                                      color: ColorApp
                                                                          .blue,
                                                                      fontFamily:
                                                                          'Amiri',
                                                                      fontSize:
                                                                          24),
                                                                ),
                                                                trailing:
                                                                    Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  fillColor: MaterialStateProperty
                                                                      .resolveWith(
                                                                          getColor),
                                                                  value:
                                                                      isCheckedTuesday,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(
                                                                    //     () {
                                                                    //   isCheckedTuesday =
                                                                    //       value!;
                                                                    // });
                                                                  },
                                                                )),
                                                            ListTile(
                                                                title:
                                                                    const Text(
                                                                  'كل أربعاء',
                                                                  style: TextStyle(
                                                                      color: ColorApp
                                                                          .blue,
                                                                      fontFamily:
                                                                          'Amiri',
                                                                      fontSize:
                                                                          24),
                                                                ),
                                                                trailing:
                                                                    Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  fillColor: MaterialStateProperty
                                                                      .resolveWith(
                                                                          getColor),
                                                                  value:
                                                                      isCheckedWednesday,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(
                                                                    //     () {
                                                                    //   isCheckedWednesday =
                                                                    //       value!;
                                                                    // });
                                                                  },
                                                                )),
                                                            ListTile(
                                                                title:
                                                                    const Text(
                                                                  'كل خميس',
                                                                  style: TextStyle(
                                                                      color: ColorApp
                                                                          .blue,
                                                                      fontFamily:
                                                                          'Amiri',
                                                                      fontSize:
                                                                          24),
                                                                ),
                                                                trailing:
                                                                    Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  fillColor: MaterialStateProperty
                                                                      .resolveWith(
                                                                          getColor),
                                                                  value:
                                                                      isCheckedThursday,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(
                                                                    //     () {
                                                                    //   isCheckedThursday =
                                                                    //       value!;
                                                                    // });
                                                                  },
                                                                )),
                                                            ListTile(
                                                                title:
                                                                    const Text(
                                                                  'كل جمعة',
                                                                  style: TextStyle(
                                                                      color: ColorApp
                                                                          .blue,
                                                                      fontFamily:
                                                                          'Amiri',
                                                                      fontSize:
                                                                          24),
                                                                ),
                                                                trailing:
                                                                    Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  fillColor: MaterialStateProperty
                                                                      .resolveWith(
                                                                          getColor),
                                                                  value:
                                                                      isCheckedFriday,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(
                                                                    //     () {
                                                                    //   isCheckedFriday =
                                                                    //       value!;
                                                                    // });
                                                                  },
                                                                )),
                                                            FloatingActionButton
                                                                .extended(
                                                              backgroundColor:
                                                                  ColorApp.blue,
                                                              onPressed: () {
                                                                // onSaveAlarm(_isRepeatSelected);
                                                              },
                                                              icon: const Icon(
                                                                  Icons.alarm),
                                                              label: const Text(
                                                                'حفظ',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Amiri',
                                                                    fontSize:
                                                                        24),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorApp.blue,
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          // DropdownAlarm()
                                          title: const Text(
                                            'تذكير بـ',
                                            style: TextStyle(
                                                color: ColorApp.blue,
                                                fontFamily: 'Amiri',
                                                fontSize: 24),
                                          ),
                                          trailing: FilledButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              padding: const EdgeInsets.all(10),
                                              textStyle:
                                                  const TextStyle(fontSize: 20),
                                              alignment:
                                                  const Center().alignment,
                                            ),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                useRootNavigator: true,
                                                context: context,
                                                clipBehavior: Clip.antiAlias,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(24),
                                                  ),
                                                ),
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                    builder: (context,
                                                        setModalState) {
                                                      return Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20),
                                                        child: Column(
                                                          children: [
                                                            ListTile(
                                                                title:
                                                                    const Text(
                                                                  'تناول جرعة دواء',
                                                                  style: TextStyle(
                                                                      color: ColorApp
                                                                          .blue,
                                                                      fontFamily:
                                                                          'Amiri',
                                                                      fontSize:
                                                                          24),
                                                                ),
                                                                trailing:
                                                                    Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  fillColor: MaterialStateProperty
                                                                      .resolveWith(
                                                                          getColor),
                                                                  value:
                                                                      isCheckedTakeMedicine,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(
                                                                    //     () {
                                                                    //   isCheckedTakeMedicine =
                                                                    //       value!;
                                                                    // });
                                                                  },
                                                                )),
                                                            ListTile(
                                                                title:
                                                                    const Text(
                                                                  'فحص نسبة السكر',
                                                                  style: TextStyle(
                                                                      color: ColorApp
                                                                          .blue,
                                                                      fontFamily:
                                                                          'Amiri',
                                                                      fontSize:
                                                                          24),
                                                                ),
                                                                trailing:
                                                                    Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  fillColor: MaterialStateProperty
                                                                      .resolveWith(
                                                                          getColor),
                                                                  value:
                                                                      isCheckedGlucose,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(
                                                                    //     () {
                                                                    //   isCheckedGlucose =
                                                                    //       value!;
                                                                    // });
                                                                  },
                                                                )),
                                                            ListTile(
                                                                title:
                                                                    const Text(
                                                                  'موعد طبيب',
                                                                  style: TextStyle(
                                                                      color: ColorApp
                                                                          .blue,
                                                                      fontFamily:
                                                                          'Amiri',
                                                                      fontSize:
                                                                          24),
                                                                ),
                                                                trailing:
                                                                    Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  fillColor: MaterialStateProperty
                                                                      .resolveWith(
                                                                          getColor),
                                                                  value:
                                                                      isCheckedAppointment,
                                                                  onChanged:
                                                                      (value) {
                                                                    // setState(
                                                                    //     () {
                                                                    //   isCheckedAppointment =
                                                                    //       value!;
                                                                    // });
                                                                  },
                                                                )),
                                                            FloatingActionButton
                                                                .extended(
                                                              backgroundColor:
                                                                  ColorApp.blue,
                                                              onPressed: () {
                                                                // onSaveAlarm(_isRepeatSelected);
                                                              },
                                                              icon: const Icon(
                                                                  Icons.alarm),
                                                              label: const Text(
                                                                'حفظ',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Amiri',
                                                                    fontSize:
                                                                        24),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorApp.blue,
                                            ),
                                          ),
                                        ),
                                        FloatingActionButton.extended(
                                          backgroundColor: ColorApp.blue,
                                          onPressed: () {
                                            // onSaveAlarm(_isRepeatSelected);
                                          },
                                          icon: const Icon(Icons.alarm),
                                          label: const Text(
                                            'حفظ',
                                            style: TextStyle(
                                                fontFamily: 'Amiri',
                                                fontSize: 24),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Column(children: const <Widget>[
                          Icon(
                            Icons.add_alarm,
                            color: ColorApp.blue,
                          ),
                          Text(
                            'أضف منبه',
                            style: TextStyle(
                                color: ColorApp.blue,
                                fontFamily: 'Amiri',
                                fontSize: 24),
                          ),
                        ]),
                      ),
                    ),
                  )
                ]).toList(),
              ))
            ]));
  }
}
