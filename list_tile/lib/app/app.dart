import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_tile_app/bloc/home_bloc.dart';
import 'package:list_tile_app/home/bloc_page.dart';
import 'package:list_tile_app/services/home_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: false,
      ),
      // home: BlocProvider(
      //   create: (context) => HomeCubit(homeService)..getUsers(),
      //   child: const CubitPage(),
      // ),
      home: BlocProvider(
        create: (context) => HomeBloc(homeService)..add(FetchEvent()),
        child: const BlocPage(),
      ),
    );
  }
}
