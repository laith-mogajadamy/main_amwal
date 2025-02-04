part of 'warehouses_bloc.dart';

abstract class WarehousesEvent extends Equatable {}

class GetWarehouses extends WarehousesEvent {
  final String search;

  GetWarehouses({
    required this.search,
  });

  @override
  List<Object?> get props => [
        search,
      ];
}

class ClearWarehouses extends WarehousesEvent {
  ClearWarehouses();

  @override
  List<Object?> get props => [];
}

class GetDefDates extends WarehousesEvent {
  final BuildContext context;
  GetDefDates({required this.context});
  @override
  List<Object?> get props => [];
}

//
class FromDateChanged extends WarehousesEvent {
  final String? fromdate;

  FromDateChanged({this.fromdate});

  @override
  List<Object?> get props => [fromdate];
}

class ToDateChanged extends WarehousesEvent {
  final String? todate;

  ToDateChanged({this.todate});

  @override
  List<Object?> get props => [todate];
}

class DueDateChanged extends WarehousesEvent {
  final String? duedate;

  DueDateChanged({this.duedate});

  @override
  List<Object?> get props => [duedate];
}
