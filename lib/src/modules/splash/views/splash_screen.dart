import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:pizza_app_admin/main.dart';
import 'package:pizza_app_admin/src/blocs/authentication_bloc/authentication_bloc.dart';
// import 'package:pizza_app_admin/src/modules/auth/views/login_screen.dart';
// import 'package:pizza_app_admin/src/modules/home/views/home_screen.dart';
// import 'package:pizza_app_admin/src/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: BlocBuilder<AuthenticationBloc,AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            context.go('/create');
            return Container();
          } 
          else if(state.status == AuthenticationStatus.unauthenticated) {
            context.go('/login');
            return Container();
          }
          else{
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber,),
            );
          }
        }, 
      ),
    );
  }
}