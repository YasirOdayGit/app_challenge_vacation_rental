import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../widgets/build_cities.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/recent_view_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String name = Faker().person.firstName();
  late PageController _pageController;
  List<String> images = List.generate(
      50, (index) => faker.image.image(random: true, keywords: ['nature']));
  int currentPage = 1;
  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1)
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
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: size.width * 0.9,
              child: const Text(
                "Recently viewed",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: size.width / 2 + 50,
              width: size.width,
              child: ListView.builder(
                itemCount: 13,
                scrollDirection: Axis.horizontal,
                // for real images we use cached network image and remove the
                // cache extent
                cacheExtent: double.infinity,
                padding: EdgeInsets.only(
                    left: size.width * 0.05 - 10, top: 10, bottom: 10),
                itemBuilder: (_, __) {
                  return RecentlyViewedWidget(size: size, image: images[__]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
