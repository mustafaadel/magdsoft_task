import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/mycolors.dart';
import 'package:magdsoft_flutter_structure/constants/strings.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/help_cubit/help_cubit.dart';
import '../../../data/models/help_model.dart';
import '../../widget/custom_elevated_button.dart';

HelpModel helpModel = HelpModel();

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<HelpModel> allHelp = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allHelp = BlocProvider.of<HelpCubit>(context).help();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
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
          //child: buildHelpList(),
          child: BlocBuilder<HelpCubit, HelpState>(
            builder: (context, state) {
              if (state is HelpLoaded) {
                allHelp = state.help;
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0.h, bottom: 6.h),
                      child: Center(
                        child: Text(
                          "Help",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: ExpansionTile(
                          title: Text(
                            allHelp[0].question!,
                            style: const TextStyle(color: MyColors.myBlue),
                          ),
                          childrenPadding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.h),
                          children: [
                            Text(allHelp[0].answer!),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: ExpansionTile(
                          title: Text(
                            allHelp[1].question!,
                            style: TextStyle(color: MyColors.myBlue),
                          ),
                          childrenPadding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.h),
                          children: [
                            Text(
                              allHelp[1].answer!,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: ExpansionTile(
                          title: Text(
                            allHelp[2].question!,
                            style: TextStyle(color: MyColors.myBlue),
                          ),
                          childrenPadding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.h),
                          children: [
                            Text(
                              allHelp[2].answer!,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: ExpansionTile(
                          title: Text(
                            allHelp[3].question!,
                            style: TextStyle(color: MyColors.myBlue),
                          ),
                          childrenPadding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.h),
                          children: [
                            Text(
                              allHelp[3].answer!,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: ExpansionTile(
                          title: Text(
                            allHelp[4].question!,
                            style: TextStyle(color: MyColors.myBlue),
                          ),
                          childrenPadding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.h),
                          children: [
                            Text(
                              allHelp[4].answer!,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: MyColors.myBlue,
                  ),
                );
              }
            },
          ),
        ),
      ]),
      bottomNavigationBar: CustomElevatedButton(
          width: 282,
          height: 48,
          text: "Continue",
          margin: EdgeInsets.only(left: 74, right: 74, bottom: 24),
          buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                24,
              ),
            ),
          ).copyWith(fixedSize: MaterialStateProperty.all<Size>(Size(282, 48))),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.00),
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
                MyColors.myBlue.withOpacity(0.27),
              ],
            ),
          ),
          //buttonTextStyle: theme.textTheme.titleLarge!,
          onTap: () {
            onTapContinue(context);
          }),
    );
  }

  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, homeScreen);
  }
}
