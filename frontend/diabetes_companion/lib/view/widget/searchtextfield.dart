// EXAMPLE use case for TextFieldSearch Widget
import '/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';
import 'dart:async';

class SearchTextField extends StatefulWidget {
  final String title;
  const SearchTextField({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => SearchTextFieldState();
}

class SearchTextFieldState extends State<SearchTextField> {
  TextEditingController myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    print("text field: ${myController.text}");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  // mocking a future
  Future<List> fetchSimpleData() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    List _list = <dynamic>[];
    // create a list from the text input of three items
    // to mock a list of items from an http call
    _list.add('خبز أبيض');
    _list.add('خبز أسمر');
    _list.add('خبز توست ');
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldSearch(
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Colors.grey,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          labelText: widget.title,
          labelStyle: const TextStyle(
              color: Colors.grey, fontSize: 20, fontFamily: 'Amiri')),
      textStyle: const TextStyle(
          color: ColorApp.blue, fontSize: 20, fontFamily: 'Amiri'),
      controller: myController,
      future: () {
        return fetchSimpleData();
      },
      label: '',
    );
  }
}

// Mock Test Item Class
class TestItem {
  final String label;
  dynamic value;

  TestItem({required this.label, this.value});

  factory TestItem.fromJson(Map<String, dynamic> json) {
    return TestItem(label: json['label'], value: json['value']);
  }
}
