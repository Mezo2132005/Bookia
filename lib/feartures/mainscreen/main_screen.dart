
import 'package:bookia_application/feartures/wishlist/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bookia_application/core/theme/app_colors.dart';

import 'package:bookia_application/feartures/home/presentation/ui/home_screen.dart';
import 'package:bookia_application/feartures/home/presentation/cubit/cubit/products_cubit.dart';

import 'package:bookia_application/feartures/wishlist/presentation/ui/wish_list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      BlocProvider(
        create: (context) => ProductsCubit()..getProducts(),
        child: HomeScreen(),
      ),
      BlocProvider(
        create: (context) => WishListCubit()..getProducts(),
        child: WishListScreen(),
      ),
      BlocProvider(
        create: (context) => WishListCubit()..getProducts(),
        child: WishListScreen(),
      ),
      BlocProvider(
        create: (context) => WishListCubit()..getProducts(),
        child: WishListScreen(),
      ),
    ];

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.basicColor,
        unselectedItemColor: AppColors.blackBasic.withOpacity(0.45),
        selectedFontSize: 12,
        unselectedFontSize: 11,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            label: 'Wish List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
