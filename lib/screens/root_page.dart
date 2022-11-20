import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/constants.dart';
import 'package:shoppingapp/screens/cart_page.dart';
import 'package:shoppingapp/models/arguments.dart';
import 'package:shoppingapp/screens/favorite_page.dart';
import 'package:shoppingapp/screens/home_page.dart';
import 'package:shoppingapp/screens/profile_page.dart';

import '../models/items.dart';


class RootPage extends StatefulWidget {
  RootPage({Key? key,required this.myMail,}) : super(key: key);
   List <EmailPwd> myMail = [];
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Items> favorites = [];
  List<Items> myCart = [];

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      FavoritePage(
        favoritedItems: favorites,
      ),
      CartPage(
        addedToCart: myCart,
      ),
      ProfilePage(profilelist: widget.myMail,),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.notifications,
              color: Constants.blackColor,
              size: 30.0,
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Constants.primaryColor,
          unselectedItemColor: Colors.black.withOpacity(0.5),
          currentIndex: _bottomNavIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          onTap: (index) {
            setState(
              () {
                _bottomNavIndex = index;
                final List<Items> favoritedItems = Items.getFavorite();
                final List<Items> addedToCartItems = Items.addedToCart();

                favorites = favoritedItems;
                myCart = addedToCartItems;
              },
            );
          },
      ),
    );
  }
}
