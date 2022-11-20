import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/constants.dart';
import 'package:shoppingapp/screens/widgets/item_widget.dart';

import '../models/items.dart';

class FavoritePage extends StatefulWidget {
  final List<Items> favoritedItems;
  const FavoritePage({Key? key, required this.favoritedItems})
      : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritedItems.isEmpty
          ? Center(
              child:
                  Text(
                    'Your Favorited Item ',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),

            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height ,
              child: ListView.builder(
                  itemCount: widget.favoritedItems.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ItemWidget(
                        index: index, itemList: widget.favoritedItems);
                  },
              ),
            ),
    );
  }
}
