import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_cubit/home_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/image_constant.dart';
import 'package:magdsoft_flutter_structure/constants/mycolors.dart';
import 'package:magdsoft_flutter_structure/constants/strings.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/product_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/brand_card.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_app_bar.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_icon_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_image_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_search_view.dart';
import 'package:sizer/sizer.dart';

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
  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allProducts = BlocProvider.of<HomeCubit>(context).product();
    //selectedIndex = BlocProvider.of<HomeCubit>(context).selectCard(0);
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
                  right: width * 0.04,
                  bottom: height * 0.01),
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
              height: 45,
              width: 45,
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
                                BlocBuilder<HomeCubit, HomeState>(
                                  builder: (context, state) {
                                    if (state is CardSelected) {
                                      selectedIndex = state.selectedIndex;
                                    }
                                    if (state is ProductLoaded) {
                                      allProducts = state.product;
                                    }
                                    return SizedBox(
                                      height: height * 0.7,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 24),
                                            child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    BrandCard(
                                                      color: selectedIndex == 0
                                                          ? MyColors.myBlue
                                                          : Colors.white,
                                                      brand: "All   ",
                                                      image:
                                                          ImageConstants.trophy,
                                                      index: 0,
                                                    ),
                                                    BrandCard(
                                                      color: selectedIndex == 1
                                                          ? MyColors.myBlue
                                                          : Colors.white,
                                                      brand: "Acer",
                                                      image: ImageConstants
                                                          .imgAcerLogo,
                                                      index: 1,
                                                    ),
                                                    BrandCard(
                                                      color: selectedIndex == 2
                                                          ? MyColors.myBlue
                                                          : Colors.white,
                                                      brand: "Razer",
                                                      image: ImageConstants
                                                          .imgRazerlogo,
                                                      index: 2,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          Expanded(
                                            child: Container(
                                                width: double.infinity,
                                                margin: const EdgeInsets.only(
                                                    top: 22),
                                                child: StaggeredGridView
                                                    .countBuilder(
                                                  shrinkWrap: true,
                                                  crossAxisCount: 4,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  itemBuilder:
                                                      (context, index) =>
                                                          index == 0
                                                              ? Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 2
                                                                              .h),
                                                                  child: Text(
                                                                    "Recommended for You",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18.sp,
                                                                    ),
                                                                  ),
                                                                )
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => ProductScreen(
                                                                                  product: allProducts[index],
                                                                                )));
                                                                  },
                                                                  child:
                                                                      HomeItemWidget(
                                                                    product:
                                                                        allProducts[
                                                                            index],
                                                                    index:
                                                                        index,
                                                                  ),
                                                                ),
                                                  itemCount: allProducts.length,
                                                  staggeredTileBuilder:
                                                      (int index) =>
                                                          StaggeredTile.count(
                                                              2,
                                                              index.toInt() == 0
                                                                  ? 1
                                                                  : 2),
                                                  mainAxisSpacing: 3.h,
                                                  crossAxisSpacing: 3.w,
                                                )),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
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
        bottomNavigationBar: BottomAppBar(
          height: 5.h,
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  CacheHelper.clearData();
                  Navigator.pushReplacementNamed(context, loginScreen);
                },
                child: Icon(
                  Icons.login,
                  color: Colors.grey,
                ),
              ),
              Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              SizedBox(width: 48.0),
              Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, helpScreen);
                },
                child: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 56.0,
          height: 56.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                MyColors.myBlue,
              ],
            ),
          ),
          child: FloatingActionButton(
            onPressed: () {
              // homeCubit.fetchDataFromAPI().then((value) => print("OKJ"));
              // // homeCubit.getAllProducts();
              // print("object");
            },
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            highlightElevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            child: const Icon(Icons.home),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
