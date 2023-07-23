import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/bloc_observer.dart';
import 'business_logic/login_cubit/login_cubit.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  String? name, phone;
  if (CacheHelper.getData(key: "name") != null) {
    name = await CacheHelper.getData(key: "name");
    phone = await CacheHelper.getData(key: "phone");
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MultiBlocProvider(providers: [
        BlocProvider(create: (_) => LoginCubit()),
      ], child: MyApp(name, phone))));
}

class MyApp extends StatelessWidget {
  String? name, phone;

  MyApp(this.name, this.phone, {super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        onGenerateRoute: AppRouter(name, phone).onGenerateRoute,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
