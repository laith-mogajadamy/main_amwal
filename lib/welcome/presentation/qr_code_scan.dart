import 'dart:convert';
import 'package:mainamwal/core/network/global.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/enter/qr_api.dart';
import 'package:mainamwal/model/enter/qr_apimodel.dart';
import 'package:mainamwal/welcome/presentation/Auth/login.dart';
import 'package:mainamwal/widgets/font/black18text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  final MobileScannerController controller =
      MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);

  QRApi? qrApi;
  @override
  void dispose() {
    qrApi;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Black18text(text: S.of(context).turnonthecameraandscan),
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (barcodes) {
          qrApi = QRApiModel.fromJson(json.decode(barcodes
              .barcodes.firstOrNull!.displayValue!
              .toString()
              .replaceAll(r'\', r'\\')) as Map<String, dynamic>);
          if (qrApi != null) {
            Global.url = qrApi!.api;
            Global.headers = {
              "Content-type": "application/json",
              "Accept": "application/json",
              "Authorization": "Bearer ",
              "p-connection": qrApi!.pconnection,
              "p-host": qrApi!.phost,
              "p-port": qrApi!.pport,
              "p-database": qrApi!.pdatabase,
              "p-username": qrApi!.pusername,
              "p-password": qrApi!.ppassword,
              "POSGUID": qrApi!.pOSGUID,
            };
            Preferences.saveAPI(qrApi!.api);
            Preferences.savepconnection(qrApi!.pconnection);
            Preferences.savepport(qrApi!.pport);
            Preferences.savephost(qrApi!.phost);
            Preferences.savepdatabase(qrApi!.pdatabase);
            Preferences.savepusername(qrApi!.pusername);
            Preferences.saveppassword(qrApi!.ppassword);
            Preferences.savePOSGUID(qrApi!.pOSGUID);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          }
        },
      ),
    );
  }
}
