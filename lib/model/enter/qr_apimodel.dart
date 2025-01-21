import 'package:mainamwal/model/enter/qr_api.dart';

class QRApiModel extends QRApi {
  const QRApiModel({
    required super.api,
    required super.pconnection,
    required super.pport,
    required super.phost,
    required super.pdatabase,
    required super.pusername,
    required super.ppassword,
    required super.pOSGUID,
  });

  factory QRApiModel.fromJson(Map<String, dynamic> json) => QRApiModel(
        api: json['API'] ?? '',
        pconnection: json['CONNECTION']?['p-connection'] ?? '',
        pport: json['CONNECTION']?['p-port'] ?? '',
        phost: json['CONNECTION']?['p-host'] ?? '',
        pdatabase: json['CONNECTION']?['p-database'] ?? '',
        pusername: json['CONNECTION']?['p-username'] ?? '',
        ppassword: json['CONNECTION']?['p-password'] ?? '',
        pOSGUID: json['POSGUID'] ?? '',
      );
}
