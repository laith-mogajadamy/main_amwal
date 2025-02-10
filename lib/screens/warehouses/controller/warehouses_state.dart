part of 'warehouses_bloc.dart';

class WarehousesState extends Equatable {
  final String token;
  //
  final List<Warehouses> warehouses;
  final List<Warehouses> filteredWarehouses;
  final RequestState warehousesState;
  final String warehousesMessage;
  //
  final List<Company> companys;
  final Company selectedcompany;
  //
  final List<SearchedWarehouses> searchedWarehouses;
  final RequestState searchedWarehousesState;
  final String searchedWarehousesMessage;
  final int page;
  final RequestState loadMoreState;
  //
  final String fromDate;
  final String toDate;
  final String dueDate;
  //
  final String scannedQR;

  const WarehousesState({
    this.token = '',
    //
    this.warehouses = const [],
    this.filteredWarehouses = const [],
    this.warehousesState = RequestState.loading,
    this.warehousesMessage = '',
    //
    this.companys = const [],
    this.selectedcompany =
        const Company(guid: '', code: '', name: '', iddefault: ''),
    //
    this.searchedWarehouses = const [],
    this.searchedWarehousesState = RequestState.loaded,
    this.searchedWarehousesMessage = '',
    this.page = 1,
    this.loadMoreState = RequestState.loaded,
    //
    this.fromDate = '',
    this.toDate = '',
    this.dueDate = '',
    //
    this.scannedQR = '',
  });

  WarehousesState copyWith({
    String? token,
    //
    List<Warehouses>? warehouses,
    List<Warehouses>? filteredWarehouses,
    RequestState? warehousesState,
    String? warehousesMessage,

    //
    List<Company>? companys,
    Company? selectedcompany,
    //
    List<SearchedWarehouses>? searchedWarehouses,
    RequestState? searchedWarehousesState,
    String? searchedWarehousesMessage,
    int? page,
    RequestState? loadMoreState,
    //
    String? fromDate,
    String? toDate,
    String? dueDate,
    //
    String? scannedQR,
  }) {
    return WarehousesState(
      token: token ?? this.token,
      //
      warehouses: warehouses ?? this.warehouses,
      filteredWarehouses: filteredWarehouses ?? this.filteredWarehouses,
      warehousesState: warehousesState ?? this.warehousesState,
      warehousesMessage: warehousesMessage ?? this.warehousesMessage,
      //
      companys: companys ?? this.companys,
      selectedcompany: selectedcompany ?? this.selectedcompany,
      //
      searchedWarehouses: searchedWarehouses ?? this.searchedWarehouses,
      searchedWarehousesState:
          searchedWarehousesState ?? this.searchedWarehousesState,
      searchedWarehousesMessage:
          searchedWarehousesMessage ?? this.searchedWarehousesMessage,
      page: page ?? this.page,
      loadMoreState: loadMoreState ?? this.loadMoreState,

      //
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      dueDate: dueDate ?? this.dueDate,
      //
      scannedQR: scannedQR ?? this.scannedQR,
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        warehouses,
        filteredWarehouses,
        warehousesState,
        warehousesMessage,
        //
        companys,
        selectedcompany,
        //
        searchedWarehouses,
        searchedWarehousesState,
        searchedWarehousesMessage,
        page,
        loadMoreState,
        //
        fromDate,
        toDate,
        dueDate,
        //
        scannedQR,
      ];
}
