import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

buildStoryPage(bool active, int index, Size size) {
  // Animated Properties
  final double fade = active ? 0 : 0.8;
  final double offset = active ? 0 : 10;

  return Stack(
    children: [
      AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
        margin: EdgeInsets.symmetric(vertical: offset, horizontal: offset / 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage(
                "assets/location_0.png",
              ),
              fit: BoxFit.fitHeight),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(color: Colors.white.withOpacity(fade)),
        ),
      ),
      Positioned(
        top: 15,
        left: 25,
        child: Row(
          children: [
            Text(
              faker.address.city(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
      AnimatedPositioned(
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
        bottom: 15 + offset,
        right: 10 + offset,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 700),
          curve: Curves.fastOutSlowIn,
          opacity: 1 - fade,
          child: Container(
            width: size.width / 2.5,
            height: 40,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                    child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Explore our guide",
                    style: TextStyle(
                      color: Color(0xff36635A),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 35,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xff36635A),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
