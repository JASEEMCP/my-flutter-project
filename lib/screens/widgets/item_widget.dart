
import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/constants.dart';
import 'package:shoppingapp/screens/detail_page.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/items.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key, required this.index, required this.itemList,
  }) : super(key: key);

  final int index;
  final List<Items> itemList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage(
                  itemIndex: itemList[index].itemId,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(.1),

        ),
        height: 80.0,
        margin: const EdgeInsets.only(top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.8),

                    ),
                    child: Image.network(itemList[index].imageURL,fit: BoxFit.cover,),
                  ),
                ),

                Positioned(
                  bottom: 20,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        itemList[index].itemName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Constants.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                r'₹'+itemList[index].price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Constants.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}