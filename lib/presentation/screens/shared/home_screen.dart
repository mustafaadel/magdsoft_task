import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure/constants/image_constant.dart';
import 'package:magdsoft_flutter_structure/constants/mycolors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_app_bar.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_icon_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_image_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_search_view.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/product_cubit/product_cubit.dart';
import '../../../data/models/product_model.dart';
import '../../widget/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<Products> allProducts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allProducts = BlocProvider.of<ProductCubit>(context).product();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          height: 100,
          title: CustomSearchView(
            decoration2: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(15.00),
              border: Border.all(
                color: Colors.transparent,
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            defaultBorderDecoration: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.00),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            width: width * 0.7,
            controller: searchController,
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            margin: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
              top: height * 0.01,
            ),
            suffix: Container(
              margin: EdgeInsets.only(
                  left: width * 0.05,
                  top: height * 0.01,
                  right: width * 0.05,
                  bottom: height * 0.02),
              child: CustomImageView(
                svgPath: ImageConstants.search,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 50,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
              top: height * 0.01,
            ),
          ),
          actions: [
            CustomIconButton(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(
                right: width * 0.05,
                top: height * 0.01,
              ),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.00),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87.withOpacity(0.25),
                    spreadRadius: 2.00,
                    blurRadius: 2.00,
                    offset: Offset(
                      2,
                      5,
                    ),
                  ),
                ],
              ),
              child: CustomImageView(
                svgPath: ImageConstants.imgFilter,
              ),
            )
          ],
        ),
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
                  0.4234
                ]),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 11, bottom: 46),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 176,
                                  width: 368,
                                  child: Stack(
                                    alignment: FractionalOffset.bottomLeft,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstants
                                            .imgAcerpredatorhelios,
                                        height: 176,
                                        width: 368,
                                        radius: BorderRadius.circular(10),
                                        alignment: Alignment.center,
                                      ),
                                      const Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, bottom: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Acer Predator Helios 300",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                "New Release",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 12,
                                              top: 6,
                                              right: 12,
                                              bottom: 6),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: MyColors.myBlue,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black87
                                                    .withOpacity(0.25),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: Offset(
                                                  2,
                                                  2,
                                                ),
                                              )
                                            ],
                                          ).copyWith(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Row(
                                            children: [
                                              CustomIconButton(
                                                  height: 40,
                                                  width: 40,
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.00),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black87
                                                            .withOpacity(0.25),
                                                        spreadRadius: 2.00,
                                                        blurRadius: 2.00,
                                                        offset: Offset(
                                                          2,
                                                          2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  child: CustomImageView(
                                                    imagePath:
                                                        ImageConstants.trophy,
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 13,
                                                    vertical: 6),
                                                child: Text(
                                                  "All",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(
                                                left: 10,
                                                top: 6,
                                                right: 10,
                                                bottom: 6),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black87
                                                      .withOpacity(0.25),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(2, 2),
                                                ),
                                              ],
                                            ).copyWith(
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Row(children: [
                                              CustomIconButton(
                                                  height: 40,
                                                  width: 40,
                                                  padding: EdgeInsets.all(6),
                                                  decoration:
                                                      IconButtonStyleHelper
                                                          .outlineBlack900TL20,
                                                  child: CustomImageView(
                                                      imagePath: ImageConstants
                                                          .imgAcerLogo)),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 13,
                                                      top: 6,
                                                      bottom: 6),
                                                  child: Text("Acer",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )))
                                            ])),
                                        Container(
                                            padding: EdgeInsets.only(
                                                left: 10,
                                                top: 6,
                                                right: 10,
                                                bottom: 6),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black87
                                                      .withOpacity(0.25),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(2, 2),
                                                ),
                                              ],
                                            ).copyWith(
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Row(children: [
                                              CustomIconButton(
                                                  height: 40,
                                                  width: 40,
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  decoration:
                                                      IconButtonStyleHelper
                                                          .outlineBlack900TL20,
                                                  child: CustomImageView(
                                                      imagePath: ImageConstants
                                                          .imgRazerlogo)),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 13,
                                                          top: 6,
                                                          bottom: 6),
                                                  child: Text("Razer",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )))
                                            ])),
                                        Container(
                                            padding: EdgeInsets.only(
                                                left: 10,
                                                top: 6,
                                                right: 10,
                                                bottom: 6),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black87
                                                      .withOpacity(0.25),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(2, 2),
                                                ),
                                              ],
                                            ).copyWith(
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Row(children: [
                                              CustomIconButton(
                                                  height: 40,
                                                  width: 40,
                                                  padding: EdgeInsets.all(6),
                                                  decoration:
                                                      IconButtonStyleHelper
                                                          .outlineBlack900TL20,
                                                  child: CustomImageView(
                                                      imagePath: ImageConstants
                                                          .imgRazerlogo)),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 13,
                                                      top: 6,
                                                      bottom: 6),
                                                  child: Text("Razer",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )))
                                            ])),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(top: 22),
                                    child:
                                        BlocBuilder<ProductCubit, ProductState>(
                                      builder: (context, state) {
                                        if (state is ProductLoaded) {
                                          allProducts = state.product;
                                          return StaggeredGridView.countBuilder(
                                            shrinkWrap: true,
                                            crossAxisCount: 4,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            padding: const EdgeInsets.all(8),
                                            itemBuilder: (context, index) =>
                                                index == 0
                                                    ? Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2.h),
                                                        child: Text(
                                                          """Recommended for You""",
                                                          style: TextStyle(
                                                            fontSize: 18.sp,
                                                          ),
                                                        ),
                                                      )
                                                    : HomeItemWidget(
                                                        product:
                                                            allProducts[index],
                                                        index: index,
                                                      ),
                                            itemCount: allProducts.length,
                                            staggeredTileBuilder: (int index) =>
                                                StaggeredTile.count(2,
                                                    index.toInt() == 0 ? 1 : 2),
                                            mainAxisSpacing: 3.h,
                                            crossAxisSpacing: 3.w,
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ),
                                ),

                                // StaggeredGridView
                                //    .countBuilder(
                                //    shrinkWrap:
                                //    true,
                                //    primary:
                                //    false,
                                //    crossAxisCount:
                                //    2,
                                //    crossAxisSpacing:
                                //    (
                                //        375),
                                //    mainAxisSpacing:
                                //    (
                                //        375),
                                //    staggeredTileBuilder:
                                //        (index) {
                                //      return StaggeredTile
                                //          .fit(2);
                                //    },
                                //    itemCount:
                                //    homeModelObj?.homeItemList.length ??
                                //        0,
                                //    itemBuilder:
                                //        (context,
                                //        index) {
                                //      HomeItemModel
                                //      model =
                                //          homeModelObj?.homeItemList[index] ??
                                //              HomeItemModel();
                                //      return HomeItemWidget(
                                //          model,
                                //          onTapColumn71nz3cicf:
                                //              () {
                                //            onTapColumn71nz3cicf(
                                //                context);
                                //          });
                                //    });
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:magdsoft_flutter_structure/constants/mycolors.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../widget/product_card.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color(0xD90062BD),
//                   Color(0x000062BD),
//                 ],
//                 stops: [
//                   0,
//                   0.4234
//                 ]),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(1.1.h),
//             child: ListView(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 1.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: 15.w,
//                         height: 6.5.h,
//                         child: Card(
//                           elevation: 5.0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: IconButton(
//                             icon: Icon(Icons.filter_alt,
//                                 color: Colors.grey, size: 25.sp),
//                             onPressed: () {},
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 75.w,
//                         height: 6.5.h,
//                         child: Card(
//                           elevation: 5.0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Row(
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.search,
//                                     color: Colors.grey, size: 25.sp),
//                                 onPressed: () {},
//                               ),
//                               const Spacer(),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 1.6.h),
//                                 child: const Text(
//                                   'Search',
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.grey),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.5.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 2.5.h),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10.0),
//                     child: Image.asset(
//                         "assets/images/Acer-Predator-Helios-300-2021 2.png"),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(1.h),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(vertical: 10.0),
//                     height: 6.5.h,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         Container(
//                             width: 30.w,
//                             decoration: BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.2),
//                                   spreadRadius: 3,
//                                   blurRadius: 2,
//                                   offset: const Offset(0, 1),
//                                 ),
//                               ],
//                               borderRadius: BorderRadius.circular(100),
//                               color: Colors.white,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 3),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Text(
//                                     "Razer",
//                                     style: TextStyle(
//                                         color: Colors.black87,
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 12.sp),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(30),
//                                     elevation: 2,
//                                     child: CircleAvatar(
//                                       backgroundColor: Colors.white,
//                                       child: Image.asset(
//                                           "assets/images/Razer-Logo 2.png"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )),
//                         SizedBox(
//                           width: 4.w,
//                         ),
//                         Container(
//                             width: 30.w,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.2),
//                                   spreadRadius: 3,
//                                   blurRadius: 2,
//                                   offset: const Offset(
//                                       0, 1), // changes position of shadow
//                                 ),
//                               ],
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 3),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Text(
//                                     "Acer",
//                                     style: TextStyle(
//                                         color: Colors.black87,
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 12.sp),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(30),
//                                     elevation: 2,
//                                     child: CircleAvatar(
//                                       backgroundColor: Colors.white,
//                                       child: ClipRRect(
//                                         borderRadius:
//                                             BorderRadius.circular(30.0),
//                                         child: Image.asset(
//                                             "assets/images/309-3098835_predator-tlcs-2017-acer-predator-logo-vector 2.png"),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )),
//                         SizedBox(
//                           width: 4.w,
//                         ),
//                         Container(
//                           width: 30.w,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100),
//                             color: MyColors.myBlue,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.2),
//                                 spreadRadius: 3,
//                                 blurRadius: 2,
//                                 offset: const Offset(
//                                     0, 1), // changes position of shadow
//                               ),
//                             ],
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 3),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   "All",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 12.sp),
//                                 ),
//                                 Material(
//                                   borderRadius: BorderRadius.circular(30),
//                                   elevation: 2,
//                                   child: CircleAvatar(
//                                     backgroundColor: Colors.white,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       child: Image.asset(
//                                           "assets/images/vector-trophy-cup-icon 2.png"),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       children: [
//                         const ProductCard(
//                             title: "Razer",
//                             subtitle: "Razer Blade Stealth 13",
//                             price: "32,000 EGP",
//                             image: "assets/images/2630-1-en-v2 2.png"),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         const ProductCard(
//                             title: "Acer",
//                             subtitle: "Predator Helios 300",
//                             price: "35,000 EGP",
//                             image: "assets/images/71nz3cIcFOL 1.png")
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           width: 40.5.w,
//                           child: Text(
//                             "Recomended for You",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: Colors.black87,
//                                 fontSize: 15.sp,
//                                 fontWeight: FontWeight.w400),
//                           ),
//                         ),
//                         const ProductCard(
//                             title: "Razer",
//                             subtitle: "Razer Blade Stealth 13",
//                             price: "32,000 EGP",
//                             image: "assets/images/2630-1-en-v2 2.png"),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         const ProductCard(
//                             title: "Acer",
//                             subtitle: "Predator Helios 300",
//                             price: "30,000 EGP",
//                             image: "assets/images/71nz3cIcFOL 1.png")
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
