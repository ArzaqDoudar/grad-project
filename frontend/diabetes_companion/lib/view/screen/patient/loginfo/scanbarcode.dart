import 'dart:async';
import '/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../widget/sectopbar.dart';

// class ChangePass extends StatefulWidget {
//   const ChangePass({super.key});

//   @override
//   State<ChangePass> createState() => ChangePassState();
// }

// class ChangePassState extends State<ChangePass> {

class ScanBarcode extends StatefulWidget {
  const ScanBarcode({super.key});

  @override
  State<ScanBarcode> createState() => ScanBarcodeState();
}

class ScanBarcodeState extends State<ScanBarcode> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print('barcodeScanRes=================');
      print(barcodeScanRes.codeUnits);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SecTopBar(
            label: 'اضافة وجبة جديدة',
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(ColorApp.blue)),
                        onPressed: () => scanBarcodeNormal(),
                        child: const Text('Start Scanning')),
                    Text('Scan result : $_scanBarcode\n',
                        style: const TextStyle(fontSize: 20)),
                    // Text(_scanBarcode.)
                  ]));
        }));
  }
}
