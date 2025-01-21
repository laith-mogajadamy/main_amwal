import 'package:equatable/equatable.dart';

class Details extends Equatable {
  final String remarks;
  final dynamic quantity;
  final dynamic unitPrice;
  final dynamic debit;
  final dynamic credit;

  const Details({
    required this.remarks,
    required this.quantity,
    required this.debit,
    required this.unitPrice,
    required this.credit,
  });

  @override
  List<Object?> get props => [
        remarks,
        quantity,
        debit,
        unitPrice,
        credit,
      ];
}
