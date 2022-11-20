import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/constants.dart';
import 'package:shoppingapp/models/items.dart';
import 'package:shoppingapp/screens/detail_page.dart';
import 'package:shoppingapp/screens/widgets/item_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Items> itemList = Items.itemList;


    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0
                  ),
                  width: size.width * .9,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [

                      Expanded(
                          child:TextField(

                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                        ),
                      )
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,

          ),
          SizedBox(
            height: size.height * .2,
            child: ListView.builder(
                itemCount: itemList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
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
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),

                      decoration: BoxDecoration(


                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(itemList[index].imageURL,)

                        ),
                        color: Constants.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:
                          Stack(
                            children: [
                              Positioned(
                                top: 10,
                                right: 20,
                                child: Container(

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),

                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        bool isFavorited = toggleIsFavorated(
                                            itemList[index].isFavorated);
                                        itemList[index].isFavorated = isFavorited;
                                      });
                                    },
                                    icon: Icon(
                                      itemList[index].isFavorated == true
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color:itemList[index].isFavorated == true? Colors.redAccent:Constants.primaryColor,
                                    ),
                                    iconSize: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(itemList[index].itemName,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    r'₹' + itemList[index].price.toString(),
                                    style: TextStyle(
                                        color: Constants.primaryColor,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],


                      ),
                    ),
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: const Text(
              'Recommended',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(
            height: size.height * .5,
            child: ListView.builder(
                itemCount: itemList.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageTransition(
                            child: DetailPage(itemIndex: itemList[index].itemId), type: PageTransitionType.bottomToTop));
                      },
                      child: ItemWidget(index: index, itemList: itemList));
                }),
          ),
        ],
      ),
    ),
    );
  }
}

