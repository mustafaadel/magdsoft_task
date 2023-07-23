import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_cubit/home_cubit.dart';
import 'package:sizer/sizer.dart';

import 'custom_icon_button.dart';
import 'custom_image_view.dart';

class BrandCard extends StatelessWidget {
  Color color;
  String image;
  String brand;
  int index;
  BrandCard(
      {super.key,
      required this.color,
      required this.brand,
      required this.image,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: avoid_print
        BlocProvider.of<HomeCubit>(context).selectCard(index);
      },
      child: Container(
          padding:
              const EdgeInsets.only(left: 10, top: 6, right: 10, bottom: 6),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(0.25),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(2, 2),
              ),
            ],
          ).copyWith(borderRadius: BorderRadius.circular(25)),
          child: Row(children: [
            CustomIconButton(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(6),
                decoration: IconButtonStyleHelper.outlineBlack900TL20,
                child: CustomImageView(imagePath: image)),
            Padding(
                padding: const EdgeInsets.only(left: 13, top: 6, bottom: 6),
                child: Text(brand,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    )))
          ])),
    );
  }
}
