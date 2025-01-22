import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String guid;
  final String code;
  final String iddefault;

  const Currency({
    required this.guid,
    required this.code,
    required this.iddefault,
  });

  @override
  List<Object?> get props => [
        guid,
        code,
        iddefault,
      ];
}
