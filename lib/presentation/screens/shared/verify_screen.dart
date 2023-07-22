import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/mycolors.dart';
import 'package:magdsoft_flutter_structure/constants/strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_elevated_button.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String _pinCode = '';
  @override
  Widget build(BuildContext context) {
    final logincubit = LoginCubit.get(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xD90062BD),
                  Color(0x000062BD),
                ],
                stops: [
                  0,
                  .5
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 46, top: 64, right: 46, bottom: 64),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Verify Phone",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 337,
                              margin:
                                  const EdgeInsets.only(top: 136, bottom: 37),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  PinCodeTextField(
                                    enableActiveFill: true,
                                    appContext: context,
                                    length: 4,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    animationType: AnimationType.fade,
                                    cursorColor: MyColors.myLightBlue,
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      //fieldHeight: 10.h,
                                      selectedColor: Colors.white,
                                      //fieldWidth: 15.w,
                                      disabledColor: Colors.white,
                                      activeColor: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      inactiveColor: Colors.white,
                                      inactiveFillColor: Colors.white,
                                      activeFillColor: Colors.white,
                                      selectedFillColor: Colors.white,
                                    ),
                                    showCursor: false,
                                    keyboardType: TextInputType.phone,
                                    boxShadows: [
                                      BoxShadow(
                                        offset: const Offset(0, 1),
                                        color: Colors.black12,
                                        blurRadius: 10,
                                      )
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _pinCode = value;
                                      });
                                    },
                                    onCompleted: (value) {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                  width: 343,
                  height: 57,
                  text: "Verify",
                  margin: const EdgeInsets.only(left: 44, top: 77, right: 43),
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        28,
                      ),
                    ),
                  ).copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size(double.maxFinite, (57)))),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.00),
                    gradient: LinearGradient(
                      begin: const Alignment(
                        -0.01,
                        1,
                      ),
                      end: const Alignment(
                        1.19,
                        1,
                      ),
                      colors: [
                        MyColors.myBlue,
                        MyColors.myBlue.withOpacity(0.27),
                      ],
                    ),
                  ),
                  onTap: () {
                    print(_pinCode);
                    if (_pinCode == logincubit.loginModel.code) {
                      onTapVerify(context);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Wrong Code",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: MyColors.myLightBlue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  onTapVerify(BuildContext context) {
    Navigator.popAndPushNamed(context, helpScreen);
  }
}
