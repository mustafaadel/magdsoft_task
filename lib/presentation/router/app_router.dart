import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_cubit/home_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/strings.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/repository/help_repository.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/help_web_services.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/verify_screen.dart';

import '../../business_logic/help_cubit/help_cubit.dart';
import '../../data/data_providers/repository/product_repository.dart';
import '../../data/network/responses/product_web_services.dart';
import '../screens/shared/help_screen.dart';
import '../screens/shared/home_screen.dart';
import '../screens/shared/login_screen.dart';
import '../screens/shared/splash_screen.dart';

class AppRouter {
  HelpRepository? _helpRepository;
  HelpCubit? _helpCubit;
  ProductRepository? _productRepository;
  HomeCubit? _homeCubit;
  String? name, phone;

  AppRouter(String? name, String? phone) {
    this.name = name;
    this.phone = phone;
    _helpRepository = HelpRepository(HelpWebServices());
    _helpCubit = HelpCubit(_helpRepository!);
    _productRepository = ProductRepository(ProductsWebservices());
    _homeCubit = HomeCubit(_productRepository!);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(
                  name: name,
                  phone: phone,
                ));
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case verifyScreen:
        return MaterialPageRoute(builder: (_) => const VerifyScreen());
      case homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => _homeCubit!, child: const HomeScreen()));
      case helpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => _helpCubit!, child: const HelpScreen()));
      default:
        return null;
    }
  }
}
