import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String guid;
  final String code;
  final String name;

  const Project({
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
