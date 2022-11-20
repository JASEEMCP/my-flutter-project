class Items {
  final int itemId;
  final int price;
  final String itemName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Items(
      {
        required this.itemName,
        required this.price,
        required this.itemId,
        required this.imageURL,
        required this.isFavorated,
        required this.decription,
        required this.isSelected});

  static List<Items> itemList = [
    Items(
        itemName: 'Tomato',
        itemId: 0,
        price: 22,
        imageURL: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Tomato_je.jpg/800px-Tomato_je.jpg',
        isFavorated: false,
        decription:
        'The tomato is the edible berry of the plant Solanum lycopersicum, '
            'commonly known as the tomato plant',
        isSelected: false),
    Items(
        itemName: 'Red Chilli',
        itemId: 1,
        price: 11,
        imageURL: 'https://jooinn.com/images/red-chilli-2.jpg',
        isFavorated: false,
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.Red chillies are a rich source of various vitamins,'
            ' minerals and proteins (amino acids) necessary for human health. ',
        isSelected: false),
    Items(
        itemName: 'Onion',
        itemId: 2,
        price: 18,
        imageURL: 'https://893375.smushcdn.com/2094051/wp-content/uploads/2020/12/30pcs-Giant-Sweet-Red-Onion-Seeds-Pack-UK-Harvest.png?lossy=1&strip=1&webp=1',
        isFavorated: false,
        decription:
        'is a vegetable that is the most widely cultivated species of the genus Allium',
        isSelected: false),
    Items(
        itemName: 'Banana',
        itemId: 3,
        price: 30,
        imageURL: 'https://th.bing.com/th/id/R.1cdce929a1fd557b62dd3c9c9207e102?rik=ahIwGMs85pUdDg&riu=http%3a%2f%2fwww.u-run.fr%2fwp-content%2fuploads%2f2015%2f02%2fbanane.jpg&ehk=1zYI27PKNh5BSelfWUf4iM%2fm9pJ0mjvriXNiYP%2bHEn4%3d&risl=&pid=ImgRaw&r=0',
        isFavorated: false,
        decription:
        'The banana plant is the largest herbaceous flowering plant',
        isSelected: false),
    Items(
        itemName: 'Garlic',
        itemId: 4,
        price: 24,
        imageURL: 'https://static.fanpage.it/wp-content/uploads/sites/22/2018/05/istock-531644839.jpg',
        isFavorated: false,
        decription:
        'Garlic (Allium sativum) is a species of bulbous flowering plant in the genus Allium',
        isSelected: false),
    Items(
        itemName: 'Corn',
        itemId: 5,
        price: 24,
        imageURL: 'https://th.bing.com/th/id/OIP.ewzXlPRBaTjHez9nG75LvgHaE9?pid=ImgDet&rs=1',
        isFavorated: false,
        decription:
        'Corn, also known as maize, is a starchy vegetable that comes as kernels on a cob, covered by a husk.',
        isSelected: false),
    Items(
        itemName: 'Sweet Potato',
        itemId: 6,
        price: 19,
        imageURL: 'https://morningchores.com/wp-content/uploads/2017/10/sweet-potato.jpg',
        isFavorated: false,
        decription:
        'The sweet potato or sweetpotato (Ipomoea batatas) is a dicotyledonous plant that belongs to the bindweed or morning glory family, Convolvulaceae',
        isSelected: false),
    Items(
       itemName:'Cucumber' ,
        itemId: 7,
        price: 23,
        imageURL: 'https://th.bing.com/th/id/OIP.tKQ3N9tqqJQvq7JaiJ8O9QHaEd?pid=ImgDet&rs=1',
        isFavorated: false,
        decription:
        'Cucumber (Cucumis sativus) is a widely-cultivated creeping vine plant in the Cucurbitaceae family that bears usually cylindrical fruits, which are used as culinary vegetables',
        isSelected: false),
    Items(
        itemName:'Cabbage',
        itemId: 8,
        price: 46,
        imageURL: 'https://www.gardeningknowhow.com/wp-content/uploads/2019/12/store-cabbage.jpg',
        isFavorated: false,
        decription:
        'Cabbage, comprising several cultivars of Brassica oleracea, is a leafy green, red (purple),'
            ' or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads.',
        isSelected: false),
  ];
  static List<Items> getFavorite(){
    List<Items> travelList = Items.itemList;
    return travelList.where((element) => element.isFavorated == true).toList();
  }

  static List<Items> addedToCart(){
    List<Items> selectedItem = Items.itemList;
    return selectedItem.where((element) => element.isSelected == true).toList();
  }
}
