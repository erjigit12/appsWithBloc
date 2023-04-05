import 'dart:developer';
import 'package:counterapp_with_bloc/counter/cubit/bloc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log('build created');
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                log('BlocBuilder created');
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().decrement(),
        child: const Icon(Icons.remove),
      ),
    );
  }
}
