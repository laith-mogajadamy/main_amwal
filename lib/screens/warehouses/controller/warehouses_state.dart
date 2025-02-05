part of 'warehouses_bloc.dart';

class WarehousesState extends Equatable {
  final String token;
  //
  final List<Warehouses> warehouses;
  final RequestState warehousesState;
  final String warehousesMessage;
  //
  final List<SearchedWarehouses> searchedWarehouses;
  final RequestState searchedWarehousesState;
  final String searchedWarehousesMessage;
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
    this.searchedWarehouses = const [],
    this.searchedWarehousesState = RequestState.loaded,
    this.searchedWarehousesMessage = '',
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
    List<SearchedWarehouses>? searchedWarehouses,
    RequestState? searchedWarehousesState,
    String? searchedWarehousesMessage,
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
      searchedWarehouses: searchedWarehouses ?? this.searchedWarehouses,
      searchedWarehousesState:
          searchedWarehousesState ?? this.searchedWarehousesState,
      searchedWarehousesMessage:
          searchedWarehousesMessage ?? this.searchedWarehousesMessage,
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
        searchedWarehouses,
        searchedWarehousesState,
        searchedWarehousesMessage,
        //
        fromDate,
        toDate,
        dueDate,
        //
      ];
}
