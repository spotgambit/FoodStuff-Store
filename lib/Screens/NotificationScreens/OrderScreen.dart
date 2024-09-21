import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/BottomSheets/FilterByOrdersBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/OrderListWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/SearchInputWidget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _searchOrders() {
    // Add your search logic here
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorRepo.background,
      appBar: AppBar(
        backgroundColor: ColorRepo.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(PhosphorIcons.arrow_left, color: ColorRepo.dark),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          ScreenContext.pageTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorRepo.dark,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: RadiiRepo.screenPadding,
          right: RadiiRepo.screenPadding,
          bottom: 0, // Removed bottom padding to allow full scroll
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchInputWidget(
                  screenWidth: screenWidth * 0.8,
                  hintText: ScreenContext.inputPlaceholders,
                  controller: _searchController,
                  isValid: true,
                  onSearch: _searchOrders,
                  onChange: (){}
                ),
                GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) => const FilterByOrdersBottomSheetWidget(),
                      );
                    },
                    child: const Icon(PhosphorIcons.funnel_simple, color: ColorRepo.dark)),
              ],
            ),
            const SizedBox(height: 20), // Reduced the gap slightly
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:20.0),
                      child: OrderListWidget(orders: ListRepo.orders, status: 'pending',  singleItem: false,),
                    ),
                    SizedBox(height: 20),
                    OrderListWidget(orders: ListRepo.orders, status: 'completed', singleItem: false,),
                    SizedBox(height: 20),
                    OrderListWidget(orders: ListRepo.orders, status: 'cancelled', singleItem: false,),
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

class ScreenContext {
  static String pageTitle = 'Orders';
  static String inputPlaceholders = 'Search for orders';

  static List<String> headerText = ['Current order', 'Completed'];
}
