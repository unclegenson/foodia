import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import '../Data/data_file.dart';
import 'food_details.dart';
import 'order_page.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool favorite = false;

int addToCartButton = 0;
bool doneButton = true;
Map foodsToShow = {};

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    setState(() {
      int j = 0;
      foodsToShow.clear();
      for (var i = 1; i < allFoods.length + 1; i++) {
        if (allFoods[i]['category'] == categories[0]) {
          foodsToShow[j] = allFoods[i];
          j++;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomSheet: doneButton
          ? Container(
              height: 0,
            )
          : buttonSheetMethod(context),
      backgroundColor: Colors.green[50],
      appBar: appbar(),
      body: SingleChildScrollView(
        child: body(size),
      ),
    );
  }

  Padding buttonSheetMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: FractionallySizedBox(
        heightFactor: 0.07,
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
              SizedBox(
                width: 1,
              ),
              Icon(Icons.check)
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrdersPage(),
              ),
            );
          },
        ),
      ),
    );
  }

  Column body(Size size) {
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
                width: size.width - 90,
                height: 50,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        int j = 0;
                        foodsToShow.clear();
                        for (var i = 1; i < allFoods.length + 1; i++) {
                          if (allFoods[i]['category'] == categories[0]) {
                            foodsToShow[j] = allFoods[i];
                            j++;
                          }
                        }
                      });
                    } else {
                      int j = 0;
                      setState(() {
                        foodsToShow.clear();
                        for (var i = 1; i < allFoods.length + 1; i++) {
                          if (allFoods[i]['name']
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              allFoods[i]['category']
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.toLowerCase())) {
                            foodsToShow[j] = allFoods[i];
                            j++;
                          }
                        }
                      });
                    }
                  },
                  cursorColor: Colors.black87,
                  cursorHeight: 23,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
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
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text(
                'Explore Categories',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
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
                        int j = 0;
                        foodsToShow.clear();
                        for (var i = 1; i < allFoods.length + 1; i++) {
                          if (allFoods[i]['category'] ==
                              categories[selectedCategory]) {
                            foodsToShow[j] = allFoods[i];
                            j++;
                          }
                        }
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
          height: doneButton ? size.height - 350 : size.height - 400,
          width: size.width - 12,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: foodsToShow.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 115,
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
                                iiindex = foodsToShow[index]['id'];
                                favorite = false;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return FoodDetail(iiindex);
                                    },
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    foodsToShow[index]['image'],
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
                                          foodsToShow[index]['name'],
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
                                  '${foodsToShow[index]['price']} \$',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  foodsToShow[index]['category'],
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
                                width: 130,
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
                                width: 130,
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
                                            if (foodsToShow[index]
                                                    ['orderCount'] >
                                                0) {
                                              foodsToShow[index]
                                                  ['orderCount']--;
                                            }
                                            int tedad0 = 0;
                                            for (var food in allFoods.values) {
                                              if (food['orderCount'] == 0) {
                                                tedad0++;
                                              }
                                            }
                                            if (tedad0 == allFoods.length) {
                                              setState(() {
                                                addToCartButton = 0;
                                                doneButton = true;
                                              });
                                            }
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.remove,
                                          size: 22, color: Colors.white),
                                    ),
                                    Text(
                                      foodsToShow[index]['orderCount']
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          foodsToShow[index]['orderCount']++;
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
                return const OrdersPage();
              },
            ));
          },
          color: Colors.black,
        ),
      ],
    );
  }
}
