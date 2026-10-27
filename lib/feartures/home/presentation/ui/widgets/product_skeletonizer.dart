import 'package:bookia_application/core/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductSkeletonizer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163.w / 281.h,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        children: [
          ProductCard(
            id: 1,
            name: "name",
            price: 5,
            image: "https://codingarabic.eraapro.com/storage/product/jX84BKBWouZ29YQYA9bCSF2cEXvThCTOkInlU8KP.jpg",
          ),
          ProductCard(
            id: 1,
            name: "name",
            price: 5,
            image: "https://codingarabic.eraapro.com/storage/product/jX84BKBWouZ29YQYA9bCSF2cEXvThCTOkInlU8KP.jpg",
          ),
          ProductCard(
            id: 1,
            name: "name",
            price: 5,
            image: "https://codingarabic.eraapro.com/storage/product/jX84BKBWouZ29YQYA9bCSF2cEXvThCTOkInlU8KP.jpg",
          ),
          ProductCard(
            id: 1,
            name: "name",
            price: 5,
            image: "https://codingarabic.eraapro.com/storage/product/jX84BKBWouZ29YQYA9bCSF2cEXvThCTOkInlU8KP.jpg",
          ),
        ],
      ),
    );
  }
}
