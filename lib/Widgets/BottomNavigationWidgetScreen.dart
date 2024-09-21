import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Repo/ColorRepo.dart';
import 'package:groceryshop/Repo/RadiiRepo.dart';
import 'package:groceryshop/Screens/HomeScreens/CartScreen.dart';
import 'package:groceryshop/Screens/HomeScreens/ExploreScreen.dart';
import 'package:groceryshop/Screens/HomeScreens/ShoppingListScreen.dart';
import 'package:groceryshop/Screens/HomeScreens/ProfileScreen.dart';

class BottomNavigationWidgetScreen extends StatefulWidget {
  final int selectedIndex;
  const BottomNavigationWidgetScreen({super.key, this.selectedIndex = 0});

  @override
  State<BottomNavigationWidgetScreen> createState() => _BottomNavigationWidgetScreenState();
}

class _BottomNavigationWidgetScreenState extends State<BottomNavigationWidgetScreen> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    _widgetOptions = [
      const ExploreScreen(),
      const CartScreen(),
      const ShoppingListScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRepo.background,
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 22),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 20)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: ColorRepo.background,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          _selectedIndex == 0 ? PhosphorIcons.storefront_fill : PhosphorIcons.storefront,
                          color: _selectedIndex == 0 ? ColorRepo.primary : ColorRepo.dark,
                        ),
                        onPressed: () => _onItemTapped(0),
                      ),
                      IconButton(
                        icon: Icon(
                          _selectedIndex == 1 ? PhosphorIcons.shopping_cart_fill : PhosphorIcons.shopping_cart,
                          color: _selectedIndex == 1 ? ColorRepo.primary : ColorRepo.dark,
                        ),
                        onPressed: () => _onItemTapped(1),
                      ),
                      IconButton(
                        icon: Icon(
                          _selectedIndex == 2 ? PhosphorIcons.notepad_fill : PhosphorIcons.notepad,
                          color: _selectedIndex == 2 ? ColorRepo.primary : ColorRepo.dark,
                        ),
                        onPressed: () => _onItemTapped(2),
                      ),
                      IconButton(
                        icon: Icon(
                          _selectedIndex == 3 ? PhosphorIcons.user_fill : PhosphorIcons.user,
                          color: _selectedIndex == 3 ? ColorRepo.primary : ColorRepo.dark,
                        ),
                        onPressed: () => _onItemTapped(3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}