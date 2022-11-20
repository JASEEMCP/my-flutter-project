import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/constants.dart';
import 'package:shoppingapp/screens/widgets/item_widget.dart';

import '../models/items.dart';

class CartPage extends StatefulWidget {
  final List<Items> addedToCart;
   CartPage({Key? key, required this.addedToCart}) : super(key: key);
  int sum = 0;
  int total(){

    for(int index = 0;index<addedToCart.length;index++)
    {
      sum = sum + addedToCart[index].price;

    }
    return sum;
  }
  @override
  State<CartPage> createState() => _CartPageState();
}


class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addedToCart.isEmpty
          ? Center(
        child:
            Text(
              'Your Cart is Empty',
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),

      )
          : Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.addedToCart.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ItemWidget(
                        index: index, itemList: widget.addedToCart);
                  }),
            ),
            Column(
              children: [
                const Divider(thickness: 1.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Total',style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                    ),
                      Text("\$${widget.total()}", style: TextStyle(
                        fontSize: 24.0,
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
