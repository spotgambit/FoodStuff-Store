import 'package:flutter/material.dart';
import '../Models/ProductModel.dart';

class ListRepo{
  static const List<String> categories = ['All', 'Vegetables', 'Proteins', 'Grains', 'Nuts', 'Seeds', 'Fluids', 'Processed', 'Live stock'];

  static const List<Map<String, dynamic>> companyInfo = [
    {
      'id': 1,
      'AppName': 'FoodStuff Store',
      'AppVersion': '2.0.1',
      'Website': 'https;//foodstuff.store',
      'AI-Name': 'Fundre AI',
      'AI-Name-Short': 'Fundre'
    }
  ];

  static const List<Map<String, dynamic>> searchHistory = [
    {
      'id': 1,
      'keyword': 'Carrot',
    },
    {
      'id': 2,
      'keyword': 'Yam',
    },
    {
      'id': 3,
      'keyword': 'Carrot',
    },
    {
      'id': 4,
      'keyword': 'Carrot',
    },
    {
      'id': 5,
      'keyword': 'Carrot',
    },

  ];

  static const List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'name': 'Potato (Irish)',
      'price': 4000.00,
      'discount': 3500.00,
      'weight': '1 Kg',
      'image': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'description': 'Irish potatoes are a versatile and nutritious vegetable. They provide approximately 77 kcal per 100g, with 17g of carbohydrates, 2g of protein, and minimal fat. They are rich in Vitamin C, B6, and Potassium. Best meals to make include mashed potatoes, potato salad, baked potatoes, and French fries.',
      'category': 'Vegetable'
    },
    {
      'id': 2,
      'name': 'Carrot',
      'price': 1300.00,
      'discount': 1000.00,
      'weight': '1 Kg',
      'image': 'http://www.pngall.com/wp-content/uploads/2016/04/Carrot-PNG.png',
      'description': 'Carrots are a highly nutritious vegetable, offering about 41 kcal per 100g, 10g of carbohydrates, 0.9g of protein, and 0.2g of fat. They are an excellent source of Vitamin A, K, B6, and Potassium. Ideal meals include carrot soup, roasted carrots, carrot salad, and carrot cake.',
      'category': 'Vegetable'
    },
    {
      'id': 3,
      'name': 'Frozen Chicken',
      'price': 15000.00,
      'discount': 12000.00,
      'weight': '1 Kg',
      'image': 'https://dodan3whn6dxi.cloudfront.net/wp-content/uploads/2019/03/15125959/WHOLE-FROZEN-CHICKEN-1200GX10.jpg',
      'description': 'Frozen chicken is a protein-rich food, providing about 165 kcal per 100g, with 31g of protein and 3.6g of fat. It contains no carbohydrates and is rich in Vitamin B6, B12, Iron, and Zinc. It is perfect for meals like chicken curry, grilled chicken, chicken stir-fry, and chicken soup.',
      'category': 'Protein'
    },
    {
      'id': 4,
      'name': 'Corn',
      'price': 880.00,
      'discount': 800.00,
      'weight': '1 Kg',
      'image': 'https://image.freepik.com/free-photo/corn-white-background_59226-73.jpg',
      'description': 'Corn is a nutritious grain, offering about 86 kcal per 100g, with 19g of carbohydrates, 3.2g of protein, and 1.2g of fat. It is a good source of fiber, Vitamin B3, B5, B6, C, and Folate. Ideal meals include corn on the cob, corn chowder, cornbread, and corn salad.',
      'category': 'Vegetable'
    },
    {
      'id': 5,
      'name': 'Bitter leaf',
      'price': 900.00,
      'discount': 720.00,
      'weight': '1 Kg',
      'image': 'https://www.nicepng.com/png/detail/261-2619257_bitterleaf-bitter-leaf.png',
      'description': 'Bitter leaf is a nutritious vegetable, providing about 30 kcal per 100g, with 6g of carbohydrates, 1.2g of protein, and minimal fat. It is high in fiber and vitamins A, C, E, and Calcium. Best meals include bitter leaf soup (Ofe Onugbu), bitter leaf tea, mixed vegetable stir-fry, and bitter leaf smoothie.',
      'category': 'Vegetable'
    },
    {
      'id': 6,
      'name': 'Beef (Diced)',
      'price': 1700.00,
      'discount': 1500.00,
      'weight': '1 Kg',
      'image': 'https://quick-recipe.com/wp-content/uploads/2018/06/HI-RES-BEEF-DICED.png',
      'description': 'Diced beef is a rich source of protein, providing about 250 kcal per 100g, with 26g of protein and 15g of fat. It is also a good source of Iron, Vitamin B12, and Zinc. Ideal meals include beef stew, beef stir-fry, beef curry, and beef kebabs.',
      'category': 'Protein'
    },
    {
      'id': 7,
      'name': 'Peanut Butter',
      'price': 3000.00,
      'discount': 2500.00,
      'weight': '1 Kg',
      'image': 'https://www.kindpng.com/picc/m/125-1252820_peanut-butter-free-png-image-transparent-background-peanut.png',
      'description': 'Peanut butter is a nutrient-dense food, providing about 588 kcal per 100g, with 25g of protein, 50g of fat, and 20g of carbohydrates. It is high in fiber and vitamins E, B3, B6, and Magnesium. Best meals include peanut butter sandwich, peanut butter smoothie, peanut butter cookies, and satay sauce.',
      'category': 'Processed Fod'
    },
  ];

  static const List<Map<String, dynamic>> shoppingLists = [
    {
      'id': 1,
      'name': 'Monday Brunch',
      'image1': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image2': 'https://quick-recipe.com/wp-content/uploads/2018/06/HI-RES-BEEF-DICED.png',
      'image3': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image4': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'items': 5,
    },
    {
      'id': 2,
      'name': 'Sunday Brunch',
      'image1': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image2': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image3': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image4': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'items': 9,
    },
    {
      'id': 3,
      'name': 'Birthday Party',
      'image1': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image2': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image3': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image4': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'items': 10,
    },
    {
      'id': 4,
      'name': 'Jollof Rice Recipe',
      'image1': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image2': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image3': 'https://quick-recipe.com/wp-content/uploads/2018/06/HI-RES-BEEF-DICED.png',
      'image4': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'items': 17,
    },
    {
      'id': 5,
      'name': 'Egusi Recipe',
      'image1': 'https://www.kindpng.com/picc/m/125-1252820_peanut-butter-free-png-image-transparent-background-peanut.png',
      'image2': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image3': 'https://www.shopsampars.com/wp-content/uploads/2020/06/irish-potato-import.jpg',
      'image4': 'https://www.nicepng.com/png/detail/261-2619257_bitterleaf-bitter-leaf.png',
      'items': 15,
    },
  ];

  static const List<Map<String, dynamic>> reviews = [
    {
      'id': 1,
      'image': 'default',
      'name': 'John Doe',
      'date': '2024-05-24',
      'comment': 'I love these. Def thumbs up. Well done, great delivery and on time. Very nice 🥳👍🏿',
    },
    {
      'id': 2,
      'image': 'default',
      'name': 'Rachael Wick',
      'date': '2024-07-24',
      'comment': 'I like it FR. Real nice and nutritious!',
    },
    {
      'id': 3,
      'image': 'default',
      'name': 'Tony Woods',
      'date': '2024-07-14',
      'comment': 'I love these. Def thumbs up. Well done, great delivery and on time. Very nice 🥳👍🏿',
    },
    {
      'id': 4,
      'image': 'default',
      'name': 'Gilly Billy',
      'date': '2023-04-24',
      'comment': 'I like it FR. Real nice and nutritious!',
    },
  ];

  static const List<Map<String, dynamic>> notifications = [
    {
      'id': 1,
      'type': 'order',
      'header': 'Track Your Order',
      'main-label': 'Order ID:',
      'main-message': '#5634FGv34',
      'sub-label': 'ETA:',
      'sub-message': '30mins',
    },
    {
      'id': 2,
      'type': 'referral',
      'header': 'Yahh, Congrats!!',
      'main-label': '',
      'main-message': '1 new referral. You\'ve gained',
      'sub-label': '',
      'sub-message': 'your referral link was used',
    },
    {
      'id': 3,
      'type': 'membership',
      'header': 'Foodstuff Store Premium Member',
      'main-label': '',
      'main-message': 'Auto-renewal on 15/08/24 for ₦ 999.00 / month',
      'sub-label': '',
      'sub-message': 'ending with ******4567',
    },
  ];

  static const List<Map<String, dynamic>> orders = [
    {
      'id': 1,
      'type': 'order',
      'header': 'Track Your Order',
      'main-label': 'Order ID:',
      'main-message': '#5634FGv34',
      'sub-label': 'ETA:',
      'sub-message': '30mins',
      'status': 'pending',
      'date': '4 Jul 2024',
      'time': '09:15AM',
      'price': 34030.00,
    },
    {
      'id': 2,
      'type': 'order',
      'header': 'Track Your Order',
      'main-label': 'Order ID:',
      'main-message': '#5634FGv34',
      'sub-label': 'ETA:',
      'sub-message': '30mins',
      'status': 'pending',
      'date': '4 Jul 2024',
      'time': '09:15AM',
      'price': 34030.00,
    },
    {
      'id': 3,
      'type': 'order',
      'header': 'Track Your Order',
      'main-label': 'Order ID:',
      'main-message': '#5634FGv34',
      'sub-label': 'ETA:',
      'sub-message': '30mins',
      'status': 'completed',
      'date': '4 Jul 2024',
      'time': '09:15AM',
      'price': 34030.00,
    },
    {
      'id': 4,
      'type': 'order',
      'header': 'Track Your Order',
      'main-label': 'Order ID:',
      'main-message': '#5634FGv34',
      'sub-label': 'ETA:',
      'sub-message': '30mins',
      'status': 'completed',
      'date': '4 Jul 2024',
      'time': '09:15AM',
      'price': 34030.00,
    },
    {
      'id': 5,
      'type': 'order',
      'header': 'Track Your Order',
      'main-label': 'Order ID:',
      'main-message': '#5634FGv34',
      'sub-label': 'ETA:',
      'sub-message': '30mins',
      'status': 'completed',
      'date': '4 Jul 2024',
      'time': '09:15AM',
      'price': 34030.00,
    },
    {
      'id': 6,
      'type': 'order',
      'header': 'Track Your Order',
      'main-label': 'Order ID:',
      'main-message': '#5634FGv34',
      'sub-label': 'ETA:',
      'sub-message': '30mins',
      'status': 'completed',
      'date': '4 Jul 2024',
      'time': '09:15AM',
      'price': 34030.00,
    },
    {
      'id': 7,
      'type': 'order',
      'header': 'Track Your Order',
      'main-label': 'Order ID:',
      'main-message': '#5634FGv34',
      'sub-label': 'ETA:',
      'sub-message': '30mins',
      'status': 'cancelled',
      'date': '4 Jul 2024',
      'time': '09:15AM',
      'price': 34030.00,
    },
    {
      'id': 8,
      'type': 'order',
      'header': 'Track Your Order',
      'main-label': 'Order ID:',
      'main-message': '#5634FGv34',
      'sub-label': 'ETA:',
      'sub-message': '30mins',
      'status': 'cancelled',
      'date': '4 Jul 2024',
      'time': '09:15AM',
      'price': 34030.00,
    },
  ];

  static const List<Map<String, dynamic>> billingHistory = [
    {
      "id": 1,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 2,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 3,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 4,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 5,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 6,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 7,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 8,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 9,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 10,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 11,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 12,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 13,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 14,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
    {
      "id": 15,
      "inv-num": "FSS - 54677",
      "date": "14/03/24",
      "price": 999.00,
    },
  ];

  static const List<Map<String, dynamic>> addresses = [
    {
      "id": 1,
      "name": "Boma Dokubo",
      "address": "6c Kado Estate, Jabi, Gwarinpa",
      "state": "Abuja",
      "zip-code": "900108",
      "country-code": "NG",
      "is-main": false,
    },
    {
      "id": 2,
      "name": "Office",
      "address": "6c Kado Estate, Jabi, Gwarinpa",
      "state": "Abuja",
      "zip-code": "900108",
      "country-code": "NG",
      "is-main": true,
    },
    {
      "id": 3,
      "name": "Warehouse",
      "address": "6c Kado Estate, Jabi, Gwarinpa",
      "state": "Kaduna",
      "zip-code": "900108",
      "country-code": "NG",
      "is-main": false,
    },
  ];


}