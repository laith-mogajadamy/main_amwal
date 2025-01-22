import 'package:equatable/equatable.dart';

class TransportCompanies extends Equatable {
  final String guid;
  final String code;
  final String name;

  const TransportCompanies({
    required this.guid,
    required this.code,
    required this.name,
  });

  @override
  List<Object?> get props => [
        guid,
        code,
        name,
      ];
}
