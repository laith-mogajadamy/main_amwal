import 'package:equatable/equatable.dart';

class StatmentTotal extends Equatable {
  final String securitiesDate;
  final String docName;
  final String code;
  final String debit;
  final String credit;

  const StatmentTotal({
    required this.securitiesDate,
    required this.docName,
    required this.debit,
    required this.code,
    required this.credit,
  });

  @override
  List<Object?> get props => [
        securitiesDate,
        docName,
        debit,
        code,
        credit,
      ];
}
