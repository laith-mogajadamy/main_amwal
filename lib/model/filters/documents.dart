import 'package:equatable/equatable.dart';

class Documents extends Equatable {
  final String guid;
  final String code;
  final String name;
  final String categoriesGuid;

  const Documents({
    required this.guid,
    required this.code,
    required this.name,
    required this.categoriesGuid,
  });

  @override
  List<Object?> get props => [
        guid,
        code,
        name,
        categoriesGuid,
      ];
}
