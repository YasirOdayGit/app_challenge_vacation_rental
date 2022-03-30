import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/build_cities.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Faker faker = Faker();
  String name = Faker().person.firstName();
  late PageController _pageController;
  int currentPage = 1;
  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.75, initialPage: 1)
      ..addListener(() {
        int pos = _pageController.page!.round();
        if (currentPage != pos) {
          {
            setState(() {
              currentPage = pos;
            });
          }
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xff313131), size: 24),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
              ))
        ],
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Welcome, ",
              style: TextStyle(
                color: Color(0xff313131),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          Text(name,
              style: const TextStyle(
                color: Color(0xff313131),
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ))
        ]),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: size.width * 0.9,
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Where to?",
                      hintStyle: const TextStyle(
                          color: Color(0xff759892),
                          fontWeight: FontWeight.w600),
                      alignLabelWithHint: true,
                      isDense: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xff759892),
                      ),
                      fillColor: const Color.fromARGB(255, 240, 240, 240),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: size.width * 0.9,
              child: const Text(
                "Let's explore new places",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (_, __) {
                  bool active = __ == currentPage;
                  return buildStoryPage(active, __, size);
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: BottomNavigationBar(
            backgroundColor: const Color(0xff36635A),
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/Home.svg"), label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/Envelope.svg"),
                  label: "Inbox"),
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
      ),
    );
  }
}
