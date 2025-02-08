import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/warehouses/warehouses.dart';
import 'package:mainamwal/screens/warehouses/controller/warehouses_bloc.dart';
import 'package:mainamwal/screens/warehouses/presentation/search_for_item_page.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class WarehousesQrCodeScan extends StatelessWidget {
  final Warehouses warehouses;

  const WarehousesQrCodeScan({super.key, required this.warehouses});

  @override
  Widget build(BuildContext context) {
    final MobileScannerController controller =
        MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.black),
        title: AppText(
          text: S.of(context).turnonthecameraandscan,
          color: AppColor.apptitle,
          fontSize: 18,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SearchForItemPage(warehouses: warehouses),
            ));
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.black,
            size: 30.r,
          ),
        ),
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (barcodes) {
          context.read<WarehousesBloc>().add(
                QRCodeScanned(
                  scannedQR:
                      barcodes.barcodes.firstOrNull!.displayValue!.toString(),
                  warehouses: warehouses,
                ),
              );
          print(barcodes.barcodes.firstOrNull!.displayValue!.toString());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SearchForItemPage(warehouses: warehouses),
          ));
        },
      ),
    );
  }
}
