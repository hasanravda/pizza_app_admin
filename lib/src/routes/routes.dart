// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app_admin/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza_app_admin/src/modules/base/views/base_screen.dart';
import 'package:pizza_app_admin/src/modules/create_pizza/views/create_pizza_screen.dart';

import '../modules/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../modules/auth/views/login_screen.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/splash/views/splash_screen.dart';

final _navKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

GoRouter router(AuthenticationBloc authBloc) {
  return GoRouter(
      navigatorKey: _navKey,
      initialLocation: '/',
      redirect: (context, state) {
        if (authBloc.state.status == AuthenticationStatus.unknown) {
          return '/';
        }
        return null;
      },
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigationKey,
            builder: (context, state, child) {
              if (state.fullPath == '/login' || state.fullPath == '/') {
                return child;
              } else {
                return BlocProvider<SignInBloc>(
                  create: (context) => SignInBloc(
                    context.read()<SignInBloc>().userRepository
                  ),
                  child: BaseScreen(child: child)
                );
              }
            },
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) =>
                    BlocProvider<AuthenticationBloc>.value(
                  value: BlocProvider.of<AuthenticationBloc>(context),
                  child: const SplashScreen(),
                ),
              ),
              GoRoute(
                path: '/login',
                builder: (context, state) =>
                    BlocProvider<AuthenticationBloc>.value(
                  value: BlocProvider.of<AuthenticationBloc>(context),
                  child: BlocProvider<SignInBloc>(
                    create: (context) => SignInBloc(
                        context.read<AuthenticationBloc>().userRepository),
                    child: SignInScreen(),
                  ),
                ),
              ),
              GoRoute(
                path: '/home',
                builder: (context, state) => HomeScreen(),
              ),
              GoRoute(
                path: '/create',
                builder: (context, state) =>CreatePizzaScreen(),
              ),
            ])
      ]);
}

logout(BuildContext context) {
  context.read<SignInBloc>().add(SignOutRequired());
}
