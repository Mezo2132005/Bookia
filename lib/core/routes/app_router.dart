import 'package:bookia_application/core/routes/app_routes.dart';
import 'package:bookia_application/feartures/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia_application/feartures/auth/presentation/ui/login_screen.dart';
import 'package:bookia_application/feartures/home/presentation/ui/home_screen.dart';
import 'package:bookia_application/feartures/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginScreen(),
          ),
        );
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      default:
        return null;
    }
  }
}
