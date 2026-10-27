import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_text_styles.dart';
import 'package:bookia_application/core/widgets/custom_button.dart';
import 'package:bookia_application/feartures/detail/data/models/details_model.dart';
import 'package:bookia_application/feartures/detail/presentation/cubit/details_cubit.dart';
import 'package:bookia_application/feartures/detail/presentation/ui/widget/details_skeletonizer.dart';
import 'package:bookia_application/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            if (state is DetailsSuccess) {
              final DetailsModel details = state.response;
              final product = details.data;

              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 60.w,
                                child: CustomButton(
                                  text: '',
                                  color: AppColors.white,
                                  textstyle:
                                      AppTextStyles.buttonFontblack,
                                  icon: Icons.arrow_back_ios,
                                  onPressed: () =>
                                      Navigator.pop(context),
                                ),
                              ),
                              SizedBox(
                                width: 60.w,
                                child: CustomButton(
                                  text: '',
                                  color: AppColors.white,
                                  textstyle:
                                      AppTextStyles.buttonFontblack,
                                  icon: Icons.bookmark_outline,
                                  // Wishlist disabled temporarily.
                                  onPressed: null,
                                ),
                              ),
                            ],
                          ),

                          24.verticalSpace,

                          Container(
                            height: 270.h,
                            width: 180.w,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(8.r),
                              child: Image.network(
                                product?.image ?? '',
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.broken_image,
                                    size: 60,
                                  );
                                },
                              ),
                            ),
                          ),

                          24.verticalSpace,

                          Text(
                            product?.name ?? '',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.font30,
                          ),

                          12.verticalSpace,

                          Text(
                            product?.category ?? '',
                            style: AppTextStyles.goldenFont18,
                          ),

                          20.verticalSpace,

                          Text(
                            (product?.description ?? '')
                                .replaceAll('<p>', '')
                                .replaceAll('</p>', ''),
                            style: AppTextStyles.detailsFont12,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            '${product?.price ?? ''}\$',
                            style: AppTextStyles.font30,
                          ),
                        ),
                        SizedBox(
                          width: 180.w,
                          child: CustomButton(
                            text: LocaleKeys.AddCard.tr(),
                            color: AppColors.blackBasic,
                            textstyle:
                                AppTextStyles.buttonFontWhite,
                            onPressed: () {
                              // Add to cart logic.
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is DetailsLoading) {
              return const DetailsSkeletonizer();
            } else {
              return const Center(
                child: Text('Unable to load product details'),
              );
            }
          },
        ),
      ),
    );
  }
}
