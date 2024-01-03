import 'package:bookingapp/screen/home_page.dart';
import 'package:bookingapp/widgets/bottombar_item.dart';
import 'package:flutter/material.dart';
import 'package:bookingapp/screen/sign_up_page.dart';

class RoutingScaffold extends StatefulWidget {
  const RoutingScaffold({super.key});

  @override
  State<RoutingScaffold> createState() => _RoutingScaffoldState();
}

class _RoutingScaffoldState extends State<RoutingScaffold> {
  int _selectedIndex = 0;
  final List _navbarIcons = [
    Icons.home_outlined,
    Icons.search,
    Icons.location_on,
    Icons.settings_outlined
  ];
  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(.3),
              blurRadius: 4,
              spreadRadius: 1,
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Wrap(
            alignment: WrapAlignment.spaceAround,
            runAlignment: WrapAlignment.center,
            children: List.generate(
                _navbarIcons.length,
                (index) => BottomBarItem(
                      onTap: () {
                        onTap(index);
                      },
                      isActive: _selectedIndex == index,
                      icon: _navbarIcons[index],
                      index: _selectedIndex,
                    ))),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [HomePage(), SignUpPage()],
      ),
    );
  }
}
