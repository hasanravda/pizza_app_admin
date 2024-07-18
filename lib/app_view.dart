import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app_admin/src/blocs/authentication_bloc/authentication_bloc.dart';

import 'src/routes/routes.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade200,
          onSurface: Colors.black,
          // primary: Color.fromRGBO(206,147,216,1),
          primary: Colors.blue,
          onPrimary: Colors.white,
          secondary: const Color.fromRGBO(244, 143, 177, 1),
          tertiary: const Color.fromRGBO(255, 204, 128, 1),
        )
      ),
      routerConfig: router(context.read<AuthenticationBloc>(),),
    );
  }
}
