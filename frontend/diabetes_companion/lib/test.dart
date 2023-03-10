import '/core/functions/checkinternet.dart';
import 'package:flutter/material.dart';

import 'view/testview.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;
  initData() async {
    res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Page')),
      body: const TestView(),
    );
  }
}
