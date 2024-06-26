import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Repo/ColorRepo.dart';
import 'package:groceryshop/Repo/RadiiRepo.dart';
import 'package:groceryshop/Screens/HomeScreens/CartScreen.dart';
import 'package:groceryshop/Screens/HomeScreens/ExploreScreen.dart';
import 'package:groceryshop/Screens/HomeScreens/OrdersScreen.dart';
import 'package:groceryshop/Screens/HomeScreens/ProfileScreen.dart';

class BottomNavigationWidgetScreen extends StatefulWidget {
  const BottomNavigationWidgetScreen({Key? key}) : super(key: key);

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
    _widgetOptions = [
      const ExploreScreen(),
      const CartScreen(),
      const OrderScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRepo.background,
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: ColorRepo.foreground,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    _selectedIndex == 0 ? PhosphorIcons.storefront_fill : PhosphorIcons.storefront,
                    color: _selectedIndex == 0 ? ColorRepo.primary : ColorRepo.dark,
                  ),
                  label: '', // Remove label text
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    _selectedIndex == 1 ? PhosphorIcons.shopping_cart_fill : PhosphorIcons.shopping_cart,
                    color: _selectedIndex == 1 ? ColorRepo.primary : ColorRepo.dark,
                  ),
                  label: '', // Remove label text
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    _selectedIndex == 2 ? PhosphorIcons.notepad_fill : PhosphorIcons.notepad,
                    color: _selectedIndex == 2 ? ColorRepo.primary : ColorRepo.dark,
                  ),
                  label: '', // Remove label text
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    _selectedIndex == 3 ? PhosphorIcons.user_fill : PhosphorIcons.user,
                    color: _selectedIndex == 3 ? ColorRepo.primary : ColorRepo.dark,
                  ),
                  label: '', // Remove label text
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: ColorRepo.primary,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}