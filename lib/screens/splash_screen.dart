import 'package:flutter/material.dart';
import 'package:food_studio/screens/food_details.dart';

import 'route_page.dart';

List colors = const [
  Color.fromARGB(255, 139, 195, 74),
  Color.fromARGB(255, 56, 142, 60),
  Color.fromARGB(255, 60, 81, 134),
  Color.fromARGB(255, 155, 114, 170),
];

List colors2 = const [
  Color(0xff1A5D1A),
  Color(0xffF1C93B),
  Color(0xffFBD85D),
  Color(0xffFAE392),
];

class Head extends StatelessWidget {
  const Head({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green[100],
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: SizedBox(
          height: 100,
          child: Column(
            children: [
              SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width - 16,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoutePage(numberr),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Let's Get Started!",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    '<UGS☕>',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'food',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 2,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                'asset/image/res3.jpg',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Foodia',
              style: TextStyle(
                fontFamily: 'food',
                fontSize: 45,
                fontWeight: FontWeight.w100,
                color: Colors.green[800],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'Say Hello to our Restaurant',
              style: TextStyle(
                color: Colors.blueGrey[700],
                fontFamily: 'main',
                fontWeight: FontWeight.w300,
                fontSize: 27,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50, top: 6),
              child: Text(
                'Order your favorite food Online and enjoy it everywhere, anytime',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontFamily: 'main',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
