import 'package:flutter/material.dart';
import 'package:food_studio/screens/splash_screen.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import '../screens/food_details.dart';
import 'order_page.dart';

List orderFoodImages = [];
List orderFoodNames = [];
List orderFoodTypes = [];
List orderFoodPrices = [];
List orderFoodNumbers = [];
List<double> totalPriceList = [];

double totalSum = 0;
double tax = 0;

InkWell tile(String text, IconData icon) {
  return InkWell(
    splashColor: Colors.orange[600],
    onTap: () {},
    child: ListTile(
      visualDensity: const VisualDensity(vertical: -3, horizontal: -4),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      leading: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
    ),
  );
}

int selectedCategory = 0;
Drawer drawer() {
  return Drawer(
    elevation: 40,
    backgroundColor: const Color.fromARGB(192, 255, 153, 0),
    child: Column(
      children: [
        SafeArea(
          child: FractionallySizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange[200],
                        radius: 80,
                        child: const CircleAvatar(
                          radius: 75,
                          backgroundImage: AssetImage('asset/image/img2.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 54),
                          child: Text(
                            'UncleGenSon',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'unclegenson@gmail.com',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '+98 910 063 9128',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        tile('Profile', Icons.person),
        tile('Wallet', Icons.wallet),
        tile('Last Orders', Icons.shopping_cart),
        tile('Favorite Foods', Icons.favorite),
        tile('Restaurant Location', Icons.location_on_rounded),
        const Divider(
          thickness: 1,
          color: Colors.white,
          indent: 20,
          endIndent: 20,
        ),
        tile('FAQ', Icons.question_mark_rounded),
        tile('Support', Icons.call),
        tile('About Restaurant', Icons.info_outline),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: tile('Log Out', Icons.logout),
        ),
      ],
    ),
  );
}

String appbartext = '';
String image = '';
String foodName = '';
String foodType = '';
double price = 0;

int number = 0;

List colors2 = const [
  Color(0xff1A5D1A),
  Color(0xffF1C93B),
  Color(0xffFBD85D),
  Color(0xffFAE392),
];
List<double> stars = [4.6, 4.9, 4.2, 4.7, 4.3, 3.8, 4.8, 4.9];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List categories = <String>[
  'Burger',
  'Pizza',
  'Seafood',
  'Persian Food',
  'Drink',
  'Dessert',
];

List burgerNames = [
  'Special Burger',
  'Chicken Burger',
  'Double Cheeseburger',
  'Cheeseburger',
  'Big Burger',
];

List burgers = [
  'asset/image/xxxxnewham.jpg',
  'asset/image/xxxxnewbur2.jpg',
  'asset/image/xxxxnewbur3.jpg',
  'asset/image/xxxxnewbur4.jpg',
  'asset/image/xxxxnewbur1.jpg',
];
bool favorite = false;
List dessertNames = [
  'Special Salad',
  'Chicken Salad',
  'Season Salad',
  'Chease Salad',
  'Fruit Salad',
  'Coleslaw',
  'Big Salad',
  'Chocolate Icecream',
  'Fruit Icecream',
  'Orange Cake',
  'Berry Cake',
  'Chocolate Cake'
];

List drinkNames = [
  'Special Juice',
  'Lemon Juice',
  'Orange Juice',
  'Watermelon',
  'Relax Juice',
  'Cola'
];

List drinks = [
  'asset/image/xxxxnewd1.jpg',
  'asset/image/xxxxnewd2.jpg',
  'asset/image/xxxxnewd3.jpg',
  'asset/image/xxxxnewd4.jpg',
  'asset/image/xxxxnewd5.jpg',
  'asset/image/xxxxnewd6.jpg',
];

List seaNames = ['Shrimp', 'Oyster', 'Fish', 'Sushi'];

List sea = [
  'asset/image/xxxxnewsea1.jpg',
  'asset/image/xxxxnewsea2.jpg',
  'asset/image/xxxxnewsea3.jpg',
  'asset/image/xxxxnewsea4.jpg',
];
List dessert = [
  'asset/image/xxxxnewfood1.jpg',
  'asset/image/xxxxnews1.jpg',
  'asset/image/xxxxnews2.jpg',
  'asset/image/xxxxnews3.jpg',
  'asset/image/xxxxnews4.jpg',
  'asset/image/xxxxnews5.jpg',
  'asset/image/img1.jpg',
  'asset/image/xxxxnewi1.jpg',
  'asset/image/xxxxnewi2.jpg',
  'asset/image/xxxxnewc1.jpg',
  'asset/image/xxxxnewc2.jpg',
  'asset/image/xxxxnewc3.jpg',
];

List pizzaName = [
  'Special Pizza',
  'Chicken Pizza',
  'Vegan Pizza',
  'Chease Pizza',
  'Pepperoni Pizza'
];

List pizza = [
  'asset/image/xxxxnewpizza1.jpg',
  'asset/image/xxxxnewpizza2.jpg',
  'asset/image/xxxxnewpizza3.jpg',
  'asset/image/xxxxnewpizza4.jpg',
  'asset/image/xxxxnewpizza5.jpg',
];
Map foodImages = {0: burgers, 1: pizza, 2: sea, 3: iran, 4: drinks, 5: dessert};
List burgerNum = [0, 0, 0, 0, 0];
List pizzaNum = [0, 0, 0, 0, 0];
List seaNum = [0, 0, 0, 0];
List iranNum = [0, 0, 0, 0, 0, 0];
List drinkNum = [0, 0, 0, 0, 0, 0];
List dessetNum = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

List burgerPrice = [33.0, 36.0, 42.0, 29.0, 34.0];
List pizzaPrice = [45.0, 39.0, 38.0, 42.0, 48.0];
List seaPrice = [29.0, 27.0, 36.0, 52.0];
List iranPrice = [42.0, 32.0, 28.0, 34.0, 38.0, 42.0];
List drinkPrice = [20.0, 16.0, 16.0, 16.0, 18.0, 12.0];
List dessertPrice = [
  24.0,
  26.0,
  20.0,
  16.0,
  18.0,
  20.0,
  13.0,
  14.0,
  14.0,
  14.0,
  14.0,
  15.0
];

Map prices = {
  0: burgerPrice,
  1: pizzaPrice,
  2: seaPrice,
  3: iranPrice,
  4: drinkPrice,
  5: dessertPrice
};

bool t = true;

Map numbers = {
  0: burgerNum,
  1: pizzaNum,
  2: seaNum,
  3: iranNum,
  4: drinkNum,
  5: dessetNum
};

Map foodsName = {
  0: burgerNames,
  1: pizzaName,
  2: seaNames,
  3: iranNames,
  4: drinkNames,
  5: dessertNames
};
bool showWidgetsInOrderPage = false;
bool c = true;
List iranNames = [
  'Special Meal',
  'Khoresh Aloo',
  'Taa Chin',
  'Crisp Chicken',
  'Special Chicken',
  'Special Kebab'
];

int addToCartButton = 0;
bool doneButton = true;

List iran = [
  'asset/image/xxxxnewiran2.jpg',
  'asset/image/xxxxnewiran1.jpg',
  'asset/image/xxxxnewiran3.jpg',
  'asset/image/xxxxnewiran4.jpg',
  'asset/image/xxxxnewiran5.jpg',
  'asset/image/xxxxnewiran6.jpg',
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: doneButton
          ? Container(
              height: 0,
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: SizedBox(
                height: 44,
                width: 380,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Done',
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(Icons.check)
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      showWidgetsInOrderPage = true;

                      for (int category = 0;
                          category < categories.length;
                          category++) {
                        for (int item = 0;
                            item < numbers[category].length;
                            item++) {
                          if (numbers[category][item] != 0) {
                            if (orderFoodImages
                                .contains(foodImages[category][item])) {
                              orderFoodNumbers[orderFoodImages
                                      .indexOf(foodImages[category][item])] =
                                  numbers[category][item];

                              totalPriceList[orderFoodImages
                                      .indexOf(foodImages[category][item])] =
                                  numbers[category][item] *
                                      prices[category][item];
                              print('1:$totalPriceList');
                            } else {
                              orderFoodImages.add(foodImages[category][item]);
                              orderFoodNames.add(foodsName[category][item]);
                              orderFoodTypes.add(categories[category]);
                              orderFoodPrices.add(prices[category][item]);
                              orderFoodNumbers.add(numbers[category][item]);

                              totalPriceList.add(numbers[category][item] *
                                  prices[category][item]);
                              print('2:$totalPriceList');
                              setState(() {
                                totalSum = sumUsingLoop(totalPriceList);
                                tax = totalSum * 0.09;
                              });
                            }
                          }
                        }
                      }
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrdersPage(
                          orderFoodImages,
                          orderFoodNames,
                          orderFoodTypes,
                          orderFoodPrices,
                          orderFoodNumbers,
                          totalPriceList,
                          totalSum,
                          tax,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
      backgroundColor: Colors.green[50],
      appBar: appbar(),
      body: SingleChildScrollView(
        child: body(),
      ),
    );
  }

  Column body() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 140, top: 6),
          child: Text(
            'Order Delicious Meal!',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.w500
                // fontFamily: 'main',
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 12),
          child: Row(
            children: [
              SizedBox(
                width: 305,
                height: 50,
                child: TextFormField(
                  cursorColor: Colors.black87,
                  cursorHeight: 23,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.black87,
                    hintText: 'What are you going to eat today?',
                    hintStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[200],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu_open,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 200, top: 6),
          child: Text(
            'Explore Categories',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500
                // fontFamily: 'main',
                ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            height: 45,
            width: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selectedCategory == index
                            ? Colors.green[600]
                            : Colors.white,
                      ),
                      width: 130,
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 18,
                          color: selectedCategory == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: doneButton
              ? MediaQuery.of(context).size.height - 340
              : MediaQuery.of(context).size.height - 390,
          width: MediaQuery.of(context).size.width - 12,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: foodImages[selectedCategory].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                appbartext = foodsName[selectedCategory][index];
                                image = foodImages[selectedCategory][index];
                                foodName = foodsName[selectedCategory][index];
                                foodType = categories[selectedCategory];
                                price = prices[selectedCategory][index];
                                number = numbers[selectedCategory][index];
                                favorite = false;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return FoodDetail(
                                        image,
                                        foodName,
                                        foodType,
                                        price,
                                        number,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    foodImages[selectedCategory][index],
                                    fit: BoxFit.cover,
                                    height: 102,
                                    width: 115,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange[400],
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange[400],
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange[400],
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange[400],
                                      size: 20,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange[400],
                                      size: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 30,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          foodsName[selectedCategory][index],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 19.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  '${prices[selectedCategory][index]} \$',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  categories[selectedCategory],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      addToCartButton == 0
                          ? Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SizedBox(
                                height: 38,
                                width: 120,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      addToCartButton = 1;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange[600],
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 120,
                                height: 38,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange[600],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(
                                          () {
                                            if (numbers[selectedCategory]
                                                    [index] >
                                                0) {
                                              numbers[selectedCategory]
                                                  [index]--;
                                            }
                                            if (numbers[selectedCategory].every(
                                                (element) => element == 0)) {
                                              addToCartButton = 0;
                                              setState(() {
                                                doneButton = true;
                                                showWidgetsInOrderPage = false;
                                                orderFoodImages.clear();
                                                orderFoodNames.clear();
                                                orderFoodTypes.clear();
                                                orderFoodPrices.clear();
                                                orderFoodNumbers.clear();
                                                totalPriceList.clear();
                                                totalSum = 0;
                                              });
                                            }
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.remove,
                                          size: 22, color: Colors.white),
                                    ),
                                    Text(
                                      numbers[selectedCategory][index]
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          numbers[selectedCategory][index]++;
                                          doneButton = false;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  AppBar appbar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      backgroundColor: Colors.green[50],
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_checkout_sharp),
          onPressed: () {
            Future.delayed(const Duration(milliseconds: 100), () {
              setState(() {
                PanaraInfoDialog.showAnimatedGrow(
                  context,
                  title: "No address added!",
                  message: "Please add your address for the delivary options.",
                  buttonText: "Okay",
                  onTapDismiss: () {
                    Navigator.pop(context);
                  },
                  panaraDialogType: PanaraDialogType.error,
                );
              });
            });
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return OrdersPage(
                  orderFoodImages,
                  orderFoodNames,
                  orderFoodTypes,
                  orderFoodPrices,
                  orderFoodNumbers,
                  totalPriceList,
                  totalSum,
                  tax,
                );
              },
            ));
          },
          color: Colors.black,
        ),
      ],
    );
  }
}
