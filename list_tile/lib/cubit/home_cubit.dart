import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:list_tile_app/models/user_model.dart';
import 'package:list_tile_app/services/home_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<CubitState> {
  HomeCubit(this.service) : super(const CubitState());

  final HomeService service;

  // Future<void> getUsers() async {
  //   emit(const HomeState(status: FetchStatus.loading));
  //   final users = await service.getUsers();
  //   if (users != null) {
  //     emit(HomeState(status: FetchStatus.success, users: users));
  //   } else {
  //     emit(const HomeState(status: FetchStatus.error));
  //   }
  // }

  Future<void> getUsers() async {
    emit(HomeLoading());
    final users = await service.getUsers();
    if (users != null) {
      emit(HomeSuccess(users));
    } else {
      emit(HomeError());
    }
  }
}
