part of 'warehouses_bloc.dart';

class WarehousesState extends Equatable {
  final String token;
  //
  final List<Warehouses> warehouses;
  final RequestState warehousesState;
  final String warehousesMessage;
  //
  final String fromDate;
  final String toDate;
  final String dueDate;
  //
  const WarehousesState({
    this.token = '',
    //
    this.warehouses = const [],
    this.warehousesState = RequestState.loading,
    this.warehousesMessage = '',
    //
    this.fromDate = '',
    this.toDate = '',
    this.dueDate = '',
  });

  WarehousesState copyWith({
    String? token,
    //
    List<Warehouses>? warehouses,
    RequestState? warehousesState,
    String? warehousesMessage,
    //
    String? fromDate,
    String? toDate,
    String? dueDate,
  }) {
    return WarehousesState(
      token: token ?? this.token,

      //
      warehouses: warehouses ?? this.warehouses,
      warehousesState: warehousesState ?? this.warehousesState,
      warehousesMessage: warehousesMessage ?? this.warehousesMessage,
      //
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      dueDate: dueDate ?? this.dueDate,
      //
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        warehouses,
        warehousesState,
        warehousesMessage,
        //
        fromDate,
        toDate,
        dueDate,
        //
      ];
}
