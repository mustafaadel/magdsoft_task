import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/mycolors.dart';
import 'package:magdsoft_flutter_structure/constants/strings.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/login_cubit/login_cubit.dart';
import '../../../constants/image_constant.dart';
import '../../../utils/validation_functions.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_icon_button.dart';
import '../../widget/custom_image_view.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstants.loginbackground),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Colors.blue.withOpacity(0.5),
                BlendMode.srcATop,
              ),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: height * 0.4,
                bottom: -100,
                width: width,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(75),
                  ),
                ),
              ),
              // column containing divider and icons
              Positioned(
                  top: height * 0.75,
                  child: Column(
                    children: [
                      Row(
                        // divider and text in the middle
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height * 0.0015,
                            width: width * 0.35,
                            color: MyColors.myLightBlue,
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          const Text(
                            'OR',
                            style: TextStyle(
                              color: MyColors.myLightBlue,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Container(
                              height: height * 0.0015,
                              width: width * 0.35,
                              color: MyColors.myLightBlue),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Row(
                        // 3 icons in the middle with shadow
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomIconButton(
                              height: 52,
                              width: 52,
                              margin: const EdgeInsets.only(
                                  left: 0, top: 2, bottom: 6),
                              padding: const EdgeInsets.all(7),
                              decoration: IconButtonStyleHelper.outlineBlack900,
                              child: CustomImageView(
                                  imagePath: ImageConstants.facebook)),
                          CustomIconButton(
                              height: 52,
                              width: 52,
                              margin: const EdgeInsets.only(
                                  left: 28, top: 2, bottom: 6),
                              padding: const EdgeInsets.all(7),
                              decoration: IconButtonStyleHelper.outlineBlack900,
                              child: CustomImageView(
                                  imagePath: ImageConstants.apple)),
                          CustomIconButton(
                              height: 52,
                              width: 52,
                              margin: const EdgeInsets.only(
                                  left: 28, top: 2, bottom: 6),
                              padding: const EdgeInsets.all(7),
                              decoration: IconButtonStyleHelper.outlineBlack900,
                              child: CustomImageView(
                                  imagePath: ImageConstants.google)),
                        ],
                      ),
                    ],
                  )),
              //container containing text-fields and button
              Align(
                alignment: Alignment.center,
                child: FractionalTranslation(
                  translation: Offset(0, -.1),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: SizedBox(
                      height: 45.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: Form(
                          child: ListView(
                            children: [
                              Center(
                                child: Text(
                                  'Welcome',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.025,
                              ),
                              Center(
                                child: Container(
                                  height: height * 0.005,
                                  width: width * 0.3,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: nameController,
                                  validator: (value) {
                                    if (!isText(value)) {
                                      return "Please enter valid text";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 12),
                                    hintText: 'Enter your Full Name',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: phoneController,
                                  validator: (value) {
                                    if (!isValidPhone(value)) {
                                      return "Please enter valid phone number";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 12),
                                    hintText: 'Enter your Phone Number',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                  ),
                                ),
                              ),
                              SizedBox(height: 3.h),
                              BlocConsumer<LoginCubit, LoginState>(
                                listener: (context, state) {
                                  onTapLogin(context);
                                },
                                builder: (context, state) {
                                  return CustomElevatedButton(
                                      width: 282,
                                      height: 48,
                                      text: "Login",
                                      margin: EdgeInsets.only(top: 31),
                                      buttonStyle: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(24.00),
                                        gradient: LinearGradient(
                                          begin: Alignment(
                                            -0.01,
                                            1,
                                          ),
                                          end: Alignment(
                                            1.19,
                                            1,
                                          ),
                                          colors: [
                                            MyColors.myBlue,
                                            MyColors.myBlue.withOpacity(0.25),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        loginCubit.login(nameController.text,
                                            phoneController.text);
                                      });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, verifyScreen);
  }
}
