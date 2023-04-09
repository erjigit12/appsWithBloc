// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class CubitState extends Equatable {
  const CubitState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends CubitState {}

class HomeLoading extends CubitState {}

class HomeSuccess extends CubitState {
  const HomeSuccess(this.users);

  final List<User> users;
}

class HomeError extends CubitState {}

// enum FetchStatus { initial, loading, success, error }
