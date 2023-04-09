import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:list_tile_app/models/user_model.dart';
import 'package:list_tile_app/services/home_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.service) : super(HomeInitial()) {
    on<HomeEvent>(_getUsers);
  }
  final HomeService service;

  Future<void> _getUsers(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final users = await service.getUsers();
    if (users != null) {
      emit(HomeSuccess(users));
    } else {
      emit(HomeError());
    }
  }
}
