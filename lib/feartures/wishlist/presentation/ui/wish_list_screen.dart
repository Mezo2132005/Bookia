import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_text_styles.dart';
import 'package:bookia_application/core/widgets/product_card.dart';
import 'package:bookia_application/feartures/home/presentation/ui/widgets/home_appbar.dart';
import 'package:bookia_application/feartures/home/presentation/ui/widgets/product_skeletonizer.dart';
import 'package:bookia_application/feartures/wishlist/data/models/wish_list_response_model.dart';
import 'package:bookia_application/feartures/wishlist/presentation/cubit/wish_list_cubit.dart';
import 'package:bookia_application/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeAppbar(),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Wishlist", style: AppTextStyles.regularFont),
                    IconButton(
                      tooltip: LocaleKeys.Refresh.tr(),
                      onPressed: () {
                        context.read<WishListCubit>().getProducts();
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
                10.verticalSpace,
                Expanded(
                  child: BlocBuilder<WishListCubit, WishListState>(
                    builder: (context, state) {
                      if (state is WishListLoading) {
                        return ProductSkeletonizer();
                      }

                      if (state is WishListSuccess) {
                        final List<WishListProductModel>? products =
                            state.response!.data!.products;

                        if (products!.isEmpty) {
                          return Center(
                            child: Lottie.asset(
                              "assets/lotti/empty ghost.json",
                            ),
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
                              price: double.parse(product.price!),
                              image: product.image,
                            );
                          },
                        );
                      }

                      if (state is WishListFailed) {
                        return const Center(
                          child: Text('Failed to load products'),
                        );
                      }

                      return const Center(child: CircularProgressIndicator());
                    },
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
