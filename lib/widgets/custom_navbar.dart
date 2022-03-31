import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      child: BottomNavigationBar(
          backgroundColor: const Color(0xff36635A),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Home.svg"), label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Envelope.svg"), label: "Inbox"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Bag.svg"), label: "Trips"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Video.svg"),
                label: "Bucket list"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Globe.svg"), label: "Explore"),
          ],
          selectedItemColor: const Color(0xff759892),
          unselectedItemColor: const Color(0xff759892),
          type: BottomNavigationBarType.fixed),
    );
  }
}
