import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_tile_app/cubit/home_cubit.dart';
import 'package:list_tile_app/models/user_model.dart';

class CubitPage extends StatelessWidget {
  const CubitPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CubitPage'),
      ),
      body: Center(
        child: BlocBuilder<HomeCubit, CubitState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return const Text('state is initial');
            } else if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeSuccess) {
              return HomeSuccessWidget(users: state.users);
            } else if (state is HomeError) {
              return const Text('state is error');
            } else {
              return const Text('You have to find');
            }
          },
        ),
      ),
    );
  }
}

class HomeSuccessWidget extends StatelessWidget {
  const HomeSuccessWidget({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          child: ListTile(
            title: Text(user.name),
            subtitle: Text(user.username),
          ),
        );
      },
    );
  }
}
