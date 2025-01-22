import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String guid;
  final String code;
  final String name;
  final String iddefault;

  const Company({
    required this.guid,
    required this.code,
    required this.name,
    required this.iddefault,
  });

  @override
  List<Object?> get props => [
        guid,
        code,
        name,
        iddefault,
      ];
}
