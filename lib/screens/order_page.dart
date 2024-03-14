import 'package:flutter/material.dart';

import 'package:food_studio/screens/food_details.dart';
import 'package:food_studio/screens/route_page.dart';
import '../Data/data_file.dart';

import 'package:url_launcher/url_launcher.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

final Uri _url = Uri.parse('https://maps.app.goo.gl/Kood2xDwX441yohn9');
bool backItem = true;

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

int iiindex = 0;
double sumUsingLoop(List<double> numbers) {
  double sum = 0;
  for (double number in numbers) {
    sum += number;
  }
  return sum;
}

bool showWidgetsInOrderPage = false;
Map showOrders = {};

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    showOrders.clear();
    int j = 0;
    for (var i = 1; i < allFoods.length + 1; i++) {
      if (allFoods[i]['orderCount'] > 0) {
        showWidgetsInOrderPage = true;
        showOrders[j] = allFoods[i];

        totalSum += showOrders[j]['price'] * showOrders[j]['orderCount'];
        tax = totalSum * 9 / 100;
        j++;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: showWidgetsInOrderPage
          ? buttomSheet()
          : Container(
              color: Colors.green[50],
              height: 100,
            ),
      backgroundColor: Colors.green[50],
      appBar: appbar(),
      body: SingleChildScrollView(
        child: bodyWhenThereIsOrders
            ? bodyWhenThereIsOrdersToShow()
            : bodyWhenNothingToshow(context),
      ),
    );
  }

  Column bodyWhenThereIsOrdersToShow() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            height: 510,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                  color: Colors.black54,
                  indent: 14,
                  endIndent: 14,
                );
              },
              itemCount: showOrders.length,
              itemBuilder: (BuildContext context, int index) {
                return eachFood(context, index);
              },
            ),
          ),
        ),
        calculateAll()
      ],
    );
  }

  bool get bodyWhenThereIsOrders => showWidgetsInOrderPage;

  Stack eachFood(BuildContext context, int index) {
    return Stack(
      children: [
        Container(
          height: 96,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green[50],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FoodDetail(iiindex);
                          },
                        ),
                      );
                    },
                    child: Image.asset(
                      showOrders[index]['image'],
                      fit: BoxFit.cover,
                      height: 94,
                      width: 94,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 254,
                        height: 24,
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                showOrders[index]['name'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        showOrders[index]['category'],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '${showOrders[index]['orderCount'] * showOrders[index]['price']} \$',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange),
                        child: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                if (showOrders[index]['orderCount'] > 0) {
                                  showOrders[index]['orderCount']--;
                                }
                                showOrders.clear();
                                totalSum = 0;
                                int j = 0;
                                for (var i = 1; i < allFoods.length + 1; i++) {
                                  if (allFoods[i]['orderCount'] > 0) {
                                    showWidgetsInOrderPage = true;
                                    showOrders[j] = allFoods[i];

                                    totalSum += showOrders[j]['price'] *
                                        showOrders[j]['orderCount'];
                                    tax = totalSum * 9 / 100;
                                    j++;
                                  }
                                }
                              },
                            );
                          },
                          icon: const Icon(Icons.remove,
                              size: 20, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        showOrders[index]['orderCount'].toString(),
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              showOrders[index]['orderCount']++;
                              totalSum = 0;
                              showOrders.clear();
                              int j = 0;
                              for (var i = 1; i < allFoods.length + 1; i++) {
                                if (allFoods[i]['orderCount'] > 0) {
                                  showWidgetsInOrderPage = true;
                                  showOrders[j] = allFoods[i];

                                  totalSum += showOrders[j]['price'] *
                                      showOrders[j]['orderCount'];
                                  tax = totalSum * 9 / 100;
                                  j++;
                                }
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding calculateAll() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(14)),
        height: 124,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Delivary Code: ',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '094032',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              indent: 12,
              endIndent: 12,
              thickness: 1,
              color: Colors.black54,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tax(9%): ',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${tax.truncate()}.0 \$',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sub Total: ',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '$totalSum \$',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        ' ${(totalSum + tax).truncate()}.0 \$',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 1.5,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      Text(
                        '${(totalSum + tax - ((totalSum + tax) * 0.04 * showOrders.length)).round()}.0 \$',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }

  Column bodyWhenNothingToshow(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
        ),
        const Icon(
          Icons.search_off_outlined,
          color: Colors.deepOrange,
          size: 140,
        ),
        const Center(
          child: Text(
            'Nothing to show!',
            style: TextStyle(fontSize: 25, color: Colors.deepOrange),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 3 / 4,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Let's order Something!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RoutePage();
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar appbar() {
    return AppBar(
      actions: const [
        IconButton(
          icon: Icon(
            Icons.share_location,
            size: 30,
          ),
          onPressed: _launchUrl,
          color: Colors.black87,
        ),
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      backgroundColor: Colors.green[50],
      elevation: 0,
      title: const Text(
        'Your Orders',
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }

  Padding buttomSheet() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              '${(totalSum + tax - (totalSum + tax) * 0.04 * showOrders.length).round()}.0 \$',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green[900],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 45,
            width: 270,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
