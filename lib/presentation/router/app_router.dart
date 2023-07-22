import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/strings.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/repository/help_repository.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/help_web_services.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/verify_screen.dart';

import '../../business_logic/help_cubit/help_cubit.dart';
import '../../business_logic/product_cubit/product_cubit.dart';
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
  ProductCubit? _productCubit;

  AppRouter() {
    _helpRepository = HelpRepository(HelpWebServices());
    _helpCubit = HelpCubit(_helpRepository!);
    _productRepository = ProductRepository(ProductsWebservices());
    _productCubit = ProductCubit(_productRepository!);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case verifyScreen:
        return MaterialPageRoute(builder: (_) => const VerifyScreen());
      case homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => _productCubit!, child: const HomeScreen()));
      case helpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => _helpCubit!, child: const HelpScreen()));
      default:
        return null;
    }
  }
}
