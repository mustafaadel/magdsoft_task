import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/constants/mycolors.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel loginModel = LoginModel();
  String? _code;

  login(String name, String phone) {
    emit(LoginLoading());
    DioHelper.postData(endPoint: EndPoint.login, data: {
      'name': name,
      'phone': phone,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      //print(loginModel.message);
      if (loginModel.message.toString() ==
          "phone number must be more than 10 and less than 15") {
        Fluttertoast.showToast(
            msg: "Phone Number Must be more than 10 and less than 15",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: MyColors.myBlue,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(LoginError());
      } else if (loginModel.message.toString() == "name is Required") {
        Fluttertoast.showToast(
            msg: "Please Enter Your Name",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: MyColors.myBlue,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(LoginError());
      } else if (loginModel.message.toString() == "phone is Required") {
        Fluttertoast.showToast(
            msg: "Please Enter Your Phone Number",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: MyColors.myBlue,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(LoginError());
      } else if (loginModel.status.toString() == "200") {
        CacheHelper.saveDataSharedPreference(key: "name", value: name);
        CacheHelper.saveDataSharedPreference(key: "phone", value: phone);
        emit(LoginSuccess());
      }
      _code = loginModel.code.toString();
    }).catchError((error) {
      print(error.toString());
      Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.myBlue,
        textColor: Colors.white,
      );
      emit(LoginError());
    });
  }
}
