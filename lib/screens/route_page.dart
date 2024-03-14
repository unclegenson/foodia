import 'package:flutter/material.dart';
import 'home_page.dart';
import 'order_page.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const OrdersPage(),
  ];
  int _currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentSelected),
      drawer: drawer(),
      bottomNavigationBar: Builder(builder: (ctx) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            // if (index == 1) {
            //   Future.delayed(const Duration(milliseconds: 100), () {
            //     setState(() {
            //       PanaraInfoDialog.showAnimatedGrow(
            //         context,
            //         title: "No address added!",
            //         message:
            //             "Please add your address for the delivary options.",
            //         buttonText: "Okay",
            //         onTapDismiss: () {
            //           Navigator.pop(ctx);
            //         },
            //         panaraDialogType: PanaraDialogType.error,
            //       );
            //     });
            //   });
            // }

            index == 1
                ? Scaffold.of(ctx).openDrawer()
                : setState(
                    () {
                      _currentSelected = index;
                    },
                  );
          },
          currentIndex: _currentSelected,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.green[800],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home_outlined,
                size: 28,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 28,
              ),
              label: 'Profile',
              activeIcon: Icon(
                Icons.person_outline,
                size: 28,
              ),
            ),
          ],
        );
      }),
    );
  }
}
