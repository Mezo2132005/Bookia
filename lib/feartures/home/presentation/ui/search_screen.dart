import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_text_styles.dart';
import 'package:bookia_application/core/widgets/custom_button.dart';
import 'package:bookia_application/core/widgets/product_card.dart';
import 'package:bookia_application/feartures/home/data/models/products_model.dart';
import 'package:bookia_application/feartures/home/presentation/cubit/cubit/search_cubit.dart';
import 'package:bookia_application/feartures/home/presentation/ui/widgets/product_skeletonizer.dart';
import 'package:bookia_application/feartures/home/presentation/ui/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60.w,
              child: CustomButton(
                text: "text",
                color: AppColors.white,
                textstyle: AppTextStyles.buttonFontblack,
                icon: Icons.arrow_back_ios,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            15.verticalSpace,
            SearchField(
              onChanged: (String search) {
                context.read<SearchCubit>().getProducts(search);
              },
            ),
            20.verticalSpace,

            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return ProductSkeletonizer();
                  }

                  if (state is SearchSuccess) {
                    final List<ProductModel> products =
                        state.response.data.products;

                    if (products.isEmpty) {
                      return Center(
                        child: Center(
                          child: Lottie.asset("assets/lotti/empty ghost.json"),
                        ),
                      );
                    }

                    return GridView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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

                  if (state is SearchFailed) {
                    return Center(
                      child: Lottie.asset("assets/lotti/empty ghost.json"),
                    );
                  }

                  return Center(
                    child: Lottie.asset("assets/lotti/empty ghost.json"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
