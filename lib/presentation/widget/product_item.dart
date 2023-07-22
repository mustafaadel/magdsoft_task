import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/image_constant.dart';
import '../../data/models/product_model.dart';
import 'custom_icon_button.dart';
import 'custom_image_view.dart';

// ignore: must_be_immutable
class HomeItemWidget extends StatelessWidget {
  final int index;
  final Products product;
  HomeItemWidget({super.key, required this.index, required this.product});
  VoidCallback? onTapColumn71nz3cicf;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(
                2,
                2,
              ),
            ),
          ],
        ).copyWith(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 10.h,
                width: 50.w,
                padding: const EdgeInsets.all(
                  12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ).copyWith(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageView(
                      url: product.image ?? "",
                      height: 114,
                      width: 144,
                      alignment: Alignment.center,
                    ),
                    CustomImageView(
                      svgPath: ImageConstants.imgFavorite,
                      height: 18,
                      width: 19,
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.only(
                        right: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 9,
                top: 9,
              ),
              child: Text(
                product.company ?? "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 9,
                top: 2,
              ),
              child: Text(product.name ?? "",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 9,
                  top: 7,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 18,
                      ),
                      child: Text(product.price ?? "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          )),
                    ),
                    CustomIconButton(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(8),
                      child: CustomImageView(
                        svgPath: ImageConstants.imgPlus,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
