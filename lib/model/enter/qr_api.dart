import 'package:equatable/equatable.dart';

class QRApi extends Equatable {
  final String api;
  final String pconnection;
  final String pport;
  final String phost;
  final String pdatabase;
  final String pusername;
  final String ppassword;
  final String pOSGUID;

  const QRApi({
    required this.api,
    required this.pconnection,
    required this.pport,
    required this.phost,
    required this.pdatabase,
    required this.pusername,
    required this.ppassword,
    required this.pOSGUID,
  });

  @override
  List<Object?> get props => [
        api,
        pconnection,
        pport,
        phost,
        pdatabase,
        pusername,
        ppassword,
        pOSGUID,
      ];
}
