import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/constants.dart';


import '../models/items.dart';

class DetailPage extends StatefulWidget {
  final int itemIndex;
  const DetailPage({Key? key, required this.itemIndex}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Items> itemList = Items.itemList;
    return Scaffold(
      body:
             SafeArea(
               child: SingleChildScrollView(
                 child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Constants.primaryColor.withOpacity(.15),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Constants.primaryColor,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: IconButton(
                                    splashRadius: 2,
                                    onPressed: () {
                                      setState(() {
                                        bool isFavorited = toggleIsFavorated(
                                             itemList[widget.itemIndex].isFavorated);
                                             itemList[widget.itemIndex].isFavorated =
                                            isFavorited;
                                      });
                                    },
                                    icon: Icon(
                                      itemList[widget.itemIndex].isFavorated == true
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Constants.primaryColor,
                                    ),
                                ),
                              ),
                            ],
                          ),
                      ),
                      Container(

                        height: size.width*0.6,
                        width: double.infinity,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,


                        ),
                        child: Image.network(itemList[widget.itemIndex].imageURL,fit: BoxFit.cover,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [Text("\$",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.red),),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${itemList[widget.itemIndex].price}",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(child: Text(itemList[widget.itemIndex].decription,textAlign: TextAlign.center,)),
                      ),
                    ],
            ),
               ),
             ),

      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                  color: itemList[widget.itemIndex].isSelected == true ? Constants.primaryColor.withOpacity(.5) : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(.3),
                    ),
                  ]),
              child: IconButton(
                splashRadius: 1,
                  onPressed: (){
                setState(() {
                  bool isSelected = toggleIsSelected(itemList[widget.itemIndex].isSelected);

                  itemList[widget.itemIndex].isSelected = isSelected;
                });
              }, icon: Icon(
                Icons.shopping_cart,
                color: itemList[widget.itemIndex].isSelected == true ? Colors.white : Constants.primaryColor,
              ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(.3),
                      )
                    ]),
                child: const Center(
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
