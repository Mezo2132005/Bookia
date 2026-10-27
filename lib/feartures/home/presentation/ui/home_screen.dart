
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_text_styles.dart';
import 'package:bookia_application/core/widgets/product_card.dart';
import 'package:bookia_application/feartures/home/data/models/products_model.dart';
import 'package:bookia_application/feartures/home/presentation/cubit/cubit/products_cubit.dart';
import 'package:bookia_application/feartures/home/presentation/ui/widgets/home_appbar.dart';
import 'package:bookia_application/feartures/home/presentation/ui/widgets/product_skeletonizer.dart';
import 'package:bookia_application/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppbar(),

              SizedBox(height: 10.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.BestSeller.tr(),
                    style: AppTextStyles.regularFont,
                  ),
                  IconButton(
                    tooltip: LocaleKeys.Refresh.tr(),
                    onPressed: () {
                      context.read<ProductsCubit>().getProducts();
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              Expanded(
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoading) {
                      return ProductSkeletonizer();
                    }

                    if (state is ProductsSuccess) {
                      final List<ProductModel> products =
                          state.response.data.products;

                      if (products.isEmpty) {
                        return const Center(
                          child: Text('No Products'),
                        );
                      }

                      return GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: products.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 163.w / 300.h,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                        ),
                        itemBuilder: (context, index) {
                          final product = products[index];

                          return ProductCard(
                            id: product.id,
                            name: product.name,
                            price: product.price,
                            image: product.image,
                          );
                        },
                      );
                    }

                    if (state is ProductsFailed) {
                      return const Center(
                        child: Text('Failed to load products'),
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
